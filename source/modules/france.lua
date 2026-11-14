function France_Alive(u)
    do return ((((u ~= nil) and (GetUnitTypeId(u) ~= 0)) and (GetWidgetLife(u) > 0.4050000011920929)) and (not IsUnitType(u, UNIT_TYPE_DEAD))) end
end

function France_Active(u)
    do return (((((France_Alive(u) and (not IsUnitHidden(u))) and (not IsUnitPaused(u))) and (CavalryCharge_Mode ~= 0)) and (COUNTDOWN_TICK_TIMER == nil)) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd))) end
end

function France_Target(source, target, organic, air)
    local pid = GetPlayerId(GetOwningPlayer(target))
    do return ((((((((France_Alive(target) and (((pid >= 9) and (pid <= 16)) or ((pid == 18) and (CavalryCharge_Mode == 2)))) and IsUnitEnemy(target, GetOwningPlayer(source))) and IsUnitVisible(target, GetOwningPlayer(source))) and (not IsUnitHidden(target))) and (not BlzIsUnitInvulnerable(target))) and (GetUnitAbilityLevel(target, 1097625443) == 0)) and (air or (not IsUnitType(target, UNIT_TYPE_FLYING)))) and ((not organic) or ((not IsUnitType(target, UNIT_TYPE_MECHANICAL)) and (not IsUnitType(target, UNIT_TYPE_STRUCTURE))))) end
end

