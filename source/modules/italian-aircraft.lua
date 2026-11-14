function Air95_Turret(t)
    --  Bomber defensive fire: targets per second, range, damage per target.
    if (t == 1749112375) then
        do return 1, 450.0, 24.0 end
    elseif (t == 1749112377) then
        do return 2, 500.0, 20.0 end
    elseif (t == 1750417970) then
        do return 1, 450.0, 16.0 end
    elseif (t == 1750417975) then
        do return 2, 500.0, 20.0 end
    elseif (t == 1750417977) then
        do return 2, 500.0, 24.0 end
    end
    do return PL104_Turret(t) end
end

function Air95_BombDamage(t)
    --  Saturation Bombing per bomb: center and edge damage. Zero: no bombing run.
    if (t == 1749112377) then
        do return 200.0, 100.0 end
    elseif (t == 1750417977) then
        do return 230.0, 115.0 end
    end
    do return PL104_BombDamage(t) end
end

function Air93_InRun(u)
    do return Air93_RunByKey[GetHandleId(u)] ~= nil end
end

function Air93_CreateRun(u, k, bx, by, dx, dy)
    -- The run record is the only owner of its warning circles, falling bombs
    -- and timing. Bomber hashtable data holds cooldowns only.
    local run = {bomber=u, key=k, id=Air82_RunId, cx=bx, cy=by, points={}, marks={}, shells={},
        tick=0, released=0, landed=0, lost=false, done=false}
    local mark = nil
    run.center, run.edge = Air95_BombDamage(GetUnitTypeId(u))
    run.zone = Air82_Zone(J88_int(GetPlayerId(GetOwningPlayer(u)) - 9), bx, by)
    for i=1,6 do
        local along=J88_real(-300.0 + J88_real(120.0 * J88_real(i - 1)))
        local x=J88_real(bx+J88_real(along*dx))
        local y=J88_real(by+J88_real(along*dy))
        MoveLocation(Air82_Ground,x,y)
        run.points[i]={x=x, y=y, z=GetLocationZ(Air82_Ground)}
        mark=AddSpecialEffect("UI\\Feedback\\Target\\Target.mdl",x,y)
        BlzSetSpecialEffectColor(mark, 255, 100, 30)
        BlzSetSpecialEffectScale(mark, 1.2000000476837158)
        run.marks[i]=mark
    end
    Air93_Runs[#Air93_Runs+1]=run
    Air93_RunByKey[k]=run
    if #Air93_Runs==1 then
        ExecuteFunc("Air88_StartRunTimer")
    end
    do return run end
end

function Air93_Finish(run)
    local u = run.bomber
    local e = nil
    if run.done then return end
    -- Retire the record before any order or cleanup callback can re-enter.
    run.done=true
    for i=#Air93_Runs,1,-1 do
        if Air93_Runs[i]==run then table.remove(Air93_Runs,i); break end
    end
    if Air93_RunByKey[run.key]==run then Air93_RunByKey[run.key]=nil end
    for i=1,6 do
        e=run.marks[i]
        run.marks[i]=nil
        if e~=nil then DestroyEffect(e) end
        e=run.shells[i]
        run.shells[i]=nil
        if e~=nil then DestroyEffect(e) end
    end
    FlushChildHashtable(Air82_Hits, run.id)
    if #Air93_Runs==0 then PauseTimer(Air88_RunTimer) end
    if ((GetUnitTypeId(u) == 0) or (not IsUnitAliveBJ(u))) then
        FlushChildHashtable(Air82_Data, run.key)
    else
        BlzSetUnitWeaponBooleanField(u, UNIT_WEAPON_BF_ATTACKS_ENABLED, 0, true)
        if (not Air82_Cleaning) then
            Battle77_InitialOrder(u)
        end
    end
end

function Air93_Step(run)
    local u = run.bomber
    local i = 0
    local e = nil
    local p = nil
    -- Integer timer steps of 0.05 seconds: release after 1.5 seconds, one bomb
    -- every 0.35 seconds, each falling for 0.3 seconds.
    run.tick=run.tick+1
    if (not run.lost) and ((GetUnitTypeId(u) == 0) or (not IsUnitAliveBJ(u))) then
        -- Bombs already in the air still land; a lost bomber releases no more.
        run.lost=true
    end
    while (not run.lost) and run.released<6 and run.tick>=30+7*run.released do
        i=run.released+1
        p=run.points[i]
        e=AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl",p.x,p.y)
        BlzSetSpecialEffectZ(e, J88_real(p.z+400.0))
        run.shells[i]=e
        run.released=i
    end
    while run.landed<run.released and run.tick>=36+7*run.landed do
        i=run.landed+1
        -- Commit before damage callbacks so no bomb can land twice.
        run.landed=i
        p=run.points[i]
        e=run.shells[i]
        run.shells[i]=nil
        if e~=nil then
            -- The bomb model's own death animation is the ground explosion.
            BlzSetSpecialEffectZ(e, p.z)
            DestroyEffect(e)
        end
        e=run.marks[i]
        run.marks[i]=nil
        if e~=nil then DestroyEffect(e) end
        Air82_Impact(run, p.x, p.y)
        if run.done then return false end
    end
    i=run.landed+1
    while i<=run.released do
        e=run.shells[i]
        if e~=nil then
            BlzSetSpecialEffectZ(e, J88_real(run.points[i].z+J88_real(400.0*J88_real((36+7*(i-1)-run.tick)/6.0))))
        end
        i=i+1
    end
    do return run.landed==6 or (run.lost and run.landed==run.released) end
end

function Air88_BattleActive(pid)
    if ((pid < 0) or (pid > 7)) then
        do return false end
    end
    --  Callers already have a living combat source. No army enumeration.
    if (CavalryCharge_Mode == 1) then
        do return Combat45_Active() end
    elseif (CavalryCharge_Mode == 2) then
        do return ((IsTriggerEnabled(BONUS_ON_DEATH_TRG) and (BonusCurrentPlayer == Player(pid))) and (not BonusPlayerDefeated)) end
    elseif (CavalryCharge_Mode == 3) then
        do return ((IsTriggerEnabled(FINAL_TOUR_ON_DEATH_TRG) and (FINAL_TOUR_ROUND_WINNER == J88_int(-1))) and (COUNTDOWN_TICK_TIMER == nil)) end
    end
    do return false end
end

function Air82_Zone(pid, x, y)
    if (not Air88_BattleActive(pid)) then
        do return J88_int(-1) end
    end
    if (CavalryCharge_Mode == 1) then
        if Naval_InsideZone(J88_div(PLAYER_CURRENT_SITE[pid], 2), x, y) then
            do return J88_div(PLAYER_CURRENT_SITE[pid], 2) end
        elseif (((Advance_Clock > Air88_AdvanceEpoch) and WomanAdvance_Ready[pid]) and Naval_InsideZone(4, x, y)) then
            --  Reuse the shared army advance result; no duplicate army scan.
            do return 4 end
        end
    elseif Naval_InsideZone(4, x, y) then
        do return 4 end
    end
    do return J88_int(-1) end
end

function Air82_Valid(u, v)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    local owner = GetPlayerId(GetOwningPlayer(v))
    if (((v == nil) or (pid < 0)) or (pid > 7)) then
        do return false end
    end
    if (CavalryCharge_Mode == 2) then
        if (owner ~= 18) then
            do return false end
        end
    elseif ((((owner < 9) or (owner > 16)) or (owner == J88_int(pid + 9))) or (not IsUnitEnemy(v, GetOwningPlayer(u)))) then
        do return false end
    end
    if ((((((v == nil) or (not IsUnitAliveBJ(v))) or IsUnitHidden(v)) or (GetUnitAbilityLevel(v, 1097625443) > 0)) or BlzIsUnitInvulnerable(v)) or (not IsUnitVisible(v, GetOwningPlayer(u)))) then
        do return false end
    end
    if (IsUnitType(v, UNIT_TYPE_STRUCTURE) and (GetUnitTypeId(v) ~= 1749437762)) then
        do return false end
    end
    if (Air82_Zone(pid, GetUnitX(v), GetUnitY(v)) < 0) then
        do return false end
    end
    if (CavalryCharge_Mode == 2) then
        do return (owner == 18) end
    end
    do return ((((owner >= 9) and (owner <= 16)) and (owner ~= J88_int(pid + 9))) and IsUnitEnemy(v, GetOwningPlayer(u))) end
end

function Air82_IsBomber(t)
    do return LoadBoolean(Air82_Types, t, 0) end
end

function Air82_OnAttack()
    local u = GetAttacker()
    if (GetUnitTypeId(u) == 1749112373) then
        SaveUnitHandle(Air82_Data, GetHandleId(u), 40, GetTriggerUnit())
    end
    u = nil
end

function Air82_OnDamage()
    local u = GetEventDamageSource()
    local v = GetTriggerUnit()
    local t = GetUnitTypeId(u)
    local amount = GetEventDamage()
    if ((((((t == 1749112371) or (t == 1749112373)) or (t == 1750421555)) or (Air95_BombDamage(t) > 0.0)) and (not Air82_Internal)) and BlzGetEventIsAttack() and (amount > 0.0) and Air82_Valid(u, v)) then
        if (((t == 1749112371) and IsUnitType(v, UNIT_TYPE_FLYING)) and Air82_IsBomber(GetUnitTypeId(v))) then
            BlzSetEventDamage(J88_real(amount * 1.2000000476837158))
        elseif (((t == 1750421555) and IsUnitType(v, UNIT_TYPE_FLYING)) and Air82_IsBomber(GetUnitTypeId(v))) then
            --  P-38 Lightning: Bomber Interception.
            BlzSetEventDamage(J88_real(amount * 1.350000023841858))
        elseif ((t == 1749112373) and (v == LoadUnitHandle(Air82_Data, GetHandleId(u), 40))) then
            RemoveSavedHandle(Air82_Data, GetHandleId(u), 40)
            if (IsUnitType(v, UNIT_TYPE_MECHANICAL) and (not IsUnitType(v, UNIT_TYPE_FLYING))) then
                BlzSetEventDamage(J88_real(amount + 40.0))
            end
        elseif ((Air95_BombDamage(t) > 0.0) and Air93_InRun(u)) then
            BlzSetEventDamage(0.0)
        end
    end
    u = nil
    v = nil
end

function Air82_Evasion(v)
    local i = 0
    local a = nil
    local chance = 0.0
    local level = 0
    while true do
        a = BlzGetUnitAbilityByIndex(v, i)
        if (a == nil) then break end
        level = J88_int(GetUnitAbilityLevel(v, BlzGetAbilityId(a)) - 1)
        chance = RMaxBJ(chance, BlzGetAbilityRealLevelField(a, ABILITY_RLF_CHANCE_TO_EVADE_EEV1, level))
        chance = RMaxBJ(chance, BlzGetAbilityRealLevelField(a, ABILITY_RLF_CHANCE_TO_EVADE_OCR4, level))
        i = J88_int(i + 1)
    end
    a = nil
    do return chance end
end

function Air82_TurretHit(u, v, amount)
    if (GetRandomReal(0.0, 1.0) >= Air82_Evasion(v)) then
        Air82_Internal = true
        UnitDamageTarget(u, v, amount, false, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        Air82_Internal = false
        DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", v, "chest"))
    end
end

function Air82_Turrets(u, count, range, damage)
    local v = nil
    local first = nil
    local second = nil
    local d = 0.0
    local best = 100000000.0
    local next = 100000000.0
    GroupEnumUnitsInRange(Air82_Search, GetUnitX(u), GetUnitY(u), range, nil)
    while true do
        v = FirstOfGroup(Air82_Search)
        if (v == nil) then break end
        GroupRemoveUnit(Air82_Search, v)
        if (IsUnitType(v, UNIT_TYPE_FLYING) and Air82_Valid(u, v)) then
            d = J88_real(J88_real(J88_real(GetUnitX(v) - GetUnitX(u)) * J88_real(GetUnitX(v) - GetUnitX(u))) + J88_real(J88_real(GetUnitY(v) - GetUnitY(u)) * J88_real(GetUnitY(v) - GetUnitY(u))))
            if (d < best) then
                second = first
                next = best
                first = v
                best = d
            elseif (d < next) then
                second = v
                next = d
            end
        end
    end
    if (first ~= nil) then
        Air82_TurretHit(u, first, damage)
    end
    if ((count == 2) and (second ~= nil)) then
        Air82_TurretHit(u, second, damage)
    end
    v = nil
    first = nil
    second = nil
end

function Air82_Footprint(x, y, cx, cy, dx, dy)
    local along = J88_real(J88_real(J88_real(x - cx) * dx) + J88_real(J88_real(y - cy) * dy))
    local side = J88_real(J88_real(J88_real(x - cx) * dy) - J88_real(J88_real(y - cy) * dx))
    local near = 0.0
    if (((along < J88_real(-480.0)) or (along > 480.0)) or (RAbsBJ(side) > 180.0)) then
        do return false end
    end
    near = J88_real(J88_real(-300.0) + J88_real(120.0 * I2R(R2I(J88_real(J88_real(along + 360.0) / 120.0)))))
    near = RMaxBJ(J88_real(-300.0), RMinBJ(300.0, near))
    do return (J88_real(J88_real(J88_real(along - near) * J88_real(along - near)) + J88_real(side * side)) <= 32400.0) end
end

function Air82_StartRun(u)
    local k = GetHandleId(u)
    local n = 0
    local i = 0
    local j = 0
    local sampled = 0
    local enemies = 0
    local vehicles = 0
    local score = 0.0
    local best = J88_real(-999999.0)
    local cx = 0.0
    local cy = 0.0
    local bx = 0.0
    local by = 0.0
    local dx = 1.0
    local dy = 0.0
    local bdX = 1.0
    local bdY = 0.0
    local length = 0.0
    local v = nil
    local other = nil
    local nearby = Air88_Sample
    if Air93_InRun(u) then
        do return end
    end
    --  Bound work per scan; validate each sampled combatant only once.
    GroupEnumUnitsInRange(nearby, GetUnitX(u), GetUnitY(u), 1100.0, nil)
    while true do
        v = FirstOfGroup(nearby)
        if ((v == nil) or (sampled >= 256)) then break end
        GroupRemoveUnit(nearby, v)
        if (Air82_Valid(u, v) and (not IsUnitType(v, UNIT_TYPE_FLYING))) then
            Air82_X[sampled] = GetUnitX(v)
            Air82_Y[sampled] = GetUnitY(v)
            Air82_Mechanical[sampled] = IsUnitType(v, UNIT_TYPE_MECHANICAL)
            sampled = J88_int(sampled + 1)
        end
    end
    GroupEnumUnitsInRange(Air82_Search, GetUnitX(u), GetUnitY(u), 600.0, nil)
    while true do
        v = FirstOfGroup(Air82_Search)
        if ((v == nil) or (n >= 8)) then break end
        GroupRemoveUnit(Air82_Search, v)
        if (Air82_Valid(u, v) and (not IsUnitType(v, UNIT_TYPE_FLYING))) then
            Air82_Candidates[n] = v
            n = J88_int(n + 1)
        end
    end
    GroupClear(Air82_Search)
    while true do
        if (i >= n) then break end
        cx = GetUnitX(Air82_Candidates[i])
        cy = GetUnitY(Air82_Candidates[i])
        dx = J88_real(cx - GetUnitX(u))
        dy = J88_real(cy - GetUnitY(u))
        length = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
        if (length < 1.0) then
            dx = Cos(J88_real(GetUnitFacing(u) * bj_DEGTORAD))
            dy = Sin(J88_real(GetUnitFacing(u) * bj_DEGTORAD))
        else
            dx = J88_real(dx / length)
            dy = J88_real(dy / length)
        end
        enemies = 0
        vehicles = 0
        j = 0
        while true do
            if (j >= sampled) then break end
            if Air82_Footprint(Air82_X[j], Air82_Y[j], cx, cy, dx, dy) then
                enemies = J88_int(enemies + 1)
                if Air82_Mechanical[j] then
                    vehicles = J88_int(vehicles + 1)
                end
            end
            j = J88_int(j + 1)
        end
        if ((enemies >= 4) or (vehicles >= 2)) then
            score = I2R(J88_int(enemies + J88_int(vehicles * 2)))
            --  Spread allied bombers away from targets already under attack.
            j = 1
            while true do
                if (j > #Air93_Runs) then break end
                other = Air93_Runs[j]
                if ((other.bomber ~= u) and IsUnitAlly(other.bomber, GetOwningPlayer(u))) then
                    if (J88_real(J88_real(J88_real(cx - other.cx) * J88_real(cx - other.cx)) + J88_real(J88_real(cy - other.cy) * J88_real(cy - other.cy))) < 360000.0) then
                        score = J88_real(score - 1000.0)
                    end
                end
                j = J88_int(j + 1)
            end
            if (score > best) then
                best = score
                bx = cx
                by = cy
                bdX = dx
                bdY = dy
            end
        end
        Air82_Candidates[i] = nil
        i = J88_int(i + 1)
    end
    GroupClear(nearby)
    if (best > J88_real(-999999.0)) then
        Air82_RunId = J88_int(Air82_RunId + 1)
        SaveReal(Air82_Data, k, 11, J88_real(TimerGetElapsed(Air88_Clock) + 24.0))
        --  Register the run before orders can fire other unit triggers.
        Air93_CreateRun(u, k, bx, by, bdX, bdY)
        BlzSetUnitWeaponBooleanField(u, UNIT_WEAPON_BF_ATTACKS_ENABLED, 0, false)
        IssueImmediateOrder(u, "stop")
    end
    nearby = nil
    v = nil
    other = nil
end

function Air82_Impact(run, x, y)
    local u = run.bomber
    local victims = {}
    local v = nil
    local hits = 0
    local d = 0.0
    local amount = 0.0
    if (GetUnitTypeId(u) == 0) then
        --  A removed bomber has no owner or damage source left.
        do return end
    end
    --  Select victims first; damage callbacks may reuse the shared search group.
    GroupEnumUnitsInRange(Air82_Search, x, y, 180.0, nil)
    while true do
        v = FirstOfGroup(Air82_Search)
        if (v == nil) then break end
        GroupRemoveUnit(Air82_Search, v)
        if (((not IsUnitType(v, UNIT_TYPE_FLYING)) and Air82_Valid(u, v)) and Naval_InsideZone(run.zone, GetUnitX(v), GetUnitY(v))) then
            victims[#victims + 1] = v
        end
    end
    for i=1,#victims do
        v = victims[i]
        hits = LoadInteger(Air82_Hits, run.id, GetHandleId(v))
        if ((hits < 3) and IsUnitAliveBJ(v)) then
            d = J88_real(J88_real(J88_real(GetUnitX(v) - x) * J88_real(GetUnitX(v) - x)) + J88_real(J88_real(GetUnitY(v) - y) * J88_real(GetUnitY(v) - y)))
            amount = run.edge
            if (d <= 14400.0) then
                amount = run.center
            end
            SaveInteger(Air82_Hits, run.id, GetHandleId(v), J88_int(hits + 1))
            Air82_Internal = true
            UnitDamageTarget(u, v, amount, false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            Air82_Internal = false
            if run.done then break end
        end
    end
    v = nil
end

function Air88_RunTick()
    local i=1
    local run=nil
    local ok=false
    local result=nil
    while i<=#Air93_Runs do
        run=Air93_Runs[i]
        ok,result=pcall(Air93_Step,run)
        if not ok then
            Air82_Internal=false
            DG73_Log("Aircraft","BOMB_RUN_ABORT",tostring(result))
            Air93_Finish(run)
        elseif result then
            Air93_Finish(run)
        end
        -- A finished or cleaned-up run has left the list; do not skip its successor.
        if Air93_Runs[i]==run then i=i+1 end
    end
    if #Air93_Runs==0 then PauseTimer(Air88_RunTimer) end
end

function Air88_StartRunTimer()
    TimerStart(Air88_RunTimer, 0.05000000074505806, true, Air88_RunTick)
end

function Air82_Think()
    local u = GetEnumUnit()
    local k = GetHandleId(u)
    local t = GetUnitTypeId(u)
    local now = TimerGetElapsed(Air88_Clock)
    local count = 0
    local range = 0.0
    local damage = 0.0
    if ((GetUnitTypeId(u) == 0) or (not IsUnitAliveBJ(u))) then
        GroupRemoveUnit(Air88_Bombers, u)
        if (not Air93_InRun(u)) then
            FlushChildHashtable(Air82_Data, k)
        end
    elseif ((Air88_BattleActive(J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)) and (not IsUnitPaused(u))) and (not IsUnitHidden(u))) then
        --  Hidden reserves have not begun their first-activation cooldowns.
        if (not LoadBoolean(Air82_Data, k, 10)) then
            SaveBoolean(Air82_Data, k, 10, true)
            SaveReal(Air82_Data, k, 11, J88_real(now + 8.0))
            SaveReal(Air82_Data, k, 12, J88_real(now + 1.0))
        end
        if (now >= LoadReal(Air82_Data, k, 12)) then
            SaveReal(Air82_Data, k, 12, J88_real(now + 1.0))
            count, range, damage = Air95_Turret(t)
            if (count > 0) then
                Air82_Turrets(u, count, range, damage)
            end
            if (((Air95_BombDamage(t) > 0.0) and (not Air93_InRun(u))) and (now >= LoadReal(Air82_Data, k, 11))) then
                Air82_StartRun(u)
            end
        end
    end
    u = nil
end

function Air82_Tick()
    ForGroup(Air88_Bombers, Air82_Think)
    if (FirstOfGroup(Air88_Bombers) == nil) then
        PauseTimer(Air88_AbilityTimer)
        Air88_AbilityRunning = false
    end
end

function Air88_StartTimer()
    if ((Air88_BattleRunning and (not Air88_AbilityRunning)) and (FirstOfGroup(Air88_Bombers) ~= nil)) then
        Air88_AbilityRunning = true
        TimerStart(Air88_AbilityTimer, 1.0, true, Air82_Tick)
    end
end

function Air82_Register(u)
    local t = GetUnitTypeId(u)
    --  Fighters and attack aircraft have only native/event-driven abilities.
    if ((Air95_Turret(t) > 0) and (not IsUnitInGroup(u, Air88_Bombers))) then
        GroupAddUnit(Air88_Bombers, u)
        Air88_StartTimer()
    end
end

function Air88_PrepareBomber()
    local u = GetEnumUnit()
    local k = GetHandleId(u)
    local now = TimerGetElapsed(Air88_Clock)
    if ((((IsUnitAliveBJ(u) and (not IsUnitPaused(u))) and (not IsUnitHidden(u))) and Air88_BattleActive(J88_int(GetPlayerId(GetOwningPlayer(u)) - 9))) and (not LoadBoolean(Air82_Data, k, 10))) then
        SaveBoolean(Air82_Data, k, 10, true)
        SaveReal(Air82_Data, k, 11, J88_real(now + 8.0))
        SaveReal(Air82_Data, k, 12, J88_real(now + 1.0))
    end
    u = nil
end

function Air88_Begin()
    Air88_BattleRunning = true
    --  Do not consume a shared advance result left over from the prior round.
    Air88_AdvanceEpoch = Advance_Clock
    ForGroup(Air88_Bombers, Air88_PrepareBomber)
    Air88_StartTimer()
end

function Air88_OnDeath()
    local u = GetTriggerUnit()
    local t = GetUnitTypeId(u)
    local k = GetHandleId(u)
    if ((t == 1749112373) or (Air95_Turret(t) > 0)) then
        GroupRemoveUnit(Air88_Bombers, u)
        if (not Air93_InRun(u)) then
            FlushChildHashtable(Air82_Data, k)
        end
        --  Released bombs still land; the active run prevents further releases.
        if (FirstOfGroup(Air88_Bombers) == nil) then
            PauseTimer(Air88_AbilityTimer)
            Air88_AbilityRunning = false
        end
    end
    u = nil
end

function Air82_Enter()
    Air82_Register(GetTriggerUnit())
end

function Air93_ForgetBomber()
    FlushChildHashtable(Air82_Data, GetHandleId(GetEnumUnit()))
end

function Air82_Stop()
    if (Air82_Data == nil) then
        do return end
    end
    Air88_BattleRunning = false
    Air88_AbilityRunning = false
    PauseTimer(Air88_AbilityTimer)
    PauseTimer(Air88_RunTimer)
    Air82_Cleaning = true
    --  Each call removes the last run, so this always terminates.
    while #Air93_Runs > 0 do
        Air93_Finish(Air93_Runs[#Air93_Runs])
    end
    --  FlushParentHashtable destroys a Warcraft hashtable. Reset per-unit
    --  children instead so the tables remain usable in later rounds.
    ForGroup(Air88_Bombers, Air93_ForgetBomber)
    GroupClear(Air88_Bombers)
    Air82_Cleaning = false
end

function Air82_Init()
    local attacks = CreateTrigger()
    local damage = CreateTrigger()
    local entry = CreateTrigger()
    local deaths = CreateTrigger()
    local area = CreateRegion()
    local bounds = GetWorldBounds()
    local i = 0
    Air82_Data = InitHashtable()
    Air82_Hits = InitHashtable()
    Air82_Types = InitHashtable()
    Air88_Bombers = CreateGroup()
    Air88_Sample = CreateGroup()
    Air88_Clock = CreateTimer()
    Air88_AbilityTimer = CreateTimer()
    Air88_RunTimer = CreateTimer()
    TimerStart(Air88_Clock, 604800.0, false, nil)
    Air82_Search = CreateGroup()
    Air82_Ground = Location(0.0, 0.0)
    RegionAddRect(area, bounds)
    RemoveRect(bounds)
    TriggerRegisterEnterRegion(entry, area, nil)
    TriggerAddAction(entry, Air82_Enter)
    while true do
        if (i >= bj_MAX_PLAYER_SLOTS) then break end
        TriggerRegisterPlayerUnitEvent(attacks, Player(i), EVENT_PLAYER_UNIT_ATTACKED, nil)
        TriggerRegisterPlayerUnitEvent(damage, Player(i), EVENT_PLAYER_UNIT_DAMAGING, nil)
        TriggerRegisterPlayerUnitEvent(deaths, Player(i), EVENT_PLAYER_UNIT_DEATH, nil)
        i = J88_int(i + 1)
    end
    TriggerAddAction(attacks, Air82_OnAttack)
    TriggerAddAction(damage, Air82_OnDamage)
    TriggerAddAction(deaths, Air88_OnDeath)
    SaveBoolean(Air82_Types, 1747989305, 0, true)
SaveBoolean(Air82_Types, 1747989314, 0, true)
SaveBoolean(Air82_Types, 1747989315, 0, true)
SaveBoolean(Air82_Types, 1747989316, 0, true)
SaveBoolean(Air82_Types, 1747989560, 0, true)
SaveBoolean(Air82_Types, 1747989561, 0, true)
SaveBoolean(Air82_Types, 1747989827, 0, true)
SaveBoolean(Air82_Types, 1747989829, 0, true)
SaveBoolean(Air82_Types, 1747989831, 0, true)
SaveBoolean(Air82_Types, 1747989832, 0, true)
SaveBoolean(Air82_Types, 1747990343, 0, true)
SaveBoolean(Air82_Types, 1747992913, 0, true)
SaveBoolean(Air82_Types, 1747993176, 0, true)
SaveBoolean(Air82_Types, 1747993420, 0, true)
SaveBoolean(Air82_Types, 1747993421, 0, true)
SaveBoolean(Air82_Types, 1747994673, 0, true)
SaveBoolean(Air82_Types, 1747994674, 0, true)
SaveBoolean(Air82_Types, 1747994697, 0, true)
SaveBoolean(Air82_Types, 1747994951, 0, true)
SaveBoolean(Air82_Types, 1747994954, 0, true)
SaveBoolean(Air82_Types, 1747994955, 0, true)
SaveBoolean(Air82_Types, 1747994956, 0, true)
SaveBoolean(Air82_Types, 1747994957, 0, true)
SaveBoolean(Air82_Types, 1749112373, 0, true)
SaveBoolean(Air82_Types, 1749112375, 0, true)
SaveBoolean(Air82_Types, 1749112377, 0, true)
SaveBoolean(Air82_Types, 1750417970, 0, true)
SaveBoolean(Air82_Types, 1750417975, 0, true)
SaveBoolean(Air82_Types, 1750417977, 0, true)
SaveBoolean(Air82_Types, PL_C_WELLINGTON, 0, true)
SaveBoolean(Air82_Types, PL_C_SKARZYNSKI, 0, true)
    deaths = nil
    attacks = nil
    damage = nil
    entry = nil
    area = nil
    bounds = nil
end

function Elite82_Valid(u, v)
    local range = BlzGetUnitWeaponRealField(u, UNIT_WEAPON_RF_ATTACK_RANGE, 0)
    if (range <= 0.0) then
        range = 600.0
        if (GetUnitTypeId(u) == 1749632307) then
            range = 525.0
        end
    end
    if ((((v == nil) or (not IsUnitAliveBJ(u))) or IsUnitPaused(u)) or IsUnitHidden(u)) then
        do return false end
    end
    do return (((((Air82_Valid(u, v) and IsUnitInRange(u, v, range)) and (GetUnitAbilityLevel(u, 1112560453) == 0)) and (GetUnitAbilityLevel(u, 1114862702) == 0)) and (GetUnitAbilityLevel(u, 1112757326) == 0)) and (GetUnitAbilityLevel(u, 1113876851) == 0)) end
end

function Elite82_OnAttack()
    local u = GetAttacker()
    if (((GetUnitTypeId(u) == 1749632307) and Elite82_Valid(u, GetTriggerUnit())) and (BlzGetUnitAbilityCooldownRemaining(u, 1095057990) <= 0.0)) then
        IssueImmediateOrder(u, "berserk")
    end
    u = nil
end

function Elite82_Enter()
    if (GetUnitTypeId(GetTriggerUnit()) == 1749632307) then
        BlzUnitHideAbility(GetTriggerUnit(), 1095057990, true)
    end
end

function Elite82_Stop()
    Ita73_Clear()
end

function Ita73_OnDamaged()
    --  A Breda PG attack is the first round of a four-round burst; the rest follow as visible bullets.
    local u = GetEventDamageSource()
    local amount = 0.0
    if (GetUnitTypeId(u) ~= Ita73_PG_TYPE) then
        return
    end
    if (Ita73_ShotDamage > 0.0) then
        BlzSetEventDamage(Ita73_ShotDamage)
        return
    end
    if (not BlzGetEventIsAttack()) then
        return
    end
    amount = GetEventDamage()
    for n = 1, Ita73_BURST - 1 do
        Ita73_Shots[#Ita73_Shots + 1] = {source = u, target = BlzGetEventDamageTarget(), damage = amount,
                                         delay = J88_real(n * Ita73_SHOT_GAP), fx = nil, x = 0.0, y = 0.0}
    end
    TimerStart(Ita73_Timer, 0.03, true, Ita73_Tick)
end

function Ita73_Tick()
    local i = 1
    local s = nil
    local dx = 0.0
    local dy = 0.0
    local dist = 0.0
    local step = J88_real(Ita73_BULLET_SPEED * 0.03)
    while (i <= #Ita73_Shots) do
        s = Ita73_Shots[i]
        if (s.fx == nil) then
            s.delay = J88_real(s.delay - 0.03)
            if (s.delay <= 0.0) then
                if (IsUnitAliveBJ(s.source) and IsUnitAliveBJ(s.target) and (not IsUnitHidden(s.source))) then
                    s.x = GetUnitX(s.source)
                    s.y = GetUnitY(s.source)
                    s.fx = AddSpecialEffect("war3mapImported\\Bullet.mdx", s.x, s.y)
                    BlzSetSpecialEffectZ(s.fx, J88_real(BlzGetLocalUnitZ(s.source) + 60.0))
                    i = i + 1
                else
                    table.remove(Ita73_Shots, i)
                end
            else
                i = i + 1
            end
        else
            dx = J88_real(GetUnitX(s.target) - s.x)
            dy = J88_real(GetUnitY(s.target) - s.y)
            dist = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
            if ((dist <= step) or (not IsUnitAliveBJ(s.target))) then
                DestroyEffect(s.fx)
                if (IsUnitAliveBJ(s.target) and IsUnitAliveBJ(s.source)) then
                    Ita73_ShotDamage = s.damage
                    UnitDamageTarget(s.source, s.target, s.damage, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                    Ita73_ShotDamage = 0.0
                end
                table.remove(Ita73_Shots, i)
            else
                s.x = J88_real(s.x + J88_real(dx / dist * step))
                s.y = J88_real(s.y + J88_real(dy / dist * step))
                BlzSetSpecialEffectYaw(s.fx, Atan2(dy, dx))
                BlzSetSpecialEffectPosition(s.fx, s.x, s.y, J88_real(BlzGetLocalUnitZ(s.target) + 60.0))
                i = i + 1
            end
        end
    end
    if (#Ita73_Shots == 0) then
        PauseTimer(Ita73_Timer)
    end
    s = nil
end

function Ita73_Clear()
    --  Battle cleanup: no burst bullet survives into the next phase.
    for i = #Ita73_Shots, 1, -1 do
        if (Ita73_Shots[i].fx ~= nil) then
            DestroyEffect(Ita73_Shots[i].fx)
        end
        Ita73_Shots[i] = nil
    end
    if (Ita73_Timer ~= nil) then
        PauseTimer(Ita73_Timer)
    end
end

function Elite82_Init()
    local attacks = CreateTrigger()
    local damaged = nil
    local entry = CreateTrigger()
    local area = CreateRegion()
    local bounds = GetWorldBounds()
    local i = 0
    RegionAddRect(area, bounds)
    RemoveRect(bounds)
    TriggerRegisterEnterRegion(entry, area, nil)
    TriggerAddAction(entry, Elite82_Enter)
    while true do
        if (i >= bj_MAX_PLAYER_SLOTS) then break end
        TriggerRegisterPlayerUnitEvent(attacks, Player(i), EVENT_PLAYER_UNIT_ATTACKED, nil)
        i = J88_int(i + 1)
    end
    TriggerAddAction(attacks, Elite82_OnAttack)
    Ita73_Timer = CreateTimer()
    damaged = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(damaged, EVENT_PLAYER_UNIT_DAMAGED)
    TriggerAddAction(damaged, Ita73_OnDamaged)
    attacks = nil
    damaged = nil
    entry = nil
    area = nil
    bounds = nil
end
