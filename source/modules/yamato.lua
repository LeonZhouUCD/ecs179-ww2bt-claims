function Missile81_Launch(source, target, model, speed, height, onHit)
    --  A visible projectile that homes on its target; onHit(source, target) runs on arrival.
    local fx = nil
    if ((source == nil) or (target == nil)) then
        do return end
    end
    fx = AddSpecialEffect(model, GetUnitX(source), GetUnitY(source))
    BlzSetSpecialEffectZ(fx, J88_real(GetUnitFlyHeight(source) + height))
    Missile81_List[#Missile81_List + 1] = {source = source, target = target, fx = fx, x = GetUnitX(source),
        y = GetUnitY(source), z = J88_real(GetUnitFlyHeight(source) + height), step = J88_real(speed * 0.03),
        onHit = onHit}
    if (#Missile81_List == 1) then
        TimerStart(Missile81_Timer, 0.03, true, Missile81_Tick)
    end
end

function Missile81_Tick()
    local i = 1
    local m = nil
    local dx = 0.0
    local dy = 0.0
    local dz = 0.0
    local dist = 0.0
    local tz = 0.0
    while (i <= #Missile81_List) do
        m = Missile81_List[i]
        if ((GetUnitTypeId(m.target) == 0) or (GetWidgetLife(m.target) <= 0.405)) then
            DestroyEffect(m.fx)
            table.remove(Missile81_List, i)
        else
            tz = J88_real(GetUnitFlyHeight(m.target) + 50.0)
            dx = J88_real(GetUnitX(m.target) - m.x)
            dy = J88_real(GetUnitY(m.target) - m.y)
            dz = J88_real(tz - m.z)
            dist = SquareRoot(J88_real(J88_real(J88_real(dx * dx) + J88_real(dy * dy)) + J88_real(dz * dz)))
            if (dist <= m.step) then
                DestroyEffect(m.fx)
                table.remove(Missile81_List, i)
                m.onHit(m.source, m.target)
            else
                m.x = J88_real(m.x + J88_real(J88_real(dx / dist) * m.step))
                m.y = J88_real(m.y + J88_real(J88_real(dy / dist) * m.step))
                m.z = J88_real(m.z + J88_real(J88_real(dz / dist) * m.step))
                BlzSetSpecialEffectYaw(m.fx, Atan2(dy, dx))
                BlzSetSpecialEffectPosition(m.fx, m.x, m.y, m.z)
                i = i + 1
            end
        end
    end
    if (#Missile81_List == 0) then
        PauseTimer(Missile81_Timer)
    end
    m = nil
end

function Missile81_Clear()
    --  Round cleanup: projectiles never carry into the next phase.
    for i = #Missile81_List, 1, -1 do
        DestroyEffect(Missile81_List[i].fx)
        Missile81_List[i] = nil
    end
    if (Missile81_Timer ~= nil) then
        PauseTimer(Missile81_Timer)
    end
end

function Yamato81_AAHit(ship, target)
    if (Yamato_Active and Yamato_IsAirTarget(ship, target)) then
        DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl", target, "origin"))
        --  Hero is named Air in this map and is used by its other AA guns.
        UnitDamageTarget(ship, target, 80.0, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    end
end

function Yamato81_IsShellTarget(ship, u)
    --  Main-battery centers and victims: living enemy ground units and structures.
    do return ((((((u ~= nil) and (GetWidgetLife(u) > 0.405)) and IsUnitEnemy(u, GetOwningPlayer(ship))) and (not IsUnitType(u, UNIT_TYPE_FLYING))) and (not IsUnitHidden(u))) and (GetUnitAbilityLevel(u, 1097625443) == 0)) and (not BlzIsUnitInvulnerable(u)) end
end

function Yamato81_FireBattery(ship)
    --  Up to 3 random enemy units become circle centers; circles of 300 never overlap.
    local x = GetUnitX(ship)
    local y = GetUnitY(ship)
    local u = nil
    local pool = {}
    local centers = {}
    local pick = 0
    local ok = false
    local dx = 0.0
    local dy = 0.0
    GroupEnumUnitsInRange(Yamato_Search, x, y, Yamato81_RANGE, nil)
    while true do
        u = FirstOfGroup(Yamato_Search)
        if (u == nil) then break end
        GroupRemoveUnit(Yamato_Search, u)
        if (Yamato81_IsShellTarget(ship, u) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE)) and IsUnitVisible(u, GetOwningPlayer(ship))) then
            pool[#pool + 1] = u
        end
    end
    while ((#pool > 0) and (#centers < 3)) do
        pick = GetRandomInt(1, #pool)
        u = pool[pick]
        table.remove(pool, pick)
        ok = true
        for i = 1, #centers do
            dx = J88_real(GetUnitX(u) - centers[i].x)
            dy = J88_real(GetUnitY(u) - centers[i].y)
            --  Strictly more than two radii apart: the circles do not even touch.
            if (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= J88_real(Yamato81_SEPARATION * Yamato81_SEPARATION)) then
                ok = false
            end
        end
        if ok then
            centers[#centers + 1] = {x = GetUnitX(u), y = GetUnitY(u)}
        end
    end
    if (#centers == 0) then
        u = nil
        do return false end
    end
    SetUnitAnimation(ship, "attack")
    QueueUnitAnimation(ship, "stand")
    for i = 1, #centers do
        Yamato81_Volleys[#Yamato81_Volleys + 1] = {ship = ship, x = centers[i].x, y = centers[i].y, salvo = 0,
            due = J88_int(Yamato_Clock + Yamato81_FIRST_IMPACT)}
    end
    u = nil
    do return true end
end

function Yamato81_Salvo(v)
    --  One three-shell salvo: 800 damage to every enemy ground unit inside the 300 circle.
    local u = nil
    local dx = 0.0
    local dy = 0.0
    local owner = GetOwningPlayer(v.ship)
    DestroyEffect(AddSpecialEffect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", v.x, v.y))
    for k = 0, 2 do
        DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", J88_real(v.x + J88_real(150.0 * Cos(J88_real(I2R(k) * 2.0943951)))), J88_real(v.y + J88_real(150.0 * Sin(J88_real(I2R(k) * 2.0943951))))))
    end
    if (GetUnitTypeId(v.ship) == 0) then
        owner = nil
        do return end
    end
    GroupEnumUnitsInRange(Yamato_Search, v.x, v.y, Yamato81_RADIUS, nil)
    while true do
        u = FirstOfGroup(Yamato_Search)
        if (u == nil) then break end
        GroupRemoveUnit(Yamato_Search, u)
        dx = J88_real(GetUnitX(u) - v.x)
        dy = J88_real(GetUnitY(u) - v.y)
        if (Yamato81_IsShellTarget(v.ship, u) and (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= J88_real(Yamato81_RADIUS * Yamato81_RADIUS))) then
            Yamato81_Exact = true
            UnitDamageTarget(v.ship, u, Yamato81_DAMAGE, false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            Yamato81_Exact = false
        end
    end
    owner = nil
    u = nil
end

function Yamato81_OnDamaged()
    --  Each main-battery salvo deals exactly 800 after armor and attack-type modifiers.
    if (Yamato81_Exact and (GetUnitTypeId(GetEventDamageSource()) == 1750675761)) then
        BlzSetEventDamage(Yamato81_DAMAGE)
    end
end

function Yamato81_TickVolleys()
    local i = 1
    local v = nil
    while (i <= #Yamato81_Volleys) do
        v = Yamato81_Volleys[i]
        if (Yamato_Clock >= v.due) then
            Yamato81_Salvo(v)
            v.salvo = v.salvo + 1
            v.due = J88_int(v.due + Yamato81_SALVO_GAP)
        end
        if (v.salvo >= 3) then
            table.remove(Yamato81_Volleys, i)
        else
            i = i + 1
        end
    end
    v = nil
end

function Yamato81_Init()
    local i = 0
    -- One Yamato shipyard per player.
    while i < bj_MAX_PLAYER_SLOTS do
        SetPlayerTechMaxAllowed(Player(i), 1750675762, 1)
        i = i + 1
    end
    local damaged = CreateTrigger()
    Missile81_Timer = CreateTimer()
    TriggerRegisterAnyUnitEventBJ(damaged, EVENT_PLAYER_UNIT_DAMAGED)
    TriggerAddAction(damaged, Yamato81_OnDamaged)
    damaged = nil
end
