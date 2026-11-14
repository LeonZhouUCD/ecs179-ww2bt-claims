function PL104_Now()
    return TimerGetElapsed(PL104_Clock)
end

function PL104_Alive(u)
    return (u ~= nil) and (GetUnitTypeId(u) ~= 0) and (GetWidgetLife(u) > 0.405) and (not IsUnitType(u, UNIT_TYPE_DEAD))
end

function PL104_Pid(u)
    --  Seat of a combat unit (combat troops belong to Player(seat + 9)); -1 otherwise.
    local pid = GetPlayerId(GetOwningPlayer(u)) - 9
    if ((pid < 0) or (pid > 7)) then
        return -1
    end
    return pid
end

function PL104_Ready(u)
    --  On the battlefield and able to act.
    return PL104_Alive(u) and (not IsUnitHidden(u)) and (not IsUnitPaused(u)) and (not IsUnitType(u, UNIT_TYPE_STUNNED))
        and (PL104_Pid(u) >= 0) and PL104_Active and Zhukov_BattleActive()
end

function PL104_Spawn(p, g, tid, facing)
    if (tid == PL_GHOST) then
        DoSpawn2(p, g, PL_C_GHOST, 1, facing)
    elseif (tid == PL_GHOST_AT) then
        DoSpawn2(p, g, PL_C_GHOST_AT, 1, facing)
    elseif (tid == PL_SPITFIRE) then
        DoSpawn2(p, g, PL_C_SPITFIRE, 2, facing)
    elseif (tid == PL_SKALSKI) then
        DoSpawn2(p, g, PL_C_SKALSKI, 1, facing)
    elseif (tid == PL_WELLINGTON) then
        DoSpawn2(p, g, PL_C_WELLINGTON, 1, facing)
    elseif (tid == PL_SKARZYNSKI) then
        DoSpawn2(p, g, PL_C_SKARZYNSKI, 1, facing)
    elseif (tid == PL_MACZEK) then
        DoSpawn2(p, g, PL_C_MACZEK, 1, facing)
        DoSpawn2(p, g, PL_C_SHERMAN, 4, facing)
        DoSpawn2(p, g, PL_C_FIREFLY, 2, facing)
    end
end

function PL104_IsAircraft(t)
    --  Ground bombers take the first attack-move to the opponent's side like the US bombers.
    return (t == PL_C_WELLINGTON) or (t == PL_C_SKARZYNSKI)
end

function PL104_InitInfantry()
    SaveBoolean(CavalryCharge_Infantry, 0, PL_C_GHOST, true)
    SaveBoolean(CavalryCharge_Infantry, 0, PL_C_GHOST_AT, true)
end

function PL104_Turret(t)
    --  Bomber defensive fire: targets per second, range, damage per target.
    if (t == PL_C_WELLINGTON) then
        return 1, 450.0, 20.0
    elseif (t == PL_C_SKARZYNSKI) then
        return 2, 500.0, 24.0
    end
    return 0, 0.0, 0.0
end

function PL104_BombDamage(t)
    --  Skarzynski uses the B-29's Saturation Bombing (same bombs and timing).
    if (t == PL_C_SKARZYNSKI) then
        return 161.0, 80.5
    end
    return 0.0, 0.0
end

