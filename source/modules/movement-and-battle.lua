function Naval_IsAdmiral(caster)
    do return ((GetUnitTypeId(caster) == 1747994195) or (GetUnitTypeId(caster) == 1747994196)) end
end

function Naval_IsPreparationPoint(x, y)
    do return (((((((RectContainsCoords(gg_rct_Red, x, y) or RectContainsCoords(gg_rct_Blue, x, y)) or RectContainsCoords(gg_rct_Teal, x, y)) or RectContainsCoords(gg_rct_Purple, x, y)) or RectContainsCoords(gg_rct_Yellow, x, y)) or RectContainsCoords(gg_rct_Orange, x, y)) or RectContainsCoords(gg_rct_Green, x, y)) or RectContainsCoords(gg_rct_Pink, x, y)) end
end

function Naval_InsideZone(zone, x, y)
    if ((not RectContainsCoords(GetPlayableMapRect(), x, y)) or Naval_IsPreparationPoint(x, y)) then
        do return false end
    end
    --  New bounds follow the actual central terrain and its four entry roads.
    if (zone == 4) then
        do return ((((x >= J88_real(-2688.0)) and (x <= 2688.0)) and (y >= J88_real(-2560.0))) and (y <= 2688.0)) end
    elseif (zone == 0) then
        do return (((x >= J88_real(-2688.0)) and (x <= 2688.0)) and (y < J88_real(-2560.0))) end
    elseif (zone == 1) then
        do return (((x > 2688.0) and (y >= J88_real(-2560.0))) and (y <= 2688.0)) end
    elseif (zone == 2) then
        do return (((x >= J88_real(-2688.0)) and (x <= 2688.0)) and (y > 2688.0)) end
    elseif (zone == 3) then
        do return (((x < J88_real(-2688.0)) and (y >= J88_real(-2560.0))) and (y <= 2688.0)) end
    end
    do return false end
end

function Naval_HasLivingArmy(pid)
    local units = CreateGroup()
    local u = nil
    local found = false
    if ((pid < 0) or (pid > 7)) then
        DestroyGroup(units)
        units = nil
        do return false end
    end
    GroupEnumUnitsOfPlayer(units, Player(J88_int(pid + 9)), nil)
    while true do
        u = FirstOfGroup(units)
        if ((u == nil) or found) then break end
        GroupRemoveUnit(units, u)
        --  Hidden reserves and summoned soldiers count; spell markers do not.
        if ((IsUnitAliveBJ(u) and (GetUnitAbilityLevel(u, 1097625443) == 0)) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE))) then
            found = true
        end
    end
    DestroyGroup(units)
    units = nil
    u = nil
    do return found end
end

function Naval_OpponentCleared(pid)
    local opponent = udg_int_Opponent[pid]
    if (((opponent < 0) or (opponent > 7)) or (opponent == pid)) then
        do return false end
    end
    do return ((SPAWN_UNITS_COUNT[opponent] == 0) and (not Naval_HasLivingArmy(opponent))) end
end

function Naval_IsBattleActive(pid)
    local active = false
    if ((pid < 0) or (pid > 7)) then
        do return false end
    end
    --  Reject inactive phases before allocating/enumerating an army group.
    if (CavalryCharge_Mode == 1) then
        active = ((IsTriggerEnabled(gg_trg_PlayerUnitDies) and (not udg_bool_WaitingForSacrificeEnd)) and (COUNTDOWN_TICK_TIMER == nil))
    elseif (CavalryCharge_Mode == 2) then
        active = ((IsTriggerEnabled(BONUS_ON_DEATH_TRG) and (BonusCurrentPlayer == Player(pid))) and (not BonusPlayerDefeated))
    elseif (CavalryCharge_Mode == 3) then
        active = ((IsTriggerEnabled(FINAL_TOUR_ON_DEATH_TRG) and (FINAL_TOUR_ROUND_WINNER == J88_int(-1))) and (COUNTDOWN_TICK_TIMER == nil))
    end
    do return (active and Naval_HasLivingArmy(pid)) end
end

function Naval_TargetZone(pid, x, y)
    local zone = J88_int(-1)
    if (not Naval_IsBattleActive(pid)) then
        do return J88_int(-1) end
    end
    if (CavalryCharge_Mode == 1) then
        zone = J88_div(PLAYER_CURRENT_SITE[pid], 2)
        if Naval_InsideZone(zone, x, y) then
            do return zone end
        end
        if (Naval_OpponentCleared(pid) and Naval_InsideZone(4, x, y)) then
            do return 4 end
        end
    elseif Naval_InsideZone(4, x, y) then
        do return 4 end
    end
    do return J88_int(-1) end
end

function Naval_IsSource(source)
    do return ((source ~= nil) and LoadBoolean(Naval_Data, GetHandleId(source), 1)) end
end

function Naval_KillerPlayer(source)
    if Naval_IsSource(source) then
        do return LoadInteger(Naval_Data, GetHandleId(source), 2) end
    end
    do return J88_int(GetPlayerId(GetOwningPlayer(source)) - 9) end
end

function Naval_BonusPoints(victim)
    local source = GetKillingUnit()
    local points = GetUnitPointValue(victim)
    local pid = GetPlayerId(BonusCurrentPlayer)
    local total = 0
    if (Naval_IsSource(source) and (Naval_KillerPlayer(source) == pid)) then
        if (Naval_BonusRound[pid] ~= udg_int_CurRound) then
            Naval_BonusRound[pid] = udg_int_CurRound
            Naval_BonusRemainder[pid] = 0
        end
        total = J88_int(points + Naval_BonusRemainder[pid])
        points = J88_div(total, 25)
        Naval_BonusRemainder[pid] = ModuloInteger(total, 25)
    end
    source = nil
    do return points end
end

function Naval_CanDamage(source, target, zone)
    local pid = Naval_KillerPlayer(source)
    local owner = GetPlayerId(GetOwningPlayer(target))
    if (((((not Naval_IsBattleActive(pid)) or (not IsUnitAliveBJ(target))) or IsUnitHidden(target)) or (GetUnitAbilityLevel(target, 1097625443) > 0)) or (IsUnitType(target, UNIT_TYPE_STRUCTURE) and (GetUnitTypeId(target) ~= 1749437762))) then
        do return false end
    end
    if (not Naval_InsideZone(zone, GetUnitX(target), GetUnitY(target))) then
        do return false end
    end
    if (CavalryCharge_Mode == 2) then
        do return (owner == 18) end
    end
    do return ((((owner >= 9) and (owner <= 16)) and (owner ~= J88_int(pid + 9))) and IsUnitEnemy(target, Player(J88_int(pid + 9)))) end
