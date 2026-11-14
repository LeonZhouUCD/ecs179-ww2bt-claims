function Carrier_IsCommander(caster)
    do return ((GetUnitTypeId(caster) == 1749954866) or (GetUnitTypeId(caster) == 1749889330)) end
end

function Carrier_PlaneType(caster)
    if (GetUnitTypeId(caster) == 1749954866) then
        do return 1747990069 end
    elseif (GetUnitTypeId(caster) == 1749889330) then
        do return 1747989828 end
    end
    do return 0 end
end

function Carrier_Forget(plane)
    GroupRemoveUnit(Carrier_Summons, plane)
    GroupRemoveUnit(udg_group_AllSpawnedUnits, plane)
    if (BonusPlayerUnits ~= nil) then
        GroupRemoveUnit(BonusPlayerUnits, plane)
    end
    if (FINAL_TOUR_SPAWNS[0] ~= nil) then
        GroupRemoveUnit(FINAL_TOUR_SPAWNS[0], plane)
    end
    if (FINAL_TOUR_SPAWNS[1] ~= nil) then
        GroupRemoveUnit(FINAL_TOUR_SPAWNS[1], plane)
    end
    FlushChildHashtable(Naval_Data, GetHandleId(plane))
end

function Carrier_Stop()
    local plane = nil
    Mac70_StopStrikes()
    Mac73_RefillCommanders()
    Zhukov_Stop()
    PL104_Stop()
    if (Carrier_Timer ~= nil) then
        PauseTimer(Carrier_Timer)
    end
    if (Carrier_Summons ~= nil) then
        while true do
            plane = FirstOfGroup(Carrier_Summons)
            if (plane == nil) then break end
            Carrier_Forget(plane)
            RemoveUnit(plane)
        end
    end
    plane = nil
end

function Carrier_TickUnit()
    local plane = GetEnumUnit()
    local key = GetHandleId(plane)
    local pid = LoadInteger(Naval_Data, key, 2)
    local x = GetUnitX(plane)
    local y = GetUnitY(plane)
    local center = (CavalryCharge_Mode ~= 1)
    if ((GetUnitTypeId(plane) == 0) or (not IsUnitAliveBJ(plane))) then
        Carrier_Forget(plane)
    elseif (((LoadInteger(Naval_Data, key, 3) ~= udg_int_CurRound) or (LoadInteger(Naval_Data, key, 4) ~= CavalryCharge_Mode)) or (not Naval_IsBattleActive(pid))) then
        Carrier_Forget(plane)
        RemoveUnit(plane)
    else
        if (CavalryCharge_Mode == 1) then
            center = Naval_OpponentCleared(pid)
        end
        if (Naval_TargetZone(pid, x, y) < 0) then
            --  Restore the last valid location; flight must not bypass arena gates.
            SetUnitX(plane, LoadReal(Naval_Data, key, 31))
            SetUnitY(plane, LoadReal(Naval_Data, key, 32))
            IssuePointOrder(plane, "attack", LoadReal(Naval_Data, key, 33), LoadReal(Naval_Data, key, 34))
        else
            SaveReal(Naval_Data, key, 31, x)
            SaveReal(Naval_Data, key, 32, y)
        end
        if (center and (not LoadBoolean(Naval_Data, key, 35))) then
            SaveBoolean(Naval_Data, key, 35, true)
            SaveReal(Naval_Data, key, 33, 0.0)
            SaveReal(Naval_Data, key, 34, 0.0)
            IssuePointOrder(plane, "attack", 0.0, 0.0)
        elseif ((GetUnitCurrentOrder(plane) == 0) or (GetUnitCurrentOrder(plane) == OrderId("stop"))) then
            IssuePointOrder(plane, "attack", LoadReal(Naval_Data, key, 33), LoadReal(Naval_Data, key, 34))
        end
    end
    plane = nil
end

function Carrier_Tick()
    ForGroup(Carrier_Summons, Carrier_TickUnit)
    if (FirstOfGroup(Carrier_Summons) == nil) then
        PauseTimer(Carrier_Timer)
    end
end

function Carrier_DamageGuard()
    local plane = GetEventDamageSource()
    local victim = GetTriggerUnit()
    if LoadBoolean(Naval_Data, GetHandleId(plane), 30) then
        --  A weapon may reach across an arena edge before the movement timer.
        if (((LoadInteger(Naval_Data, GetHandleId(plane), 3) ~= udg_int_CurRound) or (LoadInteger(Naval_Data, GetHandleId(plane), 4) ~= CavalryCharge_Mode)) or (Naval_TargetZone(LoadInteger(Naval_Data, GetHandleId(plane), 2), GetUnitX(victim), GetUnitY(victim)) < 0)) then
            BlzSetEventDamage(0.0)
        end
    end
    plane = nil
    victim = nil
end