function France_ProjectileTick()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(France_Data, key, 0)
    local target = LoadUnitHandle(France_Data, key, 1)
    local art = LoadEffectHandle(France_Data, key, 2)
    local x = LoadReal(France_Data, key, 3)
    local y = LoadReal(France_Data, key, 4)
    local dx = J88_real(GetUnitX(target) - x)
    local dy = J88_real(GetUnitY(target) - y)
    local distance = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
    local step = LoadReal(France_Data, key, 5)
    local age = J88_real(LoadReal(France_Data, key, 10) + 0.03999999910593033)
    local valid = (((LoadInteger(France_Data, key, 8) == France_Epoch) and France_Alive(source)) and France_Target(source, target, LoadBoolean(France_Data, key, 11), LoadBoolean(France_Data, key, 12)))
    if (((not valid) or (age >= 3.0)) or (distance <= step)) then
        if (valid and (distance <= step)) then
            if (LoadInteger(France_Data, key, 7) == 5) then
                DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl", target, "origin"))
            end
            UnitDamageTarget(source, target, LoadReal(France_Data, key, 6), false, true, ConvertAttackType(LoadInteger(France_Data, key, 7)), DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        end
        DestroyEffect(art)
        FlushChildHashtable(France_Data, key)
        PauseTimer(clock)
        DestroyTimer(clock)
    else
        x = J88_real(x + J88_real(J88_real(step * dx) / distance))
        y = J88_real(y + J88_real(J88_real(step * dy) / distance))
        SaveReal(France_Data, key, 3, x)
        SaveReal(France_Data, key, 4, y)
        SaveReal(France_Data, key, 10, age)
        BlzSetSpecialEffectX(art, x)
        BlzSetSpecialEffectY(art, y)
        BlzSetSpecialEffectZ(art, J88_real(BlzGetUnitZ(target) + 60.0))
        BlzSetSpecialEffectYaw(art, Atan2(dy, dx))
    end
    source = nil
    target = nil
    art = nil
    clock = nil
end

function France_Shot(source, target, damage, attackType, organic, air)
    local clock = CreateTimer()
    local key = GetHandleId(clock)
    local x = GetUnitX(source)
    local y = GetUnitY(source)
    local path = "war3mapImported\\Bullet.mdl"
    local speed = 100.0
    local art = nil
    if (attackType == 5) then
        path = "Abilities\\Weapons\\CannonTowerMissile\\CannonTowerMissile.mdl"
        speed = 52.0
    end
    art = AddSpecialEffect(path, x, y)
    BlzSetSpecialEffectZ(art, J88_real(BlzGetUnitZ(source) + 70.0))
    BlzSetSpecialEffectYaw(art, Atan2(J88_real(GetUnitY(target) - y), J88_real(GetUnitX(target) - x)))
    SaveUnitHandle(France_Data, key, 0, source)
    SaveUnitHandle(France_Data, key, 1, target)
    SaveEffectHandle(France_Data, key, 2, art)
    SaveReal(France_Data, key, 3, x)
    SaveReal(France_Data, key, 4, y)
    SaveReal(France_Data, key, 5, speed)
    SaveReal(France_Data, key, 6, damage)
    SaveInteger(France_Data, key, 7, attackType)
    SaveInteger(France_Data, key, 8, France_Epoch)
    SaveBoolean(France_Data, key, 11, organic)
    SaveBoolean(France_Data, key, 12, air)
    TimerStart(clock, 0.03999999910593033, true, France_ProjectileTick)
    clock = nil
    art = nil
end

function France_Fire(source, channel, maximum, radius, interval, low, high, attackType, organic, air)
    local key = GetHandleId(source)
    local sourceX = 0.0
    local sourceY = 0.0
    local dx = 0.0
    local dy = 0.0
    local n = 0
    local i = 0
    local u = nil
    local d = 0.0
    if (J88_real(France_Time + 9.999999747378752e-06) < LoadReal(France_Data, key, J88_int(100 + channel))) then
        do return end
    end
    --  Keep the nearest distinct eligible targets. Distance ties use a stable
    --  handle order, and every machine shares the same synchronized selection.
    sourceX = GetUnitX(source)
    sourceY = GetUnitY(source)
    GroupEnumUnitsInRange(France_Search, sourceX, sourceY, J88_real(radius + 128.0), nil)
    while true do
        u = FirstOfGroup(France_Search)
        if (u == nil) then break end
        GroupRemoveUnit(France_Search, u)
        if (France_Target(source, u, organic, air) and IsUnitInRange(source, u, radius)) then
            dx = J88_real(GetUnitX(u) - sourceX)
            dy = J88_real(GetUnitY(u) - sourceY)
            d = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            i = n
            if (i >= maximum) then
                i = J88_int(maximum - 1)
            end
            if (((n < maximum) or (d < LoadReal(France_Data, 0, i))) or ((d == LoadReal(France_Data, 0, i)) and (GetHandleId(u) < GetHandleId(France_Targets[i])))) then
                while true do
                    if (i <= 0) then break end
                    if ((d > LoadReal(France_Data, 0, J88_int(i - 1))) or ((d == LoadReal(France_Data, 0, J88_int(i - 1))) and (GetHandleId(u) >= GetHandleId(France_Targets[J88_int(i - 1)])))) then break end
                    France_Targets[i] = France_Targets[J88_int(i - 1)]
                    SaveReal(France_Data, 0, i, LoadReal(France_Data, 0, J88_int(i - 1)))
                    i = J88_int(i - 1)
                end
                France_Targets[i] = u
                SaveReal(France_Data, 0, i, d)
                if (n < maximum) then
                    n = J88_int(n + 1)
                end
            end
        end
    end
    if (n > 0) then
        --  No target does not consume this weapon's first shot or cooldown.
        SaveReal(France_Data, key, J88_int(100 + channel), J88_real(France_Time + interval))
        if ((GetUnitTypeId(source) == 1749437762) and (channel == 1)) then
            SetUnitAnimation(source, "attack")
            QueueUnitAnimation(source, "stand")
        end
    end
    i = 0
    while true do
        if (i >= n) then break end
        France_Shot(source, France_Targets[i], I2R(GetRandomInt(low, high)), attackType, organic, air)
        France_Targets[i] = nil
        i = J88_int(i + 1)
    end
    u = nil
end

function France_Taunt(source)
    --  Maginot Taunt: every 8 seconds, enemy units within 1000 are ordered to attack this fortress.
    local key = GetHandleId(source)
    local u = nil
    local taunted = false
    if (J88_real(France_Time + 9.999999747378752e-06) < LoadReal(France_Data, key, 103)) then
        do return end
    end
    GroupEnumUnitsInRange(France_Search, GetUnitX(source), GetUnitY(source), 1128.0, nil)
    while true do
        u = FirstOfGroup(France_Search)
        if (u == nil) then break end
        GroupRemoveUnit(France_Search, u)
        if ((France_Target(source, u, false, true) and IsUnitInRange(source, u, 1000.0)) and (GetUnitTypeId(u) ~= 1749437762)) then
            if IssueTargetOrder(u, "attack", source) then
                taunted = true
            end
        end
    end
    if taunted then
        --  No target does not start the cooldown.
        SaveReal(France_Data, key, 103, J88_real(France_Time + 8.0))
        DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl", source, "origin"))
    end
    u = nil
end

function France_Think()
    local u = GetEnumUnit()
    local t = GetUnitTypeId(u)
    if (not France_Alive(u)) then
        GroupRemoveUnit(France_Weapons, u)
        FlushChildHashtable(France_Data, GetHandleId(u))
    elseif France_Active(u) then
        if (t == 1749627201) then
            France_Fire(u, 2, 1, 500.0, 0.8999999761581421, 13, 20, 2, false, false)
        elseif (t == 1749437762) then
            France_Fire(u, 1, 4, 1800.0, 3.0, 55, 100, 5, false, false)
            France_Fire(u, 2, 4, 1800.0, 0.8999999761581421, 13, 20, 2, false, true)
            France_Taunt(u)
        elseif (t == 1749438513) then
            France_Fire(u, 2, 1, 500.0, 0.20000000298023224, 2, 2, 2, false, false)
        elseif (t == 1749435953) then
            FCM53_FireSecondary(u)
        end
    end
    u = nil
end

function France_FaceFortress(u, facing)
    local x = GetUnitX(u)
    local y = GetUnitY(u)
    SetUnitPathing(u, false)
    BlzSetUnitFacingEx(u, facing)
    SetUnitPosition(u, x, y)
    SetUnitX(u, x)
    SetUnitY(u, y)
end

function France_PlaceFortress(u, facing, index)
    local x = J88_real(192.0 + J88_real(I2R(IMinBJ(J88_div(index, 5), 2)) * 8.0))
    local y = J88_real(I2R(J88_int(ModuloInteger(index, 5) - 2)) * 64.0)
    if (GetUnitTypeId(u) ~= 1749437762) then
        do return end
    end
    if (facing < 90.0) then
        x = J88_real(-x)
    end
    SetUnitPathing(u, false)
    SetUnitX(u, x)
    SetUnitY(u, y)
    France_FaceFortress(u, facing)
end

function France_DuelScan()
    local u = GetEnumUnit()
    if France_Alive(u) then
        if (GetUnitTypeId(u) ~= 1749437762) then
            France_DuelOnlyForts = false
        else
            if (France_DuelCount[France_DuelSide] == 0) then
                if (GetUnitX(u) < 0.0) then
                    France_DuelFacing[France_DuelSide] = 0.0
                else
                    France_DuelFacing[France_DuelSide] = 180.0
                end
            end
            France_DuelCount[France_DuelSide] = J88_int(France_DuelCount[France_DuelSide] + 1)
        end
    end
    u = nil
end

function France_DuelMove()
    local u = GetEnumUnit()
    if (France_Alive(u) and (GetUnitTypeId(u) == 1749437762)) then
        France_PlaceFortress(u, France_DuelFacing[France_DuelSide], France_DuelCount[France_DuelSide])
        France_DuelCount[France_DuelSide] = J88_int(France_DuelCount[France_DuelSide] + 1)
    end
    u = nil
end

function France_CheckFortressDuel()
    if (((CavalryCharge_Mode ~= 3) or (COUNTDOWN_TICK_TIMER ~= nil)) or (France_DuelEpoch == France_Epoch)) then
        do return end
    end
    if (((not IsTriggerEnabled(FINAL_TOUR_ON_DEATH_TRG)) or (France_Route[China_FinalOwner[0]] ~= 1)) or (France_Route[China_FinalOwner[1]] ~= 1)) then
        do return end
    end
    --  Most checks end at the first living non-fortress; the original full
    --  scan below still determines facing/counts when the duel can trigger.
    if ((not HP88_OnlyFortresses(FINAL_TOUR_SPAWNS[0])) or (not HP88_OnlyFortresses(FINAL_TOUR_SPAWNS[1]))) then
        France_DuelOnlyForts = false
        do return end
    end
    France_DuelOnlyForts = true
    France_DuelSide = 0
    while true do
        if (France_DuelSide >= 2) then break end
        France_DuelCount[France_DuelSide] = 0
        ForGroup(FINAL_TOUR_SPAWNS[France_DuelSide], France_DuelScan)
        France_DuelSide = J88_int(France_DuelSide + 1)
    end
    if (((not France_DuelOnlyForts) or (France_DuelCount[0] == 0)) or (France_DuelCount[1] == 0)) then
        do return end
    end
    --  Each match resolves this transition once, after all other troops die.
    --  Keep opposing fronts even if another effect previously moved a fortress.
    France_DuelEpoch = France_Epoch
    France_DuelFacing[1] = J88_real(180.0 - France_DuelFacing[0])
    France_DuelSide = 0
    while true do
        if (France_DuelSide >= 2) then break end
        France_DuelCount[France_DuelSide] = 0
        ForGroup(FINAL_TOUR_SPAWNS[France_DuelSide], France_DuelMove)
        France_DuelSide = J88_int(France_DuelSide + 1)
    end
end

function France_Tick()
    France_Time = J88_real(France_Time + 0.05000000074505806)
    France_CheckFortressDuel()
    ForGroup(France_Weapons, France_Think)
    if (FirstOfGroup(France_Weapons) == nil) then
        PauseTimer(France_Clock)
    end
end

function France_Register(u)
    local t = GetUnitTypeId(u)
    if ((((t ~= 1749627201) and (t ~= 1749437762)) and (t ~= 1749438513)) and (t ~= 1749435953)) then
        do return end
    end
    if (not IsUnitInGroup(u, France_Weapons)) then
        FlushChildHashtable(France_Data, GetHandleId(u))
        GroupAddUnit(France_Weapons, u)
    end
    if (t == 1749437762) then
        SetUnitPathing(u, false)
    end
    TimerStart(France_Clock, 0.05000000074505806, true, France_Tick)
end

function France_RouteEvent()
    local u = GetTriggerUnit()
    local t = GetUnitTypeId(u)
    local pid = GetPlayerId(GetOwningPlayer(u))
    if (((pid >= 0) and (pid < 8)) and (GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_FINISH)) then
        if (t == 1747994960) then
            France_Route[pid] = 1
            SetPlayerTechMaxAllowed(Player(pid), 1749435463, 0)
            SetPlayerTechMaxAllowed(Player(pid), 1749437744, 2)
        elseif (t == 1749435463) then
            France_Route[pid] = 2
            SetPlayerTechMaxAllowed(Player(pid), 1747994960, 0)
            SetPlayerTechMaxAllowed(Player(pid), 1749435952, J88_int(-1))
        end
    end
    u = nil
end

function France_Init()
    local t = CreateTrigger()
    local pid = 0
    France_Data = InitHashtable()
    France_Weapons = CreateGroup()
    France_Search = CreateGroup()
    France_Clock = CreateTimer()
    TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerAddAction(t, France_RouteEvent)
    while true do
        if (pid >= 8) then break end
        SetPlayerTechMaxAllowed(Player(pid), 1749435463, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1747994960, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1749437744, 0)
        SetPlayerTechMaxAllowed(Player(pid), 1749435952, 0)
        pid = J88_int(pid + 1)
    end
    FCM53_Init()
    t = nil
end