end

function Naval_EndBarrage(clock)
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(Naval_Data, key, 1)
    if (source ~= nil) then
        FlushChildHashtable(Naval_Data, GetHandleId(source))
        --  Remove rather than kill: the legacy h0J0 death chain must not run.
        RemoveUnit(source)
    end
    PauseTimer(clock)
    FlushChildHashtable(Naval_Data, key)
    DestroyTimer(clock)
    source = nil
end

function Naval_BarrageTick()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(Naval_Data, key, 1)
    local pid = LoadInteger(Naval_Data, key, 2)
    local zone = LoadInteger(Naval_Data, key, 5)
    local strike = LoadInteger(Naval_Data, key, 8)
    local targetX = LoadReal(Naval_Data, key, 6)
    local targetY = LoadReal(Naval_Data, key, 7)
    local x = targetX
    local y = targetY
    local distance = 0.0
    local angle = 0.0
    local attempts = 0
    local victims = nil
    local victim = nil
    local place = nil
    if ((((source == nil) or (LoadInteger(Naval_Data, key, 3) ~= udg_int_CurRound)) or (LoadInteger(Naval_Data, key, 4) ~= CavalryCharge_Mode)) or (not Naval_IsBattleActive(pid))) then
        Naval_EndBarrage(clock)
        clock = nil
        source = nil
        do return end
    end
    --  Match the existing four impacts: three scattered, then the aimed point.
    if (strike < 3) then
        while true do
            distance = GetRandomReal(0.0, 500.0)
            angle = J88_real(GetRandomReal(0.0, 360.0) * bj_DEGTORAD)
            x = J88_real(targetX + J88_real(distance * Cos(angle)))
            y = J88_real(targetY + J88_real(distance * Sin(angle)))
            attempts = J88_int(attempts + 1)
            if (Naval_InsideZone(zone, x, y) or (attempts >= 12)) then break end
        end
        if (not Naval_InsideZone(zone, x, y)) then
            x = targetX
            y = targetY
        end
    end
    SetUnitX(source, x)
    SetUnitY(source, y)
    place = Location(x, y)
    TerrainDeformationCraterBJ(3.0, false, place, 100.0, 100.0)
    RemoveLocation(place)
    place = nil
    DestroyEffect(AddSpecialEffect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x, y))
    victims = CreateGroup()
    GroupEnumUnitsInRange(victims, x, y, 100.0, nil)
    while true do
        victim = FirstOfGroup(victims)
        if (victim == nil) then break end
        GroupRemoveUnit(victims, victim)
        if Naval_CanDamage(source, victim, zone) then
            SetUnitExploded(victim, true)
            UnitDamageTarget(source, victim, 1000.0, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
            if (IsUnitAliveBJ(victim) and Naval_IsBattleActive(pid)) then
                UnitAddAbility(victim, 1097691750)
                UnitRemoveAbility(victim, 1097691750)
                SetUnitFlyHeight(victim, GetUnitDefaultFlyHeight(victim), 0.0)
                SaveReal(udg_Hashtable, GetHandleId(victim), StringHash("Speed"), 12.5)
                SaveReal(udg_Hashtable, GetHandleId(victim), StringHash("Degrees"), J88_real(Atan2(J88_real(GetUnitY(victim) - y), J88_real(GetUnitX(victim) - x)) * bj_RADTODEG))
                SaveReal(udg_Hashtable, GetHandleId(victim), StringHash("Increase"), 1.0)
                GroupAddUnit(udg_FlyGroup, victim)
                SetUnitPathing(victim, false)
                EnableTrigger(gg_trg_Fly)
            end
        end
    end
    DestroyGroup(victims)
    if ((strike >= 3) or (not Naval_IsBattleActive(pid))) then
        Naval_EndBarrage(clock)
    else
        SaveInteger(Naval_Data, key, 8, J88_int(strike + 1))
        TimerStart(clock, 0.30000001192092896, false, Naval_BarrageTick)
    end
    clock = nil
    source = nil
    victims = nil
    victim = nil
end

function Naval_RefundRejected()
    local refund = GetExpiredTimer()
    local key = GetHandleId(refund)
    local caster = LoadUnitHandle(Naval_Data, key, 20)
    local cost = LoadReal(Naval_Data, key, 21)
    local abilityId = LoadInteger(Naval_Data, key, 22)
    local latest = false
    if (caster ~= nil) then
        latest = (LoadTimerHandle(Naval_Data, GetHandleId(caster), 20) == refund)
        if ((GetUnitTypeId(caster) ~= 0) and (GetUnitAbilityLevel(caster, abilityId) > 0)) then
            SetUnitState(caster, UNIT_STATE_MANA, RMinBJ(I2R(BlzGetUnitMaxMana(caster)), J88_real(GetUnitState(caster, UNIT_STATE_MANA) + cost)))
            --  A newer valid cast must keep its own cooldown.
            if latest then
                BlzEndUnitAbilityCooldown(caster, abilityId)
            end
        end
        if latest then
            RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
        end
    end
    FlushChildHashtable(Naval_Data, key)
    PauseTimer(refund)
    DestroyTimer(refund)
    caster = nil
    refund = nil
end

function Naval_RejectAbility(caster, abilityId)
    local level = J88_int(GetUnitAbilityLevel(caster, abilityId) - 1)
    local refund = nil
    local key = 0
    --  Do not stop, remove or disable Channel; let its normal one-second
    --  follow-through restore the command card. This rejected cast has no shells.
    if (level >= 0) then
        refund = CreateTimer()
        key = GetHandleId(refund)
        SaveUnitHandle(Naval_Data, key, 20, caster)
        SaveInteger(Naval_Data, key, 22, abilityId)
        SaveReal(Naval_Data, key, 21, I2R(BlzGetUnitAbilityManaCost(caster, abilityId, level)))
        SaveTimerHandle(Naval_Data, GetHandleId(caster), 20, refund)
        --  Refund after the engine has completed this spell-effect event.
        TimerStart(refund, 0.0, false, Naval_RefundRejected)
    end
    DisplayTextToPlayer(GetOwningPlayer(caster), 0.0, 0.0, "Naval support is limited to your current battlefield. Clear your assigned opponent before targeting the center.")
    refund = nil
end

function Naval_Reject(caster)
    Naval_RejectAbility(caster, 1093678412)
end

function Naval_Begin(caster, x, y)
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local zone = Naval_TargetZone(pid, x, y)
    local clock = nil
    local source = nil
    local key = 0
    --  Retire an older refund's cooldown claim before this new cast.
    RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
    if (zone < 0) then
        Naval_Reject(caster)
        do return end
    end
    clock = CreateTimer()
    source = CreateUnit(Player(pid), 1747995184, x, y, 90.0)
    key = GetHandleId(clock)
    SaveBoolean(Naval_Data, GetHandleId(source), 1, true)
    SaveInteger(Naval_Data, GetHandleId(source), 2, pid)
    SaveUnitHandle(Naval_Data, key, 1, source)
    SaveInteger(Naval_Data, key, 2, pid)
    SaveInteger(Naval_Data, key, 3, udg_int_CurRound)
    SaveInteger(Naval_Data, key, 4, CavalryCharge_Mode)
    SaveInteger(Naval_Data, key, 5, zone)
    SaveReal(Naval_Data, key, 6, x)
    SaveReal(Naval_Data, key, 7, y)
    SaveInteger(Naval_Data, key, 8, 0)
    TimerStart(clock, 3.0, false, Naval_BarrageTick)
    clock = nil
    source = nil
end

function Naval_Init()
    --  Validate only at SPELL_EFFECT. Early CHANNEL/CAST stop orders can leave
    --  Channel's temporarily hidden ability buttons without their normal cleanup.
    Naval_Data = InitHashtable()
    Carrier_Init()
end

function CavalryCharge_IsCavalry(uid)
    do return (((((uid == 1749828401) or (uid == 1747988818)) or (uid == 1747993137)) or (uid == 1747993138)) or (uid == 1747993427)) end
end

function CavalryCharge_IsCharger(uid)
    do return ((CavalryCharge_IsCavalry(uid) or (uid == 1747989048)) or (uid == PL_C_WOJTEK)) end
end

function CavalryCharge_GetRange(attacker)
    if ((GetUnitTypeId(attacker) == 1747989048) or (GetUnitTypeId(attacker) == PL_C_WOJTEK)) then
        do return BayonetCharge_Range end
    end
    do return CavalryCharge_Range end
end

function CavalryCharge_BayonetImpactDamage(target)
    local armorType = BlzGetUnitIntegerField(target, UNIT_IF_DEFENSE_TYPE)
    --  This map's Chaos multipliers are 1,3,2,1,0.5,1,1,0.5. Compensate
    --  armor TYPE here; Universal damage already ignores armor POINTS.
    --  Read the current native type so temporary armor-type changes are safe.
    if (armorType == 1) then
        do return J88_real(BayonetCharge_Damage / 3.0) end
    elseif (armorType == 2) then
        do return J88_real(BayonetCharge_Damage / 2.0) end
    elseif ((armorType == 4) or (armorType == 7)) then
        do return J88_real(BayonetCharge_Damage / 0.5) end
    end
    do return BayonetCharge_Damage end
end

function CavalryCharge_InitInfantry()
    if (CavalryCharge_Infantry ~= nil) then
        do return end
    end
    CavalryCharge_Infantry = InitHashtable()
    --  Positive list of real combat infantry. Blueprints, workers, vehicles,
    --  towed guns, aircraft, cavalry and non-human units are not admitted.
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988529, true) --  American Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988530, true) --  American SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988531, true) --  American LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988532, true) --  American Sergeant
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988536, true) --  American Rangers
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988537, true) --  US Marines LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988545, true) --  US Marines Anti-Tank
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988546, true) --  US Marines Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988547, true) --  US Marines SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988548, true) --  US Marines Sergeant
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988549, true) --  American Rangers AT
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988551, true) --  American Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988552, true) --  American Heavy Machinegun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988564, true) --  American Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988565, true) --  US Marines Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988566, true) --  Soviet Conscript
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988785, true) --  Soviet Commissar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988786, true) --  Soviet Flagbearer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988788, true) --  Soviet Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988789, true) --  Soviet PPSH
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988790, true) --  Soviet LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988791, true) --  Soviet Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988792, true) --  Soviet Partisans
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988793, true) --  Soviet Partisans
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988802, true) --  Soviet Partisans
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988803, true) --  Soviet Partisans
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988804, true) --  Soviet Partisans
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988808, true) --  Woman Soldier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988809, true) --  Woman Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988810, true) --  Woman Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988811, true) --  Soviet Heavy Machinegun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988812, true) --  Soviet Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988822, true) --  Soviet Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988823, true) --  Soviet Anti-Tank
    SaveBoolean(CavalryCharge_Infantry, 0, 1747988826, true) --  Japanese Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989040, true) --  Japanese LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989041, true) --  Japanese SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989042, true) --  Japanese Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989043, true) --  Japanese Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989045, true) --  American Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989048, true) --  Japanese Bayonet
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989049, true) --  Japanese Flag Bearer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989057, true) --  Japanese Banzai
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989064, true) --  Japanese HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989065, true) --  Japanese Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989068, true) --  American Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989069, true) --  Japanese Anti-Tank
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989323, true) --  Soviet Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989325, true) --  Werhmacht Infantry
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989326, true) --  Werhmacht SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989327, true) --  Werhmacht LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989328, true) --  Werhmacht Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989329, true) --  Werhmacht Squad Leader
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989330, true) --  Werhmacht HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989331, true) --  Werhmacht Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989332, true) --  Werhmacht Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989333, true) --  Werhmacht Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989553, true) --  Werhmacht Panzershreck
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989557, true) --  SS Sturmtruppen
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989558, true) --  SS Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989574, true) --  Luftwaffe Infantry
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989575, true) --  Luftwaffe SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989576, true) --  Luftwaffe Panzershreck
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989577, true) --  Luftwaffe LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989578, true) --  Luftwaffe Squad Leader
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989584, true) --  Chinese Conscript
    SaveBoolean(CavalryCharge_Infantry, 0, 1750487885, true)
    SaveBoolean(CavalryCharge_Infantry, 0, 1750487886, true)
    SaveBoolean(CavalryCharge_Infantry, 0, 1750483284, true)
    SaveBoolean(CavalryCharge_Infantry, 0, 1750486351, true)
    SaveBoolean(CavalryCharge_Infantry, 0, 1749108529, true)
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989585, true) --  Chinese Conscript
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989586, true) --  Chinese Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989587, true) --  Chinese Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989588, true) --  Chinese Peasants
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989589, true) --  Chinese Soldier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747989590, true) --  Chinese Soldier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990101, true) --  Japanese Unit 731
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990104, true) --  Japanese Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990605, true) --  Polish Flagbearer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990606, true) --  Polish Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990607, true) --  ANZAC Trooper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990608, true) --  ANZAC SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990609, true) --  ANZAC Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990610, true) --  ANZAC Shotgun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990611, true) --  ANZAC Rocket Trooper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990612, true) --  ANZAC HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990614, true) --  ANZAC Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990615, true) --  British Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990616, true) --  British Rocket Trooper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990617, true) --  British SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990618, true) --  British Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990832, true) --  British Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990833, true) --  SAS SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990834, true) --  SAS Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990835, true) --  SAS Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990836, true) --  SAS LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990838, true) --  Green Berets Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990839, true) --  Green Berets
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990840, true) --  Canadian Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990841, true) --  Canadian Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990849, true) --  Canadian LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990850, true) --  Canadian Shotgun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990851, true) --  Canadian HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990852, true) --  Indian Colonial Infantry
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990859, true) --  British Heavy Machinegun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990862, true) --  ANZAC AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747990870, true) --  American Shotguner
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992884, true) --  British Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992885, true) --  Canadian Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992886, true) --  Canadian Rocket Trooper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992888, true) --  Canadian AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992905, true) --  Canadian SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992917, true) --  Polish SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992918, true) --  Polish LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992919, true) --  Polish Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992920, true) --  Polish Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747992922, true) --  Polish HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993136, true) --  Polish Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993139, true) --  Polish Grenadier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993141, true) --  Polish AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993142, true) --  Polish Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993392, true) --  Soviet AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993423, true) --  Chinese Suicide Bomber
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993430, true) --  Polish Soviet Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993431, true) --  Polish Soviet Conscript
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993432, true) --  Polish Soviet Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993433, true) --  Polish Soviet Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993434, true) --  Polish Soviet SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993648, true) --  Polish Soviet Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993649, true) --  Polish Soviet HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993650, true) --  Polish Soviet Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993651, true) --  Polish Soviet LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993652, true) --  Polish Soviet Flagbearer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993653, true) --  Polish Soviet AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993654, true) --  Polish Soviet Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993655, true) --  Polish Soviet Commissar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993667, true) --  Soviet Guards
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993668, true) --  Soviet Guard Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993687, true) --  Chinese Suicide Bomber
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993688, true) --  HERO Leo Major
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993689, true) --  Ubermensch Sturmtruppen
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993690, true) --  Ubermensch Panzershreck
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993904, true) --  Ubermensch HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993905, true) --  Ubermensch Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993909, true) --  Ubermensch Death Squad
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993911, true) --  HERO Lyudmila Pavlichenko
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993926, true) --  Chinese Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993927, true) --  Chinese Heavy Machinegun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993928, true) --  Chinese Heavy Machinegun
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993929, true) --  Chinese Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993930, true) --  Chinese SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993931, true) --  Chinese SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993932, true) --  Chinese AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993933, true) --  Chinese AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993934, true) --  Chinese Anti-Tank
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993935, true) --  Chinese Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993936, true) --  Chinese Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993937, true) --  Chinese Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993938, true) --  Chinese Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993939, true) --  Chinese Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747993943, true) --  Wehrmacht AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994164, true) --  Soviet Partisan Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994166, true) --  Soviet Partisan HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994167, true) --  Soviet Partisan PPSH
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994177, true) --  American Code Talker
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994178, true) --  American Native Guerillas
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994179, true) --  American Afro Rifleman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994180, true) --  American Native Tomahawks
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994184, true) --  Freikorps
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994185, true) --  HERO Vasily Zaitsev
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994186, true) --  HERO Fyodor Okhlopov
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994189, true) --  HERO Matthaus Hetzenauer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994193, true) --  HERO Claus Von Stauffenberg
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994417, true) --  Japanese Sword Officier
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994422, true) --  HERO MadJack Churchill
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994423, true) --  HERO Sword MadJack Churchill
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994434, true) --  French Infantry
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994435, true) --  French Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994436, true) --  French Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994437, true) --  French SMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994438, true) --  French HMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994439, true) --  French AP Sniper
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994440, true) --  French LMG
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994441, true) --  French Medic
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994442, true) --  French Mortar
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994443, true) --  French Flagbearer
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994444, true) --  Senegalese Tirailleurs
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994455, true) --  HERO Christopher Lee
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994692, true) --  American Anti-Tank
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994695, true) --  American Afro Bayonet
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994701, true) --  Polish Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994702, true) --  American Ranger Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994703, true) --  American Ranger Shotguner
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994704, true) --  African Militia
    SaveBoolean(CavalryCharge_Infantry, 0, 1747994705, true) --  African Bayonet Militia
    SaveBoolean(CavalryCharge_Infantry, 0, 1747995205, true) --  Chinese Flamethrower
    SaveBoolean(CavalryCharge_Infantry, 0, 1747995206, true) --  Chinese Swordman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747995225, true) --  Chinese Swordman
    SaveBoolean(CavalryCharge_Infantry, 0, 1747995466, true) --  Chinese Anti-Tank