-- ---------------------------------------------------------------------------------------------
-- Registration and battle lifecycle.
function PL104_Register(u)
    local t = 0
    local key = 0
    if (u == nil) then
        return
    end
    t = GetUnitTypeId(u)
    key = GetHandleId(u)
    if ((PL104_Known[key] == u) or (PL104_Pid(u) < 0)) then
        return
    end
    if (t == PL_C_WOJTEK) then
        PL104_Bears[#PL104_Bears + 1] = u
    elseif ((t == PL_C_GHOST) or (t == PL_C_GHOST_AT)) then
        PL104_Ghosts[#PL104_Ghosts + 1] = u
    elseif (t == PL_C_SKALSKI) then
        PL104_Aces[#PL104_Aces + 1] = u
    elseif (t == PL_C_ORLIK) then
        PL104_Orliks[#PL104_Orliks + 1] = u
    else
        return
    end
    PL104_Known[key] = u
end

function PL104_RegisterEnum()
    PL104_Register(GetEnumUnit())
end

function PL104_Begin()
    PL104_Active = true
    ForGroup(udg_group_AllSpawnedUnits, PL104_RegisterEnum)
    TimerStart(PL104_Timer, PL104_STEP, true, PL104_Tick)
end

function PL104_Release(s)
    if (GetUnitTypeId(s.unit) ~= 0) then
        BlzPauseUnitEx(s.unit, false)
    end
    DestroyEffect(s.fx)
end

function PL104_Stop()
    --  Battle reset: bullets, bursts, marks, stuns and Wojtek's bonus never carry over.
    local u = nil
    PL104_Active = false
    if (PL104_Timer ~= nil) then
        PauseTimer(PL104_Timer)
    end
    for i = #PL104_Bullets, 1, -1 do
        DestroyEffect(PL104_Bullets[i].fx)
        PL104_Bullets[i] = nil
    end
    for k, s in pairs(PL104_Stuns) do
        PL104_Release(s)
        PL104_Stuns[k] = nil
    end
    for k, m in pairs(PL104_Marks) do
        DestroyEffect(m.fx)
        PL104_Marks[k] = nil
    end
    if (PL104_Boosted ~= nil) then
        while true do
            u = FirstOfGroup(PL104_Boosted)
            if (u == nil) then break end
            GroupRemoveUnit(PL104_Boosted, u)
            UnitRemoveAbility(u, PL_ABIL_ARTILLERY)
        end
    end
    PL104_Bursts = {}
    PL104_Bears = {}
    PL104_BearReady = {}
    PL104_Ghosts = {}
    PL104_GhostShot = {}
    PL104_FlashUsed = {}
    PL104_Aces = {}
    PL104_Orliks = {}
    PL104_OrlikReady = {}
    PL104_Known = {}
    u = nil
end

function PL104_Prune(list)
    for i = #list, 1, -1 do
        if (not PL104_Alive(list[i])) then
            PL104_Known[GetHandleId(list[i])] = nil
            table.remove(list, i)
        end
    end
end

-- ---------------------------------------------------------------------------------------------
-- Wojtek: bear charge (CavalryCharge handles the leap), central-field advance, artillery bonus.
function PL104_BearImpact(target)
    --  The bayonet impact compensates the map's Chaos armour-type multiplier, so universal damage
    --  lands at exactly the stated value before armour points; scale it from 30 to 200.
    return CavalryCharge_BayonetImpactDamage(target) * (PL104_BEAR_DAMAGE / BayonetCharge_Damage)
end

function PL104_BearCooling(bear)
    return PL104_Now() < (PL104_BearReady[GetHandleId(bear)] or -1.0)
end

function PL104_BearCharged(bear)
    PL104_BearReady[GetHandleId(bear)] = PL104_Now() + PL104_BEAR_COOLDOWN
end

function PL104_BearAdvance(bear)
    --  After his side battle is won the bear follows the normal route to the central field.
    local pid = PL104_Pid(bear)
    local order = GetUnitCurrentOrder(bear)
    if ((CavalryCharge_Mode == 1) and Naval_OpponentCleared(pid) and (not Naval_InsideZone(4, GetUnitX(bear), GetUnitY(bear)))
        and ((order == 0) or (order == OrderId("stop")) or (order == OrderId("holdposition")))) then
        Advance_Issue(bear, false)
    end
end

function PL104_Artillery()
    --  Living, deployed Wojtek -> every Polish artillery piece of his player attacks 50% faster.
    local bear = {}
    local u = nil
    local pid = 0
    local want = false
    for _, b in ipairs(PL104_Bears) do
        if (PL104_Alive(b) and (not IsUnitHidden(b))) then
            bear[PL104_Pid(b)] = true
        end
    end
    --  Spawned troops plus every unit already boosted (one copy of the bonus per unit, never more).
    GroupClear(PL104_Scan)
    GroupAddGroup(udg_group_AllSpawnedUnits, PL104_Scan)
    GroupAddGroup(PL104_Boosted, PL104_Scan)
    while true do
        u = FirstOfGroup(PL104_Scan)
        if (u == nil) then break end
        GroupRemoveUnit(PL104_Scan, u)
        if PL_ARTILLERY[GetUnitTypeId(u)] then
            pid = PL104_Pid(u)
            want = (pid >= 0) and (bear[pid] == true) and PL104_Alive(u) and (not IsUnitHidden(u))
            if (want and (GetUnitAbilityLevel(u, PL_ABIL_ARTILLERY) == 0)) then
                UnitAddAbility(u, PL_ABIL_ARTILLERY)
                GroupAddUnit(PL104_Boosted, u)
            elseif ((not want) and (GetUnitAbilityLevel(u, PL_ABIL_ARTILLERY) > 0)) then
                UnitRemoveAbility(u, PL_ABIL_ARTILLERY)
                GroupRemoveUnit(PL104_Boosted, u)
            end
        end
        if (GetUnitTypeId(u) == 0) then
            GroupRemoveUnit(PL104_Boosted, u)
        end
    end
    u = nil
end

-- ---------------------------------------------------------------------------------------------
-- Warsaw Ghost: Marksmanship, Concealment and Flashbang.
function PL104_IsGhost(u)
    local t = GetUnitTypeId(u)
    return (t == PL_C_GHOST) or (t == PL_C_GHOST_AT)
end

function PL104_Conceal(ghost)
    --  Visible from the start of an attack until 0.25 s after the attack cooldown has run out.
    local firing = PL104_Now() < ((PL104_GhostShot[GetHandleId(ghost)] or -100.0) + BlzGetUnitAttackCooldown(ghost, 0) + 0.25)
    if (firing and (GetUnitAbilityLevel(ghost, PL_ABIL_INVISIBLE) > 0)) then
        UnitRemoveAbility(ghost, PL_ABIL_INVISIBLE)
    elseif ((not firing) and (GetUnitAbilityLevel(ghost, PL_ABIL_INVISIBLE) == 0)) then
        UnitAddAbility(ghost, PL_ABIL_INVISIBLE)
    end
end

function PL104_Zone(x, y)
    for zone = 0, 4 do
        if Naval_InsideZone(zone, x, y) then
            return zone
        end
    end
    return -1
end

function PL104_Stun(u, seconds)
    --  Counter-based engine stun; a second flashbang extends the same stun.
    local key = GetHandleId(u)
    local s = PL104_Stuns[key]
    if (s == nil) then
        BlzPauseUnitEx(u, true)
        s = {unit = u, fx = AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl", u, "overhead"), untilTime = 0.0}
        PL104_Stuns[key] = s
    end
    s.untilTime = RMaxBJ(s.untilTime, PL104_Now() + seconds)
end

function PL104_Blink(ghost)
    --  1000 straight back from his facing; the nearest legal point on that line inside his
    --  current battlefield otherwise. Never into another battlefield or off the map.
    local x = GetUnitX(ghost)
    local y = GetUnitY(ghost)
    local a = GetUnitFacing(ghost) * bj_DEGTORAD
    local zone = PL104_Zone(x, y)
    local d = 1000.0
    local cx = 0.0
    local cy = 0.0
    if (zone < 0) then
        return
    end
    while (d >= 50.0) do
        cx = x - d * Cos(a)
        cy = y - d * Sin(a)
        if (Naval_InsideZone(zone, cx, cy) and (not IsTerrainPathable(cx, cy, PATHING_TYPE_WALKABILITY))) then
            SetUnitPosition(ghost, cx, cy)
            if Naval_InsideZone(zone, GetUnitX(ghost), GetUnitY(ghost)) then
                DestroyEffect(AddSpecialEffect("Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl", x, y))
                DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", ghost, "origin"))
                Advance_Issue(ghost, false)
                return
            end
            SetUnitPosition(ghost, x, y)
        end
        d = d - 50.0
    end
end

function PL104_OnAttacked()
    local ghost = GetTriggerUnit()
    local attacker = GetAttacker()
    if ((not PL104_Active) or PL104_Busy) then
        return
    end
    if PL104_IsGhost(attacker) then
        --  His own attack starts: reveal him for this shot.
        PL104_GhostShot[GetHandleId(attacker)] = PL104_Now()
        UnitRemoveAbility(attacker, PL_ABIL_INVISIBLE)
    end
    if (PL104_IsGhost(ghost) and PL104_Alive(ghost) and PL104_Alive(attacker) and IsUnitEnemy(attacker, GetOwningPlayer(ghost))
        and (PL104_FlashUsed[GetHandleId(ghost)] ~= ghost)) then
        --  One flashbang per Ghost per battle; the busy flag only stops re-entry.
        PL104_FlashUsed[GetHandleId(ghost)] = ghost
        PL104_Busy = true
        DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", GetUnitX(ghost), GetUnitY(ghost)))
        if (not IsUnitType(attacker, UNIT_TYPE_MAGIC_IMMUNE)) then
            PL104_Stun(attacker, 1.5)
        end
        PL104_Blink(ghost)
        PL104_Busy = false
    end
    ghost = nil
    attacker = nil
end

-- ---------------------------------------------------------------------------------------------
-- Damage: Marksmanship kills, then Mark Target (+30%). Neither deals new damage.
function PL104_OnDamaged()
    local source = GetEventDamageSource()
    local target = GetTriggerUnit()
    local amount = GetEventDamage()
    local m = nil
    if (amount <= 0.0) then
        return
    end
    if (PL104_IsGhost(source) and BlzGetEventIsAttack() and CavalryCharge_IsInfantry(target)
        and IsUnitEnemy(target, GetOwningPlayer(source)) and (not BlzIsUnitInvulnerable(target)) and (GetRandomInt(1, 100) <= 20)) then
        BlzSetEventDamage(GetWidgetLife(target) + 1000.0)
        DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodFootman.mdl", target, "chest"))
        return
    end
    m = PL104_Marks[GetHandleId(target)]
    if ((m ~= nil) and (m.unit == target) and (PL104_Now() < m.untilTime)) then
        BlzSetEventDamage(amount * 1.3)
    end
end

-- ---------------------------------------------------------------------------------------------
-- Skalski: Ace Fury, +4% attack speed per 2% of maximum hitpoints lost (level 1 = +0%).
function PL104_Fury(ace)
    local maxLife = BlzGetUnitMaxHP(ace)
    local steps = 0
    local level = 1
    if (maxLife > 0) then
        steps = R2I((100.0 * (maxLife - GetWidgetLife(ace)) / maxLife) / 2.0)
    end
    level = IMinBJ(50, IMaxBJ(1, steps + 1))
    if (GetUnitAbilityLevel(ace, PL_ABIL_FURY) ~= level) then
        --  Re-add so the item-style bonus is recalculated at the new level.
        UnitRemoveAbility(ace, PL_ABIL_FURY)
        UnitAddAbility(ace, PL_ABIL_FURY)
        SetUnitAbilityLevel(ace, PL_ABIL_FURY, level)
    end
end

-- ---------------------------------------------------------------------------------------------
-- Orlik: automatic Machine-Gun Sweep.
function PL104_SweepTarget(orlik, u)
    --  Visible, living enemy infantry by the map's infantry list; never vehicles, aircraft or buildings.
    return PL104_Alive(u) and (not IsUnitHidden(u)) and CavalryCharge_IsInfantry(u) and IsUnitEnemy(u, GetOwningPlayer(orlik))
        and IsUnitVisible(u, GetOwningPlayer(orlik)) and (GetUnitAbilityLevel(u, 1097625443) == 0) and (not BlzIsUnitInvulnerable(u))
end

function PL104_SectorHasTarget(orlik)
    local x = GetUnitX(orlik)
    local y = GetUnitY(orlik)
    local facing = GetUnitFacing(orlik) * bj_DEGTORAD
    local u = nil
    local found = false
    local diff = 0.0
    GroupEnumUnitsInRange(PL104_Search, x, y, PL104_SWEEP_RANGE, nil)
    while true do
        u = FirstOfGroup(PL104_Search)
        if (u == nil) then break end
        GroupRemoveUnit(PL104_Search, u)
        if ((not found) and PL104_SweepTarget(orlik, u)) then
            diff = Atan2(Sin(Atan2(GetUnitY(u) - y, GetUnitX(u) - x) - facing), Cos(Atan2(GetUnitY(u) - y, GetUnitX(u) - x) - facing))
            if (RAbsBJ(diff) <= 60.0 * bj_DEGTORAD + 0.0001) then
                found = true
            end
        end
    end
    u = nil
    return found
end

function PL104_Volley(b)
    --  Seven bullets 20 degrees apart, symmetric about the locked direction, one shared hit set.
    local hits = {}
    local a = 0.0
    local fx = nil
    local x = GetUnitX(b.unit)
    local y = GetUnitY(b.unit)
    for k = -3, 3 do
        a = b.dir + k * 20.0 * bj_DEGTORAD
        fx = AddSpecialEffect("war3mapImported\\Bullet.mdx", x, y)
        BlzSetSpecialEffectZ(fx, Mac70_GroundZ(x, y) + 60.0)
        BlzSetSpecialEffectYaw(fx, a)
        PL104_Bullets[#PL104_Bullets + 1] = {source = b.unit, owner = GetOwningPlayer(b.unit), x = x, y = y,
            dx = Cos(a), dy = Sin(a), left = PL104_SWEEP_RANGE, fx = fx, hits = hits}
    end
    fx = nil
end

function PL104_OrlikThink(orlik)
    local key = GetHandleId(orlik)
    local now = PL104_Now()
    if (PL104_Ready(orlik) and (now >= (PL104_OrlikReady[key] or -1.0)) and PL104_SectorHasTarget(orlik)) then
        --  Cooldown starts with the first volley.
        PL104_OrlikReady[key] = now + PL104_SWEEP_COOLDOWN
        PL104_Bursts[#PL104_Bursts + 1] = {unit = orlik, dir = GetUnitFacing(orlik) * bj_DEGTORAD, fired = 0, start = now}
    end
end

function PL104_BurstTick()
    local i = 1
    local b = nil
    local now = PL104_Now()
    while (i <= #PL104_Bursts) do
        b = PL104_Bursts[i]
        if (not PL104_Ready(b.unit)) then
            --  Dead, removed, hidden, stunned or out of battle: unlaunched volleys are cancelled.
            table.remove(PL104_Bursts, i)
        else
            while ((b.fired < 4) and (now + 0.001 >= b.start + b.fired * PL104_SWEEP_GAP)) do
                PL104_Volley(b)
                b.fired = b.fired + 1
            end
            if (b.fired >= 4) then
                table.remove(PL104_Bursts, i)
            else
                i = i + 1
            end
        end
    end
    b = nil
end

function PL104_SegmentDistance(px, py, ax, ay, bx, by)
    local vx = bx - ax
    local vy = by - ay
    local len = vx * vx + vy * vy
    local t = 0.0
    if (len > 0.0) then
        t = RMaxBJ(0.0, RMinBJ(1.0, ((px - ax) * vx + (py - ay) * vy) / len))
    end
    return SquareRoot((px - ax - t * vx) * (px - ax - t * vx) + (py - ay - t * vy) * (py - ay - t * vy))
end

function PL104_BulletHit(m, ax, ay, bx, by)
    --  Swept segment test: the first new infantry unit along this step's path, nearest the start.
    local u = nil
    local best = nil
    local bestD = 0.0
    local d = 0.0
    GroupEnumUnitsInRange(PL104_Search, (ax + bx) / 2.0, (ay + by) / 2.0, PL104_SWEEP_SPEED * PL104_STEP / 2.0 + PL104_SWEEP_WIDTH + 64.0, nil)
    while true do
        u = FirstOfGroup(PL104_Search)
        if (u == nil) then break end
        GroupRemoveUnit(PL104_Search, u)
        if ((m.hits[GetHandleId(u)] == nil) and PL104_SweepTarget(m.source, u)
            and (PL104_SegmentDistance(GetUnitX(u), GetUnitY(u), ax, ay, bx, by) <= PL104_SWEEP_WIDTH + BlzGetUnitCollisionSize(u))) then
            d = (GetUnitX(u) - ax) * (GetUnitX(u) - ax) + (GetUnitY(u) - ay) * (GetUnitY(u) - ay)
            if ((best == nil) or (d < bestD)) then
                best = u
                bestD = d
            end
        end
    end
    u = nil
    return best
end

function PL104_BulletTick()
    local i = 1
    local m = nil
    local step = 0.0
    local nx = 0.0
    local ny = 0.0
    local hit = nil
    while (i <= #PL104_Bullets) do
        m = PL104_Bullets[i]
        step = RMinBJ(PL104_SWEEP_SPEED * PL104_STEP, m.left)
        nx = m.x + m.dx * step
        ny = m.y + m.dy * step
        hit = nil
        if (GetUnitTypeId(m.source) ~= 0) then
            hit = PL104_BulletHit(m, m.x, m.y, nx, ny)
        end
        if (hit ~= nil) then
            --  Once per target per volley; spell damage like the map's other scripted machineguns.
            m.hits[GetHandleId(hit)] = true
            UnitDamageTarget(m.source, hit, PL104_SWEEP_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            DestroyEffect(m.fx)
            table.remove(PL104_Bullets, i)
        else
            m.x = nx
            m.y = ny
            m.left = m.left - step
            if ((m.left <= 0.0) or (not RectContainsCoords(GetPlayableMapRect(), nx, ny))) then
                DestroyEffect(m.fx)
                table.remove(PL104_Bullets, i)
            else
                BlzSetSpecialEffectPosition(m.fx, nx, ny, Mac70_GroundZ(nx, ny) + 60.0)
                i = i + 1
            end
        end
    end
    m = nil
    hit = nil
end

-- ---------------------------------------------------------------------------------------------
-- Maczek: Mark Target from the commander building.
function PL104_MarkValid(pid, target)
    local owner = 0
    if ((not PL104_Alive(target)) or IsUnitHidden(target) or (GetUnitAbilityLevel(target, 1097625443) > 0)
        or IsUnitType(target, UNIT_TYPE_STRUCTURE) or BlzIsUnitInvulnerable(target)) then
        return false
    end
    owner = GetPlayerId(GetOwningPlayer(target))
    if (CavalryCharge_Mode == 2) then
        return owner == 18
    end
    return (owner >= 9) and (owner <= 16) and (owner ~= pid + 9) and IsUnitEnemy(target, Player(pid + 9))
end

function PL104_MarkReason(pid, target)
    if (not Naval_IsBattleActive(pid)) then
        return "Mark Target can only be used during your battles."
    elseif (not PL104_MarkValid(pid, target)) then
        return "Mark Target needs a living enemy unit."
    elseif (Mac70_ZoneAllowed(pid, GetUnitX(target), GetUnitY(target), Mac70_CentralOpen(pid)) < 0) then
        return "Mark Target can only target your current battlefield."
    end
    return nil
end

function PL104_Mark(pid, target)
    local key = GetHandleId(target)
    local m = PL104_Marks[key]
    if ((m == nil) or (m.unit ~= target)) then
        m = {unit = target, fx = AddSpecialEffect("Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl", GetUnitX(target), GetUnitY(target))}
        BlzSetSpecialEffectColor(m.fx, 255, 30, 30)
        BlzSetSpecialEffectScale(m.fx, 2.0)
        BlzSetSpecialEffectPitch(m.fx, bj_PI / 2.0)
        PL104_Marks[key] = m
    end
    --  Re-marking refreshes the one mark and arrow; marks never multiply.
    m.pid = pid
    m.untilTime = PL104_Now() + PL104_MARK_DURATION
    PL104_MarkFollow(m)
end

function PL104_MarkFollow(m)
    local x = GetUnitX(m.unit)
    local y = GetUnitY(m.unit)
    BlzSetSpecialEffectPosition(m.fx, x, y, Mac70_GroundZ(x, y) + GetUnitFlyHeight(m.unit) + 260.0)
end

function PL104_MarkTick()
    local now = PL104_Now()
    for key, m in pairs(PL104_Marks) do
        if ((now >= m.untilTime) or (not PL104_Alive(m.unit)) or IsUnitHidden(m.unit) or (not IsUnitEnemy(m.unit, Player(m.pid + 9)))) then
            DestroyEffect(m.fx)
            PL104_Marks[key] = nil
        else
            PL104_MarkFollow(m)
        end
    end
end

function PL104_OnCast()
    local caster = GetTriggerUnit()
    local target = GetSpellTargetUnit()
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local reason = nil
    if ((GetSpellAbilityId() ~= PL_ABIL_MARK) or (GetUnitTypeId(caster) ~= PL_MACZEK) or (pid < 0) or (pid > 7)) then
        caster = nil
        return
    end
    reason = PL104_MarkReason(pid, target)
    if (reason ~= nil) then
        --  MacArthur's rejection path: mana and cooldown are given back after the event.
        Mac70_Reject(caster, PL_ABIL_MARK, reason)
    else
        RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
        PL104_Mark(pid, target)
    end
    caster = nil
    target = nil
end

-- ---------------------------------------------------------------------------------------------
function PL104_Tick()
    local now = PL104_Now()
    PL104_Ticks = PL104_Ticks + 1
    for k, s in pairs(PL104_Stuns) do
        if ((now >= s.untilTime) or (GetUnitTypeId(s.unit) == 0)) then
            PL104_Release(s)
            PL104_Stuns[k] = nil
        end
    end
    PL104_Prune(PL104_Ghosts)
    for _, g in ipairs(PL104_Ghosts) do
        PL104_Conceal(g)
    end
    PL104_Prune(PL104_Aces)
    for _, a in ipairs(PL104_Aces) do
        PL104_Fury(a)
    end
    PL104_Prune(PL104_Orliks)
    for _, o in ipairs(PL104_Orliks) do
        PL104_OrlikThink(o)
    end
    PL104_BurstTick()
    PL104_BulletTick()
    PL104_MarkTick()
    if (ModuloInteger(PL104_Ticks, 10) == 0) then
        PL104_Prune(PL104_Bears)
        for _, b in ipairs(PL104_Bears) do
            if PL104_Ready(b) then
                PL104_BearAdvance(b)
            end
        end
        PL104_Artillery()
    end
end

-- ---------------------------------------------------------------------------------------------
-- One hero per identity per player: purchases, upgrades, simultaneous orders and AI.
function PL104_Holds(u, identity)
    --  Owns that hero or is upgrading into it.
    local key = GetHandleId(u)
    if (PL_IDENTITY[GetUnitTypeId(u)] == identity) then
        return true
    end
    return LoadBoolean(ArmyEconomy_Ledger, key, 5) and (PL_IDENTITY[LoadInteger(ArmyEconomy_Ledger, key, 4)] == identity)
end

function PL104_Count(pid, identity, skip)
    local u = nil
    local n = 0
    GroupEnumUnitsOfPlayer(PL104_Scan, Player(pid), nil)
    while true do
        u = FirstOfGroup(PL104_Scan)
        if (u == nil) then break end
        GroupRemoveUnit(PL104_Scan, u)
        if ((skip[GetHandleId(u)] == nil) and PL104_Alive(u) and PL104_Holds(u, identity)) then
            n = n + 1
        end
    end
    u = nil
    return n
end

function PL104_RefreshLimits()
    --  The first Warsaw Ghost form closes once either form is owned or being bought.
    for pid = 0, 7 do
        if (PL104_Count(pid, 1, {}) > 0) then
            SetPlayerTechMaxAllowed(Player(pid), PL_GHOST, 0)
        else
            SetPlayerTechMaxAllowed(Player(pid), PL_GHOST, 1)
        end
        SetPlayerTechMaxAllowed(Player(pid), PL_GHOST_AT, 1)
        SetPlayerTechMaxAllowed(Player(pid), PL_SKALSKI, 1)
        SetPlayerTechMaxAllowed(Player(pid), PL_SKARZYNSKI, 1)
    end
end

function PL104_CheckUpgrades()
    --  Runs after the upgrade-start event has been booked. Simultaneous orders are decided in
    --  event order: the first keeps its upgrade, any later duplicate is cancelled (native refund).
    local skip = {}
    local item = nil
    local key = 0
    local identity = nil
    for _, item in ipairs(PL104_UpgradeQueue) do
        skip[GetHandleId(item)] = true
    end
    for _, item in ipairs(PL104_UpgradeQueue) do
        key = GetHandleId(item)
        skip[key] = nil
        identity = PL_IDENTITY[LoadInteger(ArmyEconomy_Ledger, key, 4)]
        if (PL104_Alive(item) and LoadBoolean(ArmyEconomy_Ledger, key, 5) and (identity ~= nil)) then
            skip[key] = true
            if (PL104_Count(GetPlayerId(GetOwningPlayer(item)), identity, skip) > 0) then
                IssueImmediateOrderById(item, 851976)
                DisplayTextToPlayer(GetOwningPlayer(item), 0.0, 0.0, "This hero is limited to one per player.")
            else
                skip[key] = nil
            end
        end
    end
    PL104_UpgradeQueue = {}
    PL104_RefreshLimits()
    item = nil
end

function PL104_OnUpgrade()
    local u = GetTriggerUnit()
    local pid = GetPlayerId(GetOwningPlayer(u))
    if ((pid >= 0) and (pid < 8)) then
        if (GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_START) then
            PL104_UpgradeQueue[#PL104_UpgradeQueue + 1] = u
        end
        if ((GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_FINISH) and (GetUnitTypeId(u) == PL_MACZEK)) then
            --  The national flag has no mana: refresh the runtime regeneration like the carrier commanders.
            BlzSetUnitRealField(u, UNIT_RF_MANA_REGENERATION, 1.0)
            SetUnitState(u, UNIT_STATE_MANA, I2R(BlzGetUnitMaxMana(u)))
        end
        TimerStart(PL104_UpgradeTimer, 0.0, false, PL104_CheckUpgrades)
    end
    u = nil
end

-- ---------------------------------------------------------------------------------------------
function PL104_AddChild(table, parent, child, countKey)
    local count = LoadInteger(table, parent, countKey)
    SaveInteger(table, parent, 100 + count, child)
    SaveInteger(table, parent, countKey, count + 1)
end

function PL104_Economy()
    --  Polish Sniper -> Warsaw Ghost -> Ghost (anti-tank); PZL P.11 -> Spitfire Mk IX -> Skalski;
    --  PZL.37 Los -> Wellington -> Skarzynski; Poland headquarters -> General Maczek.
    PL104_AddChild(ArmyEconomy_Types, PL_SNIPER, PL_GHOST, 6)
    ArmyEconomy_Register(PL_GHOST, 0, 2500, 100, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, PL_GHOST, 100, PL_GHOST_AT)
    ArmyEconomy_Register(PL_GHOST_AT, 0, 2500, 100, 5000, 3, 0)
    PL104_AddChild(ArmyEconomy_Types, PL_P11, PL_SPITFIRE, 6)
    ArmyEconomy_Register(PL_SPITFIRE, 0, 1500, 0, 3000, 3, 1)
    SaveInteger(ArmyEconomy_Types, PL_SPITFIRE, 100, PL_SKALSKI)
    ArmyEconomy_Register(PL_SKALSKI, 0, 3000, 0, 6000, 3, 0)
    PL104_AddChild(ArmyEconomy_Types, PL_LOS, PL_WELLINGTON, 6)
    ArmyEconomy_Register(PL_WELLINGTON, 0, 1500, 0, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, PL_WELLINGTON, 100, PL_SKARZYNSKI)
    ArmyEconomy_Register(PL_SKARZYNSKI, 0, 3000, 0, 5500, 3, 0)
    PL104_AddChild(ArmyEconomy_Types, PL_FLAG, PL_MACZEK, 6)
    ArmyEconomy_Register(PL_MACZEK, 0, 10000, 0, 10000, 1, 0)
end

function PL104_AO(tid, label, icon, category, dps, ground, air, attack, armorType, cooldown, range, armor, speed, low, high)
    AO_Register(tid, label, icon, "", category, dps, ground, air)
    SaveInteger(AO_Data, tid, 7, attack)
    SaveInteger(AO_Data, tid, 8, armorType)
    SaveReal(AO_Data, tid, 9, cooldown)
    SaveReal(AO_Data, tid, 10, range)
    SaveReal(AO_Data, tid, 11, armor)
    SaveReal(AO_Data, tid, 12, speed)
    SaveInteger(AO_Data, tid, 13, low)
    SaveInteger(AO_Data, tid, 14, high)
end

function PL104_Overview()
    --  Base DPS = average attack damage / interval; scripted skills are listed in the unit text.
    PL104_AO(PL_C_GHOST, "HERO Warsaw Ghost", "ReplaceableTextures\\CommandButtons\\BTNPolishWarsawGhost.blp", 0, 70.0, 70.0, 70.0, 2, 0, 2.0, 1000.0, 0.0, 175.0, 110, 170)
    PL104_AO(PL_C_GHOST_AT, "HERO Warsaw Ghost (Anti-Tank)", "ReplaceableTextures\\CommandButtons\\BTNPolishWarsawGhostAT.blp", 0, 91.0, 91.0, 91.0, 5, 0, 2.0, 1000.0, 0.0, 175.0, 143, 221)
    PL104_AO(PL_C_SPITFIRE, "Spitfire Mk IX", "ReplaceableTextures\\CommandButtons\\BTNPolishSpitfireIX.blp", 3, 105.56, 105.56, 105.56, 6, 5, 0.9, 550.0, 0.0, 200.0, 85, 105)
    PL104_AO(PL_C_SKALSKI, "HERO Stanislaw Skalski", "ReplaceableTextures\\CommandButtons\\BTNPolishSkalski.blp", 3, 193.75, 193.75, 193.75, 6, 5, 0.8, 600.0, 0.0, 220.0, 140, 170)
    PL104_AO(PL_C_WELLINGTON, "Vickers Wellington Mk II", "ReplaceableTextures\\CommandButtons\\BTNPolishWellington.blp", 3, 225.0, 225.0, 0.0, 3, 5, 1.0, 220.0, 1.0, 185.0, 200, 250)
    PL104_AO(PL_C_SKARZYNSKI, "HERO Stanislaw Skarzynski", "ReplaceableTextures\\CommandButtons\\BTNPolishSkarzynski.blp", 3, 213.18, 213.18, 0.0, 3, 5, 1.1, 250.0, 2.0, 190.0, 210, 259)
    PL104_AO(PL_C_MACZEK, "HERO Stanislaw Maczek", "ReplaceableTextures\\CommandButtons\\BTNPolishMaczek.blp", 2, 180.0, 180.0, 0.0, 5, 2, 1.5, 650.0, 8.0, 180.0, 220, 320)
    PL104_AO(PL_C_SHERMAN, "Polish M4 Sherman", "war3mapImported\\IconM4Sherman.blp", 2, 74.75, 74.75, 74.75, 5, 2, 2.0, 600.0, 0.0, 150.0, 100, 199)
    PL104_AO(PL_C_FIREFLY, "Polish Sherman Firefly", "ReplaceableTextures\\CommandButtons\\BTNBritishFirefly.blp", 2, 112.0, 112.0, 0.0, 5, 2, 2.5, 800.0, 1.0, 145.0, 240, 320)
    Zhukov_AOProducer(PL_GHOST, PL_C_GHOST, 1)
    Zhukov_AOProducer(PL_GHOST_AT, PL_C_GHOST_AT, 1)
    Zhukov_AOProducer(PL_SPITFIRE, PL_C_SPITFIRE, 2)
    Zhukov_AOProducer(PL_SKALSKI, PL_C_SKALSKI, 1)
    Zhukov_AOProducer(PL_WELLINGTON, PL_C_WELLINGTON, 1)
    Zhukov_AOProducer(PL_SKARZYNSKI, PL_C_SKARZYNSKI, 1)
    SaveInteger(AO_Data, PL_MACZEK, 20, 3)
    SaveInteger(AO_Data, PL_MACZEK, 100, PL_C_MACZEK)
    SaveInteger(AO_Data, PL_MACZEK, 200, 1)
    SaveInteger(AO_Data, PL_MACZEK, 101, PL_C_SHERMAN)
    SaveInteger(AO_Data, PL_MACZEK, 201, 4)
    SaveInteger(AO_Data, PL_MACZEK, 102, PL_C_FIREFLY)
    SaveInteger(AO_Data, PL_MACZEK, 202, 2)
end

function PL104_AIReset(uid)
    for key = 500, 567 do
        SaveReal(NewAI_Data, uid, key, 0.0)
    end
end

function PL104_RegisterAI()
    PL104_AIChild(PL_SNIPER, PL_GHOST)
    NewAI_CatalogUnit(PL_GHOST, 0, 2500, 3, 1, 1, 0, 1, 1, 550, "POL Warsaw Ghost (1)")
    SaveInteger(NewAI_Data, PL_GHOST, 100, PL_GHOST_AT)
    US95_AIAdd(PL_GHOST, 1, 1500.0, 1000.0, 70.0, 3, 70.0, 3)
    NewAI_CatalogUnit(PL_GHOST_AT, 0, 2500, 3, 1, 0, 0, 1, 1, 800, "POL Warsaw Ghost - Anti-Tank (1)")
    Zhukov_AIAdd(PL_GHOST_AT, 1, 1500.0, 1000.0, 91.0)
    PL104_AIChild(PL_P11, PL_SPITFIRE)
    NewAI_CatalogUnit(PL_SPITFIRE, 0, 1500, 3, 5, 1, 0, 2, 1, 300, "POL Spitfire Mk IX (2)")
    SaveInteger(NewAI_Data, PL_SPITFIRE, 100, PL_SKALSKI)
    US95_AIAdd(PL_SPITFIRE, 2, 1500.0, 550.0, 105.56, 1, 105.56, 1)
    NewAI_CatalogUnit(PL_SKALSKI, 0, 3000, 3, 5, 0, 0, 1, 1, 600, "POL Stanislaw Skalski (1)")
    US95_AIAdd(PL_SKALSKI, 1, 3500.0, 600.0, 232.5, 1, 232.5, 1)
    PL104_AIChild(PL_LOS, PL_WELLINGTON)
    NewAI_CatalogUnit(PL_WELLINGTON, 0, 1500, 3, 5, 1, 0, 1, 1, 250, "POL Wellington Mk II (1)")
    SaveInteger(NewAI_Data, PL_WELLINGTON, 100, PL_SKARZYNSKI)
    US95_AIAdd(PL_WELLINGTON, 1, 2200.0, 220.0, 225.0, 2, 0.0, 0)
    NewAI_CatalogUnit(PL_SKARZYNSKI, 0, 3000, 3, 5, 0, 0, 1, 1, 550, "POL Stanislaw Skarzynski (1)")
    US95_AIAdd(PL_SKARZYNSKI, 1, 3600.0, 250.0, 213.18, 2, 0.0, 0)
    PL104_AIChild(PL_FLAG, PL_MACZEK)
    NewAI_CatalogUnit(PL_MACZEK, 0, 10000, 1, 0, 0, 0, 7, 1, 1000, "Stanislaw Maczek")
    Zhukov_AIAdd(PL_MACZEK, 1, 4000.0, 650.0, 180.0)
    Zhukov_AIAdd(PL_MACZEK, 4, 1000.0, 600.0, 74.75)
    Zhukov_AIAdd(PL_MACZEK, 2, 1800.0, 800.0, 112.0)
    --  Wojtek: 5000 hitpoints.
    SaveReal(NewAI_Data, PL_WOJTEK, 500, 5000.0)
    SaveReal(NewAI_Data, PL_WOJTEK, 510, 5000.0)
    --  Orlik's redesigned combat profile replaces the inherited one.
    PL104_AIReset(PL_ORLIK)
    Zhukov_AIAdd(PL_ORLIK, 1, 3500.0, 600.0, 133.33)
    --  Combat unit ranges against ground (540) and air (541).
    for _, r in ipairs({{PL_C_ORLIK, 600.0, 600.0}, {PL_C_GHOST, 1000.0, 1000.0}, {PL_C_GHOST_AT, 1000.0, 1000.0},
        {PL_C_SPITFIRE, 550.0, 550.0}, {PL_C_SKALSKI, 600.0, 600.0}, {PL_C_WELLINGTON, 220.0, 0.0},
        {PL_C_SKARZYNSKI, 250.0, 0.0}, {PL_C_MACZEK, 650.0, 0.0}, {PL_C_SHERMAN, 600.0, 600.0}, {PL_C_FIREFLY, 800.0, 800.0}}) do
        SaveReal(NewAI_Data, r[1], 540, r[2])
        SaveReal(NewAI_Data, r[1], 541, r[3])
    end
end

function PL104_AIChild(parent, child)
    PL104_AddChild(NewAI_Data, parent, child, 5)
end

function PL104_Init()
    local attacked = CreateTrigger()
    local damaged = CreateTrigger()
    local cast = CreateTrigger()
    local upgrade = CreateTrigger()
    PL104_Clock = CreateTimer()
    TimerStart(PL104_Clock, 1000000.0, false, nil)
    PL104_Timer = CreateTimer()
    PL104_UpgradeTimer = CreateTimer()
    PL104_LimitTimer = CreateTimer()
    PL104_Boosted = CreateGroup()
    PL104_Search = CreateGroup()
    PL104_Scan = CreateGroup()
    TriggerRegisterAnyUnitEventBJ(attacked, EVENT_PLAYER_UNIT_ATTACKED)
    TriggerAddAction(attacked, PL104_OnAttacked)
    TriggerRegisterAnyUnitEventBJ(damaged, EVENT_PLAYER_UNIT_DAMAGED)
    TriggerAddAction(damaged, PL104_OnDamaged)
    TriggerRegisterAnyUnitEventBJ(cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddAction(cast, PL104_OnCast)
    TriggerRegisterAnyUnitEventBJ(upgrade, EVENT_PLAYER_UNIT_UPGRADE_START)
    TriggerRegisterAnyUnitEventBJ(upgrade, EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
    TriggerRegisterAnyUnitEventBJ(upgrade, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerRegisterAnyUnitEventBJ(upgrade, EVENT_PLAYER_UNIT_DEATH)
    TriggerAddAction(upgrade, PL104_OnUpgrade)
    --  Sold buildings are removed without an event: limits are also refreshed every second.
    PL104_RefreshLimits()
    TimerStart(PL104_LimitTimer, 1.0, true, PL104_RefreshLimits)
    attacked = nil
    damaged = nil
    cast = nil
    upgrade = nil
end
