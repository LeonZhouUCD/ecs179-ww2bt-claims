function Mac70_Carrier(pid)
    --  MacArthur's carrier is the commander flag after its free MacArthur upgrade.
    local u = nil
    if ((pid < 0) or (pid > 7)) then
        return nil
    end
    u = CM67_Flag[pid]
    if ((u ~= nil) and (GetUnitTypeId(u) == Mac70_CARRIER) and (GetOwningPlayer(u) == Player(pid))) then
        return u
    end
    return nil
end

function Mac70_GetLevel(pid)
    if (Mac70_Carrier(pid) == nil) then
        return 0
    end
    return Mac70_Level[pid] or 1
end

function Mac70_Apply(pid)
    --  Level 2: F4F. Level 3 replaces it with F6F. Level 4 adds SB2C; Level 5 adds the air group.
    local u = Mac70_Carrier(pid)
    local level = Mac70_GetLevel(pid)
    local want = false
    if (u == nil) then
        return
    end
    for i, id in ipairs(Mac70_ABILITIES) do
        want = ((i == 1) and (level == 2)) or ((i == 2) and (level >= 3)) or ((i == 3) and (level >= 4)) or ((i == 4) and (level >= 5))
        if want and (GetUnitAbilityLevel(u, id) == 0) then
            UnitAddAbility(u, id)
            UnitMakeAbilityPermanent(u, true, id)
        elseif (not want) and (GetUnitAbilityLevel(u, id) > 0) then
            UnitRemoveAbility(u, id)
        end
    end
end

function Mac70_LevelMessage(level)
    if (level == 2) then
        return "MacArthur reached Level 2: F4F Reinforcements unlocked. Select his aircraft carrier building to call them."
    elseif (level == 3) then
        return "MacArthur reached Level 3: F6F Reinforcements now replace F4F Reinforcements."
    elseif (level == 4) then
        return "MacArthur reached Level 4: SB2C Precision Strike unlocked."
    end
    return "MacArthur reached Level 5, the maximum level: SB2C Group Strike unlocked."
end

function Mac70_Upgrade(pid)
    --  Every check happens before payment; a refused upgrade never spends Blood Points.
    local p = Player(pid)
    local level = Mac70_GetLevel(pid)
    local blood = 0
    if (level == 0) then
        return false, "MacArthur is not your commander."
    elseif (level >= 5) then
        return false, "MacArthur is already at the maximum level (5)."
    end
    blood = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
    if (blood < Mac70_LEVEL_COST[level + 1]) then
        return false, "Not enough Blood Points. MacArthur Level " .. I2S(level + 1) .. " costs " .. I2S(Mac70_LEVEL_COST[level + 1]) .. " Blood Points."
    end
    SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, blood - Mac70_LEVEL_COST[level + 1])
    Mac70_Level[pid] = level + 1
    Mac70_Apply(pid)
    return true, Mac70_LevelMessage(level + 1)
end

function Mac70_OnSync()
    local player = GetTriggerPlayer()
    local ok = false
    local message = nil
    if ((BlzGetTriggerSyncPrefix() ~= "WW2Mac70") or (BlzGetTriggerSyncData() ~= "upgrade")) then
        return
    end
    ok, message = Mac70_Upgrade(GetPlayerId(player))
    if (GetLocalPlayer() == player) then
        Mac70_LocalWait = 0
    end
    DisplayTimedTextToPlayer(player, 0.0, 0.0, 8.0, message)
    player = nil
end

function Mac70_PanelActive(pid)
    --  The commander panel shows MacArthur's progression once he is the chosen commander.
    local parent = CM67_Parent(GetUnitTypeId(CM67_Flag[pid]))
    return (CM67_Chosen[pid] == Mac70_CARRIER) and (CM67_Option(parent, CM67_Index) == Mac70_CARRIER) and (Mac70_Carrier(pid) ~= nil)
end

function Mac70_PanelText(level)
    local rows = {
        "F4F Reinforcements: 3 F4F Wildcats (40 mana)",
        "F6F Reinforcements: 3 F6F Hellcats (40 mana), replaces F4F Reinforcements",
        "SB2C Precision Strike: 4000 damage to one enemy ground unit (60 mana)",
        "SB2C Group Strike: 3 precision strikes every 2 seconds for 8 seconds on the most valuable targets in a 500 radius (120 mana)",
    }
    local s = "|cffffcc00Level " .. I2S(level) .. " of 5|r|nUpgrade MacArthur up to Level 5: Level 2 and 3 cost 2000 Blood Points each, Level 4 costs 3000 and Level 5 costs 4000. Select MacArthur's aircraft carrier building to use his reinforcement abilities."
    local color = nil
    if (level == 1) then
        s = s .. "|n|nNo reinforcements available. Upgrade to Level 2 to unlock F4F Reinforcements."
    end
    s = s .. "|n"
    for i, row in ipairs(rows) do
        color = "|cff9a9a9a"
        if (level >= i + 1) and not ((i == 1) and (level >= 3)) then
            color = "|cff00ff00"
        end
        s = s .. "|n" .. color .. "Level " .. I2S(i + 1) .. ":|r " .. row
        if (i == 1) and (level >= 3) then
            s = s .. " - replaced at Level 3"
        end
    end
    return s .. "|n|nThe carrier holds 120 mana. Aircraft last for the current battle."