SaveBoolean(CavalryCharge_Infantry, 0, 1749627184, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627185, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627186, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627187, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627188, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627189, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627190, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627191, true)
SaveBoolean(CavalryCharge_Infantry, 0, 1749627192, true)
PL104_InitInfantry()
end

function CavalryCharge_IsInfantry(target)
    if ((((target == nil) or IsUnitType(target, UNIT_TYPE_STRUCTURE)) or IsUnitType(target, UNIT_TYPE_MECHANICAL)) or IsUnitType(target, UNIT_TYPE_FLYING)) then
        do return false end
    end
    CavalryCharge_InitInfantry()
    do return LoadBoolean(CavalryCharge_Infantry, 0, GetUnitTypeId(target)) end
end

function CavalryCharge_IsTarget(rider, target)
    local owner = GetPlayerId(GetOwningPlayer(rider))
    local other = GetPlayerId(GetOwningPlayer(target))
    if (((owner < 9) or (owner > 16)) or (target == rider)) then
        do return false end
    end
    if (((GetWidgetLife(target) <= 0.4050000011920929) or IsUnitType(target, UNIT_TYPE_DEAD)) or IsUnitType(target, UNIT_TYPE_FLYING)) then
        do return false end
    end
    if (((IsUnitHidden(target) or IsUnitPaused(target)) or BlzIsUnitInvulnerable(target)) or (GetUnitAbilityLevel(target, 1097625443) > 0)) then
        do return false end
    end
    if ((GetUnitTypeId(rider) == 1747989048) and (not CavalryCharge_IsInfantry(target))) then
        do return false end
    end
    if ((not IsUnitEnemy(target, GetOwningPlayer(rider))) or (not IsUnitVisible(target, GetOwningPlayer(rider)))) then
        do return false end
    end
    if (CavalryCharge_Mode == 1) then
        do return (other == J88_int(udg_int_Opponent[J88_int(owner - 9)] + 9)) end
    elseif (CavalryCharge_Mode == 2) then
        do return (other == 18) end
    elseif (CavalryCharge_Mode == 3) then
        do return ((other >= 9) and (other <= 16)) end
    end
    do return false end
