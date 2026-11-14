"""Mock Lua 5.3 tests for the 1.0.3 losing-streak compensation (stubbed natives; not an engine test)."""
import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
from lupa.lua53 import LuaRuntime  # noqa: E402

# The unchanged modular source contains the same three functions used by this test.
LUA = (HERE.parent / 'source/modules/losing-streak.lua').read_text(encoding='utf-8')


def fn(name):
    m = re.search(r'^function %s\(.*?^end$' % re.escape(name), LUA, re.M | re.S)
    assert m, name
    return m.group(0)


STUBS = r'''
function J88_int(x) return math.floor(x) end
function J88_concat(a, b) return tostring(a) .. tostring(b) end
function I2S(x) return tostring(x) end
PLAYER_STATE_RESOURCE_LUMBER = "lumber"
BP = {}; MSG = {}
function Player(i) return i end
function IsPlayerInForce(p, f) return p < 8 end
udg_AllPlayers = {}
function AdjustPlayerStateBJ(v, p, s) BP[p] = (BP[p] or 0) + v end
function DisplayTimedTextToPlayer(p, x, y, d, s) MSG[p] = s end
ARMY = {}
function Naval_HasLivingArmy(pid) return ARMY[pid] == true end
SPAWN_UNITS_COUNT = {}
LS103_Side = {}; LS103_Streak = {}; LS103_Fielded = {}
udg_int_Opponent = {[0] = 1, [1] = 0, [2] = 3, [3] = 2, [4] = 5, [5] = 4, [6] = 7, [7] = 6}
'''

TESTS = r'''
local R = {}
local function check(name, ok) R[#R + 1] = {name, ok} end
-- Each round: everyone fields an army; then the listed losers are wiped out first.
local function round(losers, fielded)
  for p = 0, 7 do ARMY[p] = (fielded == nil) or fielded[p] ~= false; SPAWN_UNITS_COUNT[p] = 0 end
  LS103_RoundStart()
  for _, p in ipairs(losers) do ARMY[p] = false; LS103_CheckSides() end
  -- the winners' armies later die in the centre; this must not count as a loss
  for p = 0, 7 do ARMY[p] = false end
  LS103_CheckSides()
  BP = {}; MSG = {}
  LS103_RoundEnd()
end
round({0}); round({0})
check("two losses: no compensation", BP[0] == nil and LS103_Streak[0] == 2)
check("side winner's later death is not a loss", LS103_Streak[1] == 0)
round({0})
check("third loss pays 3000 with a message", BP[0] == 3000 and MSG[0]:find("Losing streak") and MSG[0]:find("3000"))
round({0})
check("fourth loss pays 4000", BP[0] == 4000)
round({0})
check("fifth loss pays 5000", BP[0] == 5000)
round({1})
check("a side win resets the streak", LS103_Streak[0] == 0 and BP[0] == nil)
round({2}); round({2}); round({2}, {[2] = false, [3] = true})
check("a round without troops neither pays nor changes the streak", BP[2] == nil and LS103_Streak[2] == 2)
round({2})
check("next fielded loss continues to 3 and pays 3000", BP[2] == 3000)
-- Both armies of a pairing fall in the same check: draw.
for p = 0, 7 do ARMY[p] = true; SPAWN_UNITS_COUNT[p] = 0 end
LS103_RoundStart()
ARMY[4] = false; ARMY[5] = false; LS103_CheckSides()
check("simultaneous wipe is a draw for both", LS103_Side[4] == 3 and LS103_Side[5] == 3)
-- Queued reinforcements keep a player in the fight.
LS103_RoundStart()
ARMY[6] = false; SPAWN_UNITS_COUNT[6] = 2; LS103_CheckSides()
check("queued reinforcements are not a defeat", LS103_Side[6] == 0)
return R
'''


def main():
    vm = LuaRuntime(unpack_returned_tuples=True)
    vm.execute(STUBS)
    for name in ('LS103_RoundStart', 'LS103_CheckSides', 'LS103_RoundEnd'):
        vm.execute(fn(name))
    results = vm.execute(TESTS)
    rows = [(results[i][1], bool(results[i][2])) for i in range(1, len(results) + 1)]
    for name, ok in rows:
        print(('PASS ' if ok else 'FAIL ') + name)
    output = HERE.parent / 'results/mock-streak103.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(
        {'scope': 'Mock Lua 5.3 with stubbed natives; not an engine, editor or multiplayer test.',
         'results': [{'case': n, 'pass': ok} for n, ok in rows]}, indent=2), encoding='utf-8')
    assert all(ok for _, ok in rows), 'mock failures'
    print(len(rows), 'cases passed')


if __name__ == '__main__':
    main()