end

function Mac70_RenderPanel(pid)
    --  Local presentation only; game state changes go through the WW2Mac70 sync event.
    local level = Mac70_GetLevel(pid)
    local blood = GetPlayerState(Player(pid), PLAYER_STATE_RESOURCE_LUMBER)
    local status = "Selected: Douglas MacArthur, Level " .. I2S(level) .. " of 5."
    BlzFrameSetText(CM67_Frame(6), Mac70_PanelText(level))
    if (level >= 5) then
        BlzFrameSetText(CM67_Frame(7), "|cFFFFC850Upgrade:|r Maximum level reached.")
        status = "Selected: Douglas MacArthur, Level 5 of 5 (maximum)."
    else
        BlzFrameSetText(CM67_Frame(7), "|cFFFFC850Next Upgrade:|r Level " .. I2S(level + 1) .. ", " .. I2S(Mac70_LEVEL_COST[level + 1]) .. " Blood Points")
        if (blood < Mac70_LEVEL_COST[level + 1]) then
            status = status .. " Not enough Blood Points for the next level."
        elseif (Mac70_LocalWait > 0) then
            status = "Confirming upgrade..."
        end
    end
    BlzFrameSetText(CM67_Frame(9), status)
    BlzFrameSetText(CM67_Frame(8), "Upgrade")
    BlzFrameSetEnable(CM67_Frame(8), (level < 5) and (blood >= Mac70_LEVEL_COST[level + 1]) and (Mac70_LocalWait == 0))
end

function Mac70_RequestUpgrade()
    --  Called from the local panel click; the sync handler performs the upgrade on every client.
    if (Mac70_LocalWait == 0) and BlzSendSyncData("WW2Mac70", "upgrade") then
        Mac70_LocalWait = 12
    end
end

function Mac70_TroopsInCenter(pid)
    --  Ground or air troops count; carrier aircraft, hidden reserves and spell markers do not.
    local g = CreateGroup()
    local u = nil
    local found = false
    GroupEnumUnitsOfPlayer(g, Player(pid + 9), nil)
    while true do
        u = FirstOfGroup(g)
        if ((u == nil) or found) then break end
        GroupRemoveUnit(g, u)
        if (IsUnitAliveBJ(u) and (not IsUnitHidden(u)) and (GetUnitAbilityLevel(u, Mac70_LOCUST) == 0)
            and (not IsUnitType(u, UNIT_TYPE_STRUCTURE)) and (not IsUnitInGroup(u, Carrier_Summons))
            and Naval_InsideZone(4, GetUnitX(u), GetUnitY(u))) then
            found = true
        end
    end
    DestroyGroup(g)
    g = nil
    u = nil
    return found
end

function Mac70_CentralOpen(pid)
    --  Normal rounds: the center opens once the home battle is won AND troops reached it.
    --  The latch lasts for the current round; special rounds use the center only.
    if (CavalryCharge_Mode ~= 1) then
        return true
    end
    if (Mac70_ArrivedRound[pid] == udg_int_CurRound) then
        return true
    end
    if Naval_OpponentCleared(pid) and Mac70_TroopsInCenter(pid) then
        Mac70_ArrivedRound[pid] = udg_int_CurRound
        return true
    end
    return false
end

function Mac70_ZoneAllowed(pid, x, y, centralOpen)
    --  Callers check that the seat's battle is active.
    local zone = -1
    if (CavalryCharge_Mode == 1) then
        zone = J88_div(PLAYER_CURRENT_SITE[pid], 2)
        if Naval_InsideZone(zone, x, y) then
            return zone
        end
        if centralOpen and Naval_InsideZone(4, x, y) then
            return 4
        end
        return -1
    end
    if Naval_InsideZone(4, x, y) then
        return 4
    end
    return -1
end