end

function CavalryCharge_FindTarget(rider)
    local candidate = nil
    local best = nil
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local chargeRange = CavalryCharge_GetRange(rider)
    local bestDistance = J88_real(J88_real(chargeRange * chargeRange) + 0.009999999776482582)
    GroupEnumUnitsInRange(CavalryCharge_Search, GetUnitX(rider), GetUnitY(rider), chargeRange, nil)
    while true do
        candidate = FirstOfGroup(CavalryCharge_Search)
        if (candidate == nil) then break end
        GroupRemoveUnit(CavalryCharge_Search, candidate)
        if CavalryCharge_IsTarget(rider, candidate) then
            dx = J88_real(GetUnitX(candidate) - GetUnitX(rider))
            dy = J88_real(GetUnitY(candidate) - GetUnitY(rider))
            distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if (distance < bestDistance) then
                bestDistance = distance
                best = candidate
            end
        end
    end
    candidate = nil
    do return best end
end

function CavalryCharge_RemoveBonus(rider)
    if (GetUnitTypeId(rider) ~= 0) then
        UnitRemoveAbility(rider, CavalryCharge_BonusAbility)
    end
    GroupRemoveUnit(CavalryCharge_Boosted, rider)
    FlushChildHashtable(CavalryCharge_State, GetHandleId(rider))
