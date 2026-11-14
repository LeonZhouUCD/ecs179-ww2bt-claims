"""Mock Lua 5.3 tests for the MacArthur carrier module (0.7.0 Lua13, updated for 0.7.3 Lua16).

Runs the project's runtime prelude and modules/macarthur.lua against stubbed Warcraft
natives. This checks script logic only; it is not an engine or World Editor test.
"""
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
from lupa.lua53 import LuaRuntime  # noqa: E402

STUBS = r'''
UNIT_TYPE_STRUCTURE = "structure"; UNIT_TYPE_FLYING = "flying"
UNIT_STATE_MANA = "mana"; UNIT_STATE_MAX_LIFE = "maxlife"
PLAYER_STATE_RESOURCE_LUMBER = "lumber"
ATTACK_TYPE_CHAOS = "chaos"; DAMAGE_TYPE_NORMAL = "normal"; WEAPON_TYPE_WHOKNOWS = "whoknows"
EVENT_PLAYER_UNIT_SPELL_EFFECT = "effect"
bj_DEGTORAD = math.pi / 180; bj_RADTODEG = 180 / math.pi
LOG = {messages = {}, damage = {}, orders = {}, effects = 0, destroyed = 0, timers = {}}
players = {}
function Player(i) if not players[i] then players[i] = {id = i, lumber = 0} end return players[i] end
function GetPlayerId(p) return p.id end
function GetPlayerState(p, s) return p.lumber end
function SetPlayerState(p, s, v) p.lumber = v end
units = {}
function newunit(owner, t, x, y)
  local u = {owner = Player(owner), type = t, x = x, y = y, alive = true, hidden = false, abilities = {},
             structure = false, flying = false, invul = false, mana = 0, maxlife = 100, order = 0}
  units[#units + 1] = u
  return u
end
function CreateUnit(p, t, x, y, f) local u = newunit(p.id, t, x, y); u.created = true; return u end
function RemoveUnit(u) u.removed = true; u.alive = false end
function GetUnitTypeId(u) if u == nil or u.removed then return 0 end return u.type end
function GetOwningPlayer(u) return u.owner end
function IsUnitAliveBJ(u) return u.alive and not u.removed end
function IsUnitHidden(u) return u.hidden end
function IsUnitType(u, k) if k == "structure" then return u.structure end return u.flying end
function IsUnitEnemy(u, p) return u.owner.id ~= p.id end
function BlzIsUnitInvulnerable(u) return u.invul end
function GetUnitAbilityLevel(u, id) return u.abilities[id] or 0 end
function UnitAddAbility(u, id) u.abilities[id] = 1 end
function UnitRemoveAbility(u, id) u.abilities[id] = nil end
function UnitMakeAbilityPermanent(u, f, id) end
function GetUnitX(u) return u.x end
function GetUnitY(u) return u.y end
function SetUnitX(u, x) u.x = x end
function SetUnitY(u, y) u.y = y end
function SetUnitFacing(u, f) end
function GetUnitState(u, s) return u[s] end
function SetUnitState(u, s, v) u[s] = v end
function BlzGetUnitMaxMana(u) return 120 end
function GetUnitCurrentOrder(u) return u.order end
function OrderId(s) return 851972 end
function IssuePointOrder(u, o, x, y) LOG.orders[#LOG.orders + 1] = {o, x, y}; return true end
function IssueTargetOrder(u, o, t) LOG.orders[#LOG.orders + 1] = {o, t}; return true end
MANA = {}
function BlzGetUnitAbilityManaCost(u, id, level) return MANA[id] end
function BlzEndUnitAbilityCooldown(u, id) end
function DisplayTextToPlayer(p, x, y, m) LOG.messages[#LOG.messages + 1] = m end
function DisplayTimedTextToPlayer(p, x, y, d, m) LOG.messages[#LOG.messages + 1] = m end
function DG73_Log(a, b, c) LOG.messages[#LOG.messages + 1] = "LOG " .. tostring(c) end
function I2R(i) return i + 0.0 end
function I2S(i) return tostring(i) end
function Cos(a) return math.cos(a) end
function Sin(a) return math.sin(a) end
function Atan2(y, x) return math.atan(y, x) end
function SquareRoot(v) return math.sqrt(v) end
function RMinBJ(a, b) return math.min(a, b) end
-- groups
function CreateGroup() return {list = {}} end
function DestroyGroup(g) end
function GroupAddUnit(g, u) if g then for _, v in ipairs(g.list) do if v == u then return end end; g.list[#g.list + 1] = u end end
function GroupRemoveUnit(g, u) for i, v in ipairs(g.list) do if v == u then table.remove(g.list, i) return end end end
function FirstOfGroup(g) if g == nil then return nil end return g.list[1] end
function IsUnitInGroup(u, g) if g == nil then return false end for _, v in ipairs(g.list) do if v == u then return true end end return false end
function GroupEnumUnitsOfPlayer(g, p, f) g.list = {}; for _, u in ipairs(units) do if u.owner == p and not u.removed then g.list[#g.list + 1] = u end end end
function GroupEnumUnitsInRect(g, r, f) g.list = {}; for _, u in ipairs(units) do if not u.removed then g.list[#g.list + 1] = u end end end
function GetPlayableMapRect() return {} end
function GetRandomInt(a, b) return a end
-- hashtable
HT = {}
local function slot(k) HT[k] = HT[k] or {} return HT[k] end
function SaveUnitHandle(h, k, i, v) slot(k)[i] = v end
function SaveInteger(h, k, i, v) slot(k)[i] = v end
function SaveReal(h, k, i, v) slot(k)[i] = v end
function SaveBoolean(h, k, i, v) slot(k)[i] = v end
function SaveTimerHandle(h, k, i, v) slot(k)[i] = v end
function RemoveSavedHandle(h, k, i) slot(k)[i] = nil end
function LoadUnitHandle(h, k, i) return slot(k)[i] end
function LoadReal(h, k, i) return slot(k)[i] or 0.0 end
function LoadInteger(h, k, i) return slot(k)[i] or 0 end
function LoadTimerHandle(h, k, i) return slot(k)[i] end
function FlushChildHashtable(h, k) HT[k] = nil end
local handles = 0
function GetHandleId(x) if not x.hid then handles = handles + 1; x.hid = handles end return x.hid end
function CreateTimer() local t = {}; LOG.timers[#LOG.timers + 1] = t; return t end
function TimerStart(t, d, rep, fn) t.d = d; t.rep = rep; t.fn = fn; t.running = true end
function PauseTimer(t) t.running = false end
function DestroyTimer(t) t.destroyed = true end
function GetExpiredTimer() return CURRENT_TIMER end
function CreateTrigger() return {} end
function BlzTriggerRegisterPlayerSyncEvent(t, p, prefix, host) end
function TriggerAddAction(t, fn) t.fn = fn end
function TriggerRegisterAnyUnitEventBJ(t, e) end
function Location(x, y) return {x = x, y = y} end
function MoveLocation(l, x, y) l.x = x; l.y = y end
function GetLocationZ(l) return 0.0 end
function AddSpecialEffect(m, x, y) LOG.effects = LOG.effects + 1; return {model = m, x = x, y = y, z = 0} end
function BlzSetSpecialEffectScale(e, s) e.scale = s end
function BlzSetSpecialEffectZ(e, z) e.z = z end
function BlzSetSpecialEffectPosition(e, x, y, z) e.x = x; e.y = y; e.z = z end
function DestroyEffect(e) LOG.destroyed = LOG.destroyed + 1 end
DAMAGE_SOURCE = nil; EVENT_DAMAGE = nil
function GetEventDamageSource() return DAMAGE_SOURCE end
function BlzSetEventDamage(v) EVENT_DAMAGE = v end
function UnitDamageTarget(s, t, a, atk, rng, at, dt, wt)
  -- Simulates armor/type doubling, then the damage event, as the engine would.
  DAMAGE_SOURCE = s; EVENT_DAMAGE = a * 2; Mac73_OnDamaged()
  LOG.damage[#LOG.damage + 1] = {s, t, EVENT_DAMAGE, at}; return true
end
function Bounty_Value(u) return u.bounty or 0 end
-- map state used by the module
CM67_Flag = {}; CM67_Chosen = {}
NewAI_Controlled = {}; NewAI_Paused = false
PLAYER_CURRENT_SITE = {[0] = 0, [1] = 2}
CavalryCharge_Mode = 1; udg_int_CurRound = 3
BonusPlayerUnits = nil; FINAL_TOUR_SPAWNS = {[0] = CreateGroup(), [1] = CreateGroup()}
Carrier_Summons = CreateGroup(); udg_group_AllSpawnedUnits = CreateGroup(); Carrier_Timer = CreateTimer()
function Carrier_Tick() end
Naval_Data = {}
ACTIVE = true; CLEARED = false
function Naval_IsBattleActive(pid) return ACTIVE end
function Naval_OpponentCleared(pid) return CLEARED end
function Naval_InsideZone(zone, x, y)
  if zone == 4 then return x >= -2688 and x <= 2688 and y >= -2560 and y <= 2688
  elseif zone == 0 then return x >= -2688 and x <= 2688 and y < -2560
  elseif zone == 1 then return x > 2688 and y >= -2560 and y <= 2688 end
  return false
end
function Naval_RefundRejected()
  local t = GetExpiredTimer(); local k = GetHandleId(t); local c = HT[k][20]
  c.mana = math.min(120, c.mana + HT[k][21])
end
'''

