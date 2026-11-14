"""Mock Lua 5.3 tests for the 0.8.0 multiplayer sync layer and panel coordination.

Runs runtime.lua and modules/panel-coordination.lua against stubbed natives. This checks
script logic only; it is not an engine, World Editor or multiplayer test.
"""
import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
from lupa.lua53 import LuaRuntime  # noqa: E402

STUBS = r'''
LOG = {calls = {}, created = 0}
local handles = 0
local function handle(kind) handles = handles + 1; return {kind = kind, id = handles} end
PLAYERS = {}
function Player(i) if PLAYERS[i] == nil then PLAYERS[i] = handle("player") end return PLAYERS[i] end
function GetLocalPlayer() return Player(1) end
function CreateTimer() LOG.created = LOG.created + 1; return handle("timer") end
function Location(x, y) local l = handle("location"); l.x = x; l.y = y; return l end
function CreateGroup() return handle("group") end
function FirstOfGroup(g) return nil end
function LoadFrameHandle(t, p, c) return nil end
function SaveFrameHandle(t, p, c, f) return true end
function GetUnitTypeId(u) return 7 end
function BlzFrameIsVisible(f) return f ~= nil and f.visible end
function BlzFrameSetVisible(f, v) f.visible = v end
function TimerStart(t, d, rep, fn) t.fn = fn end
function TriggerEvaluate() error("TriggerEvaluate must not be used by panel coordination") end
function TriggerExecute() error("TriggerExecute must not be used by panel coordination") end
function Condition() error("Condition must not be used by panel coordination") end
function CreateTrigger() error("CreateTrigger must not be used by panel coordination") end
function MultiboardMinimize() end
function IsMultiboardDisplayed() return false end
function IsMultiboardMinimized() return true end
CURRENT_SCOREBOARD = nil
ORIG_GetUnitTypeId = GetUnitTypeId
ORIG_CreateTimer = CreateTimer
'''

TESTS = r'''
local R = {}
local function check(name, ok) R[#R + 1] = {name, ok and true or false} end
local count = 0
for _ in pairs(SYNC80_Pins) do count = count + 1 end
check("all player slots referenced at load", SYNC80_Pins[Player(0)] and SYNC80_Pins[Player(27)] and SYNC80_Pins[GetLocalPlayer()])
local t = CreateTimer()
check("created timer referenced", SYNC80_Pins[t] == true)
check("wrapped native returns the native result", t.kind == "timer")
local l = Location(12, 34)
check("arguments pass through the wrapper", l.x == 12 and l.y == 34 and SYNC80_Pins[l])
check("nil results are not recorded", FirstOfGroup({}) == nil)
check("agent natives are wrapped, other natives are untouched", CreateTimer ~= ORIG_CreateTimer and GetUnitTypeId == ORIG_GetUnitTypeId)
local before = 0
for _ in pairs(SYNC80_Pins) do before = before + 1 end
GetLocalPlayer(); Player(3); Player(3)
local after = 0
for _ in pairs(SYNC80_Pins) do after = after + 1 end
check("repeat lookups of the same handle add nothing", before == after)

-- Panel coordination with plain callbacks.
PM69_Count = 0
PM69_Active = 0
PM69_Board = nil
PM69_Query = {}
PM69_Close = {}
PM69_WasOpen = {}
UI64_Modal = false
local panels = {{open = false}, {open = false}, {open = false}}
local closed = {}
for i = 1, 3 do
  PM69_Register(function() return panels[i].open end, function() panels[i].open = false; closed[#closed + 1] = i end)
end
PM69_Poll()
check("idle poll opens nothing", PM69_Active == 0 and #closed == 0)
panels[1].open = true
PM69_Poll()
check("opening a panel activates it", PM69_Active == 1)
panels[2].open = true
PM69_Poll()
check("opening a second panel closes the first", PM69_Active == 2 and panels[1].open == false and closed[1] == 1)
PM69_Activate(3)
check("activation closes every other open panel", panels[2].open == false and closed[2] == 2 and PM69_Active == 3)
panels[3].open = false
PM69_Poll()
check("closing the active panel clears focus", PM69_Active == 0)
return R
'''


def main():
    project = HERE.parent / 'source'
    runtime = (project / 'runtime.lua').read_text(encoding='utf-8')
    panel = (project / 'modules/panel-coordination.lua').read_text(encoding='utf-8')
    vm = LuaRuntime(unpack_returned_tuples=True)
    vm.execute(STUBS)
    vm.execute(runtime)
    vm.execute(panel)
    results = vm.execute(TESTS)
    rows = [(results[i][1], bool(results[i][2])) for i in range(1, len(results) + 1)]
    # Static guards on the shipped sources.
    pc = panel
    rows.append(('panel coordination has no trigger evaluation or execution',
                 not re.search(r'\b(TriggerEvaluate|TriggerExecute|CreateTrigger|Condition)\(', pc)))
    pf = (project / 'modules/profiles-and-achievements.lua').read_text(encoding='utf-8')
    rows.append(('local file worker is a protected call', 'pcall(PF73_LocalWork)' in pf and 'ExecuteFunc("PF73_LocalWork")' not in pf))
    rows.append(('service records are not switched off in multiplayer', 'Service records are not saved in multiplayer games.' not in pf))
    ao = (project / 'modules/army-overview.lua').read_text(encoding='utf-8')
    rows.append(('army overview counts never touch a hashtable', 'AO_Count, 0' not in ao and 'AO_Count = {}' in ao))
    allsrc = ''.join(p.read_text(encoding='utf-8') for p in (project / 'modules').glob('*.lua'))
    rows.append(('no collectgarbage calls', 'collectgarbage' not in allsrc + runtime))
    for name, ok in rows:
        print(('PASS ' if ok else 'FAIL ') + name)
    out = HERE.parent / 'results' / 'mock-sync80.json'
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps({'scope': 'Mock Lua 5.3 with stubbed natives; not an engine or multiplayer test.',
                               'results': [{'case': n, 'pass': ok} for n, ok in rows]}, indent=2), encoding='utf-8')
    assert all(ok for _, ok in rows), 'mock failures'
    print(len(rows), 'cases passed')


if __name__ == '__main__':
    main()