end

function CavalryCharge_ExpireBonus()
    local rider = GetEnumUnit()
    if ((((GetUnitTypeId(rider) == 0) or (GetWidgetLife(rider) <= 0.4050000011920929)) or IsUnitType(rider, UNIT_TYPE_DEAD)) or (CavalryCharge_Tick >= LoadInteger(CavalryCharge_State, GetHandleId(rider), 0))) then
        CavalryCharge_RemoveBonus(rider)
    end
    rider = nil
end

function CavalryCharge_TryCharge(rider, target)
    local chargeRange = CavalryCharge_GetRange(rider)
    local bayonet = (GetUnitTypeId(rider) == 1747989048)
    local bear = (GetUnitTypeId(rider) == PL_C_WOJTEK)
    local startX = GetUnitX(rider)
    local startY = GetUnitY(rider)
    local targetX = GetUnitX(target)
    local targetY = GetUnitY(target)
    local dx = J88_real(targetX - startX)
    local dy = J88_real(targetY - startY)
    local angle = Atan2(J88_real(-dy), J88_real(-dx))
    local stand = RMaxBJ(64.0, J88_real(J88_real(BlzGetUnitCollisionSize(rider) + BlzGetUnitCollisionSize(target)) + 16.0))
    local x = 0.0
    local y = 0.0
    local movedX = 0.0
    local movedY = 0.0
    local attempt = 0
    local repositioned = false
    if (((IsUnitInGroup(rider, CavalryCharge_Spent) or (bear and PL104_BearCooling(rider))) or (not CavalryCharge_IsTarget(rider, target))) or (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) > J88_real(chargeRange * chargeRange))) then
        do return false end
    end
    --  Try the near side first, then alternative sides. SetUnitPosition retains
    --  Warcraft's collision/pathing resolution; never force X/Y through a wall.
    while true do
        if (attempt >= 8) then break end
        x = J88_real(targetX + J88_real(stand * Cos(J88_real(angle + J88_real(I2R(attempt) * 0.7853981852531433)))))
        y = J88_real(targetY + J88_real(stand * Sin(J88_real(angle + J88_real(I2R(attempt) * 0.7853981852531433)))))
        dx = J88_real(x - startX)
        dy = J88_real(y - startY)
        if ((J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= J88_real(chargeRange * chargeRange)) and (not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY))) then
            repositioned = true
            SetUnitPosition(rider, x, y)
            movedX = J88_real(GetUnitX(rider) - startX)
            movedY = J88_real(GetUnitY(rider) - startY)
            dx = J88_real(GetUnitX(rider) - x)
            dy = J88_real(GetUnitY(rider) - y)
            --  Reject engine placement far from the requested landing point.
            if (((J88_real(J88_real(movedX * movedX) + J88_real(movedY * movedY)) <= J88_real(chargeRange * chargeRange)) and (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= 2304.0)) and CavalryCharge_IsTarget(rider, target)) then
                --  Mark spent before damage, so death/event callbacks cannot
                --  register the same charging unit for another impact.
                if bear then
                    PL104_BearCharged(rider)
                else
                    GroupAddUnit(CavalryCharge_Spent, rider)
                end
                if ((not bayonet) and (not bear)) then
                    UnitAddAbility(rider, CavalryCharge_BonusAbility)
                    GroupAddUnit(CavalryCharge_Boosted, rider)
                    SaveInteger(CavalryCharge_State, GetHandleId(rider), 0, J88_int(CavalryCharge_Tick + R2I(J88_real(J88_real(CavalryCharge_BonusDuration / CavalryCharge_Period) + 0.5))))
                end
                SetUnitFacing(rider, J88_real(Atan2(J88_real(targetY - GetUnitY(rider)), J88_real(targetX - GetUnitX(rider))) * bj_RADTODEG))
                DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", rider, "origin"))
                if bayonet then
                    --  Compensate the map's armor-type multiplier, then use
                    --  universal impact damage credited to the charging unit.
                    UnitDamageTarget(rider, target, CavalryCharge_BayonetImpactDamage(target), false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
                elseif bear then
                    UnitDamageTarget(rider, target, PL104_BearImpact(target), false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
                    Advance_Issue(rider, false)
                    do return true end
                end
                --  Preserve the battle's attack-move destination. A unit-target
                --  attack would strand the rider after that target is killed.
                IssuePointOrder(rider, "attack", 0.0, 0.0)
                do return true end
            end
            SetUnitPosition(rider, startX, startY)
        end
        attempt = J88_int(attempt + 1)
    end
    --  Rejected placement also uses SetUnitPosition, which interrupts orders.
    if repositioned then
        IssuePointOrder(rider, "attack", 0.0, 0.0)
    end
    do return false end
end

function CavalryCharge_Process()
    local rider = CavalryCharge_Current
    local target = nil
    if (((((GetUnitTypeId(rider) == 0) or (GetWidgetLife(rider) <= 0.4050000011920929)) or IsUnitType(rider, UNIT_TYPE_DEAD)) or IsUnitInGroup(rider, CavalryCharge_Spent)) or (CavalryCharge_IsCavalry(GetUnitTypeId(rider)) and (GetUnitAbilityLevel(rider, CavalryCharge_BonusAbility) > 0))) then
        GroupRemoveUnit(CavalryCharge_Pending, rider)
    elseif (((not IsUnitHidden(rider)) and (not IsUnitPaused(rider))) and (not ((GetUnitTypeId(rider) == PL_C_WOJTEK) and PL104_BearCooling(rider)))) then
        target = CavalryCharge_FindTarget(rider)
        --  Wojtek stays registered: he charges again after his cooldown.
        if (((target ~= nil) and CavalryCharge_TryCharge(rider, target)) and (GetUnitTypeId(rider) ~= PL_C_WOJTEK)) then
            GroupRemoveUnit(CavalryCharge_Pending, rider)
        end
    end
    rider = nil
    target = nil
end

function CavalryCharge_Enum()
    CavalryCharge_Current = GetEnumUnit()
    --  A separate JASS operation budget per rider also handles large armies.
    ExecuteFunc("CavalryCharge_Process")
    CavalryCharge_Current = nil
end

function CavalryCharge_OnTick()
    if (not CavalryCharge_Active) then
        do return end
    end
    CavalryCharge_Tick = J88_int(CavalryCharge_Tick + 1)
    ForGroup(CavalryCharge_Boosted, CavalryCharge_ExpireBonus)
    ForGroup(CavalryCharge_Pending, CavalryCharge_Enum)
end

function CavalryCharge_Register(rider)
    local owner = GetPlayerId(GetOwningPlayer(rider))
    if ((((not CavalryCharge_IsCharger(GetUnitTypeId(rider))) or (owner < 9)) or (owner > 16)) or (CavalryCharge_IsCavalry(GetUnitTypeId(rider)) and (GetUnitAbilityLevel(rider, CavalryCharge_BonusAbility) > 0))) then
        do return end
    end
    if (CavalryCharge_Pending == nil) then
        CavalryCharge_Pending = CreateGroup()
        CavalryCharge_Search = CreateGroup()
        CavalryCharge_Boosted = CreateGroup()
        CavalryCharge_Spent = CreateGroup()
        CavalryCharge_State = InitHashtable()
        CavalryCharge_Timer = CreateTimer()
    end
    if IsUnitInGroup(rider, CavalryCharge_Spent) then
        do return end
    end
    GroupAddUnit(CavalryCharge_Pending, rider)
end

function CavalryCharge_Begin(mode)
    CavalryCharge_Mode = mode
    CavalryCharge_Active = true
    ExecuteFunc("Air88_Begin")
    PL104_Begin()
    if (CavalryCharge_Timer ~= nil) then
        TimerStart(CavalryCharge_Timer, CavalryCharge_Period, true, CavalryCharge_OnTick)
    end
end

function CavalryCharge_Stop()
    local rider = nil
    ExecuteFunc("Air82_Stop")
ExecuteFunc("Elite82_Stop")
Carrier_Stop()
    CavalryCharge_Active = false
    CavalryCharge_Mode = 0
    if (CavalryCharge_Timer ~= nil) then
        PauseTimer(CavalryCharge_Timer)
        GroupClear(CavalryCharge_Pending)
        GroupClear(CavalryCharge_Search)
    end
    if (CavalryCharge_Boosted ~= nil) then
        while true do
            rider = FirstOfGroup(CavalryCharge_Boosted)
            if (rider == nil) then break end
            CavalryCharge_RemoveBonus(rider)
        end
        GroupClear(CavalryCharge_Spent)
    end
    CavalryCharge_Tick = 0
    rider = nil
end

function Battle77_InitialOrder(u)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    local t = GetUnitTypeId(u)
    local site = 0
    if (((((((((((((((((((((((((((((t == 1749627193) or (t == 1749627201)) or (t == 1749627440)) or (t == 1749627441)) or (t == 1749627442)) or (t == 1749112369)) or (t == 1749112371)) or (t == 1749112373)) or (t == 1749112375)) or (t == 1749112377)) or (t == 1749632305)) or (t == 1749632306)) or (t == 1749632307)) or (t == 1749632308)) or (t == 1749631281)) or (t == 1749631283)) or (t == 1749631285)) or (t == 1749634097)) or (t == 1749634099)) or (t == 1749634101)) or (t == 1749633073)) or (t == 1749633075)) or (t == 1749633077)) or US95_IsAircraft(t)) or PL104_IsAircraft(t)) and (pid >= 0)) and (pid < 8)) and (CavalryCharge_Mode == 1)) and (not Naval_OpponentCleared(pid))) then
        site = PLAYER_CURRENT_SITE[pid]
        if (ModuloInteger(site, 2) == 0) then
            site = J88_int(site + 1)
        else
            site = J88_int(site - 1)
        end
        IssuePointOrder(u, "attack", GetRectCenterX(udg_region_Spawns[site]), GetRectCenterY(udg_region_Spawns[site]))
    else
        IssuePointOrder(u, "attack", 0.0, 0.0)
    end
end

function Combat45_IsTroop(u)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    do return (((((((pid >= 0) and (pid < 8)) and (GetUnitTypeId(u) ~= 0)) and (GetWidgetLife(u) > 0.4050000011920929)) and (not IsUnitType(u, UNIT_TYPE_DEAD))) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE))) and (GetUnitAbilityLevel(u, 1097625443) == 0)) end
end