function Carrier_Begin(caster, x, y)
    local pid = GetPlayerId(GetOwningPlayer(caster))
    local zone = Naval_TargetZone(pid, x, y)
    local tid = Carrier_PlaneType(caster)
    local count = 5
    local i = 0
    local side = J88_int(-1)
    local key = 0
    local px = 0.0
    local py = 0.0
    local angle = 0.0
    local plane = nil
    local member = nil
    RemoveSavedHandle(Naval_Data, GetHandleId(caster), 20)
    if (CavalryCharge_Mode == 3) then
        while true do
            if (i >= 2) then break end
            member = FirstOfGroup(FINAL_TOUR_SPAWNS[i])
            if ((member ~= nil) and (GetOwningPlayer(member) == Player(J88_int(pid + 9)))) then
                side = i
            end
            i = J88_int(i + 1)
        end
    end
    if ((((zone < 0) or (tid == 0)) or ((CavalryCharge_Mode == 2) and (BonusPlayerUnits == nil))) or ((CavalryCharge_Mode == 3) and (side < 0))) then
        Naval_RejectAbility(caster, 1093682006)
        member = nil
        do return end
    end
    if (GetUnitTypeId(caster) == 1749889330) then
        count = 7
    end
    i = 0
    while true do
        if (i >= count) then break end
        if (i >= 5) then
            tid = 1747989315
        end
        angle = J88_real(J88_real(J88_real(I2R(i) * 360.0) / I2R(count)) * bj_DEGTORAD)
        px = J88_real(x + J88_real(70.0 * Cos(angle)))
        py = J88_real(y + J88_real(70.0 * Sin(angle)))
        if (not Naval_InsideZone(zone, px, py)) then
            px = x
            py = y
        end
        plane = CreateUnit(Player(J88_int(pid + 9)), tid, px, py, J88_real(Atan2(J88_real(-py), J88_real(-px)) * bj_RADTODEG))
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
        i = J88_int(i + 1)
    end
    TimerStart(Carrier_Timer, 0.25, true, Carrier_Tick)
    plane = nil
    member = nil
end

function Carrier_OnCast()
    if ((GetSpellAbilityId() == 1093682006) and Carrier_IsCommander(GetTriggerUnit())) then
        Carrier_Begin(GetTriggerUnit(), GetSpellTargetX(), GetSpellTargetY())
    end
end

function Carrier_AIThink()
    local pid = NewAI_CurrentPid
    local commanders = nil
    local targets = nil
    local caster = nil
    local target = nil
    local x = 0.0
    local y = 0.0
    local owner = J88_int(-1)
    local found = false
    local cleared = false
    local active = false
    local zone = 4
    if (((((pid < 0) or (pid > 7)) or NewAI_Paused) or (not NewAI_Controlled[pid])) or (not Naval_IsBattleActive(pid))) then
        do return end
    end
    --  MacArthur's carrier casts his levelled reinforcements; Nagumo keeps Carrier Air Support.
    Mac70_AIThink(pid)
    commanders = CreateGroup()
    targets = CreateGroup()
    GroupEnumUnitsOfPlayer(commanders, Player(pid), nil)
    while true do
        caster = FirstOfGroup(commanders)
        if (caster == nil) then break end
        GroupRemoveUnit(commanders, caster)
        if (((((Carrier_IsCommander(caster) and (GetUnitTypeId(caster) ~= Mac70_CARRIER)) and IsUnitAliveBJ(caster)) and (GetUnitState(caster, UNIT_STATE_MANA) >= 60.0)) and (BlzGetUnitAbilityCooldownRemaining(caster, 1093682006) <= 0.0)) and ((GetUnitCurrentOrder(caster) == 0) or (GetUnitCurrentOrder(caster) == OrderId("stop")))) then
            found = false
            --  Snapshot per caster, after any previous caster's order. The target
            --  loop performs reads only, so its battle state cannot change.
            active = Naval_IsBattleActive(pid)
            zone = 4
            cleared = false
            if (CavalryCharge_Mode == 1) then
                zone = J88_div(PLAYER_CURRENT_SITE[pid], 2)
                cleared = Naval_OpponentCleared(pid)
            end
            GroupEnumUnitsInRect(targets, GetPlayableMapRect(), nil)
            while true do
                target = FirstOfGroup(targets)
                if ((target == nil) or found) then break end
                GroupRemoveUnit(targets, target)
                owner = GetPlayerId(GetOwningPlayer(target))
                if ((((IsUnitAliveBJ(target) and (not IsUnitHidden(target))) and (GetUnitAbilityLevel(target, 1097625443) == 0)) and (not (IsUnitType(target, UNIT_TYPE_STRUCTURE) and (GetUnitTypeId(target) ~= 1749437762)))) and (((CavalryCharge_Mode == 2) and (owner == 18)) or (((((CavalryCharge_Mode ~= 2) and (owner >= 9)) and (owner <= 16)) and (owner ~= J88_int(pid + 9))) and IsUnitEnemy(target, Player(J88_int(pid + 9)))))) then
                    x = GetUnitX(target)
                    y = GetUnitY(target)
                    if (active and (Naval_InsideZone(zone, x, y) or (((CavalryCharge_Mode == 1) and cleared) and Naval_InsideZone(4, x, y)))) then
                        found = true
                    end
                end
            end
            GroupClear(targets)
            if found then
                IssuePointOrder(caster, "cloudoffog", x, y)
            end
        end
    end
    DestroyGroup(commanders)
    DestroyGroup(targets)
    commanders = nil
    targets = nil
    caster = nil
    target = nil
end

function Carrier_Init()
    local cast = CreateTrigger()
    local damage = CreateTrigger()
    Carrier_Summons = CreateGroup()
    Carrier_Timer = CreateTimer()
    TriggerRegisterAnyUnitEventBJ(cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddAction(cast, Carrier_OnCast)
    TriggerRegisterAnyUnitEventBJ(damage, EVENT_PLAYER_UNIT_DAMAGING)
    TriggerAddAction(damage, Carrier_DamageGuard)
    cast = nil
    damage = nil
end
