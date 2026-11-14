function Zhukov_IsRoute(pid)
    do return ((pid >= 0) and (pid < 8) and (Zhukov_Chosen[pid] == true)) end
end

function Zhukov_Defer(kind, u, pid)
    --  Route work runs one step after the triggering event, after every other handler of it.
    Zhukov_Queue[#Zhukov_Queue + 1] = {kind = kind, unit = u, pid = pid}
    if (#Zhukov_Queue == 1) then
        TimerStart(Zhukov_Timer, 0.0, false, Zhukov_Process)
    end
end

function Zhukov_Process()
    local i = 1
    local item = nil
    while (i <= #Zhukov_Queue) do
        item = Zhukov_Queue[i]
        if (item.kind == "apply") then
            Zhukov_Apply(item.pid)
        elseif (Zhukov_IsRoute(item.pid) and (GetUnitTypeId(item.unit) ~= 0) and (GetPlayerId(GetOwningPlayer(item.unit)) == item.pid)) then
            Zhukov_Normalize(item.unit)
        end
        i = i + 1
    end
    for k = #Zhukov_Queue, 1, -1 do
        Zhukov_Queue[k] = nil
    end
    item = nil
end

function Zhukov_Begin(flag)
    --  Called when the Soviet headquarters finishes its upgrade into Georgy Zhukov.
    local pid = GetPlayerId(GetOwningPlayer(flag))
    if ((pid >= 0) and (pid < 8) and (not Zhukov_IsRoute(pid))) then
        Zhukov_Defer("apply", flag, pid)
    end
end

function Zhukov_InProgress(u)
    --  Construction or a paid upgrade is still running: convert when it completes.
    local key = GetHandleId(u)
    do return (LoadBoolean(ArmyEconomy_Ledger, key, 5) or ((GermanRoutes_Pending ~= nil) and (LoadInteger(GermanRoutes_Pending, key, 0) == 1))) end
end

function Zhukov_Refund(u)
    --  Refund the actual receipt once and remove the producer (no native cancel or sell path).
    local key = GetHandleId(u)
    local owner = GetOwningPlayer(u)
    local gold = 0
    local wood = 0
    if ((GetUnitTypeId(u) == 0) or LoadBoolean(ArmyEconomy_Ledger, key, 99)) then
        owner = nil
        do return end
    end
    gold = ArmyEconomy_Gold(u)
    wood = ArmyEconomy_Wood(u)
    SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
    RemoveUnit(u)
    SetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD) + gold))
    SetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER) + wood))
    FlushChildHashtable(ArmyEconomy_Ledger, key)
    SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
    if (GermanRoutes_Pending ~= nil) then
        FlushChildHashtable(GermanRoutes_Pending, key)
    end
    owner = nil
end

function Zhukov_ConvertBuilder(old)
    local pid = GetPlayerId(GetOwningPlayer(old))
    local owner = GetOwningPlayer(old)
    local selected = IsUnitSelected(old, owner)
    local replacement = nil
    if (NewAI_Busy[pid] == old) then
        NewAI_Busy[pid] = nil
        NewAI_BusySince[pid] = 0
    end
    if (NewAI_BestUnit == old) then
        NewAI_BestUnit = nil
        NewAI_BestType = 0
        NewAI_BestScore = J88_real(-1.0)
    end
    replacement = GermanRoutes_ReplaceUnit(old, ZK_BUILDER)
    if ((replacement ~= nil) and (replacement ~= old)) then
        if (NewAI_BuildTargetActor[pid] == old) then
            NewAI_BuildTargetActor[pid] = replacement
            NewAI_BuildSpaceState[pid] = 0
        end
        Nation62_Worker[pid] = replacement
        SaveBoolean(Nation50_Granted, pid, ZK_BUILDER, true)
        if selected then
            SelectUnitAddForPlayer(replacement, owner)
        end
    end
    owner = nil
    replacement = nil
end

function Zhukov_Normalize(u)
    --  One owned unit of a Zhukov player: refund banned producers, convert route producers.
    local t = GetUnitTypeId(u)
    local target = ZK_ROUTE[t]
    if (GetWidgetLife(u) <= 0.405) then
        do return end
    end
    if ZK_FORBIDDEN[t] then
        Zhukov_Refund(u)
    elseif (t == 1747993674) then
        Zhukov_ConvertBuilder(u)
    elseif ((target ~= nil) and (not Zhukov_InProgress(u))) then
        Zhukov_ReplaceBuilding(u, target)
    end