function Combat45_Active()
    do return ((((CavalryCharge_Mode == 1) and (COUNTDOWN_TICK_TIMER == nil)) and (not udg_bool_WaitingForSacrificeEnd)) and IsTriggerEnabled(gg_trg_PlayerUnitDies)) end
end

function Combat45_ReconcilePlayer(pid)
    local u = nil
    local added = false
    GroupEnumUnitsOfPlayer(Combat45_Scan, Player(J88_int(pid + 9)), nil)
    while true do
        u = FirstOfGroup(Combat45_Scan)
        if (u == nil) then break end
        GroupRemoveUnit(Combat45_Scan, u)
        if Combat45_IsTroop(u) then
            added = (not IsUnitInGroup(u, udg_group_AllSpawnedUnits))
            if added then
                GroupAddUnit(udg_group_AllSpawnedUnits, u)
                CavalryCharge_Register(u)
                Yamato_Register(u)
                China_Register(u)
                PL104_Register(u)
            end
            --  The only explicit combat pauses in this map are countdown and settlement.
            --  Both states are excluded before entering this reconciliation.
            if ((not IsUnitHidden(u)) and (added or IsUnitPaused(u))) then
                PauseUnit(u, false)
                Advance_RequestUnit = u
                ExecuteFunc("Advance_Manual")
                Advance_RequestUnit = nil
            end
        end
    end
    u = nil
end

function Combat45_Tick()
    if Combat45_Active() then
        --  One owner each second, rather than another full-map scan every tick.
        Combat45_ReconcilePlayer(Combat45_NextPlayer)
        Combat45_NextPlayer = ModuloInteger(J88_int(Combat45_NextPlayer + 1), 8)
    end