function Mac70_TargetZone(pid, x, y)
    local zone = -1
    if (not Naval_IsBattleActive(pid)) then
        return -1, "MacArthur's reinforcements can only be called during your battles."
    end
    if (CavalryCharge_Mode == 1) then
        zone = J88_div(PLAYER_CURRENT_SITE[pid], 2)
        if Naval_InsideZone(zone, x, y) then
            return zone, nil
        end
        if Naval_InsideZone(4, x, y) then
            if Mac70_CentralOpen(pid) then
                return 4, nil
            end
            return -1, "The central battlefield opens after you win your battle and your troops reach the center."
        end
        return -1, "MacArthur's reinforcements can only target your own battlefield."
    end
    if Naval_InsideZone(4, x, y) then
        return 4, nil
    end
    return -1, "In this round, MacArthur's reinforcements can only target the central battlefield."
end

function Mac70_Reject(caster, abilityId, message)
    --  Same refund path as rejected naval casts: mana returns after the spell-effect event.
    local level = GetUnitAbilityLevel(caster, abilityId) - 1
    local refund = nil
    local key = 0
    if (level >= 0) then
        refund = CreateTimer()
        key = GetHandleId(refund)
        SaveUnitHandle(Naval_Data, key, 20, caster)
        SaveInteger(Naval_Data, key, 22, abilityId)
        SaveReal(Naval_Data, key, 21, I2R(BlzGetUnitAbilityManaCost(caster, abilityId, level)))
        SaveTimerHandle(Naval_Data, GetHandleId(caster), 20, refund)
        TimerStart(refund, 0.0, false, Naval_RefundRejected)
    end
    DisplayTextToPlayer(GetOwningPlayer(caster), 0.0, 0.0, message)
    refund = nil
end

function Mac70_FinalSide(pid)
    local member = nil
    local side = -1
    if (CavalryCharge_Mode ~= 3) then
        return -1
    end
    for i = 0, 1 do
        member = FirstOfGroup(FINAL_TOUR_SPAWNS[i])
        if ((member ~= nil) and (GetOwningPlayer(member) == Player(pid + 9))) then
            side = i
        end
    end
    member = nil
    return side
end

function Mac70_Summon(pid, zone, side, x, y, roster)
    --  Carrier aircraft follow the existing carrier lifecycle (Carrier_Tick, guard, cleanup).
    local total = 0
    local index = 0
    local slot = 0
    local slots = 0
    local radius = 0.0
    local angle = 0.0
    local px = 0.0
    local py = 0.0
    local key = 0
    local plane = nil
    for _, entry in ipairs(roster) do
        total = total + entry[2]
    end
    for _, entry in ipairs(roster) do
        for n = 1, entry[2] do
            if (index < 8) then
                slot = index
                slots = math.min(total, 8)
                radius = 90.0
            else
                slot = index - 8
                slots = total - 8
                radius = 190.0
            end
            angle = J88_real(J88_real(J88_real(I2R(slot) * 360.0) / I2R(slots)) * bj_DEGTORAD)
            px = J88_real(x + J88_real(radius * Cos(angle)))
            py = J88_real(y + J88_real(radius * Sin(angle)))
            if (not Naval_InsideZone(zone, px, py)) then
                px = x
                py = y
            end
            plane = CreateUnit(Player(pid + 9), entry[1], px, py, J88_real(Atan2(J88_real(-py), J88_real(-px)) * bj_RADTODEG))
            key = GetHandleId(plane)
            GroupAddUnit(Carrier_Summons, plane)
            GroupAddUnit(udg_group_AllSpawnedUnits, plane)
            if (CavalryCharge_Mode == 2) then
                GroupAddUnit(BonusPlayerUnits, plane)
            elseif (CavalryCharge_Mode == 3) then
                GroupAddUnit(FINAL_TOUR_SPAWNS[side], plane)
            end
            SaveBoolean(Naval_Data, key, 30, true)
            SaveInteger(Naval_Data, key, 2, pid)
            SaveInteger(Naval_Data, key, 3, udg_int_CurRound)
            SaveInteger(Naval_Data, key, 4, CavalryCharge_Mode)
            SaveReal(Naval_Data, key, 31, px)
            SaveReal(Naval_Data, key, 32, py)
            SaveReal(Naval_Data, key, 33, x)
            SaveReal(Naval_Data, key, 34, y)
            SaveBoolean(Naval_Data, key, 35, false)
            IssuePointOrder(plane, "attack", x, y)
            index = index + 1
        end
    end
    TimerStart(Carrier_Timer, 0.25, true, Carrier_Tick)
    plane = nil
end