end

function Zhukov_ReplaceBuilding(old, target)
    --  Free the footprint first, then build the route producer on the same grid cell.
    --  (Creating it while the old building still stands would place it beside the old one.)
    local owner = GetOwningPlayer(old)
    local x = GetUnitX(old)
    local y = GetUnitY(old)
    local facing = GetUnitFacing(old)
    local life = J88_real(GetWidgetLife(old) / GetUnitState(old, UNIT_STATE_MAX_LIFE))
    local gold = ArmyEconomy_Gold(old)
    local wood = ArmyEconomy_Wood(old)
    local data = GetUnitUserData(old)
    local selected = IsUnitSelected(old, owner)
    local replacement = nil
    RemoveUnit(old)
    replacement = CreateUnit(owner, target, x, y, facing)
    if (replacement ~= nil) then
        SetUnitState(replacement, UNIT_STATE_LIFE, J88_real(GetUnitState(replacement, UNIT_STATE_MAX_LIFE) * life))
        SetUnitUserData(replacement, data)
        ArmyEconomy_Set(replacement, gold, wood)
        GermanRoutes_PreserveReferences(old, replacement)
        if selected then
            SelectUnitAddForPlayer(replacement, owner)
        end
    end
    FlushChildHashtable(ArmyEconomy_Ledger, GetHandleId(old))
    FlushChildHashtable(GermanRoutes_Pending, GetHandleId(old))
    owner = nil
    replacement = nil
end

function Zhukov_NormalizeCombat(u)
    --  A living T-34 or SU-85 in the current battle becomes its route vehicle.
    local target = ZK_COMBAT[GetUnitTypeId(u)]
    local key = GetHandleId(u)
    local bounty = 0
    local points = 0
    local has = false
    local replacement = nil
    if ((target == nil) or (GetWidgetLife(u) <= 0.405)) then
        do return end
    end
    has = HaveSavedInteger(Bounty_Data, key, 0)
    bounty = LoadInteger(Bounty_Data, key, 0)
    points = LoadInteger(Bounty_Data, key, 90)
    replacement = GermanRoutes_ReplaceUnit(u, target)
    if ((replacement ~= nil) and (replacement ~= u) and has) then
        SaveInteger(Bounty_Data, GetHandleId(replacement), 0, bounty)
        SaveInteger(Bounty_Data, GetHandleId(replacement), 90, points)
    end
    replacement = nil
end

function Zhukov_RemoveForbiddenTroops(pid)
    --  Combat copies of refunded partisan/cavalry producers leave without rewards.
    local list = Zhukov_Lineage[pid] or {}
    local u = nil
    for i = 1, #list do
        u = list[i]
        if ((GetUnitTypeId(u) ~= 0) and (GetWidgetLife(u) > 0.405)) then
            GroupRemoveUnit(udg_group_AllSpawnedUnits, u)
            if (BonusPlayerUnits ~= nil) then
                GroupRemoveUnit(BonusPlayerUnits, u)
            end
            GroupRemoveUnit(FINAL_TOUR_SPAWNS[0], u)
            GroupRemoveUnit(FINAL_TOUR_SPAWNS[1], u)
            RemoveUnit(u)
        end
    end
    Zhukov_Lineage[pid] = {}
    u = nil
end