end

function Combat45_CheckEnd()
    local pid = 0
    Combat45_EndPending = false
    if (not Combat45_Active()) then
        do return end
    end
    LS103_CheckSides()
    --  Most deaths leave several owners fighting. Avoid eight owner scans then.
    if (FirstOfGroup(udg_group_AllSpawnedUnits) ~= nil) then
        PUD_ENUM_PLAYER = Player(J88_int(GetPlayerId(GetOwningPlayer(FirstOfGroup(udg_group_AllSpawnedUnits))) - 9))
        PUD_ENUM_RESULT = true
        ForGroup(udg_group_AllSpawnedUnits, PUD_CheckSamePlayer)
        if (not PUD_ENUM_RESULT) then
            do return end
        end
    end
    --  Summon and replacement callbacks from this death have completed.
    while true do
        if (pid >= 8) then break end
        Combat45_ReconcilePlayer(pid)
        pid = J88_int(pid + 1)
    end
    if (FirstOfGroup(udg_group_AllSpawnedUnits) == nil) then
        Round012_ClearSurvivors()
        do return end
    end
    PUD_ENUM_PLAYER = Player(J88_int(GetPlayerId(GetOwningPlayer(FirstOfGroup(udg_group_AllSpawnedUnits))) - 9))
    PUD_ENUM_RESULT = true
    ForGroup(udg_group_AllSpawnedUnits, PUD_CheckSamePlayer)
    if (PUD_ENUM_RESULT and (not udg_bool_WaitingForSacrificeEnd)) then
        ROUND_WINNER = PUD_ENUM_PLAYER
        Print(J88_concat(GetPlayerName(PUD_ENUM_PLAYER), " is the last player alive!"))
        PlaySoundBJ(gg_snd_UndeadBuildingBirth1)
        Round012_ClearSurvivors()
    end
end

function Combat45_Summon()
    local u = GetSummonedUnit()
    if (Combat45_Active() and Combat45_IsTroop(u)) then
        GroupAddUnit(udg_group_AllSpawnedUnits, u)
        CavalryCharge_Register(u)
        Yamato_Register(u)
        China_Register(u)
        PL104_Register(u)
        Advance_RequestUnit = u
        ExecuteFunc("Advance_Manual")
        Advance_RequestUnit = nil
    end
    u = nil
end

function Combat45_Init()
    local t = CreateTrigger()
    Combat45_Scan = CreateGroup()
    Combat45_Timer = CreateTimer()
    Combat45_EndTimer = CreateTimer()
    TimerStart(Combat45_Timer, 1.0, true, Combat45_Tick)
    TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SUMMON)
    TriggerAddAction(t, Combat45_Summon)
    t = nil
end

function Advance_OrderAllowed(order)
    do return ((((((((order == 0) or (order == OrderId("attack"))) or (order == OrderId("attackground"))) or (order == OrderId("move"))) or (order == OrderId("smart"))) or (order == OrderId("stop"))) or (order == OrderId("holdposition"))) or (order == OrderId("patrol"))) end
end

function Advance_SpecialBusy(u)
    do return ((IsUnitInGroup(u, udg_FlyGroup) or LoadBoolean(NewAI_RecoveryData, GetHandleId(u), 8)) or ((GetUnitTypeId(u) == 1749108529) and Agent_Valid(u, LoadUnitHandle(Agent_Data, GetHandleId(u), 0)))) end
end

function Advance_AirHunt(u)
    --  Aircraft fly straight to the center and would idle there while other battles
    --  continue elsewhere. Send an idle aircraft to attack-move to the nearest enemy
    --  in the central battlefield. Returns false when there is no such enemy.
    local owner = GetOwningPlayer(u)
    local v = nil
    local best = nil
    local d = 0.0
    local bestD = 0.0
    local p = 0
    if (Advance_AirSearch == nil) then
        Advance_AirSearch = CreateGroup()
    end
    GroupEnumUnitsInRange(Advance_AirSearch, 0.0, 0.0, 4000.0, nil)
    while true do
        v = FirstOfGroup(Advance_AirSearch)
        if (v == nil) then break end
        GroupRemoveUnit(Advance_AirSearch, v)
        p = GetPlayerId(GetOwningPlayer(v))
        if (((((((p >= 9) and (p <= 16)) and IsUnitEnemy(v, owner)) and (GetWidgetLife(v) > 0.4050000011920929)) and (not IsUnitHidden(v))) and (GetUnitAbilityLevel(v, 1097625443) == 0)) and Naval_InsideZone(4, GetUnitX(v), GetUnitY(v))) then
            d = J88_real(J88_real(J88_real(GetUnitX(v) - GetUnitX(u)) * J88_real(GetUnitX(v) - GetUnitX(u))) + J88_real(J88_real(GetUnitY(v) - GetUnitY(u)) * J88_real(GetUnitY(v) - GetUnitY(u))))
            if ((best == nil) or (d < bestD)) then
                best = v
                bestD = d
            end
        end
    end
    if (best == nil) then
        do return false end
    end
    IssuePointOrder(u, "attack", GetUnitX(best), GetUnitY(best))
    best = nil
    v = nil
    do return true end
end

function Advance_Issue(u, sidestep)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    local site = 0
    local gx = 0.0
    local gy = 0.0
    local dx = 0.0
    local dy = 0.0
    local length = 0.0
    local sx = 0.0
    local sy = 0.0
    local sign = 1.0
    local key = GetHandleId(u)
    if ((CavalryCharge_Mode == 1) and (not Naval_OpponentCleared(pid))) then
        site = PLAYER_CURRENT_SITE[pid]
        if (ModuloInteger(site, 2) == 0) then
            site = J88_int(site + 1)
        else
            site = J88_int(site - 1)
        end
        gx = GetRectCenterX(udg_region_Spawns[site])
        gy = GetRectCenterY(udg_region_Spawns[site])
    end
    dx = J88_real(gx - GetUnitX(u))
    dy = J88_real(gy - GetUnitY(u))
    length = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
    SaveBoolean(WomanAdvance_State, key, 4, false)
    if (sidestep and (length > 192.0)) then
        if (ModuloInteger(J88_int(key + Advance_Clock), 2) == 0) then
            sign = J88_real(-1.0)
        end
        sx = J88_real(GetUnitX(u) - J88_real(J88_real(J88_real(sign * dy) * 128.0) / length))
        sy = J88_real(GetUnitY(u) + J88_real(J88_real(J88_real(sign * dx) * 128.0) / length))
        --  A legal short step, never a teleport or collision/ethereal cheat.
        if (((RectContainsCoords(GetPlayableMapRect(), sx, sy) and (not Naval_IsPreparationPoint(sx, sy))) and ((Naval_InsideZone(J88_div(PLAYER_CURRENT_SITE[pid], 2), sx, sy) or (Naval_OpponentCleared(pid) and Naval_InsideZone(4, sx, sy))) or (CavalryCharge_Mode ~= 1))) and (IsUnitType(u, UNIT_TYPE_FLYING) or (not IsTerrainPathable(sx, sy, PATHING_TYPE_WALKABILITY)))) then
            if IssuePointOrder(u, "move", sx, sy) then
                SaveBoolean(WomanAdvance_State, key, 4, true)
                do return end
            end
        end
    end
    --  Reissue even if the stale native order is still named attack.
    IssuePointOrder(u, "attack", gx, gy)