function Mac70_CallPoint(caster, abilityId, roster)
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local x = GetSpellTargetX()
    local y = GetSpellTargetY()
    local zone, reason = Mac70_TargetZone(pid, x, y)
    local side = Mac70_FinalSide(pid)
    if (zone < 0) then
        Mac70_Reject(caster, abilityId, reason)
        return
    end
    if (((CavalryCharge_Mode == 2) and (BonusPlayerUnits == nil)) or ((CavalryCharge_Mode == 3) and (side < 0))) then
        Mac70_Reject(caster, abilityId, "MacArthur's reinforcements can only be called during your battles.")
        return
    end
    --  A valid cast keeps its mana; forget any older pending refund for this caster.
    RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
    Mac70_Summon(pid, zone, side, x, y, roster)
end

function Mac70_StrikeTarget(pid, target)
    --  Enemy ground units, heroes included; never aircraft, buildings or spell markers.
    local owner = 0
    if ((target == nil) or (GetUnitTypeId(target) == 0) or (not IsUnitAliveBJ(target)) or IsUnitHidden(target)) then
        return false
    end
    if ((GetUnitAbilityLevel(target, Mac70_LOCUST) > 0) or IsUnitType(target, UNIT_TYPE_STRUCTURE) or IsUnitType(target, UNIT_TYPE_FLYING)) then
        return false
    end
    owner = GetPlayerId(GetOwningPlayer(target))
    if (CavalryCharge_Mode == 2) then
        return owner == 18
    end
    return (owner >= 9) and (owner <= 16) and (owner ~= pid + 9) and IsUnitEnemy(target, Player(pid + 9))
end

function Mac70_CallStrike(caster, abilityId, target)
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local zone = -1
    local reason = "SB2C Precision Strike needs an enemy ground unit."
    if (not Naval_IsBattleActive(pid)) then
        reason = "MacArthur's reinforcements can only be called during your battles."
    elseif Mac70_StrikeTarget(pid, target) then
        zone, reason = Mac70_TargetZone(pid, GetUnitX(target), GetUnitY(target))
    end
    if (zone < 0) then
        Mac70_Reject(caster, abilityId, reason)
        return
    end
    RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
    Mac70_StartStrike(pid, caster, target)
end

function Mac70_GroundZ(x, y)
    MoveLocation(Mac70_Ground, x, y)
    return GetLocationZ(Mac70_Ground)
end