function Zhukov_Apply(pid)
    local owner = Player(pid)
    local units = {}
    local u = nil
    if Zhukov_IsRoute(pid) then
        owner = nil
        do return end
    end
    Zhukov_Chosen[pid] = true
    for i = 1, #ZK_FORBIDDEN_LIST do
        SetPlayerTechMaxAllowed(owner, ZK_FORBIDDEN_LIST[i], 0)
    end
    for i = 1, #ZK_REPLACED_LIST do
        SetPlayerTechMaxAllowed(owner, ZK_REPLACED_LIST[i], 0)
    end
    SetPlayerTechMaxAllowed(owner, ZK_BUILDER, 1)
    --  Collect first: conversions remove units from the enumeration.
    GroupEnumUnitsOfPlayer(Zhukov_Search, owner, nil)
    while true do
        u = FirstOfGroup(Zhukov_Search)
        if (u == nil) then break end
        GroupRemoveUnit(Zhukov_Search, u)
        units[#units + 1] = u
    end
    for i = 1, #units do
        Zhukov_Normalize(units[i])
    end
    if (CM67_Flag[pid] ~= nil) then
        Nation50_EnsureBuilder(CM67_Flag[pid], ZK_BUILDER)
    end
    units = {}
    GroupEnumUnitsOfPlayer(Zhukov_Search, Player(J88_int(pid + 9)), nil)
    while true do
        u = FirstOfGroup(Zhukov_Search)
        if (u == nil) then break end
        GroupRemoveUnit(Zhukov_Search, u)
        units[#units + 1] = u
    end
    for i = 1, #units do
        Zhukov_NormalizeCombat(units[i])
    end
    Zhukov_RemoveForbiddenTroops(pid)
    DisplayTimedTextToPlayer(owner, 0.0, 0.0, 10.0, "|cffffcc00Georgy Zhukov|r takes command. T-34 tanks become T-34-85s and SU-85s become SU-100s. Partisan and cavalry formations have been refunded.")
    owner = nil
    u = nil
end

function Zhukov_OnProduction()
    local kind = GetTriggerEventId()
    local u = GetTriggerUnit()
    local pid = 0
    local t = 0
    if (kind == EVENT_PLAYER_UNIT_TRAIN_FINISH) then
        u = GetTrainedUnit()
    end
    if (u == nil) then
        do return end
    end
    pid = GetPlayerId(GetOwningPlayer(u))
    t = GetUnitTypeId(u)
    if (Zhukov_IsRoute(pid) and (ZK_FORBIDDEN[t] or (ZK_ROUTE[t] ~= nil) or (t == 1747993674))) then
        Zhukov_Defer("unit", u, pid)
    end
    u = nil
end

function Zhukov_CanonicalType(t)
    local c = ZK_CANONICAL[t]
    if (c ~= nil) then
        do return c end
    end
    do return t end
end

function Zhukov_SpawnInfantry(p, g, facing)
    --  The exact ten-man Soviet Infantry Squad recipe.
    DoSpawn2(p, g, 1747988788, 5, facing)
    DoSpawn2(p, g, 1747988789, 2, facing)
    DoSpawn2(p, g, 1747988790, 1, facing)
    DoSpawn2(p, g, 1747988791, 1, facing)
    DoSpawn2(p, g, 1747988785, 1, facing)
end

function Zhukov_Spawn(p, g, tid, facing)
    local pid = GetPlayerId(p)
    if (tid == ZK_T3485) then
        DoSpawn2(p, g, ZK_C_T3485, 1, facing)
    elseif (tid == ZK_T28) then
        DoSpawn2(p, g, ZK_C_T28, 1, facing)
        Zhukov_RegisterT28(SPAWN_UNITS_SORTED[J88_int(J88_int(J88_int(pid * 1000) + SPAWN_UNITS_COUNT[pid]) - 1)])
    elseif (tid == ZK_IS7) then
        DoSpawn2(p, g, ZK_C_IS7, 1, facing)
    elseif (tid == ZK_SU100) then
        DoSpawn2(p, g, ZK_C_SU100, 1, facing)
    elseif (tid == ZK_ISU152) then
        DoSpawn2(p, g, ZK_C_ISU152, 1, facing)
    elseif (tid == ZK_SUPPORT1) then
        Zhukov_SpawnInfantry(p, g, facing)
        DoSpawn2(p, g, ZK_C_T60, 1, facing)
    elseif (tid == ZK_SUPPORT3) then
        Zhukov_SpawnInfantry(p, g, facing)
        DoSpawn2(p, g, ZK_C_T60, 3, facing)
    end
end

function Zhukov_RecordBatch()
    --  Remember combat copies of partisan/cavalry producers (removed if Zhukov is chosen mid-battle).
    local list = nil
    if ((Bounty_Building == nil) or (not ZK_FORBIDDEN[GetUnitTypeId(Bounty_Building)])) then
        do return end
    end
    list = Zhukov_Lineage[Bounty_Pid]
    if (list == nil) then
        list = {}
        Zhukov_Lineage[Bounty_Pid] = list
    end
    for i = Bounty_Start, J88_int(SPAWN_UNITS_COUNT[Bounty_Pid] - 1) do
        list[#list + 1] = SPAWN_UNITS_SORTED[J88_int(J88_int(Bounty_Pid * 1000) + i)]
    end
    list = nil
end

function Zhukov_RegisterT28(u)
    if (GetUnitTypeId(u) ~= ZK_C_T28) then
        do return end
    end
    Zhukov_T28[#Zhukov_T28 + 1] = u
    if (#Zhukov_T28 == 1) then
        TimerStart(Zhukov_T28Timer, 1.0, true, Zhukov_T28Tick)
    end
end

function Zhukov_BattleActive()
    do return ((CavalryCharge_Mode ~= 0) and (COUNTDOWN_TICK_TIMER == nil) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd))) end
end

function Zhukov_IsMGTarget(tank, u)
    --  Living, visible, enemy ground infantry (organic, not a building, not an aircraft).
    do return ((u ~= nil) and (GetWidgetLife(u) > 0.405) and IsUnitEnemy(u, GetOwningPlayer(tank)) and (not IsUnitType(u, UNIT_TYPE_MECHANICAL)) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE)) and (not IsUnitType(u, UNIT_TYPE_FLYING)) and IsUnitVisible(u, GetOwningPlayer(tank)) and (not IsUnitHidden(u)) and (GetUnitAbilityLevel(u, 1097625443) == 0) and (not BlzIsUnitInvulnerable(u))) end
end

function Zhukov_T28Fire(tank)
    --  Up to 3 different targets, nearest first (ties by handle id); one 35-damage round each.
    local x = GetUnitX(tank)
    local y = GetUnitY(tank)
    local u = nil
    local dx = 0.0
    local dy = 0.0
    local d2 = 0.0
    local picked = {}
    local best = 0
    local cand = {}
    GroupEnumUnitsInRange(Zhukov_Search, x, y, Zhukov_MG_RANGE, nil)
    while true do
        u = FirstOfGroup(Zhukov_Search)
        if (u == nil) then break end
        GroupRemoveUnit(Zhukov_Search, u)
        if Zhukov_IsMGTarget(tank, u) then
            dx = J88_real(GetUnitX(u) - x)
            dy = J88_real(GetUnitY(u) - y)
            d2 = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if (d2 <= J88_real(Zhukov_MG_RANGE * Zhukov_MG_RANGE)) then
                cand[#cand + 1] = {unit = u, d2 = d2, id = GetHandleId(u)}
            end
        end
    end
    for n = 1, Zhukov_MG_TARGETS do
        best = 0
        for i = 1, #cand do
            if ((best == 0) or (cand[i].d2 < cand[best].d2) or ((cand[i].d2 == cand[best].d2) and (cand[i].id < cand[best].id))) then
                best = i
            end
        end
        if (best == 0) then break end
        picked[#picked + 1] = cand[best].unit
        table.remove(cand, best)
    end
    for i = 1, #picked do
        Missile81_Launch(tank, picked[i], "war3mapImported\\Bullet.mdx", 1000.0, 60.0, Zhukov_T28Hit)
    end
    u = nil
end

function Zhukov_T28Hit(tank, target)
    if ((GetUnitTypeId(tank) ~= 0) and Zhukov_BattleActive() and Zhukov_IsMGTarget(tank, target)) then
        --  Spell damage like the map's Phoenix Fire machine guns: spell immunity blocks it.
        UnitDamageTarget(tank, target, Zhukov_MG_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
    end
end

function Zhukov_T28Tick()
    local i = 1
    local u = nil
    while (i <= #Zhukov_T28) do
        u = Zhukov_T28[i]
        if ((GetUnitTypeId(u) == 0) or (GetWidgetLife(u) <= 0.405)) then
            table.remove(Zhukov_T28, i)
        else
            if (Zhukov_BattleActive() and (not IsUnitPaused(u)) and (not IsUnitHidden(u)) and (not IsUnitType(u, UNIT_TYPE_STUNNED))) then
                Zhukov_T28Fire(u)
            end
            i = i + 1
        end
    end
    if (#Zhukov_T28 == 0) then
        PauseTimer(Zhukov_T28Timer)
    end
    u = nil
end

function Zhukov_Stop()
    --  Round cleanup: T-28 registrations and recorded lineages end with the battle.
    for i = #Zhukov_T28, 1, -1 do
        Zhukov_T28[i] = nil
    end
    if (Zhukov_T28Timer ~= nil) then
        PauseTimer(Zhukov_T28Timer)
    end
    Zhukov_Lineage = {}
end

function Zhukov_Economy()
    --  Step price, cumulative normal-path receipt, kind and upgrade children.
    ArmyEconomy_Register(ZK_HQ, 0, 5000, 0, 5000, 1, 0)
    ArmyEconomy_Register(1747993156, 0, 0, 0, 0, 1, 1)
    SaveInteger(ArmyEconomy_Types, 1747993156, 100, ZK_HQ)
    ArmyEconomy_Register(ZK_BUILDER, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(ZK_CONSCRIPT, 150, 0, 150, 0, 3, 3)
    SaveInteger(ArmyEconomy_Types, ZK_CONSCRIPT, 100, (string.unpack(">I4", "h0DB")))
    SaveInteger(ArmyEconomy_Types, ZK_CONSCRIPT, 101, ZK_INFANTRY)
    SaveInteger(ArmyEconomy_Types, ZK_CONSCRIPT, 102, (string.unpack(">I4", "h01G")))
    ArmyEconomy_Register(ZK_INFANTRY, 50, 0, 200, 0, 3, 6)
    for i = 0, 4 do
        SaveInteger(ArmyEconomy_Types, ZK_INFANTRY, J88_int(100 + i), LoadInteger(ArmyEconomy_Types, 1747988787, J88_int(100 + i)))
    end
    SaveInteger(ArmyEconomy_Types, ZK_INFANTRY, 105, ZK_SUPPORT1)
    ArmyEconomy_Register(ZK_SUPPORT1, 0, 300, 200, 300, 3, 1)
    SaveInteger(ArmyEconomy_Types, ZK_SUPPORT1, 100, ZK_SUPPORT3)
    ArmyEconomy_Register(ZK_SUPPORT3, 0, 500, 200, 800, 3, 0)
    ArmyEconomy_Register(ZK_T3485, 0, 1500, 0, 1500, 3, 5)
    for i = 0, 2 do
        SaveInteger(ArmyEconomy_Types, ZK_T3485, J88_int(100 + i), LoadInteger(ArmyEconomy_Types, 1747989077, J88_int(100 + i)))
    end
    SaveInteger(ArmyEconomy_Types, ZK_T3485, 103, ZK_IS3)
    SaveInteger(ArmyEconomy_Types, ZK_T3485, 104, ZK_T28)
    ArmyEconomy_Register(ZK_T28, 0, 1500, 0, 3000, 3, 0)
    ArmyEconomy_Register(ZK_IS3, 0, 6500, 0, 8000, 3, 1)
    SaveInteger(ArmyEconomy_Types, ZK_IS3, 100, ZK_IS7)
    ArmyEconomy_Register(ZK_IS7, 0, 5500, 0, 13500, 3, 0)
    ArmyEconomy_Register(ZK_T26, 0, 1000, 0, 1000, 3, 3)
    SaveInteger(ArmyEconomy_Types, ZK_T26, 100, ZK_SU100)
    SaveInteger(ArmyEconomy_Types, ZK_T26, 101, (string.unpack(">I4", "h07U")))
    SaveInteger(ArmyEconomy_Types, ZK_T26, 102, (string.unpack(">I4", "h07V")))
    ArmyEconomy_Register(ZK_SU100, 0, 500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, ZK_SU100, 100, ZK_ISU152)
    ArmyEconomy_Register(ZK_ISU152, 0, 4000, 0, 5500, 3, 0)
    --  Aircraft: every step costs ceil(base * 1.3).
    ArmyEconomy_Register(ZK_YAK9, 0, 1950, 0, 1950, 3, 1)
    SaveInteger(ArmyEconomy_Types, ZK_YAK9, 100, ZK_IL2)
    ArmyEconomy_Register(ZK_IL2, 0, 1300, 0, 3250, 3, 0)
    ArmyEconomy_Register(ZK_TU2, 0, 1950, 0, 1950, 3, 1)
    SaveInteger(ArmyEconomy_Types, ZK_TU2, 100, ZK_IL4)
    ArmyEconomy_Register(ZK_IL4, 0, 1950, 0, 3900, 3, 0)
end

function Zhukov_AOVehicle(tid, label, icon, category, dps, ground, cooldown, range, armor, speed, low, high)
    AO_Register(tid, label, icon, "", category, dps, ground, ground)
    SaveInteger(AO_Data, tid, 7, 5)
    SaveInteger(AO_Data, tid, 8, 2)
    SaveReal(AO_Data, tid, 9, cooldown)
    SaveReal(AO_Data, tid, 10, range)
    SaveReal(AO_Data, tid, 11, armor)
    SaveReal(AO_Data, tid, 12, speed)
    SaveInteger(AO_Data, tid, 13, low)
    SaveInteger(AO_Data, tid, 14, high)
end

function Zhukov_AOProducer(producer, unit, count)
    SaveInteger(AO_Data, producer, 20, 1)
    SaveInteger(AO_Data, producer, 100, unit)
    SaveInteger(AO_Data, producer, 200, count)
end

function Zhukov_AOSupport(producer, tanks)
    for i = 0, 4 do
        SaveInteger(AO_Data, producer, J88_int(100 + i), LoadInteger(AO_Data, 1747988787, J88_int(100 + i)))
        SaveInteger(AO_Data, producer, J88_int(200 + i), LoadInteger(AO_Data, 1747988787, J88_int(200 + i)))
    end
    SaveInteger(AO_Data, producer, 20, 6)
    SaveInteger(AO_Data, producer, 105, ZK_C_T60)
    SaveInteger(AO_Data, producer, 205, tanks)
end

function Zhukov_Overview()
    --  Base DPS = average main-gun damage / interval. T-28 adds 105 machine-gun DPS spread over 3 targets.
    Zhukov_AOVehicle(ZK_C_T3485, "T-34-85", "ReplaceableTextures\\CommandButtons\\BTNZhukovT3485.blp", 2, 100.0, 135.0, 1.8, 650.0, 2.0, 165.0, 130, 230)
    Zhukov_AOVehicle(ZK_C_T60, "T-60", "ReplaceableTextures\\CommandButtons\\BTNZhukovT60.blp", 1, 27.0, 27.0, 2.0, 550.0, 0.0, 125.0, 36, 72)
    Zhukov_AOVehicle(ZK_C_IS7, "IS-7", "ReplaceableTextures\\CommandButtons\\BTNZhukovIS7.blp", 2, 166.67, 191.67, 3.0, 650.0, 3.0, 120.0, 450, 550)
    Zhukov_AOVehicle(ZK_C_SU100, "SU-100", "ReplaceableTextures\\CommandButtons\\BTNZhukovSU100.blp", 2, 125.0, 125.0, 2.0, 900.0, 1.0, 140.0, 200, 300)
    Zhukov_AOVehicle(ZK_C_ISU152, "ISU-152", "ReplaceableTextures\\CommandButtons\\BTNZhukovISU152.blp", 2, 180.0, 180.0, 5.0, 1000.0, 2.0, 110.0, 800, 1000)
    Zhukov_AOVehicle(ZK_C_T28, "T-28", "ReplaceableTextures\\CommandButtons\\BTNZhukovT28.blp", 2, 60.0, 165.0, 2.5, 600.0, 1.0, 130.0, 120, 180)
    Zhukov_AOProducer(ZK_T3485, ZK_C_T3485, 1)
    Zhukov_AOProducer(ZK_T28, ZK_C_T28, 1)
    Zhukov_AOProducer(ZK_IS7, ZK_C_IS7, 1)
    Zhukov_AOProducer(ZK_SU100, ZK_C_SU100, 1)
    Zhukov_AOProducer(ZK_ISU152, ZK_C_ISU152, 1)
    Zhukov_AOSupport(ZK_SUPPORT1, 1)
    Zhukov_AOSupport(ZK_SUPPORT3, 3)
end

function Zhukov_AICopy(uid, source)
    for key = 500, 567 do
        SaveReal(NewAI_Data, uid, key, LoadReal(NewAI_Data, source, key))
    end
end

function Zhukov_AIAdd(uid, count, hp, range, dps)
    --  Chaos main guns; catalog multipliers by armor class as in the existing tank entries.
    local ground = {1.075, 3.225, 2.15, 1.075, 0.5375, 1.075, 1.075, 0.5375}
    local air = {1.0, 3.0, 2.0, 1.0, 0.5, 1.0, 1.0, 0.5}
    US95_AIAccumulate(uid, 500, J88_real(I2R(count) * hp))
    US95_AIAccumulate(uid, 512, J88_real(I2R(count) * hp))
    SaveReal(NewAI_Data, uid, 501, RMaxBJ(LoadReal(NewAI_Data, uid, 501), range))
    US95_AIAccumulate(uid, 530, J88_real(I2R(count) * dps))
    US95_AIAccumulate(uid, 531, J88_real(I2R(count) * dps))
    for i = 0, 7 do
        US95_AIAccumulate(uid, J88_int(520 + i), J88_real(J88_real(I2R(count) * dps) * ground[J88_int(i + 1)]))
        US95_AIAccumulate(uid, J88_int(550 + i), J88_real(J88_real(I2R(count) * dps) * air[J88_int(i + 1)]))
    end
end

function Zhukov_RegisterAI()
    local soviet = 1747993156
    NewAI_CatalogUnit(ZK_HQ, 0, 5000, 1, 0, 0, 0, 0, 1, 400, "Georgy Zhukov")
    SaveInteger(NewAI_Data, soviet, 5, 1)
    SaveInteger(NewAI_Data, soviet, 100, ZK_HQ)
    NewAI_CatalogUnit(ZK_BUILDER, 0, 0, 2, 0, 8, 0, 0, 1, 100, "Soviet Bloodmaster")
    SaveInteger(NewAI_Data, ZK_BUILDER, 100, 1747990576)
    SaveInteger(NewAI_Data, ZK_BUILDER, 101, 1747990582)
    SaveInteger(NewAI_Data, ZK_BUILDER, 102, ZK_TU2)
    SaveInteger(NewAI_Data, ZK_BUILDER, 103, ZK_YAK9)
    SaveInteger(NewAI_Data, ZK_BUILDER, 104, ZK_T26)
    SaveInteger(NewAI_Data, ZK_BUILDER, 105, ZK_T3485)
    SaveInteger(NewAI_Data, ZK_BUILDER, 106, 1747988813)
    SaveInteger(NewAI_Data, ZK_BUILDER, 107, ZK_CONSCRIPT)
    NewAI_CatalogUnit(ZK_CONSCRIPT, 150, 0, 3, 1, 3, 0, 10, 1, 100, "SOV Conscript (10)")
    SaveInteger(NewAI_Data, ZK_CONSCRIPT, 100, (string.unpack(">I4", "h0DB")))
    SaveInteger(NewAI_Data, ZK_CONSCRIPT, 101, ZK_INFANTRY)
    SaveInteger(NewAI_Data, ZK_CONSCRIPT, 102, (string.unpack(">I4", "h01G")))
    Zhukov_AICopy(ZK_CONSCRIPT, 1747988784)
    NewAI_CatalogUnit(ZK_INFANTRY, 50, 0, 3, 1, 6, 0, 10, 1, 100, "SOV Infantry (10)")
    for i = 0, 4 do
        SaveInteger(NewAI_Data, ZK_INFANTRY, J88_int(100 + i), LoadInteger(NewAI_Data, 1747988787, J88_int(100 + i)))
    end
    SaveInteger(NewAI_Data, ZK_INFANTRY, 105, ZK_SUPPORT1)
    Zhukov_AICopy(ZK_INFANTRY, 1747988787)
    NewAI_CatalogUnit(ZK_SUPPORT1, 0, 300, 3, 1, 1, 0, 11, 1, 220, "SOV Infantry with T-60 (11)")
    SaveInteger(NewAI_Data, ZK_SUPPORT1, 100, ZK_SUPPORT3)
    Zhukov_AICopy(ZK_SUPPORT1, 1747988787)
    Zhukov_AIAdd(ZK_SUPPORT1, 1, 300.0, 550.0, 33.75)
    NewAI_CatalogUnit(ZK_SUPPORT3, 0, 500, 3, 1, 0, 0, 13, 1, 260, "SOV Infantry with 3 T-60 (13)")
    Zhukov_AICopy(ZK_SUPPORT3, 1747988787)
    Zhukov_AIAdd(ZK_SUPPORT3, 3, 300.0, 550.0, 33.75)
    NewAI_CatalogUnit(ZK_T3485, 0, 1500, 3, 2, 5, 0, 1, 1, 150, "SOV T-34-85 Tank(1)")
    for i = 0, 2 do
        SaveInteger(NewAI_Data, ZK_T3485, J88_int(100 + i), LoadInteger(NewAI_Data, 1747989077, J88_int(100 + i)))
    end
    SaveInteger(NewAI_Data, ZK_T3485, 103, ZK_IS3)
    SaveInteger(NewAI_Data, ZK_T3485, 104, ZK_T28)
    Zhukov_AIAdd(ZK_T3485, 1, 1400.0, 650.0, 135.0)
    NewAI_CatalogUnit(ZK_T28, 0, 1500, 3, 2, 0, 0, 1, 1, 300, "SOV T-28 Tank(1)")
    Zhukov_AIAdd(ZK_T28, 1, 2500.0, 600.0, 60.0)
    US95_AIAccumulate(ZK_T28, 520, 105.0)
    US95_AIAccumulate(ZK_T28, 521, 105.0)
    US95_AIAccumulate(ZK_T28, 531, 105.0)
    NewAI_CatalogUnit(ZK_IS3, 0, 6500, 3, 2, 1, 0, 1, 1, 325, "SOV IS-3 Tank(1)")
    SaveInteger(NewAI_Data, ZK_IS3, 100, ZK_IS7)
    Zhukov_AICopy(ZK_IS3, 1747990356)
    NewAI_CatalogUnit(ZK_IS7, 0, 5500, 3, 2, 0, 0, 1, 1, 1100, "SOV IS-7 Heavy Tank(1)")
    Zhukov_AIAdd(ZK_IS7, 1, 11000.0, 650.0, 191.67)
    NewAI_CatalogUnit(ZK_T26, 0, 1000, 3, 2, 3, 0, 1, 1, 100, "SOV T26 Tank(1)")
    SaveInteger(NewAI_Data, ZK_T26, 100, ZK_SU100)
    SaveInteger(NewAI_Data, ZK_T26, 101, (string.unpack(">I4", "h07U")))
    SaveInteger(NewAI_Data, ZK_T26, 102, (string.unpack(">I4", "h07V")))
    Zhukov_AICopy(ZK_T26, 1747989074)
    NewAI_CatalogUnit(ZK_SU100, 0, 500, 3, 3, 1, 0, 1, 1, 150, "SOV SU-100 Tank Destroyer(1)")
    SaveInteger(NewAI_Data, ZK_SU100, 100, ZK_ISU152)
    Zhukov_AIAdd(ZK_SU100, 1, 800.0, 900.0, 125.0)
    NewAI_CatalogUnit(ZK_ISU152, 0, 4000, 3, 3, 0, 0, 1, 1, 550, "SOV ISU-152 Assault Gun(1)")
    Zhukov_AIAdd(ZK_ISU152, 1, 4500.0, 1000.0, 180.0)
    NewAI_CatalogUnit(ZK_YAK9, 0, 1950, 3, 5, 1, 0, 4, 1, 100, "SOV Yak 9 (3)")
    SaveInteger(NewAI_Data, ZK_YAK9, 100, ZK_IL2)
    Zhukov_AICopy(ZK_YAK9, 1747989303)
    NewAI_CatalogUnit(ZK_IL2, 0, 1300, 3, 5, 0, 0, 5, 1, 100, "SOV IL-2 Sturmoviks (3)")
    Zhukov_AICopy(ZK_IL2, 1747993401)
    NewAI_CatalogUnit(ZK_TU2, 0, 1950, 3, 5, 1, 0, 1, 1, 100, "SOV Tu-2 Bomber(1)")
    SaveInteger(NewAI_Data, ZK_TU2, 100, ZK_IL4)
    Zhukov_AICopy(ZK_TU2, 1747989304)
    NewAI_CatalogUnit(ZK_IL4, 0, 1950, 3, 5, 0, 0, 1, 1, 100, "SOV IL-4 Bomber(1)")
    Zhukov_AICopy(ZK_IL4, 1747993409)
    for _, t in ipairs({ZK_C_T3485, ZK_C_T60, ZK_C_IS7, ZK_C_SU100, ZK_C_ISU152, ZK_C_T28}) do
        SaveReal(NewAI_Data, t, 540, 600.0)
        SaveReal(NewAI_Data, t, 541, 600.0)
    end
end

function Zhukov_AIScore(pid)
    --  Appoint Zhukov with a working builder and a Blood Point reserve for the new tanks.
    if ((NewAI_Workers[pid] > 0) and (udg_int_CurVsRound >= 3) and (GetPlayerState(Player(pid), PLAYER_STATE_RESOURCE_LUMBER) >= 8000)) then
        do return 1900.0 end
    end
    do return J88_real(-1.0) end
end

function Zhukov_Init()
    local production = CreateTrigger()
    Zhukov_Timer = CreateTimer()
    Zhukov_T28Timer = CreateTimer()
    Zhukov_Search = CreateGroup()
    TriggerRegisterAnyUnitEventBJ(production, EVENT_PLAYER_UNIT_CONSTRUCT_START)
    TriggerRegisterAnyUnitEventBJ(production, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    TriggerRegisterAnyUnitEventBJ(production, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerRegisterAnyUnitEventBJ(production, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    TriggerAddAction(production, Zhukov_OnProduction)
    production = nil
end