end

function Advance_Manual()
    local u = Advance_RequestUnit
    local pid = 0
    if (u == nil) then
        do return end
    end
    pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    if (((((((((pid < 0) or (pid >= 8)) or (GetUnitTypeId(u) == 0)) or (GetWidgetLife(u) <= 0.4050000011920929)) or IsUnitHidden(u)) or IsUnitType(u, UNIT_TYPE_STRUCTURE)) or (GetUnitAbilityLevel(u, 1097625443) > 0)) or (not Naval_IsBattleActive(pid))) or (COUNTDOWN_TICK_TIMER ~= nil)) then
        GroupRemoveUnit(udg_StuckUnits, u)
    else
        if ((Combat45_Active() and IsUnitPaused(u)) and Combat45_IsTroop(u)) then
            PauseUnit(u, false)
        end
        if (((not IsUnitPaused(u)) and (not Advance_SpecialBusy(u))) and Advance_OrderAllowed(GetUnitCurrentOrder(u))) then
        Advance_Issue(u, false)
        SaveReal(WomanAdvance_State, GetHandleId(u), 0, GetUnitX(u))
        SaveReal(WomanAdvance_State, GetHandleId(u), 1, GetUnitY(u))
        SaveInteger(WomanAdvance_State, GetHandleId(u), 2, 0)
        GroupRemoveUnit(udg_StuckUnits, u)
    end
        end
    u = nil
end

function WomanAdvance_Check()
    local u = GetEnumUnit()
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    local key = GetHandleId(u)
    local order = 0
    local still = 0
    local x = GetUnitX(u)
    local y = GetUnitY(u)
    local dx = 0.0
    local dy = 0.0
    if ((pid < 0) or (pid >= 8)) then
        u = nil
        do return end
    end
    if (((((((not WomanAdvance_Ready[pid]) or (GetUnitTypeId(u) == 0)) or (GetWidgetLife(u) <= 0.4050000011920929)) or IsUnitHidden(u)) or IsUnitPaused(u)) or IsUnitType(u, UNIT_TYPE_STRUCTURE)) or (GetUnitAbilityLevel(u, 1097625443) > 0)) then
        FlushChildHashtable(WomanAdvance_State, key)
        u = nil
        do return end
    end
    order = GetUnitCurrentOrder(u)
    WomanAdvance_Dirty = true
    if ((IsUnitType(u, UNIT_TYPE_FLYING) and (((order == 0) or (order == OrderId("stop"))) or (order == OrderId("holdposition")))) and Advance_AirHunt(u)) then
        SaveReal(WomanAdvance_State, key, 0, x)
        SaveReal(WomanAdvance_State, key, 1, y)
        SaveInteger(WomanAdvance_State, key, 2, 0)
        u = nil
        do return end
    end
    if ((Advance_SpecialBusy(u) or (not Advance_OrderAllowed(order))) or (HaveSavedInteger(NewAI_RecoveryData, key, 9) and (J88_int(Advance_Clock - LoadInteger(NewAI_RecoveryData, key, 9)) <= 3))) then
        --  Preserve the established route across combat and spell activity.
        SaveReal(WomanAdvance_State, key, 0, x)
        SaveReal(WomanAdvance_State, key, 1, y)
        SaveInteger(WomanAdvance_State, key, 2, 0)
        u = nil
        do return end
    end
    if LoadBoolean(WomanAdvance_State, key, 4) then
        Advance_Issue(u, false)
    elseif (J88_real(J88_real(x * x) + J88_real(y * y)) > 65536.0) then
        if HaveSavedReal(WomanAdvance_State, key, 0) then
            dx = J88_real(x - LoadReal(WomanAdvance_State, key, 0))
            dy = J88_real(y - LoadReal(WomanAdvance_State, key, 1))
            if (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= 144.0) then
                still = J88_int(LoadInteger(WomanAdvance_State, key, 2) + 1)
            end
        else
            --  First safe post-victory check restores the route for every faction.
            if (not NewAI_Engaged(u)) then
                Advance_Issue(u, false)
                order = OrderId("attack")
            end
        end
        if ((((order == 0) or (order == OrderId("stop"))) or (order == OrderId("holdposition"))) or (still >= 4)) then
            --  Nearby enemies only delay recovery; they cannot block it forever.
            if ((not NewAI_Engaged(u)) or (still >= 12)) then
                Advance_Issue(u, (still >= 4))
                still = 0
            end
        end
    end
    SaveReal(WomanAdvance_State, key, 0, x)
    SaveReal(WomanAdvance_State, key, 1, y)
    SaveInteger(WomanAdvance_State, key, 2, still)
    u = nil
end

function WomanAdvance_Tick()
    local pid = 0
    Advance_Clock = J88_int(Advance_Clock + 1)
    if ((((CavalryCharge_Mode ~= 1) or (COUNTDOWN_TICK_TIMER ~= nil)) or udg_bool_WaitingForSacrificeEnd) or (not IsTriggerEnabled(gg_trg_PlayerUnitDies))) then
        --  FlushParentHashtable destroys a hashtable; replace it once, only if used.
        if WomanAdvance_Dirty then
            FlushParentHashtable(WomanAdvance_State)
            WomanAdvance_State = InitHashtable()
            WomanAdvance_Dirty = false
        end
        do return end
    end
    while true do
        if (pid >= 8) then break end
        WomanAdvance_Ready[pid] = (Naval_IsBattleActive(pid) and Naval_OpponentCleared(pid))
        pid = J88_int(pid + 1)
    end
    ForGroup(udg_group_AllSpawnedUnits, WomanAdvance_Check)
end

function WomanAdvance_Init()
    WomanAdvance_State = InitHashtable()
    WomanAdvance_Timer = CreateTimer()
    TimerStart(WomanAdvance_Timer, 1.0, true, WomanAdvance_Tick)
end