function Mac70_StartStrike(pid, caster, target)
    --  The SB2C approaches from the carrier's direction, 1000 units out, at 1000 units/s.
    local tx = GetUnitX(target)
    local ty = GetUnitY(target)
    local angle = Atan2(J88_real(ty - GetUnitY(caster)), J88_real(tx - GetUnitX(caster)))
    local sx = J88_real(tx - J88_real(1000.0 * Cos(angle)))
    local sy = J88_real(ty - J88_real(1000.0 * Sin(angle)))
    local plane = CreateUnit(Player(pid + 9), Mac70_SB2C_TYPE, sx, sy, J88_real(angle * bj_RADTODEG))
    Mac70_Strikes[#Mac70_Strikes + 1] = {pid = pid, plane = plane, target = target, x = tx, y = ty,
        angle = angle, tick = 0, released = -1, landed = false, bomb = nil}
    if (#Mac70_Strikes == 1) then
        TimerStart(Mac70_StrikeTimer, Mac70_STRIKE_STEP, true, Mac70_StrikeTick)
    end
    plane = nil
end

function Mac70_StrikeStep(s)
    --  Returns true when the strike is complete. The target is tracked until impact.
    local px = GetUnitX(s.plane)
    local py = GetUnitY(s.plane)
    local dx = 0.0
    local dy = 0.0
    local dist = 0.0
    local step = J88_real(Mac70_STRIKE_SPEED * Mac70_STRIKE_STEP)
    local progress = 0.0
    local z = 0.0
    s.tick = s.tick + 1
    if Mac70_StrikeTarget(s.pid, s.target) then
        s.x = GetUnitX(s.target)
        s.y = GetUnitY(s.target)
    end
    if (s.released < 0) then
        dx = J88_real(s.x - px)
        dy = J88_real(s.y - py)
        dist = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
        if (dist > step) then
            s.angle = Atan2(dy, dx)
            SetUnitX(s.plane, J88_real(px + J88_real(step * Cos(s.angle))))
            SetUnitY(s.plane, J88_real(py + J88_real(step * Sin(s.angle))))
            SetUnitFacing(s.plane, J88_real(s.angle * bj_RADTODEG))
        end
        if ((dist <= J88_real(step * 2.0)) or (s.tick >= 64)) then
            --  Release over the target: one visible bomb, the same model as the bombing runs.
            s.released = s.tick
            s.bomb = AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", s.x, s.y)
            BlzSetSpecialEffectScale(s.bomb, 1.6)
            BlzSetSpecialEffectZ(s.bomb, J88_real(Mac70_GroundZ(s.x, s.y) + 400.0))
        end
        return false
    end
    --  After release the aircraft flies straight on and leaves.
    SetUnitX(s.plane, J88_real(px + J88_real(step * Cos(s.angle))))
    SetUnitY(s.plane, J88_real(py + J88_real(step * Sin(s.angle))))
    if (not s.landed) then
        progress = I2R(s.tick - s.released) / I2R(Mac70_BOMB_TICKS)
        z = Mac70_GroundZ(s.x, s.y)
        if (progress < 1.0) then
            BlzSetSpecialEffectPosition(s.bomb, s.x, s.y, J88_real(z + J88_real(400.0 * J88_real(1.0 - progress))))
            return false
        end
        s.landed = true
        --  The bomb model's own death animation is the ground explosion.
        BlzSetSpecialEffectPosition(s.bomb, s.x, s.y, z)
        DestroyEffect(s.bomb)
        s.bomb = nil
        DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", s.x, s.y))
        if (Mac70_StrikeTarget(s.pid, s.target) and (not BlzIsUnitInvulnerable(s.target))
            and (Mac70_TargetZone(s.pid, s.x, s.y) >= 0)) then
            Mac70_StrikeHit = true
            UnitDamageTarget(s.plane, s.target, Mac70_STRIKE_DAMAGE, false, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            Mac70_StrikeHit = false
        end
    end
    return (s.tick - s.released) >= Mac70_EXIT_TICKS
end

function Mac70_FinishStrike(s)
    if (s.bomb ~= nil) then
        DestroyEffect(s.bomb)
        s.bomb = nil
    end
    if ((s.plane ~= nil) and (GetUnitTypeId(s.plane) ~= 0)) then
        RemoveUnit(s.plane)
    end
    s.plane = nil
    s.target = nil
end

function Mac70_StrikeTick()
    local i = 1
    local s = nil
    local ok = false
    local done = false
    while (i <= #Mac70_Strikes) do
        s = Mac70_Strikes[i]
        ok, done = pcall(Mac70_StrikeStep, s)
        if (not ok) then
            DG73_Log("Aircraft", "MAC70_STRIKE_ABORT", tostring(done))
            done = true
        end
        if done then
            Mac70_FinishStrike(s)
            table.remove(Mac70_Strikes, i)
        else
            i = i + 1
        end
    end
    if (#Mac70_Strikes == 0) then
        PauseTimer(Mac70_StrikeTimer)
    end
    s = nil
end

function Mac70_StopStrikes()
    --  Round cleanup: no strike, bomb or strike aircraft survives into the next phase.
    for i = #Mac70_Barrages, 1, -1 do
        Mac70_Barrages[i] = nil
    end
    if (Mac70_BarrageTimer ~= nil) then
        PauseTimer(Mac70_BarrageTimer)
    end
    for i = #Mac70_Strikes, 1, -1 do
        Mac70_FinishStrike(Mac70_Strikes[i])
        Mac70_Strikes[i] = nil
    end
    if (Mac70_StrikeTimer ~= nil) then
        PauseTimer(Mac70_StrikeTimer)
    end
end

function Mac70_Spent(pid)
    --  Blood Points paid for MacArthur's levels; Army Points value is a tenth, like purchases.
    local spent = 0
    for level = 2, Mac70_GetLevel(pid) do
        spent = spent + Mac70_LEVEL_COST[level]
    end
    return spent
end

function Mac70_CallBarrage(caster, abilityId)
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local x = GetSpellTargetX()
    local y = GetSpellTargetY()
    local zone, reason = Mac70_TargetZone(pid, x, y)
    if (zone < 0) then
        Mac70_Reject(caster, abilityId, reason)
        return
    end
    RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
    Mac70_Barrages[#Mac70_Barrages + 1] = {pid = pid, caster = caster, x = x, y = y, waves = 0}
    Mac70_BarrageWave(Mac70_Barrages[#Mac70_Barrages])
    if (#Mac70_Barrages == 1) then
        TimerStart(Mac70_BarrageTimer, 2.0, true, Mac70_BarrageTick)
    end
end

function Mac70_BarrageWave(b)
    --  Three random legal enemy ground units inside the circle, one SB2C strike each.
    local g = CreateGroup()
    local u = nil
    local pool = {}
    local pick = 0
    local dx = 0.0
    local dy = 0.0
    b.waves = b.waves + 1
    GroupEnumUnitsInRect(g, GetPlayableMapRect(), nil)
    while true do
        u = FirstOfGroup(g)
        if (u == nil) then break end
        GroupRemoveUnit(g, u)
        dx = J88_real(GetUnitX(u) - b.x)
        dy = J88_real(GetUnitY(u) - b.y)
        if ((J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= J88_real(Mac70_STRIKE_RADIUS * Mac70_STRIKE_RADIUS))
            and Mac70_StrikeTarget(b.pid, u) and (not BlzIsUnitInvulnerable(u))
            and (Mac70_TargetZone(b.pid, GetUnitX(u), GetUnitY(u)) >= 0)) then
            pool[#pool + 1] = u
        end
    end
    DestroyGroup(g)
    for n = 1, Mac70_STRIKE_WAVE_TARGETS do
        if (#pool == 0) then break end
        pick = Mac73_MostValuable(pool)
        Mac70_StartStrike(b.pid, b.caster, pool[pick])
        table.remove(pool, pick)
    end
    g = nil
    u = nil
    return b.waves >= Mac70_STRIKE_WAVES
end

function Mac73_MostValuable(pool)
    --  Index of the unit with the highest Blood Point value; equal values pick at random.
    local best = 1
    local bestValue = -1
    local ties = 0
    local value = 0
    for i, u in ipairs(pool) do
        value = Bounty_Value(u)
        if (value > bestValue) then
            best = i
            bestValue = value
            ties = 1
        elseif (value == bestValue) then
            ties = ties + 1
            if (GetRandomInt(1, ties) == 1) then
                best = i
            end
        end
    end
    return best
end

function Mac73_OnDamaged()
    if Mac70_StrikeHit and (GetUnitTypeId(GetEventDamageSource()) == Mac70_SB2C_TYPE) then
        BlzSetEventDamage(Mac70_STRIKE_DAMAGE)
    end
end

function Mac73_RefillCommanders()
    --  After every battle, commander buildings with mana are refilled.
    local u = nil
    for pid = 0, 7 do
        u = CM67_Flag[pid]
        if ((u ~= nil) and (GetUnitTypeId(u) ~= 0) and (BlzGetUnitMaxMana(u) > 0)) then
            SetUnitState(u, UNIT_STATE_MANA, I2R(BlzGetUnitMaxMana(u)))
        end
    end
    u = nil
end

function Mac73_SelectCommander()
    --  Local selection only; the click event itself runs on every client.
    local pid = GetPlayerId(GetTriggerPlayer())
    local flag = CM67_Flag[pid]
    local now = 0.0
    if (GetTriggerPlayer() ~= GetLocalPlayer()) then
        return
    end
    BlzFrameSetEnable(Mac73_CmdButton, false)
    BlzFrameSetEnable(Mac73_CmdButton, true)
    if ((flag == nil) or (GetUnitTypeId(flag) == 0) or (CM67_Chosen[pid] == 0) or (GetOwningPlayer(flag) ~= GetLocalPlayer())) then
        return
    end
    now = TimerGetElapsed(Mac73_CmdClock)
    ClearSelection()
    SelectUnit(flag, true)
    if (now - Mac73_LastClick <= 0.4) then
        PanCameraToTimed(GetUnitX(flag), GetUnitY(flag), 0.0)
    end
    Mac73_LastClick = now
end

function Mac73_RefreshButton()
    --  Visible once a commander is appointed; shows that commander's icon.
    local pid = GetPlayerId(GetLocalPlayer())
    local flag = nil
    local show = false
    if ((pid >= 0) and (pid < 8)) then
        flag = CM67_Flag[pid]
        show = (flag ~= nil) and (GetUnitTypeId(flag) ~= 0) and (CM67_Chosen[pid] ~= 0)
        if show then
            BlzFrameSetTexture(Mac73_CmdIcon, LoadStr(CM67_Data, CM67_Chosen[pid], 4), 0, true)
        end
    end
    BlzFrameSetVisible(Mac73_CmdButton, show)
    flag = nil
end

function Mac73_UIInit()
    local root = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
    local tip = nil
    local click = CreateTrigger()
    Mac73_CmdClock = CreateTimer()
    TimerStart(Mac73_CmdClock, 100000.0, false, nil)
    Mac73_CmdButton = BlzCreateFrameByType("GLUEBUTTON", "WW2CommanderSelect", root, "ScoreScreenTabButtonTemplate", 0)
    Mac73_CmdIcon = BlzCreateFrameByType("BACKDROP", "WW2CommanderSelectIcon", Mac73_CmdButton, "", 0)
    BlzFrameSetAllPoints(Mac73_CmdIcon, Mac73_CmdButton)
    BlzFrameSetSize(Mac73_CmdButton, 0.0252, 0.0252)
    if (UI5_Frame(72) ~= nil) then
        --  Directly right of the idle builder button, following its scale and position.
        BlzFrameSetPoint(Mac73_CmdButton, FRAMEPOINT_LEFT, UI5_Frame(72), FRAMEPOINT_RIGHT, 0.004, 0.0)
    else
        BlzFrameSetAbsPoint(Mac73_CmdButton, FRAMEPOINT_BOTTOMLEFT, UI44_X(0.046), 0.1548)
    end
    tip = BlzCreateFrameByType("TEXT", "WW2CommanderSelectTip", root, "", 0)
    BlzFrameSetText(tip, "Select your commander building. Double-click to center the camera on it.")
    BlzFrameSetSize(tip, 0.2, 0.02)
    BlzFrameSetPoint(tip, FRAMEPOINT_BOTTOMLEFT, Mac73_CmdButton, FRAMEPOINT_TOPLEFT, 0.0, 0.004)
    BlzFrameSetTooltip(Mac73_CmdButton, tip)
    BlzFrameSetVisible(Mac73_CmdButton, false)
    BlzTriggerRegisterFrameEvent(click, Mac73_CmdButton, FRAMEEVENT_CONTROL_CLICK)
    TriggerAddAction(click, Mac73_SelectCommander)
    TimerStart(CreateTimer(), 0.25, true, Mac73_RefreshButton)
    root = nil
    tip = nil
    click = nil
end

function Mac70_BarrageTick()
    local i = 1
    while (i <= #Mac70_Barrages) do
        if Mac70_BarrageWave(Mac70_Barrages[i]) then
            table.remove(Mac70_Barrages, i)
        else
            i = i + 1
        end
    end
    if (#Mac70_Barrages == 0) then
        PauseTimer(Mac70_BarrageTimer)
    end
end

function Mac70_OnCast()
    local caster = GetTriggerUnit()
    local id = GetSpellAbilityId()
    if (GetUnitTypeId(caster) ~= Mac70_CARRIER) then
        caster = nil
        return
    end
    if (id == Mac70_ABIL_F4F) then
        Mac70_CallPoint(caster, id, {{Mac70_F4F_TYPE, 3}})
    elseif (id == Mac70_ABIL_F6F) then
        Mac70_CallPoint(caster, id, {{Mac70_F6F_TYPE, 3}})
    elseif (id == Mac70_ABIL_AIR) then
        Mac70_CallBarrage(caster, id)
    elseif (id == Mac70_ABIL_SB2C) then
        Mac70_CallStrike(caster, id, GetSpellTargetUnit())
    end
    caster = nil
end

function Mac70_ArrivalTick()
    --  Latch central access while troops pass through the center after the home win.
    if (CavalryCharge_Mode ~= 1) then
        return
    end
    for pid = 0, 7 do
        if ((Mac70_GetLevel(pid) >= 2) and (Mac70_ArrivedRound[pid] ~= udg_int_CurRound) and Naval_IsBattleActive(pid)) then
            Mac70_CentralOpen(pid)
        end
    end
end

function Mac70_AIPoint(pid, centralOpen)
    --  First legal enemy position, using the same enemy rules as the inherited carrier AI.
    local targets = CreateGroup()
    local target = nil
    local owner = 0
    local x = nil
    local y = nil
    GroupEnumUnitsInRect(targets, GetPlayableMapRect(), nil)
    while true do
        target = FirstOfGroup(targets)
        if ((target == nil) or (x ~= nil)) then break end
        GroupRemoveUnit(targets, target)
        owner = GetPlayerId(GetOwningPlayer(target))
        if (IsUnitAliveBJ(target) and (not IsUnitHidden(target)) and (GetUnitAbilityLevel(target, Mac70_LOCUST) == 0)
            and ((not IsUnitType(target, UNIT_TYPE_STRUCTURE)) or (GetUnitTypeId(target) == 1749437762))
            and (((CavalryCharge_Mode == 2) and (owner == 18))
                or ((CavalryCharge_Mode ~= 2) and (owner >= 9) and (owner <= 16) and (owner ~= pid + 9) and IsUnitEnemy(target, Player(pid + 9))))
            and (Mac70_ZoneAllowed(pid, GetUnitX(target), GetUnitY(target), centralOpen) >= 0)) then
            x = GetUnitX(target)
            y = GetUnitY(target)
        end
    end
    DestroyGroup(targets)
    targets = nil
    target = nil
    return x, y
end

function Mac70_AIStrikeTarget(pid, centralOpen)
    --  The legal enemy ground unit with the highest maximum life (tanks and heroes first).
    local targets = CreateGroup()
    local target = nil
    local best = nil
    local bestLife = 0.0
    GroupEnumUnitsInRect(targets, GetPlayableMapRect(), nil)
    while true do
        target = FirstOfGroup(targets)
        if (target == nil) then break end
        GroupRemoveUnit(targets, target)
        if (Mac70_StrikeTarget(pid, target) and (not BlzIsUnitInvulnerable(target))
            and (Mac70_ZoneAllowed(pid, GetUnitX(target), GetUnitY(target), centralOpen) >= 0)
            and (GetUnitState(target, UNIT_STATE_MAX_LIFE) > bestLife)) then
            best = target
            bestLife = GetUnitState(target, UNIT_STATE_MAX_LIFE)
        end
    end
    DestroyGroup(targets)
    targets = nil
    target = nil
    return best
end

function Mac70_AIThink(pid)
    --  Level 5 saves for the air group; Level 4 prefers the strike; Levels 2-3 call fighters.
    local carrier = Mac70_Carrier(pid)
    local level = Mac70_GetLevel(pid)
    local mana = 0.0
    local centralOpen = false
    local x = nil
    local y = nil
    local target = nil
    if ((carrier == nil) or (level < 2) or (not NewAI_Controlled[pid]) or NewAI_Paused or (not Naval_IsBattleActive(pid))) then
        return
    end
    if ((GetUnitCurrentOrder(carrier) ~= 0) and (GetUnitCurrentOrder(carrier) ~= OrderId("stop"))) then
        return
    end
    mana = GetUnitState(carrier, UNIT_STATE_MANA)
    centralOpen = Mac70_CentralOpen(pid)
    if (level >= 5) then
        if (mana >= 120.0) then
            target = Mac70_AIStrikeTarget(pid, centralOpen)
            if (target ~= nil) then
                IssuePointOrder(carrier, "rainoffire", GetUnitX(target), GetUnitY(target))
            end
        end
        return
    end
    if ((level == 4) and (mana >= 60.0)) then
        target = Mac70_AIStrikeTarget(pid, centralOpen)
        if (target ~= nil) then
            IssueTargetOrder(carrier, "acidbomb", target)
            return
        end
    end
    if ((mana >= 40.0) and ((level < 4) or (mana >= 120.0))) then
        x, y = Mac70_AIPoint(pid, centralOpen)
        if (x ~= nil) then
            if (level >= 3) then
                IssuePointOrder(carrier, "monsoon", x, y)
            else
                IssuePointOrder(carrier, "blizzard", x, y)
            end
        end
    end
end

function Mac70_AIUpgrade(pid)
    --  AI seats buy a level during preparation while keeping 2000 Blood Points in reserve.
    if (NewAI_Controlled[pid] and (Mac70_GetLevel(pid) >= 1) and (Mac70_GetLevel(pid) < 5)
        and (GetPlayerState(Player(pid), PLAYER_STATE_RESOURCE_LUMBER) >= Mac70_LEVEL_COST[Mac70_GetLevel(pid) + 1] + 2000)) then
        Mac70_Upgrade(pid)
    end
end

function Mac70_RegisterOverview()
    --  Army overview entries for the carrier fighters (base DPS = average damage / interval).
    US95_AOUnit(Mac70_F4F_TYPE, "F4F Wildcat", "ReplaceableTextures\\CommandButtons\\BTNMac70F4F.blp", 6, 60.0, 24.0, 60.0, 0.8, 450.0, 0.0, 200.0, 42, 54)
    US95_AOUnit(Mac70_F6F_TYPE, "F6F Hellcat", "ReplaceableTextures\\CommandButtons\\BTNMac70F6F.blp", 6, 90.0, 36.0, 90.0, 0.8, 500.0, 0.0, 210.0, 66, 78)
end

function Mac70_Init()
    local sync = CreateTrigger()
    local damaged = nil
    local cast = CreateTrigger()
    for i = 0, 7 do
        BlzTriggerRegisterPlayerSyncEvent(sync, Player(i), "WW2Mac70", false)
    end
    TriggerAddAction(sync, Mac70_OnSync)
    TriggerRegisterAnyUnitEventBJ(cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddAction(cast, Mac70_OnCast)
    Mac70_StrikeTimer = CreateTimer()
    Mac70_BarrageTimer = CreateTimer()
    damaged = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(damaged, EVENT_PLAYER_UNIT_DAMAGED)
    TriggerAddAction(damaged, Mac73_OnDamaged)
    --  After the HUD has cached the idle builder button (UI5 starts at 0.5 seconds).
    TimerStart(CreateTimer(), 2.0, false, Mac73_UIInit)
    Mac70_Ground = Location(0.0, 0.0)
    TimerStart(CreateTimer(), 1.0, true, Mac70_ArrivalTick)
    sync = nil
    cast = nil
end