TESTS = r'''
local R = {}
local function check(name, cond) R[#R + 1] = {name, cond and true or false} end
local function fire(t) CURRENT_TIMER = t; t.fn() end
local function count(t) local n = 0; for _, u in ipairs(units) do if u.created and u.type == t and not u.removed then n = n + 1 end end return n end
MANA[Mac70_ABIL_F4F] = 40; MANA[Mac70_ABIL_F6F] = 40; MANA[Mac70_ABIL_SB2C] = 60; MANA[Mac70_ABIL_AIR] = 120

-- Selection and levels
local carrier = newunit(0, Mac70_CARRIER, 0, -4000)
carrier.mana = 120
check("not chosen -> level 0", Mac70_GetLevel(0) == 0)
CM67_Flag[0] = carrier; CM67_Chosen[0] = Mac70_CARRIER
check("free selection -> level 1", Mac70_GetLevel(0) == 1)
local function abil(u) return {u.abilities[Mac70_ABIL_F4F] ~= nil, u.abilities[Mac70_ABIL_F6F] ~= nil, u.abilities[Mac70_ABIL_SB2C] ~= nil, u.abilities[Mac70_ABIL_AIR] ~= nil} end
local a = abil(carrier)
check("level 1 has no call", not (a[1] or a[2] or a[3] or a[4]))
Player(0).lumber = 1999
local ok = Mac70_Upgrade(0)
check("1999 BP refused, unchanged", (not ok) and Player(0).lumber == 1999 and Mac70_GetLevel(0) == 1)
Player(0).lumber = 11000
local paid = {0, 2000, 4000, 7000, 11000}
local expect = {{true, false, false, false}, {false, true, false, false}, {false, true, true, false}, {false, true, true, true}}
for lvl = 2, 5 do
  ok = Mac70_Upgrade(0)
  a = abil(carrier)
  check("upgrade to " .. lvl .. " ok", ok and Mac70_GetLevel(0) == lvl and Player(0).lumber == 11000 - paid[lvl] and Mac70_Spent(0) == paid[lvl])
  local e = expect[lvl - 1]
  check("abilities at level " .. lvl, a[1] == e[1] and a[2] == e[2] and a[3] == e[3] and a[4] == e[4])
end
ok = Mac70_Upgrade(0)
check("max level refused, total spent 11000", (not ok) and Player(0).lumber == 0 and Mac70_GetLevel(0) == 5)

-- Access rules, normal round (own zone 0 = south; zone 1 is another battlefield)
CavalryCharge_Mode = 1; ACTIVE = true; CLEARED = false
check("own battlefield allowed", Mac70_TargetZone(0, 0, -3000) == 0)
check("other battlefield refused", Mac70_TargetZone(0, 3000, 0) < 0)
check("center refused: neither", Mac70_TargetZone(0, 0, 0) < 0)
local troop = newunit(9, 1, 0, -3000)
troop.x = 100; troop.y = 100
check("center refused: troops there but battle not won", Mac70_TargetZone(0, 0, 0) < 0)
troop.x = 0; troop.y = -3000; CLEARED = true
check("center refused: battle won but troops not there", Mac70_TargetZone(0, 0, 0) < 0)
local plane = newunit(9, Mac70_F4F_TYPE, 50, 50); GroupAddUnit(Carrier_Summons, plane)
check("carrier aircraft do not count as arrival", Mac70_TargetZone(0, 0, 0) < 0)
troop.x = 100; troop.y = 100
check("center allowed: won and arrived", Mac70_TargetZone(0, 0, 0) == 4)
troop.x = 0; troop.y = -3000
check("arrival latched this round", Mac70_TargetZone(0, 0, 0) == 4)
check("home stays usable after unlock", Mac70_TargetZone(0, 0, -3000) == 0)
udg_int_CurRound = 4
check("latch resets next round", Mac70_TargetZone(0, 0, 0) < 0)
ACTIVE = false
check("inactive battle refused", Mac70_TargetZone(0, 0, -3000) < 0)
ACTIVE = true; CavalryCharge_Mode = 2
check("bonus: center allowed", Mac70_TargetZone(0, 0, 0) == 4)
check("bonus: home refused", Mac70_TargetZone(0, 0, -3000) < 0)
CavalryCharge_Mode = 3
check("final: center allowed", Mac70_TargetZone(0, 0, 0) == 4)

-- Rejected cast refunds mana, and spawns nothing
CavalryCharge_Mode = 1; CLEARED = false; udg_int_CurRound = 5
carrier.mana = 120 - 120   -- the engine has already spent the cost
function GetSpellTargetX() return 3000 end
function GetSpellTargetY() return 0 end
function GetSpellAbilityId() return Mac70_ABIL_AIR end
function GetTriggerUnit() return carrier end
local before = #LOG.timers
Mac70_OnCast()
local refund = LOG.timers[#LOG.timers]
check("illegal cast schedules a refund", #LOG.timers == before + 1 and refund.d == 0.0)
fire(refund)
check("illegal cast refunds 120 mana", carrier.mana == 120)
check("illegal cast spawns nothing", count(Mac70_F4F_TYPE) == 0 and count(Mac70_B17_TYPE) == 0)
check("illegal cast message", LOG.messages[#LOG.messages] == "MacArthur's reinforcements can only target your own battlefield.")

-- Legal casts: exact rosters
function GetSpellTargetX() return 0 end
function GetSpellTargetY() return -3000 end
Mac70_Level[0] = 2; Mac70_Apply(0)
function GetSpellAbilityId() return Mac70_ABIL_F4F end
Mac70_OnCast()
check("F4F call: exactly 3 F4F", count(Mac70_F4F_TYPE) == 3)
Mac70_Level[0] = 3; Mac70_Apply(0)
function GetSpellAbilityId() return Mac70_ABIL_F6F end
Mac70_OnCast()
check("F6F call: exactly 3 F6F", count(Mac70_F6F_TYPE) == 3)
check("existing F4Fs stay F4Fs", count(Mac70_F4F_TYPE) == 3)
local tracked = 0
for _, u in ipairs(units) do if u.created and IsUnitInGroup(u, Carrier_Summons) and HT[GetHandleId(u)][30] == true and HT[GetHandleId(u)][2] == 0 then tracked = tracked + 1 end end
check("all summons use the carrier lifecycle", tracked == 6)
check("no summon outside its zone", (function() for _, u in ipairs(units) do if u.created and u.type ~= Mac70_SB2C_TYPE and not Naval_InsideZone(0, u.x, u.y) then return false end end return true end)())

-- SB2C target rules
local enemy = newunit(10, 77, 0, -3200); enemy.maxlife = 900
local air = newunit(10, 78, 0, -3200); air.flying = true
local building = newunit(10, 79, 0, -3200); building.structure = true
local own = newunit(9, 80, 0, -3200)
check("enemy ground unit eligible", Mac70_StrikeTarget(0, enemy))
check("aircraft not eligible", not Mac70_StrikeTarget(0, air))
check("building not eligible", not Mac70_StrikeTarget(0, building))
check("own unit not eligible", not Mac70_StrikeTarget(0, own))
CavalryCharge_Mode = 2
check("bonus: only bonus enemies", not Mac70_StrikeTarget(0, enemy) and Mac70_StrikeTarget(0, newunit(18, 81, 0, 0)))
CavalryCharge_Mode = 1

-- SB2C strike lifecycle: one bomb, 4000 chaos damage at impact, aircraft removed
Mac70_Level[0] = 4; Mac70_Apply(0)
function GetSpellAbilityId() return Mac70_ABIL_SB2C end
function GetSpellTargetUnit() return enemy end
Mac70_Init()
Mac70_OnCast()
check("strike started", #Mac70_Strikes == 1 and count(Mac70_SB2C_TYPE) == 1)
local s = Mac70_Strikes[1]
local damageBefore = #LOG.damage
local steps = 0
while #Mac70_Strikes > 0 and steps < 200 do CURRENT_TIMER = Mac70_StrikeTimer; Mac70_StrikeTick(); steps = steps + 1 end
check("strike completes", #Mac70_Strikes == 0 and steps < 200)
check("exactly one 4000 chaos hit on the target", #LOG.damage == damageBefore + 1 and LOG.damage[#LOG.damage][2] == enemy and LOG.damage[#LOG.damage][3] == 4000.0 and LOG.damage[#LOG.damage][4] == "chaos")
check("strike aircraft removed", count(Mac70_SB2C_TYPE) == 0)
-- target dies before impact
Mac70_OnCast(); damageBefore = #LOG.damage
for i = 1, 10 do Mac70_StrikeTick() end
enemy.alive = false
while #Mac70_Strikes > 0 do Mac70_StrikeTick() end
check("dead target takes no damage", #LOG.damage == damageBefore)
-- invulnerable at impact
local tank = newunit(11, 82, 0, -3300); tank.invul = true
function GetSpellTargetUnit() return tank end
Mac70_OnCast(); damageBefore = #LOG.damage
while #Mac70_Strikes > 0 do Mac70_StrikeTick() end
check("invulnerable target takes no damage", #LOG.damage == damageBefore)
-- cleanup at round end
tank.invul = false
Mac70_OnCast()
Mac70_StopStrikes()
check("round cleanup removes strikes", #Mac70_Strikes == 0 and count(Mac70_SB2C_TYPE) == 0)
-- illegal strike: enemy in another battlefield
local far = newunit(10, 83, 3000, 0)
function GetSpellTargetUnit() return far end
carrier.mana = 0
before = #LOG.timers
Mac70_OnCast()
fire(LOG.timers[#LOG.timers])
check("illegal strike refunds 60 mana", carrier.mana == 60 and #Mac70_Strikes == 0)

-- AI
NewAI_Controlled[0] = true
Mac70_Level[0] = 1; Mac70_Apply(0)
Player(0).lumber = 3999; Mac70_AIUpgrade(0)
check("AI keeps a 2000 reserve", Mac70_GetLevel(0) == 1)
Player(0).lumber = 4000; Mac70_AIUpgrade(0)
check("AI upgrades with spare Blood Points", Mac70_GetLevel(0) == 2 and Player(0).lumber == 2000)
local function lastOrder() return LOG.orders[#LOG.orders] end
enemy.alive = true; enemy.x = 0; enemy.y = -3200
carrier.mana = 40; Mac70_AIThink(0)
check("AI level 2 calls F4F", lastOrder()[1] == "blizzard")
Mac70_Level[0] = 4; Mac70_Apply(0); carrier.mana = 60; Mac70_AIThink(0)
check("AI level 4 strikes the toughest target", lastOrder()[1] == "acidbomb")
local n = #LOG.orders
Mac70_Level[0] = 5; Mac70_Apply(0); carrier.mana = 100; Mac70_AIThink(0)
check("AI level 5 saves for the air group", #LOG.orders == n)
carrier.mana = 120; Mac70_AIThink(0)
check("AI level 5 calls the air group", lastOrder()[1] == "rainoffire")
-- SB2C Group Strike: 4 waves, up to 3 random legal targets inside 500 each.
Mac70_StopStrikes()
CavalryCharge_Mode = 1; ACTIVE = true
Mac70_Level[0] = 5; Mac70_Apply(0)
local started = 0
local rawStart = Mac70_StartStrike
Mac70_StartStrike = function(pid, c, t) started = started + 1; return rawStart(pid, c, t) end
for i = 1, 5 do newunit(12, 90, 100 * i, -3100) end
local outside = newunit(12, 91, 0, -3100 - 900)
local air2 = newunit(12, 92, 50, -3050); air2.flying = true
function GetSpellAbilityId() return Mac70_ABIL_AIR end
function GetSpellTargetX() return 0 end
function GetSpellTargetY() return -3100 end
Mac70_OnCast()
check("group strike: first wave of 3", started == 3 and #Mac70_Barrages == 1)
for w = 1, 3 do CURRENT_TIMER = Mac70_BarrageTimer; Mac70_BarrageTick() end
check("group strike: 4 waves, 12 strikes, then ends", started == 12 and #Mac70_Barrages == 0)
local hitOutside = false
for _, s in ipairs(Mac70_Strikes) do if s.target == outside or s.target == air2 then hitOutside = true end end
check("group strike skips targets outside the circle and aircraft", not hitOutside)
Mac70_StopStrikes()
check("round cleanup clears group strikes", #Mac70_Barrages == 0 and #Mac70_Strikes == 0)
function GetSpellTargetX() return 3000 end
function GetSpellTargetY() return 0 end
carrier.mana = 0; started = 0
Mac70_OnCast(); fire(LOG.timers[#LOG.timers])
check("illegal group strike refunds 120 mana", carrier.mana == 120 and started == 0)
Mac70_StartStrike = rawStart
-- 0.7.3: the most valuable units are struck first.
Mac70_StopStrikes()
for _, u in ipairs(units) do if u.type == 90 then u.removed = true end end
local cheap = newunit(12, 93, 0, -3100); cheap.bounty = 5
local rich = {}
for i = 1, 3 do rich[i] = newunit(12, 94, 30 * i, -3100); rich[i].bounty = 100 * i end
local mid = newunit(12, 95, -30, -3100); mid.bounty = 50
local chosen = {}
Mac70_StartStrike = function(pid, c, t) chosen[#chosen + 1] = t end
function GetSpellTargetX() return 0 end
function GetSpellTargetY() return -3100 end
carrier.mana = 120
Mac70_OnCast()
check("group strike picks the 3 highest Blood Point units", chosen[1] == rich[3] and chosen[2] == rich[2] and chosen[3] == rich[1])
CURRENT_TIMER = Mac70_BarrageTimer; Mac70_BarrageTick()
check("next wave takes the next most valuable", chosen[4] == rich[3] and #chosen == 6)
Mac70_StartStrike = rawStart
Mac70_StopStrikes()
-- 0.7.3: a bomb always deals exactly 4000 after armor and attack type.
local before = #LOG.damage
local plane = newunit(0, Mac70_SB2C_TYPE, 0, 0)
Mac70_StrikeHit = true
UnitDamageTarget(plane, rich[1], Mac70_STRIKE_DAMAGE, false, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
Mac70_StrikeHit = false
check("SB2C bomb final damage is exactly 4000", LOG.damage[before + 1][3] == 4000)
UnitDamageTarget(newunit(0, 77, 0, 0), rich[1], 100, false, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
check("other damage is not changed", LOG.damage[before + 2][3] == 200)
-- 0.7.3: commander mana is refilled after every battle.
carrier.mana = 3
Mac73_RefillCommanders()
check("battle end refills commander mana", carrier.mana == 120)
return R
'''


def main():
    project = HERE.parent / 'source'
    runtime = (project / 'runtime.lua').read_text(encoding='utf-8')
    module = (project / 'modules/macarthur.lua').read_text(encoding='utf-8')
    vm = LuaRuntime(unpack_returned_tuples=True)
    vm.execute(STUBS)
    vm.execute(runtime)
    vm.execute(module)
    results = vm.execute(TESTS)
    rows = [(results[i][1], bool(results[i][2])) for i in range(1, len(results) + 1)]
    for name, ok in rows:
        print(('PASS ' if ok else 'FAIL ') + name)
    out = HERE.parent / 'results' / 'mock-mac70.json'
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps({'scope': 'Mock Lua 5.3 with stubbed natives; not an engine test.',
                               'results': [{'case': n, 'pass': ok} for n, ok in rows]}, indent=2), encoding='utf-8')
    assert all(ok for _, ok in rows), 'mock failures'
    print(len(rows), 'cases passed')


if __name__ == '__main__':
    main()
