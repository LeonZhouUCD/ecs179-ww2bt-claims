function Mao_BattleReward(pid, amount)
    local fraction = 0
    local bonus = 0
    if ((((pid < 0) or (pid >= 8)) or (not Mao_Active[pid])) or (amount <= 0)) then
        do return amount end
    end
    --  Carry hundredths across payouts; small rewards are not rounded away.
    --  Split the amount first so multiplying the fractional part stays bounded.
    fraction = J88_int(J88_int(ModuloInteger(amount, 100) * 8) + Mao_RewardRemainder[pid])
    bonus = J88_int(J88_int(J88_div(amount, 100) * 8) + J88_div(fraction, 100))
    Mao_RewardRemainder[pid] = ModuloInteger(fraction, 100)
    do return J88_int(amount + bonus) end
end

function Mao_RecruitChance(pid)
    if (((pid >= 0) and (pid < 8)) and Mao_Active[pid]) then
        do return 10 end
    end
    do return 6 end
end

function China_IsNativeCommunist(t)
    do return (((((((((((((((((((((((((((((t == 1747989585) or (t == 1747989587)) or (t == 1747989590)) or (t == 1747993687)) or (t == 1747993926)) or (t == 1747993928)) or (t == 1747993929)) or (t == 1747993931)) or (t == 1747993932)) or (t == 1747993937)) or (t == 1747993939)) or (t == 1747995225)) or (t == 1747995466)) or (t == 1749242933)) or (t == CT_C_T3485)) or (t == CT_C_IS2)) or (t == CT_C_T59)) or (t == 1749236022)) or (t == 1749498165)) or (t == 1749241137)) or (t == 1749242963)) or (t == 1749108529)) or (t == 1749828401)) or (t == 1749824561)) or (t == 1749238082)) or (t == 1750487885)) or (t == 1750487886)) or (t == 1750483284)) or (t == 1750486351)) end
end

function China_IsCommunist(u)
    local pid = 0
    if ((u == nil) or (China_Data == nil)) then
        do return false end
    end
    --  The legacy artillery and naval systems attribute indirect kills through
    --  their source handle. Keep that attribution for Communist recruitment.
    pid = Naval_KillerPlayer(u)
    if ((pid < 0) or (pid >= 8)) then
        do return false end
    end
    do return ((China_IsNativeCommunist(GetUnitTypeId(u)) or LoadBoolean(China_Data, GetHandleId(u), 1)) or (China_Route[pid] == 2)) end
end

function Mao_DiscountType(t)
    --  Discount variants are retained only as disabled legacy editor records.
    do return 0 end
end

function Mao_CanonicalType(t)
    if (ZK_CANONICAL[t] ~= nil) then
        do return ZK_CANONICAL[t] end
    end
    if (t == 1749893424) then
        do return 1747995457 end
    end
    if (t == 1749893425) then
        do return 1747995458 end
    end
    if (t == 1749893426) then
        do return 1747995459 end
    end
    if (t == 1749893427) then
        do return 1747995460 end
    end
    if (t == 1749893428) then
        do return 1747995461 end
    end
    if (t == 1749893429) then
        do return 1747995462 end
    end
    if (t == 1749893430) then
        do return 1747995463 end
    end
    if (t == 1749893431) then
        do return 1747995464 end
    end
    if (t == 1749893432) then
        do return 1747995465 end
    end
    if (t == 1750151216) then
        do return 1747990325 end
    end
    if (t == 1750151217) then
        do return 1747990342 end
    end
    if (t == 1750151218) then
        do return 1747990100 end
    end
    if (t == 1750151219) then
        do return 1747989571 end
    end
    if (t == 1750151220) then
        do return 1747989572 end
    end
    if (t == 1750151221) then
        do return 1747989338 end
    end
    if (t == 1750151222) then
        do return 1747989554 end
    end
    if (t == 1750151223) then
        do return 1747990329 end
    end
    if (t == 1750151224) then
        do return 1747990337 end
    end
    if (t == 1750151225) then
        do return 1747990351 end
    end
    if (t == 1750151472) then
        do return 1747993679 end
    end
    if (t == 1750151473) then
        do return 1747993680 end
    end
    if (t == 1750151474) then
        do return 1747990321 end
    end
    if (t == 1750151475) then
        do return 1747990323 end
    end
    if (t == 1750151476) then
        do return 1747990105 end
    end
    if (t == 1750151477) then
        do return 1747990091 end
    end
    if (t == 1750151478) then
        do return 1747990092 end
    end
    if (t == 1750151479) then
        do return 1747989582 end
    end
    if (t == 1750151480) then
        do return 1747993670 end
    end
    if (t == 1750151481) then
        do return 1747989570 end
    end
    if (t == 1750151728) then
        do return 1747989569 end
    end
    if (t == 1750151729) then
        do return 1747989555 end
    end
    if (t == 1750151730) then
        do return 1747990338 end
    end
    if (t == 1750151731) then
        do return 1747993681 end
    end
    if (t == 1750151732) then
        do return 1747990322 end
    end
    if (t == 1750151733) then
        do return 1747990320 end
    end
    if (t == 1750151734) then
        do return 1750348354 end
    end
    if (t == 1750151735) then
        do return 1747990324 end
    end
    do return t end
end

function Mao_SetAvailability(p, active)
    local normal = J88_int(-1)
    local discounted = 0
    SetPlayerTechMaxAllowed(p, 1747995457, normal)
    SetPlayerTechMaxAllowed(p, 1749893424, discounted)
    SetPlayerTechMaxAllowed(p, 1747995458, normal)
    SetPlayerTechMaxAllowed(p, 1749893425, discounted)
    SetPlayerTechMaxAllowed(p, 1747995459, normal)
    SetPlayerTechMaxAllowed(p, 1749893426, discounted)
    SetPlayerTechMaxAllowed(p, 1747995460, normal)
    SetPlayerTechMaxAllowed(p, 1749893427, discounted)
    SetPlayerTechMaxAllowed(p, 1747995461, normal)
    SetPlayerTechMaxAllowed(p, 1749893428, discounted)
    SetPlayerTechMaxAllowed(p, 1747995462, normal)
    SetPlayerTechMaxAllowed(p, 1749893429, discounted)
    SetPlayerTechMaxAllowed(p, 1747995463, normal)
    SetPlayerTechMaxAllowed(p, 1749893430, discounted)
    SetPlayerTechMaxAllowed(p, 1747995464, normal)
    SetPlayerTechMaxAllowed(p, 1749893431, discounted)
    SetPlayerTechMaxAllowed(p, 1747995465, normal)
    SetPlayerTechMaxAllowed(p, 1749893432, discounted)
end

function Mao_ApplyInfantry(u)
    local pid = 0
    if (u == nil) then
        do return end
    end
    pid = Naval_KillerPlayer(u)
    if (((((((pid >= 0) and (pid < 8)) and Mao_Active[pid]) and China_IsNativeCommunist(GetUnitTypeId(u))) and (not IsUnitType(u, UNIT_TYPE_MECHANICAL))) and (not IsUnitType(u, UNIT_TYPE_FLYING))) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE))) then
        --  Native passives stack normally with other bonuses, but never duplicate themselves.
        UnitAddAbility(u, 1093684549)
        UnitAddAbility(u, 1093684563)
        UnitAddAbility(u, 1093684548)
        UnitMakeAbilityPermanent(u, true, 1093684549)
        UnitMakeAbilityPermanent(u, true, 1093684563)
        UnitMakeAbilityPermanent(u, true, 1093684548)
    end
end

function Lin_Apply(u)
    local pid = Naval_KillerPlayer(u)
    local enabled = false
    if ((pid >= 0) and (pid < 8)) then
        enabled = ((Lin_Active[pid] and (not IsUnitType(u, UNIT_TYPE_STRUCTURE))) and (BlzGetUnitWeaponIntegerField(u, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0) == 3))
    end
    if enabled then
        UnitRemoveAbility(u, 1095525234)
        UnitAddAbility(u, 1095525485)
        UnitAddAbility(u, 1095524723)
        UnitMakeAbilityPermanent(u, true, 1095525485)
        UnitMakeAbilityPermanent(u, true, 1095524723)
    else
        UnitRemoveAbility(u, 1095525485)
        UnitRemoveAbility(u, 1095525234)
        UnitRemoveAbility(u, 1095524723)
    end
end

function Lin_RefreshPlayer(pid)
    local g = CreateGroup()
    local u = nil
    GroupEnumUnitsOfPlayer(g, Player(J88_int(pid + 9)), nil)
    while true do
        u = FirstOfGroup(g)
        if (u == nil) then break end
        GroupRemoveUnit(g, u)
        Lin_Apply(u)
    end
    DestroyGroup(g)
    u = nil
    g = nil
end

function Lin_OnOwner()
    Lin_Apply(GetTriggerUnit())
end

function China_Register(u)
    if ((u == nil) or (China_Data == nil)) then
        do return end
    end
    Mao_ApplyInfantry(u)
    Lin_Apply(u)
    Agent_Register(u)
    if ((GetUnitTypeId(u) == 1750486351) and IsUnitInGroup(u, Volunteer_Spent)) then
        UnitRemoveAbility(u, 1096185455)
    end
    if ((GetUnitTypeId(u) == 1747995225) or (GetUnitTypeId(u) == 1750487885)) then
        GroupAddUnit(China_StateUnits, u)
        if (LoadBoolean(China_Data, GetHandleId(u), 0) or ((GetUnitTypeId(u) == 1750487885) and IsUnitInGroup(u, Volunteer_Spent))) then
            UnitRemoveAbility(u, 1094936647)
        else
            UnitAddAbility(u, 1094936647)
            GroupAddUnit(China_Grenadiers, u)
        end
    end
end

function China_IsEnemyCombatant(u, owner)
    local pid = 0
    if ((u == nil) or (GetWidgetLife(u) <= 0.4050000011920929)) then
        do return false end
    end
    pid = GetPlayerId(GetOwningPlayer(u))
    do return (((((((pid >= 9) and (pid <= 16)) or ((pid == 18) and (CavalryCharge_Mode == 2))) and IsUnitEnemy(u, owner)) and (GetUnitAbilityLevel(u, 1097625443) == 0)) and (GetUnitAbilityLevel(u, 1098282348) == 0)) and ((not IsUnitType(u, UNIT_TYPE_STRUCTURE)) or (GetUnitTypeId(u) == 1749437762))) end
end

function China_TrackCombat(u)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
    local i = 0
    if ((((pid < 0) or (pid >= 8)) or (GetUnitAbilityLevel(u, 1097625443) > 0)) or IsUnitType(u, UNIT_TYPE_STRUCTURE)) then
        do return end
    end
    UnitAddAbility(u, 1093677105)
    SaveBoolean(China_Data, GetHandleId(u), 1, true)
    GroupAddUnit(China_StateUnits, u)
    CavalryCharge_Register(u)
    Yamato_Register(u)
    China_Register(u)
    if ((gg_trg_PlayerUnitDies ~= nil) and IsTriggerEnabled(gg_trg_PlayerUnitDies)) then
        GroupAddUnit(udg_group_AllSpawnedUnits, u)
    end
    if (((BONUS_ON_DEATH_TRG ~= nil) and IsTriggerEnabled(BONUS_ON_DEATH_TRG)) and (BonusCurrentPlayer == Player(pid))) then
        GroupAddUnit(BonusPlayerUnits, u)
        --  The engine may emit a split-on-death summon after the parent's death
        --  listener found the group empty. Restore the live-army condition.
        BonusPlayerDefeated = false
    end
    if ((FINAL_TOUR_ON_DEATH_TRG ~= nil) and IsTriggerEnabled(FINAL_TOUR_ON_DEATH_TRG)) then
        while true do
            if (i >= 2) then break end
            if (China_FinalOwner[i] == pid) then
                GroupAddUnit(FINAL_TOUR_SPAWNS[i], u)
            end
            i = J88_int(i + 1)
        end
        GroupAddUnit(udg_group_AllSpawnedUnits, u)
    end
    IssuePointOrder(u, "attack", 0.0, 0.0)
end

function China_ClearConvertedCorpses()
    local corpse = nil
    China_CorpseCleanupPending = false
    while true do
        corpse = FirstOfGroup(China_ConvertedCorpses)
        if (corpse == nil) then break end
        GroupRemoveUnit(China_ConvertedCorpses, corpse)
        GroupRemoveUnit(China_Grenadiers, corpse)
        GroupRemoveUnit(China_StateUnits, corpse)
        GroupRemoveUnit(China_DeathCleanup, corpse)
        FlushChildHashtable(China_Data, GetHandleId(corpse))
        FlushChildHashtable(Volunteer_Data, GetHandleId(corpse))
        RemoveUnit(corpse)
    end
    corpse = nil
end

function China_ClearRecruitEffect()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    DestroyEffect(LoadEffectHandle(China_Data, key, 10))
    FlushChildHashtable(China_Data, key)
    DestroyTimer(clock)
    clock = nil
end

function China_ShowRecruitEffect(recruited)
    local clock = CreateTimer()
    local flash = AddSpecialEffectTarget("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", recruited, "origin")
    BlzSetSpecialEffectScale(flash, 1.350000023841858)
    SaveEffectHandle(China_Data, GetHandleId(clock), 10, flash)
    TimerStart(clock, 1.5, false, China_ClearRecruitEffect)
    flash = nil
    clock = nil
end

function China_TryRecruit(dead, killer)
    local owner = nil
    local oldKey = 0
    local newKey = 0
    local deadPid = 0
    local recruited = nil
    local grenadeSpent = false
    if ((dead == nil) or (China_Data == nil)) then
        do return end
    end
    GroupAddUnit(China_DeathCleanup, dead)
    if ((((killer == nil) or (CavalryCharge_Mode == 0)) or ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd)) or (not China_IsCommunist(killer))) then
        do return end
    end
    deadPid = GetPlayerId(GetOwningPlayer(dead))
    owner = Player(J88_int(Naval_KillerPlayer(killer) + 9))
    if (((((not ((deadPid >= 9) and (deadPid <= 16))) or (not IsUnitEnemy(dead, owner))) or (GetUnitAbilityLevel(dead, 1097625443) > 0)) or (GetUnitAbilityLevel(dead, 1098282348) > 0)) or IsUnitType(dead, UNIT_TYPE_STRUCTURE)) then
        owner = nil
        do return end
    end
    oldKey = GetHandleId(dead)
    if (IsUnitInGroup(dead, China_EverRecruited) or LoadBoolean(China_Data, oldKey, 2)) then
        owner = nil
        do return end
    end
    --  Each death receives exactly one faction-chance roll, even if multiple handlers run.
    SaveBoolean(China_Data, oldKey, 2, true)
    if (GetRandomInt(1, 100) > Mao_RecruitChance(Naval_KillerPlayer(killer))) then
        owner = nil
        do return end
    end
    grenadeSpent = LoadBoolean(China_Data, oldKey, 0)
    recruited = CreateUnit(owner, GetUnitTypeId(dead), GetUnitX(dead), GetUnitY(dead), GetUnitFacing(dead))
    if (recruited == nil) then
        owner = nil
        do return end
    end
    newKey = GetHandleId(recruited)
    GroupAddUnit(China_EverRecruited, recruited)
    if IsUnitInGroup(dead, Volunteer_Spent) then
        GroupAddUnit(Volunteer_Spent, recruited)
    end
    if IsUnitInGroup(dead, Agent_Spent) then
        GroupAddUnit(Agent_Spent, recruited)
    end
    SaveInteger(Bounty_Data, newKey, 90, Agent_Value(dead))
    SaveInteger(Bounty_Data, newKey, 0, 0)
    SaveBoolean(China_Data, newKey, 0, grenadeSpent)
    if IsUnitType(dead, UNIT_TYPE_HERO) then
        SetHeroLevel(recruited, GetHeroLevel(dead), false)
    end
    --  Set hero level before life: leveling may change the new hero's maximum.
    BlzSetUnitMaxHP(recruited, BlzGetUnitMaxHP(dead))
    SetWidgetLife(recruited, J88_real(I2R(BlzGetUnitMaxHP(dead)) * 0.30000001192092896))
    China_TrackCombat(recruited)
    --  Show conversion only after the roll and successful creation/ownership.
    China_ShowRecruitEffect(recruited)
    --  Zero-delay deferred removal keeps all current death callbacks intact and
    --  consumes the corpse before a later player order can raise it again.
    GroupAddUnit(China_ConvertedCorpses, dead)
    if (not China_CorpseCleanupPending) then
        China_CorpseCleanupPending = true
        TimerStart(China_CorpseTimer, 0.0, false, China_ClearConvertedCorpses)
    end
    recruited = nil
    owner = nil
end

function China_OnSummon()
    local source = GetSummoningUnit()
    local summoned = GetSummonedUnit()
    if (China_IsCommunist(source) and (GetOwningPlayer(source) == GetOwningPlayer(summoned))) then
        if (CavalryCharge_Mode ~= 0) then
            China_TrackCombat(summoned)
        elseif LoadBoolean(China_Data, GetHandleId(source), 1) then
            --  Round cleanup can kill a captured split-on-death parent. Its
            --  children must not escape the frozen survivor cleanup pass.
            RemoveUnit(summoned)
        end
    end
    source = nil
    summoned = nil
end

function China_GrenadeImpact(caster, owner, x, y)
    local victims = CreateGroup()
    local victim = nil
    local damage = 40.0
    local blast = AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", x, y)
    --  Bonus combat only: the Communist swordman grenade deals half damage.
    if ((CavalryCharge_Mode == 2) and ((GetUnitTypeId(caster) == 1747995225) or (GetUnitTypeId(caster) == 1750487885))) then
        damage = 20.0
    end
    BlzSetSpecialEffectScale(blast, 0.75)
    DestroyEffect(blast)
    GroupEnumUnitsInRange(victims, x, y, 100.0, nil)
    while true do
        victim = FirstOfGroup(victims)
        if (victim == nil) then break end
        GroupRemoveUnit(victims, victim)
        if ((China_IsEnemyCombatant(victim, owner) and (not IsUnitHidden(victim))) and (not IsUnitType(victim, UNIT_TYPE_FLYING))) then
            UnitDamageTarget(caster, victim, damage, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
        end
    end
    DestroyGroup(victims)
    victims = nil
    victim = nil
    blast = nil
end

function China_GrenadeFlight()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local caster = LoadUnitHandle(China_Data, key, 0)
    local owner = LoadPlayerHandle(China_Data, key, 1)
    local missile = LoadEffectHandle(China_Data, key, 10)
    local elapsed = J88_real(LoadReal(China_Data, key, 8) + 0.03125)
    local progress = RMinBJ(1.0, J88_real(elapsed / LoadReal(China_Data, key, 9)))
    local sx = LoadReal(China_Data, key, 2)
    local sy = LoadReal(China_Data, key, 3)
    local sz = LoadReal(China_Data, key, 4)
    local x = LoadReal(China_Data, key, 5)
    local y = LoadReal(China_Data, key, 6)
    local z = LoadReal(China_Data, key, 7)
    local active = ((((((CavalryCharge_Mode ~= 0) and (CavalryCharge_Mode == LoadInteger(China_Data, key, 12))) and (udg_int_CurRound == LoadInteger(China_Data, key, 11))) and (COUNTDOWN_TICK_TIMER == nil)) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd))) and (GetUnitTypeId(caster) ~= 0))
    if active then
        BlzSetSpecialEffectPosition(missile, J88_real(sx + J88_real(J88_real(x - sx) * progress)), J88_real(sy + J88_real(J88_real(y - sy) * progress)), J88_real(J88_real(sz + J88_real(J88_real(z - sz) * progress)) + J88_real(J88_real(640.0 * progress) * J88_real(1.0 - progress))))
    end
    if ((not active) or (progress >= 1.0)) then
        PauseTimer(clock)
        DestroyEffect(missile)
        --  Landing, not launch, applies damage. Never damage a later round.
        if active then
            China_GrenadeImpact(caster, owner, x, y)
        end
        FlushChildHashtable(China_Data, key)
        DestroyTimer(clock)
    else
        SaveReal(China_Data, key, 8, elapsed)
    end
    clock = nil
    caster = nil
    owner = nil
    missile = nil
end

function China_LaunchGrenade(caster, x, y)
    local unitKey = GetHandleId(caster)
    local sx = GetUnitX(caster)
    local sy = GetUnitY(caster)
    local dx = J88_real(x - sx)
    local dy = J88_real(y - sy)
    local distance = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
    local ground = nil
    local clock = nil
    local key = 0
    local missile = nil
    if ((((((((((((GetUnitTypeId(caster) ~= 1747995225) and (GetUnitTypeId(caster) ~= 1750487885)) or ((GetUnitTypeId(caster) == 1750487885) and IsUnitInGroup(caster, Volunteer_Spent))) or (GetWidgetLife(caster) <= 0.4050000011920929)) or IsUnitHidden(caster)) or IsUnitPaused(caster)) or LoadBoolean(China_Data, unitKey, 0)) or (GetUnitAbilityLevel(caster, 1094936647) == 0)) or (distance > 800.0)) or (CavalryCharge_Mode == 0)) or (COUNTDOWN_TICK_TIMER ~= nil)) or ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd)) then
        do return end
    end
    --  Claim the charge before starting any asynchronous work or death events.
    SaveBoolean(China_Data, unitKey, 0, true)
    if (GetUnitTypeId(caster) == 1750487885) then
        GroupAddUnit(Volunteer_Spent, caster)
    end
    UnitRemoveAbility(caster, 1094936647)
    GroupRemoveUnit(China_Grenadiers, caster)
    clock = CreateTimer()
    key = GetHandleId(clock)
    ground = Location(sx, sy)
    missile = AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", sx, sy)
    BlzSetSpecialEffectScale(missile, 1.2000000476837158)
    BlzSetSpecialEffectZ(missile, J88_real(GetLocationZ(ground) + 65.0))
    BlzSetSpecialEffectYaw(missile, Atan2(dy, dx))
    SaveUnitHandle(China_Data, key, 0, caster)
    SavePlayerHandle(China_Data, key, 1, GetOwningPlayer(caster))
    SaveReal(China_Data, key, 2, sx)
    SaveReal(China_Data, key, 3, sy)
    SaveReal(China_Data, key, 4, J88_real(GetLocationZ(ground) + 65.0))
    MoveLocation(ground, x, y)
    SaveReal(China_Data, key, 5, x)
    SaveReal(China_Data, key, 6, y)
    SaveReal(China_Data, key, 7, J88_real(GetLocationZ(ground) + 15.0))
    SaveReal(China_Data, key, 8, 0.0)
    SaveReal(China_Data, key, 9, RMaxBJ(0.3499999940395355, J88_real(distance / 900.0)))
    SaveEffectHandle(China_Data, key, 10, missile)
    SaveInteger(China_Data, key, 11, udg_int_CurRound)
    SaveInteger(China_Data, key, 12, CavalryCharge_Mode)
    RemoveLocation(ground)
    SetUnitAnimation(caster, "attack")
    TimerStart(clock, 0.03125, true, China_GrenadeFlight)
    ground = nil
    missile = nil
    clock = nil
end

function China_OnGrenade()
    if (GetSpellAbilityId() == 1094936647) then
        China_LaunchGrenade(GetTriggerUnit(), GetSpellTargetX(), GetSpellTargetY())
    end
end

function China_GrenadierThink()
    local caster = GetEnumUnit()
    local owner = GetOwningPlayer(caster)
    local candidate = nil
    local best = nil
    local x = GetUnitX(caster)
    local y = GetUnitY(caster)
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local bestDistance = 640001.0
    if (((GetUnitTypeId(caster) == 0) or (GetWidgetLife(caster) <= 0.4050000011920929)) or LoadBoolean(China_Data, GetHandleId(caster), 0)) then
        GroupRemoveUnit(China_Grenadiers, caster)
        caster = nil
        owner = nil
        do return end
    end
    if (((((IsUnitHidden(caster) or IsUnitPaused(caster)) or (GetUnitAbilityLevel(caster, 1094936647) == 0)) or (CavalryCharge_Mode == 0)) or (COUNTDOWN_TICK_TIMER ~= nil)) or ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd)) then
        caster = nil
        owner = nil
        do return end
    end
    --  Native synchronized enumeration; nearest target, handle ID breaks ties.
    GroupEnumUnitsInRange(China_Search, x, y, 800.0, nil)
    while true do
        candidate = FirstOfGroup(China_Search)
        if (candidate == nil) then break end
        GroupRemoveUnit(China_Search, candidate)
        if ((China_IsEnemyCombatant(candidate, owner) and (not IsUnitHidden(candidate))) and (not IsUnitType(candidate, UNIT_TYPE_FLYING))) then
            dx = J88_real(GetUnitX(candidate) - x)
            dy = J88_real(GetUnitY(candidate) - y)
            distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if ((distance < bestDistance) or (((distance == bestDistance) and (best ~= nil)) and (GetHandleId(candidate) < GetHandleId(best)))) then
                best = candidate
                bestDistance = distance
            end
        end
    end
    if (best ~= nil) then
        --  Battle clones are controlled by several attack-order systems. Launch
        --  through the same guarded handler so those orders cannot cancel casts.
        China_LaunchGrenade(caster, GetUnitX(best), GetUnitY(best))
    end
    candidate = nil
    best = nil
    caster = nil
    owner = nil
end

function China_ClearDeadState()
    local u = GetEnumUnit()
    if ((GetUnitTypeId(u) == 0) or (GetWidgetLife(u) <= 0.4050000011920929)) then
        GroupRemoveUnit(China_StateUnits, u)
        GroupRemoveUnit(China_Grenadiers, u)
        FlushChildHashtable(China_Data, GetHandleId(u))
        FlushChildHashtable(Volunteer_Data, GetHandleId(u))
    end
    u = nil
end

function China_OnTick()
    local corpse = nil
    while true do
        corpse = FirstOfGroup(China_DeathCleanup)
        if (corpse == nil) then break end
        GroupRemoveUnit(China_DeathCleanup, corpse)
        FlushChildHashtable(China_Data, GetHandleId(corpse))
        FlushChildHashtable(Volunteer_Data, GetHandleId(corpse))
    end
    ForGroup(China_StateUnits, China_ClearDeadState)
    ForGroup(China_Grenadiers, China_GrenadierThink)
    corpse = nil
end

function Mao_ConvertBuilding(u)
    --  Planned Economy now rewards battle income; it never replaces buildings.
end

function Mao_Refresh()
    --  No periodic building conversion or investment refund remains.
end

function Lin_Activate(flag)
    local pid = GetPlayerId(GetOwningPlayer(flag))
    local buildings = nil
    local building = nil
    if ((((pid < 0) or (pid >= 8)) or Lin_Active[pid]) or Mao_Active[pid]) then
        do return end
    end
    Lin_Active[pid] = true
    SetPlayerTechMaxAllowed(Player(pid), 1749233714, 0)
    SetPlayerTechMaxAllowed(Player(pid), 1749828174, 0)
    SetPlayerTechMaxAllowed(Player(pid), 1749498164, 0)
    SetPlayerTechMaxAllowed(Player(pid), 1749503024, J88_int(-1))
    buildings = CreateGroup()
    GroupEnumUnitsOfPlayer(buildings, Player(pid), nil)
    while true do
        building = FirstOfGroup(buildings)
        if (building == nil) then break end
        GroupRemoveUnit(buildings, building)
        if (GetUnitTypeId(building) == 1749498164) then
            ArmyEconomy_RefundAndRemove(building)
        end
    end
    DestroyGroup(buildings)
    buildings = nil
    building = nil
    Lin_RefreshPlayer(pid)
    DisplayTimedTextToPlayer(Player(pid), 0.0, 0.0, 12.0, "Lin Biao: artillery +15% attack damage and +15% attack speed; 20% chance to fire a second shell. Old Mountain Gun buildings removed and fully refunded. New Mountain Guns cost 1500 Blood Points and unlock Type 4 howitzers.")
end

function Mao_Activate(flag)
    local pid = GetPlayerId(GetOwningPlayer(flag))
    local g = CreateGroup()
    local u = nil
    if ((((pid < 0) or (pid >= 8)) or Mao_Active[pid]) or Lin_Active[pid]) then
        DestroyGroup(g)
        g = nil
        do return end
    end
    Mao_Active[pid] = true
    SetPlayerTechMaxAllowed(Player(pid), 1749828174, 0)
    SetPlayerTechMaxAllowed(Player(pid), 1749233714, 0)
    Mao_SetAvailability(Player(pid), true)
    GroupEnumUnitsOfPlayer(g, Player(J88_int(pid + 9)), nil)
    while true do
        u = FirstOfGroup(g)
        if (u == nil) then break end
        GroupRemoveUnit(g, u)
        Mao_ApplyInfantry(u)
    end
    DestroyGroup(g)
    DisplayTimedTextToPlayer(Player(pid), 0.0, 0.0, 12.0, "Chairman Mao: +8% battle Blood Points; infantry gain 5% evasion, +10% attack speed and +10% damage. Capture chance: 10%.")
    g = nil
    u = nil
end

function Mao_OnEvent()
    if ((GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_FINISH) and (GetUnitTypeId(GetTriggerUnit()) == 1749233714)) then
        Mao_Activate(GetTriggerUnit())
    elseif ((GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_FINISH) and (GetUnitTypeId(GetTriggerUnit()) == 1749828174)) then
        Lin_Activate(GetTriggerUnit())
    end
end

function Mao_Init()
    local pid = 0
    local owner = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(owner, EVENT_PLAYER_UNIT_CHANGE_OWNER)
    TriggerAddAction(owner, Lin_OnOwner)
    owner = nil
    Bounty_Data = InitHashtable()
    Mao_Events = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Mao_Events, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerAddAction(Mao_Events, Mao_OnEvent)
    while true do
        if (pid >= 8) then break end
        SetPlayerTechMaxAllowed(Player(pid), 1749233714, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1749828174, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1749503024, 0)
        Mao_SetAvailability(Player(pid), false)
        pid = J88_int(pid + 1)
    end
end

function China_OnRouteChosen()
    local flag = GetTriggerUnit()
    local owner = GetOwningPlayer(flag)
    local pid = GetPlayerId(owner)
    local t = GetUnitTypeId(flag)
    local builderType = 0
    local route = 0
    local workers = nil
    local worker = nil
    if ((pid < 0) or (pid >= 8)) then
        flag = nil
        owner = nil
        do return end
    end
    if (t == 1747988570) then
        builderType = 1747989845
        route = 1
    elseif (t == 1747990359) then
        builderType = 1747990346
        route = 2
    else
        flag = nil
        owner = nil
        do return end
    end
    if (China_Route[pid] == 0) then
        China_Route[pid] = route
        SetPlayerTechMaxAllowed(owner, 1747988570, 0)
        SetPlayerTechMaxAllowed(owner, 1747990359, 0)
        SetPlayerTechMaxAllowed(owner, builderType, 1)
        --  The other builder is unavailable after the irreversible party choice.
        if (route == 1) then
            SetPlayerTechMaxAllowed(owner, 1747990346, 0)
        else
            SetPlayerTechMaxAllowed(owner, 1747989845, 0)
        end
        workers = GetUnitsOfPlayerAndTypeId(owner, builderType)
        if (FirstOfGroup(workers) == nil) then
            worker = CreateUnit(owner, builderType, J88_real(GetUnitX(flag) + 160.0), GetUnitY(flag), 270.0)
            if (worker ~= nil) then
                SetUnitPosition(worker, J88_real(GetUnitX(flag) + 160.0), GetUnitY(flag))
            end
        end
        DestroyGroup(workers)
    end
    workers = nil
    worker = nil
    flag = nil
    owner = nil
end

function Volunteer_ExpireStunCaster()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    RemoveUnit(LoadUnitHandle(Volunteer_Data, key, 0))
    FlushChildHashtable(Volunteer_Data, key)
    DestroyTimer(clock)
    clock = nil
end

function Volunteer_Stun(source, target)
    local dummy = CreateUnit(GetOwningPlayer(source), 1750484045, GetUnitX(target), GetUnitY(target), 0.0)
    local clock = CreateTimer()
    UnitAddAbility(dummy, 1096184692)
    IssueTargetOrder(dummy, "thunderbolt", target)
    SaveUnitHandle(Volunteer_Data, GetHandleId(clock), 0, dummy)
    TimerStart(clock, 1.0, false, Volunteer_ExpireStunCaster)
    dummy = nil
    clock = nil
end

function Volunteer_EndVolley()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    GroupRemoveUnit(Volunteer_VolleyActive, LoadUnitHandle(Volunteer_Data, key, 0))
    FlushChildHashtable(Volunteer_Data, key)
    DestroyTimer(clock)
    clock = nil
end

function Volunteer_StartVolley(u)
    local clock = nil
    if ((((GetUnitTypeId(u) ~= 1750486351) or (GetWidgetLife(u) <= 0.4050000011920929)) or IsUnitInGroup(u, Volunteer_Spent)) or (CavalryCharge_Mode == 0)) then
        do return end
    end
    GroupAddUnit(Volunteer_Spent, u)
    GroupAddUnit(Volunteer_VolleyActive, u)
    UnitRemoveAbility(u, 1096185455)
    clock = CreateTimer()
    SaveUnitHandle(Volunteer_Data, GetHandleId(clock), 0, u)
    TimerStart(clock, 5.0, false, Volunteer_EndVolley)
    clock = nil
end

function Volunteer_ShellTick()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(Volunteer_Data, key, 0)
    local shell = LoadEffectHandle(Volunteer_Data, key, 1)
    local progress = J88_real(LoadReal(Volunteer_Data, key, 2) + 0.0625)
    local x = LoadReal(Volunteer_Data, key, 3)
    local y = LoadReal(Volunteer_Data, key, 4)
    local sx = LoadReal(Volunteer_Data, key, 5)
    local sy = LoadReal(Volunteer_Data, key, 6)
    local ground = LoadReal(Volunteer_Data, key, 7)
    local damage = LoadReal(Volunteer_Data, key, 8)
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local victims = nil
    local victim = nil
    local active = ((((((GetUnitTypeId(source) ~= 0) and (CavalryCharge_Mode ~= 0)) and (CavalryCharge_Mode == LoadInteger(Volunteer_Data, key, 10))) and (udg_int_CurRound == LoadInteger(Volunteer_Data, key, 9))) and (COUNTDOWN_TICK_TIMER == nil)) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd)))
    if (active and (progress < 1.0)) then
        BlzSetSpecialEffectPosition(shell, J88_real(sx + J88_real(J88_real(x - sx) * progress)), J88_real(sy + J88_real(J88_real(y - sy) * progress)), J88_real(J88_real(ground + 60.0) + J88_real(J88_real(480.0 * progress) * J88_real(1.0 - progress))))
        SaveReal(Volunteer_Data, key, 2, progress)
    else
        PauseTimer(clock)
        DestroyEffect(shell)
        if active then
            DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", x, y))
            victims = CreateGroup()
            GroupEnumUnitsInRange(victims, x, y, 100.0, nil)
            while true do
                victim = FirstOfGroup(victims)
                if (victim == nil) then break end
                GroupRemoveUnit(victims, victim)
                if (China_IsEnemyCombatant(victim, GetOwningPlayer(source)) and (not IsUnitType(victim, UNIT_TYPE_FLYING))) then
                    dx = J88_real(GetUnitX(victim) - x)
                    dy = J88_real(GetUnitY(victim) - y)
                    distance = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
                    if (distance <= 25.0) then
                        UnitDamageTarget(source, victim, damage, false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                    elseif (distance <= 50.0) then
                        UnitDamageTarget(source, victim, J88_real(damage * 0.5), false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                    elseif (distance <= 75.0) then
                        UnitDamageTarget(source, victim, J88_real(damage * 0.25), false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                    end
                end
            end
            DestroyGroup(victims)
        end
        FlushChildHashtable(Volunteer_Data, key)
        DestroyTimer(clock)
    end
    clock = nil
    source = nil
    shell = nil
    victims = nil
    victim = nil
end

function Volunteer_ExtraShell(source, target, damage, offset)
    local clock = CreateTimer()
    local key = GetHandleId(clock)
    local ground = Location(GetUnitX(target), GetUnitY(target))
    local shell = AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", J88_real(GetUnitX(source) + offset), GetUnitY(source))
    SaveUnitHandle(Volunteer_Data, key, 0, source)
    SaveEffectHandle(Volunteer_Data, key, 1, shell)
    SaveReal(Volunteer_Data, key, 2, 0.0)
    SaveReal(Volunteer_Data, key, 3, GetUnitX(target))
    SaveReal(Volunteer_Data, key, 4, GetUnitY(target))
    SaveReal(Volunteer_Data, key, 5, J88_real(GetUnitX(source) + offset))
    SaveReal(Volunteer_Data, key, 6, GetUnitY(source))
    SaveReal(Volunteer_Data, key, 7, GetLocationZ(ground))
    SaveReal(Volunteer_Data, key, 8, damage)
    SaveInteger(Volunteer_Data, key, 9, udg_int_CurRound)
    SaveInteger(Volunteer_Data, key, 10, CavalryCharge_Mode)
    RemoveLocation(ground)
    TimerStart(clock, 0.03125, true, Volunteer_ShellTick)
    clock = nil
    ground = nil
    shell = nil
end

function Volunteer_BurstShell()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(Volunteer_Data, key, 0)
    local target = LoadUnitHandle(Volunteer_Data, key, 1)
    local count = LoadInteger(Volunteer_Data, key, 2)
    if (((((((GetUnitTypeId(source) ~= 0) and (GetWidgetLife(source) > 0.4050000011920929)) and (GetUnitTypeId(target) ~= 0)) and (GetWidgetLife(target) > 0.4050000011920929)) and (CavalryCharge_Mode == LoadInteger(Volunteer_Data, key, 4))) and (udg_int_CurRound == LoadInteger(Volunteer_Data, key, 5))) and (CavalryCharge_Mode ~= 0)) then
        Volunteer_ExtraShell(source, target, LoadReal(Volunteer_Data, key, 3), 0.0)
    else
        count = 1
    end
    count = J88_int(count + 1)
    SaveInteger(Volunteer_Data, key, 2, count)
    if (count >= 2) then
        FlushChildHashtable(Volunteer_Data, key)
        DestroyTimer(clock)
    end
    source = nil
    target = nil
    clock = nil
end

function Volunteer_QueueBurst(source, target, damage)
    local clock = CreateTimer()
    local key = GetHandleId(clock)
    SaveUnitHandle(Volunteer_Data, key, 0, source)
    SaveUnitHandle(Volunteer_Data, key, 1, target)
    SaveInteger(Volunteer_Data, key, 2, 0)
    SaveReal(Volunteer_Data, key, 3, damage)
    SaveInteger(Volunteer_Data, key, 4, CavalryCharge_Mode)
    SaveInteger(Volunteer_Data, key, 5, udg_int_CurRound)
    TimerStart(clock, 0.20000000298023224, true, Volunteer_BurstShell)
    clock = nil
end

function Volunteer_OnDamage()
    local source = GetEventDamageSource()
    local target = GetTriggerUnit()
    local kind = GetUnitTypeId(source)
    local damage = GetEventDamage()
    if (((((((kind ~= 1750487886) and (kind ~= 1750483284)) and (kind ~= 1750486351)) or (not BlzGetEventIsAttack())) or (damage <= 0.0)) or (CavalryCharge_Mode == 0)) or (not China_IsEnemyCombatant(target, GetOwningPlayer(source)))) then
        source = nil
        target = nil
        do return end
    end
    if ((kind == 1750487886) and (not IsUnitInGroup(source, Volunteer_Spent))) then
        GroupAddUnit(Volunteer_Spent, source)
        BlzSetEventDamage(J88_real(damage * 5.0))
    elseif ((kind == 1750483284) and (not IsUnitInGroup(source, Volunteer_Spent))) then
        GroupAddUnit(Volunteer_Spent, source)
        Volunteer_Stun(source, target)
    elseif (((kind == 1750486351) and LoadBoolean(Volunteer_Data, GetHandleId(source), 31)) and (target == LoadUnitHandle(Volunteer_Data, GetHandleId(source), 30))) then
        --  Claim before extra splash; cancelled attacks never create shells.
        SaveBoolean(Volunteer_Data, GetHandleId(source), 31, false)
        Volunteer_StartVolley(source)
        if IsUnitInGroup(source, Volunteer_VolleyActive) then
            Volunteer_QueueBurst(source, target, damage)
        end
    end
    source = nil
    target = nil
end

function Volunteer_PrioritizeArmor(source, current)
    local candidates = nil
    local candidate = nil
    local best = nil
    local range = BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_RANGE, 0)
    local distance = 0.0
    local nearest = J88_real(J88_real(range * range) + 1.0)
    local dx = 0.0
    local dy = 0.0
    if ((CavalryCharge_Mode == 0) or IsUnitType(current, UNIT_TYPE_MECHANICAL)) then
        do return end
    end
    candidates = CreateGroup()
    GroupEnumUnitsInRange(candidates, GetUnitX(source), GetUnitY(source), range, nil)
    while true do
        candidate = FirstOfGroup(candidates)
        if (candidate == nil) then break end
        GroupRemoveUnit(candidates, candidate)
        if ((((China_IsEnemyCombatant(candidate, GetOwningPlayer(source)) and IsUnitType(candidate, UNIT_TYPE_MECHANICAL)) and (not IsUnitType(candidate, UNIT_TYPE_FLYING))) and (not BlzIsUnitInvulnerable(candidate))) and IsUnitVisible(candidate, GetOwningPlayer(source))) then
            dx = J88_real(GetUnitX(candidate) - GetUnitX(source))
            dy = J88_real(GetUnitY(candidate) - GetUnitY(source))
            distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if (distance < nearest) then
                best = candidate
                nearest = distance
            end
        end
    end
    if (best ~= nil) then
        IssueTargetOrder(source, "attack", best)
    end
    DestroyGroup(candidates)
    candidates = nil
    candidate = nil
    best = nil
end

function Volunteer_OnAttack()
    local source = GetAttacker()
    local target = GetTriggerUnit()
    if ((GetUnitTypeId(source) == 1750483284) and China_IsEnemyCombatant(target, GetOwningPlayer(source))) then
        Volunteer_PrioritizeArmor(source, target)
    end
    if ((GetUnitTypeId(source) == 1750486351) and China_IsEnemyCombatant(target, GetOwningPlayer(source))) then
        SaveUnitHandle(Volunteer_Data, GetHandleId(source), 30, target)
        SaveBoolean(Volunteer_Data, GetHandleId(source), 31, (CavalryCharge_Mode ~= 0))
    end
    source = nil
    target = nil
end

function Volunteer_OnSpell()
end

function Volunteer_Init()
    local damage = CreateTrigger()
    local attack = CreateTrigger()
    Volunteer_Data = InitHashtable()
    Volunteer_Spent = CreateGroup()
    Volunteer_VolleyActive = CreateGroup()
    TriggerRegisterAnyUnitEventBJ(damage, EVENT_PLAYER_UNIT_DAMAGING)
    TriggerAddAction(damage, Volunteer_OnDamage)
    TriggerRegisterAnyUnitEventBJ(attack, EVENT_PLAYER_UNIT_ATTACKED)
    TriggerAddAction(attack, Volunteer_OnAttack)
    damage = nil
    attack = nil
end

function China_Init()
    local pid = 0
    if (China_Data ~= nil) then
        do return end
    end
    Mao_Init()
    ExecuteFunc("WomanAdvance_Init")
    ScoreFaction_Init()
    China_Data = InitHashtable()
    China_Grenadiers = CreateGroup()
    China_Search = CreateGroup()
    China_ConvertedCorpses = CreateGroup()
    China_DeathCleanup = CreateGroup()
    China_StateUnits = CreateGroup()
    China_EverRecruited = CreateGroup()
    Volunteer_Init()
    LinFire_Init()
    Agent_Init()
    China_Timer = CreateTimer()
    China_CorpseTimer = CreateTimer()
    China_RouteTrigger = CreateTrigger()
    China_GrenadeTrigger = CreateTrigger()
    China_SummonTrigger = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(China_RouteTrigger, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerAddAction(China_RouteTrigger, China_OnRouteChosen)
    TriggerRegisterAnyUnitEventBJ(China_GrenadeTrigger, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddAction(China_GrenadeTrigger, China_OnGrenade)
    TriggerRegisterAnyUnitEventBJ(China_SummonTrigger, EVENT_PLAYER_UNIT_SUMMON)
    TriggerAddAction(China_SummonTrigger, China_OnSummon)
    TimerStart(China_Timer, 0.5, true, China_OnTick)
    while true do
        if (pid >= 8) then break end
        SetPlayerTechMaxAllowed(Player(pid), 1749233713, 0)
        SetPlayerTechMaxAllowed(Player(pid), 1749233714, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1749828174, 1)
        SetPlayerTechMaxAllowed(Player(pid), 1749503024, 0)
        pid = J88_int(pid + 1)
    end
end

function Mao_AICatalog()
    NewAI_CatalogUnit(1749233714, 0, 3000, 1, 0, 0, 0, 0, 1, 300, "Chairman Mao")
    SaveInteger(NewAI_Data, 1747990359, 5, 2)
    SaveInteger(NewAI_Data, 1747990359, 101, 1749233714)
    --  Normal-price infantry remains available before and after Mao activation.
    SaveInteger(NewAI_Data, 1747990346, 5, 6)
    SaveInteger(NewAI_Data, 1747990346, 105, 1750478896)
    SaveInteger(NewAI_Data, 1747990346, 100, 1747995457)
    SaveInteger(NewAI_Data, 1747990346, 101, 1749241136)
    SaveInteger(NewAI_Data, 1747990346, 102, 1749236021)
    SaveInteger(NewAI_Data, 1747990346, 103, 1749242932)
    SaveInteger(NewAI_Data, 1747990346, 104, 1749498164)

SaveReal(NewAI_Data, 1749503024, 500, 200.0)
SaveReal(NewAI_Data, 1749503024, 501, 1200.0)
SaveReal(NewAI_Data, 1749503024, 502, 0.0)
SaveReal(NewAI_Data, 1749503024, 530, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 531, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 510, 0.0)
SaveReal(NewAI_Data, 1749503024, 511, 200.0)
SaveReal(NewAI_Data, 1749503024, 512, 0.0)
SaveReal(NewAI_Data, 1749503024, 513, 0.0)
SaveReal(NewAI_Data, 1749503024, 514, 0.0)
SaveReal(NewAI_Data, 1749503024, 515, 0.0)
SaveReal(NewAI_Data, 1749503024, 516, 0.0)
SaveReal(NewAI_Data, 1749503024, 517, 0.0)
SaveReal(NewAI_Data, 1749503024, 520, 30.0)
SaveReal(NewAI_Data, 1749503024, 521, 60.0)
SaveReal(NewAI_Data, 1749503024, 522, 30.0)
SaveReal(NewAI_Data, 1749503024, 523, 30.0)
SaveReal(NewAI_Data, 1749503024, 524, 60.0)
SaveReal(NewAI_Data, 1749503024, 525, 30.0)
SaveReal(NewAI_Data, 1749503024, 526, 30.0)
SaveReal(NewAI_Data, 1749503024, 527, 30.0)
SaveReal(NewAI_Data, 1749503024, 550, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 551, 53.33332824707031)
SaveReal(NewAI_Data, 1749503024, 552, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 553, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 554, 53.33332824707031)
SaveReal(NewAI_Data, 1749503024, 555, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 556, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 557, 26.666669845581055)
SaveReal(NewAI_Data, 1749503024, 560, 0.0)
SaveReal(NewAI_Data, 1749503024, 561, 0.0)
SaveReal(NewAI_Data, 1749503024, 562, 0.0)
SaveReal(NewAI_Data, 1749503024, 563, 0.0)
SaveReal(NewAI_Data, 1749503024, 564, 0.0)
SaveReal(NewAI_Data, 1749503024, 565, 0.0)
SaveReal(NewAI_Data, 1749503024, 566, 0.0)
SaveReal(NewAI_Data, 1749503024, 567, 0.0)
SaveReal(NewAI_Data, 1749824560, 500, 200.0)
SaveReal(NewAI_Data, 1749824560, 501, 1200.0)
SaveReal(NewAI_Data, 1749824560, 502, 0.0)
SaveReal(NewAI_Data, 1749824560, 530, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 531, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 510, 0.0)
SaveReal(NewAI_Data, 1749824560, 511, 200.0)
SaveReal(NewAI_Data, 1749824560, 512, 0.0)
SaveReal(NewAI_Data, 1749824560, 513, 0.0)
SaveReal(NewAI_Data, 1749824560, 514, 0.0)
SaveReal(NewAI_Data, 1749824560, 515, 0.0)
SaveReal(NewAI_Data, 1749824560, 516, 0.0)
SaveReal(NewAI_Data, 1749824560, 517, 0.0)
SaveReal(NewAI_Data, 1749824560, 520, 35.625)
SaveReal(NewAI_Data, 1749824560, 521, 71.25)
SaveReal(NewAI_Data, 1749824560, 522, 35.625)
SaveReal(NewAI_Data, 1749824560, 523, 35.625)
SaveReal(NewAI_Data, 1749824560, 524, 71.25)
SaveReal(NewAI_Data, 1749824560, 525, 35.625)
SaveReal(NewAI_Data, 1749824560, 526, 35.625)
SaveReal(NewAI_Data, 1749824560, 527, 35.625)
SaveReal(NewAI_Data, 1749824560, 550, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 551, 63.33332824707031)
SaveReal(NewAI_Data, 1749824560, 552, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 553, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 554, 63.33332824707031)
SaveReal(NewAI_Data, 1749824560, 555, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 556, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 557, 31.666669845581055)
SaveReal(NewAI_Data, 1749824560, 560, 0.0)
SaveReal(NewAI_Data, 1749824560, 561, 0.0)
SaveReal(NewAI_Data, 1749824560, 562, 0.0)
SaveReal(NewAI_Data, 1749824560, 563, 0.0)
SaveReal(NewAI_Data, 1749824560, 564, 0.0)
SaveReal(NewAI_Data, 1749824560, 565, 0.0)
SaveReal(NewAI_Data, 1749824560, 566, 0.0)
SaveReal(NewAI_Data, 1749824560, 567, 0.0)
SaveReal(NewAI_Data, 1749828400, 500, 1500.0)
SaveReal(NewAI_Data, 1749828400, 501, 50.0)
SaveReal(NewAI_Data, 1749828400, 502, 0.0)
SaveReal(NewAI_Data, 1749828400, 530, 87.5)
SaveReal(NewAI_Data, 1749828400, 531, 175.0)
SaveReal(NewAI_Data, 1749828400, 510, 0.0)
SaveReal(NewAI_Data, 1749828400, 511, 0.0)
SaveReal(NewAI_Data, 1749828400, 512, 0.0)
SaveReal(NewAI_Data, 1749828400, 513, 0.0)
SaveReal(NewAI_Data, 1749828400, 514, 0.0)
SaveReal(NewAI_Data, 1749828400, 515, 0.0)
SaveReal(NewAI_Data, 1749828400, 516, 0.0)
SaveReal(NewAI_Data, 1749828400, 517, 1500.0)
SaveReal(NewAI_Data, 1749828400, 520, 262.5)
SaveReal(NewAI_Data, 1749828400, 521, 52.5)
SaveReal(NewAI_Data, 1749828400, 522, 87.5)
SaveReal(NewAI_Data, 1749828400, 523, 175.0)
SaveReal(NewAI_Data, 1749828400, 524, 175.0)
SaveReal(NewAI_Data, 1749828400, 525, 87.5)
SaveReal(NewAI_Data, 1749828400, 526, 175.0)
SaveReal(NewAI_Data, 1749828400, 527, 166.25)
SaveReal(NewAI_Data, 1749828400, 550, 262.5)
SaveReal(NewAI_Data, 1749828400, 551, 52.5)
SaveReal(NewAI_Data, 1749828400, 552, 87.5)
SaveReal(NewAI_Data, 1749828400, 553, 175.0)
SaveReal(NewAI_Data, 1749828400, 554, 175.0)
SaveReal(NewAI_Data, 1749828400, 555, 87.5)
SaveReal(NewAI_Data, 1749828400, 556, 175.0)
SaveReal(NewAI_Data, 1749828400, 557, 166.25)
SaveReal(NewAI_Data, 1749828400, 560, 0.0)
SaveReal(NewAI_Data, 1749828400, 561, 0.0)
SaveReal(NewAI_Data, 1749828400, 562, 0.0)
SaveReal(NewAI_Data, 1749828400, 563, 0.0)
SaveReal(NewAI_Data, 1749828400, 564, 0.0)
SaveReal(NewAI_Data, 1749828400, 565, 0.0)
SaveReal(NewAI_Data, 1749828400, 566, 0.0)
SaveReal(NewAI_Data, 1749828400, 567, 0.0)
SaveReal(NewAI_Data, 1749824561, 540, 1200.0)
SaveReal(NewAI_Data, 1749824561, 541, 1200.0)
SaveReal(NewAI_Data, 1749828401, 540, 50.0)
SaveReal(NewAI_Data, 1749828401, 541, 50.0)
NewAI_CatalogUnit(1749503024, 0, 1500, 3, 3, 0, 1, 1, 1, 150, "CC Mountain Gun (1)")
NewAI_CatalogUnit(1749824560, 0, 1000, 3, 3, 0, 0, 1, 1, 250, "CC Type 4 150mm Howitzer (1)")
SaveInteger(NewAI_Data, 1749824560, 200, 1749828174)
SaveInteger(NewAI_Data, 1749824560, 300, 1)
NewAI_CatalogUnit(1749828400, 200, 0, 3, 1, 0, 0, 10, 1, 200, "CC Dadao Cavalry (10)")
NewAI_CatalogUnit(1749828174, 0, 3000, 1, 0, 0, 0, 0, 1, 300, "Lin Biao")
SaveInteger(NewAI_Data, 1749498164, 100, 1749824560)
SaveInteger(NewAI_Data, 1749503024, 100, 1749824560)
SaveInteger(NewAI_Data, 1747990359, 5, 3)
SaveInteger(NewAI_Data, 1747990359, 102, 1749828174)
SaveInteger(NewAI_Data, 1747990346, 5, 8)
SaveInteger(NewAI_Data, 1747990346, 106, 1749828400)
SaveInteger(NewAI_Data, 1747990346, 107, 1749503024)

NewAI_CatalogUnit(1749108528, 0, 1500, 3, 1, 0, 0, 3, 1, 150, "CC Agents (3)")
SaveInteger(NewAI_Data, 1747990346, 5, 9)
SaveInteger(NewAI_Data, 1747990346, 108, 1749108528)
NewAI_CatalogUnit(1749435463, 0, 0, 1, 0, 1, 0, 0, 1, 300, "Charles de Gaulle")
SaveInteger(NewAI_Data, 1749435463, 100, 1747993155)
SaveInteger(NewAI_Data, 1747989848, 5, 3)
SaveInteger(NewAI_Data, 1747989848, 101, 1747994960)
SaveInteger(NewAI_Data, 1747989848, 102, 1749435463)
NewAI_CatalogUnit(1749438512, 0, 900, 3, 2, 0, 1, 3, 1, 390, "Panhard 178 47mm")
SaveInteger(NewAI_Data, 1749438512, 200, 1749435463)
SaveInteger(NewAI_Data, 1749438512, 300, 1)
SaveReal(NewAI_Data, 1749438512, 500, 1500.0)
SaveReal(NewAI_Data, 1749438512, 501, 550.0)
SaveReal(NewAI_Data, 1749438512, 502, 0.0)
SaveReal(NewAI_Data, 1749438512, 530, 45.83332824707031)
SaveReal(NewAI_Data, 1749438512, 531, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 510, 0.0)
SaveReal(NewAI_Data, 1749438512, 511, 1500.0)
SaveReal(NewAI_Data, 1749438512, 512, 0.0)
SaveReal(NewAI_Data, 1749438512, 513, 0.0)
SaveReal(NewAI_Data, 1749438512, 514, 0.0)
SaveReal(NewAI_Data, 1749438512, 515, 0.0)
SaveReal(NewAI_Data, 1749438512, 516, 0.0)
SaveReal(NewAI_Data, 1749438512, 517, 0.0)
SaveReal(NewAI_Data, 1749438512, 520, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 521, 45.83332824707031)
SaveReal(NewAI_Data, 1749438512, 522, 27.5)
SaveReal(NewAI_Data, 1749438512, 523, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 524, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 525, 45.83332824707031)
SaveReal(NewAI_Data, 1749438512, 526, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 527, 137.5)
SaveReal(NewAI_Data, 1749438512, 550, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 551, 45.83332824707031)
SaveReal(NewAI_Data, 1749438512, 552, 27.5)
SaveReal(NewAI_Data, 1749438512, 553, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 554, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 555, 45.83332824707031)
SaveReal(NewAI_Data, 1749438512, 556, 91.66667175292969)
SaveReal(NewAI_Data, 1749438512, 557, 137.5)
SaveReal(NewAI_Data, 1749438512, 560, 0.0)
SaveReal(NewAI_Data, 1749438512, 561, 0.0)
SaveReal(NewAI_Data, 1749438512, 562, 0.0)
SaveReal(NewAI_Data, 1749438512, 563, 0.0)
SaveReal(NewAI_Data, 1749438512, 564, 0.0)
SaveReal(NewAI_Data, 1749438512, 565, 0.0)
SaveReal(NewAI_Data, 1749438512, 566, 0.0)
SaveReal(NewAI_Data, 1749438512, 567, 0.0)
NewAI_CatalogUnit(1749437488, 0, 500, 3, 2, 0, 1, 1, 1, 150, "Lorraine 37L Antichar")
SaveInteger(NewAI_Data, 1749437488, 200, 1749435463)
SaveInteger(NewAI_Data, 1749437488, 300, 1)
SaveReal(NewAI_Data, 1749437488, 500, 600.0)
SaveReal(NewAI_Data, 1749437488, 501, 800.0)
SaveReal(NewAI_Data, 1749437488, 502, 0.0)
SaveReal(NewAI_Data, 1749437488, 530, 90.5)
SaveReal(NewAI_Data, 1749437488, 531, 90.5)
SaveReal(NewAI_Data, 1749437488, 510, 0.0)
SaveReal(NewAI_Data, 1749437488, 511, 0.0)
SaveReal(NewAI_Data, 1749437488, 512, 600.0)
SaveReal(NewAI_Data, 1749437488, 513, 0.0)
SaveReal(NewAI_Data, 1749437488, 514, 0.0)
SaveReal(NewAI_Data, 1749437488, 515, 0.0)
SaveReal(NewAI_Data, 1749437488, 516, 0.0)
SaveReal(NewAI_Data, 1749437488, 517, 0.0)
SaveReal(NewAI_Data, 1749437488, 520, 97.2874984741211)
SaveReal(NewAI_Data, 1749437488, 521, 291.86248779296875)
SaveReal(NewAI_Data, 1749437488, 522, 194.5749969482422)
SaveReal(NewAI_Data, 1749437488, 523, 97.2874984741211)
SaveReal(NewAI_Data, 1749437488, 524, 48.64374923706055)
SaveReal(NewAI_Data, 1749437488, 525, 97.2874984741211)
SaveReal(NewAI_Data, 1749437488, 526, 97.2874984741211)
SaveReal(NewAI_Data, 1749437488, 527, 48.64374923706055)
SaveReal(NewAI_Data, 1749437488, 550, 90.5)
SaveReal(NewAI_Data, 1749437488, 551, 271.5)
SaveReal(NewAI_Data, 1749437488, 552, 181.0)
SaveReal(NewAI_Data, 1749437488, 553, 90.5)
SaveReal(NewAI_Data, 1749437488, 554, 45.25)
SaveReal(NewAI_Data, 1749437488, 555, 90.5)
SaveReal(NewAI_Data, 1749437488, 556, 90.5)
SaveReal(NewAI_Data, 1749437488, 557, 45.25)
SaveReal(NewAI_Data, 1749437488, 560, 0.0)
SaveReal(NewAI_Data, 1749437488, 561, 0.0)
SaveReal(NewAI_Data, 1749437488, 562, 0.0)
SaveReal(NewAI_Data, 1749437488, 563, 0.0)
SaveReal(NewAI_Data, 1749437488, 564, 0.0)
SaveReal(NewAI_Data, 1749437488, 565, 0.0)
SaveReal(NewAI_Data, 1749437488, 566, 0.0)
SaveReal(NewAI_Data, 1749437488, 567, 0.0)
NewAI_CatalogUnit(1749434672, 0, 4500, 3, 2, 1, 1, 1, 1, 600, "AMX 50 100")
SaveInteger(NewAI_Data, 1749434672, 200, 1749435463)
SaveInteger(NewAI_Data, 1749434672, 300, 1)
SaveReal(NewAI_Data, 1749434672, 500, 1800.0)
SaveReal(NewAI_Data, 1749434672, 501, 600.0)
SaveReal(NewAI_Data, 1749434672, 502, 1800.0)
SaveReal(NewAI_Data, 1749434672, 530, 0.0)
SaveReal(NewAI_Data, 1749434672, 531, 225.0)
SaveReal(NewAI_Data, 1749434672, 510, 0.0)
SaveReal(NewAI_Data, 1749434672, 511, 0.0)
SaveReal(NewAI_Data, 1749434672, 512, 1800.0)
SaveReal(NewAI_Data, 1749434672, 513, 0.0)
SaveReal(NewAI_Data, 1749434672, 514, 0.0)
SaveReal(NewAI_Data, 1749434672, 515, 0.0)
SaveReal(NewAI_Data, 1749434672, 516, 0.0)
SaveReal(NewAI_Data, 1749434672, 517, 0.0)
SaveReal(NewAI_Data, 1749434672, 520, 225.0)
SaveReal(NewAI_Data, 1749434672, 521, 675.0)
SaveReal(NewAI_Data, 1749434672, 522, 450.0)
SaveReal(NewAI_Data, 1749434672, 523, 225.0)
SaveReal(NewAI_Data, 1749434672, 524, 112.5)
SaveReal(NewAI_Data, 1749434672, 525, 225.0)
SaveReal(NewAI_Data, 1749434672, 526, 225.0)
SaveReal(NewAI_Data, 1749434672, 527, 112.5)
SaveReal(NewAI_Data, 1749434672, 550, 0.0)
SaveReal(NewAI_Data, 1749434672, 551, 0.0)
SaveReal(NewAI_Data, 1749434672, 552, 0.0)
SaveReal(NewAI_Data, 1749434672, 553, 0.0)
SaveReal(NewAI_Data, 1749434672, 554, 0.0)
SaveReal(NewAI_Data, 1749434672, 555, 0.0)
SaveReal(NewAI_Data, 1749434672, 556, 0.0)
SaveReal(NewAI_Data, 1749434672, 557, 0.0)
SaveReal(NewAI_Data, 1749434672, 560, 0.0)
SaveReal(NewAI_Data, 1749434672, 561, 0.0)
SaveReal(NewAI_Data, 1749434672, 562, 0.0)
SaveReal(NewAI_Data, 1749434672, 563, 0.0)
SaveReal(NewAI_Data, 1749434672, 564, 0.0)
SaveReal(NewAI_Data, 1749434672, 565, 0.0)
SaveReal(NewAI_Data, 1749434672, 566, 0.0)
SaveReal(NewAI_Data, 1749434672, 567, 0.0)
NewAI_CatalogUnit(1749439280, 0, 4000, 3, 2, 0, 1, 1, 1, 1000, "AMX 50 Surblinde")
SaveInteger(NewAI_Data, 1749439280, 200, 1749435463)
SaveInteger(NewAI_Data, 1749439280, 300, 1)
SaveReal(NewAI_Data, 1749439280, 500, 5000.0)
SaveReal(NewAI_Data, 1749439280, 501, 600.0)
SaveReal(NewAI_Data, 1749439280, 502, 5000.0)
SaveReal(NewAI_Data, 1749439280, 530, 49.75)
SaveReal(NewAI_Data, 1749439280, 531, 49.75)
SaveReal(NewAI_Data, 1749439280, 510, 0.0)
SaveReal(NewAI_Data, 1749439280, 511, 0.0)
SaveReal(NewAI_Data, 1749439280, 512, 5000.0)
SaveReal(NewAI_Data, 1749439280, 513, 0.0)
SaveReal(NewAI_Data, 1749439280, 514, 0.0)
SaveReal(NewAI_Data, 1749439280, 515, 0.0)
SaveReal(NewAI_Data, 1749439280, 516, 0.0)
SaveReal(NewAI_Data, 1749439280, 517, 0.0)
SaveReal(NewAI_Data, 1749439280, 520, 53.48125076293945)
SaveReal(NewAI_Data, 1749439280, 521, 160.44375610351562)
SaveReal(NewAI_Data, 1749439280, 522, 106.9625015258789)
SaveReal(NewAI_Data, 1749439280, 523, 53.48125076293945)
SaveReal(NewAI_Data, 1749439280, 524, 26.740619659423828)
SaveReal(NewAI_Data, 1749439280, 525, 53.48125076293945)
SaveReal(NewAI_Data, 1749439280, 526, 53.48125076293945)
SaveReal(NewAI_Data, 1749439280, 527, 26.740619659423828)
SaveReal(NewAI_Data, 1749439280, 550, 49.75)
SaveReal(NewAI_Data, 1749439280, 551, 149.25)
SaveReal(NewAI_Data, 1749439280, 552, 99.5)
SaveReal(NewAI_Data, 1749439280, 553, 49.75)
SaveReal(NewAI_Data, 1749439280, 554, 24.875)
SaveReal(NewAI_Data, 1749439280, 555, 49.75)
SaveReal(NewAI_Data, 1749439280, 556, 49.75)
SaveReal(NewAI_Data, 1749439280, 557, 24.875)
SaveReal(NewAI_Data, 1749439280, 560, 0.0)
SaveReal(NewAI_Data, 1749439280, 561, 0.0)
SaveReal(NewAI_Data, 1749439280, 562, 0.0)
SaveReal(NewAI_Data, 1749439280, 563, 0.0)
SaveReal(NewAI_Data, 1749439280, 564, 0.0)
SaveReal(NewAI_Data, 1749439280, 565, 0.0)
SaveReal(NewAI_Data, 1749439280, 566, 0.0)
SaveReal(NewAI_Data, 1749439280, 567, 0.0)
NewAI_CatalogUnit(1749435952, 0, 12000, 3, 2, 0, 2, 1, 1, 1200, "FCM F1")
SaveInteger(NewAI_Data, 1749435952, 200, 1749435463)
SaveInteger(NewAI_Data, 1749435952, 300, 1)
SaveInteger(NewAI_Data, 1749435952, 201, 1378889776)
SaveInteger(NewAI_Data, 1749435952, 301, 1)
SaveReal(NewAI_Data, 1749435952, 500, 16000.0)
SaveReal(NewAI_Data, 1749435952, 501, 700.0)
SaveReal(NewAI_Data, 1749435952, 502, 0.0)
SaveReal(NewAI_Data, 1749435952, 530, 575.5)
SaveReal(NewAI_Data, 1749435952, 531, 575.5)
SaveReal(NewAI_Data, 1749435952, 510, 0.0)
SaveReal(NewAI_Data, 1749435952, 511, 0.0)
SaveReal(NewAI_Data, 1749435952, 512, 16000.0)
SaveReal(NewAI_Data, 1749435952, 513, 0.0)
SaveReal(NewAI_Data, 1749435952, 514, 0.0)
SaveReal(NewAI_Data, 1749435952, 515, 0.0)
SaveReal(NewAI_Data, 1749435952, 516, 0.0)
SaveReal(NewAI_Data, 1749435952, 517, 0.0)
SaveReal(NewAI_Data, 1749435952, 520, 618.6624755859375)
SaveReal(NewAI_Data, 1749435952, 521, 1855.987548828125)
SaveReal(NewAI_Data, 1749435952, 522, 1237.324951171875)
SaveReal(NewAI_Data, 1749435952, 523, 618.6624755859375)
SaveReal(NewAI_Data, 1749435952, 524, 309.33123779296875)
SaveReal(NewAI_Data, 1749435952, 525, 618.6624755859375)
SaveReal(NewAI_Data, 1749435952, 526, 618.6624755859375)
SaveReal(NewAI_Data, 1749435952, 527, 309.33123779296875)
SaveReal(NewAI_Data, 1749435952, 550, 575.5)
SaveReal(NewAI_Data, 1749435952, 551, 1726.5)
SaveReal(NewAI_Data, 1749435952, 552, 1151.0)
SaveReal(NewAI_Data, 1749435952, 553, 575.5)
SaveReal(NewAI_Data, 1749435952, 554, 287.75)
SaveReal(NewAI_Data, 1749435952, 555, 575.5)
SaveReal(NewAI_Data, 1749435952, 556, 575.5)
SaveReal(NewAI_Data, 1749435952, 557, 287.75)
SaveReal(NewAI_Data, 1749435952, 560, 0.0)
SaveReal(NewAI_Data, 1749435952, 561, 0.0)
SaveReal(NewAI_Data, 1749435952, 562, 0.0)
SaveReal(NewAI_Data, 1749435952, 563, 0.0)
SaveReal(NewAI_Data, 1749435952, 564, 0.0)
SaveReal(NewAI_Data, 1749435952, 565, 0.0)
SaveReal(NewAI_Data, 1749435952, 566, 0.0)
SaveReal(NewAI_Data, 1749435952, 567, 0.0)
NewAI_CatalogUnit(1749437744, 0, 6000, 3, 2, 0, 2, 1, 1, 600, "Maginot Line")
SaveInteger(NewAI_Data, 1749437744, 200, 1747994960)
SaveInteger(NewAI_Data, 1749437744, 300, 1)
SaveInteger(NewAI_Data, 1749437744, 201, 1378889776)
SaveInteger(NewAI_Data, 1749437744, 301, 1)
SaveReal(NewAI_Data, 1749437744, 500, 1200.0)
SaveReal(NewAI_Data, 1749437744, 501, 1800.0)
SaveReal(NewAI_Data, 1749437744, 502, 0.0)
SaveReal(NewAI_Data, 1749437744, 530, 49.75)
SaveReal(NewAI_Data, 1749437744, 531, 49.75)
SaveReal(NewAI_Data, 1749437744, 510, 0.0)
SaveReal(NewAI_Data, 1749437744, 511, 0.0)
SaveReal(NewAI_Data, 1749437744, 512, 1200.0)
SaveReal(NewAI_Data, 1749437744, 513, 0.0)
SaveReal(NewAI_Data, 1749437744, 514, 0.0)
SaveReal(NewAI_Data, 1749437744, 515, 0.0)
SaveReal(NewAI_Data, 1749437744, 516, 0.0)
SaveReal(NewAI_Data, 1749437744, 517, 0.0)
SaveReal(NewAI_Data, 1749437744, 520, 53.48125076293945)
SaveReal(NewAI_Data, 1749437744, 521, 160.44375610351562)
SaveReal(NewAI_Data, 1749437744, 522, 106.9625015258789)
SaveReal(NewAI_Data, 1749437744, 523, 53.48125076293945)
SaveReal(NewAI_Data, 1749437744, 524, 26.740619659423828)
SaveReal(NewAI_Data, 1749437744, 525, 53.48125076293945)
SaveReal(NewAI_Data, 1749437744, 526, 53.48125076293945)
SaveReal(NewAI_Data, 1749437744, 527, 26.740619659423828)
SaveReal(NewAI_Data, 1749437744, 550, 49.75)
SaveReal(NewAI_Data, 1749437744, 551, 149.25)
SaveReal(NewAI_Data, 1749437744, 552, 99.5)
SaveReal(NewAI_Data, 1749437744, 553, 49.75)
SaveReal(NewAI_Data, 1749437744, 554, 24.875)
SaveReal(NewAI_Data, 1749437744, 555, 49.75)
SaveReal(NewAI_Data, 1749437744, 556, 49.75)
SaveReal(NewAI_Data, 1749437744, 557, 24.875)
SaveReal(NewAI_Data, 1749437744, 560, 0.0)
SaveReal(NewAI_Data, 1749437744, 561, 0.0)
SaveReal(NewAI_Data, 1749437744, 562, 0.0)
SaveReal(NewAI_Data, 1749437744, 563, 0.0)
SaveReal(NewAI_Data, 1749437744, 564, 0.0)
SaveReal(NewAI_Data, 1749437744, 565, 0.0)
SaveReal(NewAI_Data, 1749437744, 566, 0.0)
SaveReal(NewAI_Data, 1749437744, 567, 0.0)
SaveInteger(NewAI_Data, 1747994712, 5, 3)
SaveInteger(NewAI_Data, 1747994712, 102, 1749438512)
SaveInteger(NewAI_Data, 1747994945, 5, 2)
SaveInteger(NewAI_Data, 1747994945, 101, 1749437488)
SaveInteger(NewAI_Data, 1747994935, 5, 4)
SaveInteger(NewAI_Data, 1747994935, 103, 1749434672)
SaveInteger(NewAI_Data, 1749434672, 5, 1)
SaveInteger(NewAI_Data, 1749434672, 100, 1749439280)
SaveInteger(NewAI_Data, 1747993155, 5, 9)
SaveInteger(NewAI_Data, 1747993155, 107, 1749437744)
SaveInteger(NewAI_Data, 1747993155, 108, 1749435952)
SaveInteger(NewAI_Data, 1747994959, 5, 9)
SaveInteger(NewAI_Data, 1747994959, 107, 1749437744)
SaveInteger(NewAI_Data, 1747994959, 108, 1749435952)
SaveReal(NewAI_Data, 1749438512, 500, 1800.0)
SaveReal(NewAI_Data, 1749438512, 501, 390.0)
SaveReal(NewAI_Data, 1749438512, 502, 1800.0)
SaveReal(NewAI_Data, 1749438512, 530, 0.0)
SaveReal(NewAI_Data, 1749438512, 531, 163.33334350585938)
SaveReal(NewAI_Data, 1749438512, 510, 0.0)
SaveReal(NewAI_Data, 1749438512, 520, 163.33334350585938)
SaveReal(NewAI_Data, 1749438512, 550, 0.0)
SaveReal(NewAI_Data, 1749438512, 511, 1800.0)
SaveReal(NewAI_Data, 1749438512, 521, 490.0)
SaveReal(NewAI_Data, 1749438512, 551, 0.0)
SaveReal(NewAI_Data, 1749438512, 512, 0.0)
SaveReal(NewAI_Data, 1749438512, 522, 326.66668701171875)
SaveReal(NewAI_Data, 1749438512, 552, 0.0)
SaveReal(NewAI_Data, 1749438512, 513, 0.0)
SaveReal(NewAI_Data, 1749438512, 523, 163.33334350585938)
SaveReal(NewAI_Data, 1749438512, 553, 0.0)
SaveReal(NewAI_Data, 1749438512, 514, 0.0)
SaveReal(NewAI_Data, 1749438512, 524, 81.66667175292969)
SaveReal(NewAI_Data, 1749438512, 554, 0.0)
SaveReal(NewAI_Data, 1749438512, 515, 0.0)
SaveReal(NewAI_Data, 1749438512, 525, 163.33334350585938)
SaveReal(NewAI_Data, 1749438512, 555, 0.0)
SaveReal(NewAI_Data, 1749438512, 516, 0.0)
SaveReal(NewAI_Data, 1749438512, 526, 163.33334350585938)
SaveReal(NewAI_Data, 1749438512, 556, 0.0)
SaveReal(NewAI_Data, 1749438512, 517, 0.0)
SaveReal(NewAI_Data, 1749438512, 527, 81.66667175292969)
SaveReal(NewAI_Data, 1749438512, 557, 0.0)
SaveReal(NewAI_Data, 1749437488, 500, 600.0)
SaveReal(NewAI_Data, 1749437488, 501, 150.0)
SaveReal(NewAI_Data, 1749437488, 502, 600.0)
SaveReal(NewAI_Data, 1749437488, 530, 90.5)
SaveReal(NewAI_Data, 1749437488, 531, 90.5)
SaveReal(NewAI_Data, 1749437488, 510, 0.0)
SaveReal(NewAI_Data, 1749437488, 520, 90.5)
SaveReal(NewAI_Data, 1749437488, 550, 90.5)
SaveReal(NewAI_Data, 1749437488, 511, 0.0)
SaveReal(NewAI_Data, 1749437488, 521, 271.5)
SaveReal(NewAI_Data, 1749437488, 551, 271.5)
SaveReal(NewAI_Data, 1749437488, 512, 600.0)
SaveReal(NewAI_Data, 1749437488, 522, 181.0)
SaveReal(NewAI_Data, 1749437488, 552, 181.0)
SaveReal(NewAI_Data, 1749437488, 513, 0.0)
SaveReal(NewAI_Data, 1749437488, 523, 90.5)
SaveReal(NewAI_Data, 1749437488, 553, 90.5)
SaveReal(NewAI_Data, 1749437488, 514, 0.0)
SaveReal(NewAI_Data, 1749437488, 524, 45.25)
SaveReal(NewAI_Data, 1749437488, 554, 45.25)
SaveReal(NewAI_Data, 1749437488, 515, 0.0)
SaveReal(NewAI_Data, 1749437488, 525, 90.5)
SaveReal(NewAI_Data, 1749437488, 555, 90.5)
SaveReal(NewAI_Data, 1749437488, 516, 0.0)
SaveReal(NewAI_Data, 1749437488, 526, 90.5)
SaveReal(NewAI_Data, 1749437488, 556, 90.5)
SaveReal(NewAI_Data, 1749437488, 517, 0.0)
SaveReal(NewAI_Data, 1749437488, 527, 45.25)
SaveReal(NewAI_Data, 1749437488, 557, 45.25)
SaveReal(NewAI_Data, 1749434672, 500, 1800.0)
SaveReal(NewAI_Data, 1749434672, 501, 600.0)
SaveReal(NewAI_Data, 1749434672, 502, 1800.0)
SaveReal(NewAI_Data, 1749434672, 530, 0.0)
SaveReal(NewAI_Data, 1749434672, 531, 225.0)
SaveReal(NewAI_Data, 1749434672, 510, 0.0)
SaveReal(NewAI_Data, 1749434672, 520, 225.0)
SaveReal(NewAI_Data, 1749434672, 550, 0.0)
SaveReal(NewAI_Data, 1749434672, 511, 0.0)
SaveReal(NewAI_Data, 1749434672, 521, 675.0)
SaveReal(NewAI_Data, 1749434672, 551, 0.0)
SaveReal(NewAI_Data, 1749434672, 512, 1800.0)
SaveReal(NewAI_Data, 1749434672, 522, 450.0)
SaveReal(NewAI_Data, 1749434672, 552, 0.0)
SaveReal(NewAI_Data, 1749434672, 513, 0.0)
SaveReal(NewAI_Data, 1749434672, 523, 225.0)
SaveReal(NewAI_Data, 1749434672, 553, 0.0)
SaveReal(NewAI_Data, 1749434672, 514, 0.0)
SaveReal(NewAI_Data, 1749434672, 524, 112.5)
SaveReal(NewAI_Data, 1749434672, 554, 0.0)
SaveReal(NewAI_Data, 1749434672, 515, 0.0)
SaveReal(NewAI_Data, 1749434672, 525, 225.0)
SaveReal(NewAI_Data, 1749434672, 555, 0.0)
SaveReal(NewAI_Data, 1749434672, 516, 0.0)
SaveReal(NewAI_Data, 1749434672, 526, 225.0)
SaveReal(NewAI_Data, 1749434672, 556, 0.0)
SaveReal(NewAI_Data, 1749434672, 517, 0.0)
SaveReal(NewAI_Data, 1749434672, 527, 112.5)
SaveReal(NewAI_Data, 1749434672, 557, 0.0)
SaveReal(NewAI_Data, 1749439280, 500, 5000.0)
SaveReal(NewAI_Data, 1749439280, 501, 1000.0)
SaveReal(NewAI_Data, 1749439280, 502, 5000.0)
SaveReal(NewAI_Data, 1749439280, 530, 0.0)
SaveReal(NewAI_Data, 1749439280, 531, 394.82757568359375)
SaveReal(NewAI_Data, 1749439280, 510, 0.0)
SaveReal(NewAI_Data, 1749439280, 520, 394.82757568359375)
SaveReal(NewAI_Data, 1749439280, 550, 0.0)
SaveReal(NewAI_Data, 1749439280, 511, 0.0)
SaveReal(NewAI_Data, 1749439280, 521, 1184.4827880859375)
SaveReal(NewAI_Data, 1749439280, 551, 0.0)
SaveReal(NewAI_Data, 1749439280, 512, 5000.0)
SaveReal(NewAI_Data, 1749439280, 522, 789.6551513671875)
SaveReal(NewAI_Data, 1749439280, 552, 0.0)
SaveReal(NewAI_Data, 1749439280, 513, 0.0)
SaveReal(NewAI_Data, 1749439280, 523, 394.82757568359375)
SaveReal(NewAI_Data, 1749439280, 553, 0.0)
SaveReal(NewAI_Data, 1749439280, 514, 0.0)
SaveReal(NewAI_Data, 1749439280, 524, 197.41378784179688)
SaveReal(NewAI_Data, 1749439280, 554, 0.0)
SaveReal(NewAI_Data, 1749439280, 515, 0.0)
SaveReal(NewAI_Data, 1749439280, 525, 394.82757568359375)
SaveReal(NewAI_Data, 1749439280, 555, 0.0)
SaveReal(NewAI_Data, 1749439280, 516, 0.0)
SaveReal(NewAI_Data, 1749439280, 526, 394.82757568359375)
SaveReal(NewAI_Data, 1749439280, 556, 0.0)
SaveReal(NewAI_Data, 1749439280, 517, 0.0)
SaveReal(NewAI_Data, 1749439280, 527, 197.41378784179688)
SaveReal(NewAI_Data, 1749439280, 557, 0.0)
SaveReal(NewAI_Data, 1749435952, 500, 10000.0)
SaveReal(NewAI_Data, 1749435952, 501, 1200.0)
SaveReal(NewAI_Data, 1749435952, 502, 10000.0)
SaveReal(NewAI_Data, 1749435952, 530, 0.0)
SaveReal(NewAI_Data, 1749435952, 531, 600.0)
SaveReal(NewAI_Data, 1749435952, 510, 0.0)
SaveReal(NewAI_Data, 1749435952, 520, 600.0)
SaveReal(NewAI_Data, 1749435952, 550, 0.0)
SaveReal(NewAI_Data, 1749435952, 511, 0.0)
SaveReal(NewAI_Data, 1749435952, 521, 1800.0)
SaveReal(NewAI_Data, 1749435952, 551, 0.0)
SaveReal(NewAI_Data, 1749435952, 512, 10000.0)
SaveReal(NewAI_Data, 1749435952, 522, 1200.0)
SaveReal(NewAI_Data, 1749435952, 552, 0.0)
SaveReal(NewAI_Data, 1749435952, 513, 0.0)
SaveReal(NewAI_Data, 1749435952, 523, 600.0)
SaveReal(NewAI_Data, 1749435952, 553, 0.0)
SaveReal(NewAI_Data, 1749435952, 514, 0.0)
SaveReal(NewAI_Data, 1749435952, 524, 300.0)
SaveReal(NewAI_Data, 1749435952, 554, 0.0)
SaveReal(NewAI_Data, 1749435952, 515, 0.0)
SaveReal(NewAI_Data, 1749435952, 525, 600.0)
SaveReal(NewAI_Data, 1749435952, 555, 0.0)
SaveReal(NewAI_Data, 1749435952, 516, 0.0)
SaveReal(NewAI_Data, 1749435952, 526, 600.0)
SaveReal(NewAI_Data, 1749435952, 556, 0.0)
SaveReal(NewAI_Data, 1749435952, 517, 0.0)
SaveReal(NewAI_Data, 1749435952, 527, 300.0)
SaveReal(NewAI_Data, 1749435952, 557, 0.0)
SaveReal(NewAI_Data, 1749437744, 500, 10000.0)
SaveReal(NewAI_Data, 1749437744, 501, 1800.0)
SaveReal(NewAI_Data, 1749437744, 502, 10000.0)
SaveReal(NewAI_Data, 1749437744, 530, 73.33333587646484)
SaveReal(NewAI_Data, 1749437744, 531, 176.6666717529297)
SaveReal(NewAI_Data, 1749437744, 510, 0.0)
SaveReal(NewAI_Data, 1749437744, 520, 176.6666717529297)
SaveReal(NewAI_Data, 1749437744, 550, 73.33333587646484)
SaveReal(NewAI_Data, 1749437744, 511, 0.0)
SaveReal(NewAI_Data, 1749437744, 521, 530.0)
SaveReal(NewAI_Data, 1749437744, 551, 220.0)
SaveReal(NewAI_Data, 1749437744, 512, 0.0)
SaveReal(NewAI_Data, 1749437744, 522, 353.3333435058594)
SaveReal(NewAI_Data, 1749437744, 552, 146.6666717529297)
SaveReal(NewAI_Data, 1749437744, 513, 10000.0)
SaveReal(NewAI_Data, 1749437744, 523, 176.6666717529297)
SaveReal(NewAI_Data, 1749437744, 553, 73.33333587646484)
SaveReal(NewAI_Data, 1749437744, 514, 0.0)
SaveReal(NewAI_Data, 1749437744, 524, 88.33333587646484)
SaveReal(NewAI_Data, 1749437744, 554, 36.66666793823242)
SaveReal(NewAI_Data, 1749437744, 515, 0.0)
SaveReal(NewAI_Data, 1749437744, 525, 176.6666717529297)
SaveReal(NewAI_Data, 1749437744, 555, 73.33333587646484)
SaveReal(NewAI_Data, 1749437744, 516, 0.0)
SaveReal(NewAI_Data, 1749437744, 526, 176.6666717529297)
SaveReal(NewAI_Data, 1749437744, 556, 73.33333587646484)
SaveReal(NewAI_Data, 1749437744, 517, 0.0)
SaveReal(NewAI_Data, 1749437744, 527, 88.33333587646484)
SaveReal(NewAI_Data, 1749437744, 557, 36.66666793823242)
SaveInteger(NewAI_Data, 1747988568, 5, 10)
SaveInteger(NewAI_Data, 1747988568, 100, 1747993925)
SaveInteger(NewAI_Data, 1747988568, 101, 1747988567)
SaveInteger(NewAI_Data, 1747988568, 102, 1747989848)
SaveInteger(NewAI_Data, 1747988568, 103, 1747992898)
SaveInteger(NewAI_Data, 1747988568, 104, 1747989296)
SaveInteger(NewAI_Data, 1747988568, 105, 1747990604)
SaveInteger(NewAI_Data, 1747988568, 106, 1747990344)
SaveInteger(NewAI_Data, 1747988568, 107, 1747990598)
SaveInteger(NewAI_Data, 1747988568, 108, 1747988569)
SaveInteger(NewAI_Data, 1747988568, 109, 1747993156)
SaveInteger(NewAI_Data, 1747993925, 5, 4)
SaveInteger(NewAI_Data, 1747993925, 100, 1747993684)
SaveInteger(NewAI_Data, 1747993925, 101, 1747993912)
SaveInteger(NewAI_Data, 1747993925, 102, 1747993683)
SaveInteger(NewAI_Data, 1747993925, 103, 1747993682)
SaveInteger(NewAI_Data, 1747988567, 5, 3)
SaveInteger(NewAI_Data, 1747988567, 100, 1747994690)
SaveInteger(NewAI_Data, 1747988567, 101, 1747994445)
SaveInteger(NewAI_Data, 1747988567, 102, 1747994192)
SaveInteger(NewAI_Data, 1747989848, 5, 2)
SaveInteger(NewAI_Data, 1747989848, 100, 1747994960)
SaveInteger(NewAI_Data, 1747989848, 101, 1749435463)
SaveInteger(NewAI_Data, 1747992898, 5, 0)
SaveInteger(NewAI_Data, 1747989296, 5, 4)
SaveInteger(NewAI_Data, 1747989296, 100, 1747993912)
SaveInteger(NewAI_Data, 1747989296, 101, 1747993684)
SaveInteger(NewAI_Data, 1747989296, 102, 1747993683)
SaveInteger(NewAI_Data, 1747989296, 103, 1747993682)
SaveInteger(NewAI_Data, 1747990604, 5, 2)
SaveInteger(NewAI_Data, 1747990604, 100, 1747993162)
SaveInteger(NewAI_Data, 1747990604, 101, 1747993657)
SaveInteger(NewAI_Data, 1747990344, 5, 4)
SaveInteger(NewAI_Data, 1747990344, 100, 1747994456)
SaveInteger(NewAI_Data, 1747990344, 101, 1747994196)
SaveInteger(NewAI_Data, 1747990344, 102, 1747994191)
SaveInteger(NewAI_Data, 1747990344, 103, 1749889330)
SaveInteger(NewAI_Data, 1747990598, 5, 2)
SaveInteger(NewAI_Data, 1747990598, 100, 1747994195)
SaveInteger(NewAI_Data, 1747990598, 101, 1749954866)
SaveInteger(NewAI_Data, 1747988569, 5, 2)
SaveInteger(NewAI_Data, 1747988569, 100, 1747988570)
SaveInteger(NewAI_Data, 1747988569, 101, 1747990359)
SaveInteger(NewAI_Data, 1747993156, 5, 0)
SaveInteger(NewAI_Data, 1747993684, 5, 0)
SaveInteger(NewAI_Data, 1747993912, 5, 0)
SaveInteger(NewAI_Data, 1747993683, 5, 0)
SaveInteger(NewAI_Data, 1747993682, 5, 0)
SaveInteger(NewAI_Data, 1747994690, 5, 0)
SaveInteger(NewAI_Data, 1747994445, 5, 0)
SaveInteger(NewAI_Data, 1747994192, 5, 0)
SaveInteger(NewAI_Data, 1747994960, 5, 0)
SaveInteger(NewAI_Data, 1749435463, 5, 0)
SaveInteger(NewAI_Data, 1747993162, 5, 0)
SaveInteger(NewAI_Data, 1747993657, 5, 0)
SaveInteger(NewAI_Data, 1747994456, 5, 0)
SaveInteger(NewAI_Data, 1747994196, 5, 0)
SaveInteger(NewAI_Data, 1747994191, 5, 0)
SaveInteger(NewAI_Data, 1749889330, 5, 0)
SaveInteger(NewAI_Data, 1747994195, 5, 0)
SaveInteger(NewAI_Data, 1749954866, 5, 0)
SaveInteger(NewAI_Data, 1747988570, 5, 1)
SaveInteger(NewAI_Data, 1747988570, 100, 1749233713)
SaveInteger(NewAI_Data, 1747990359, 5, 2)
SaveInteger(NewAI_Data, 1747990359, 100, 1749233714)
SaveInteger(NewAI_Data, 1747990359, 101, 1749828174)
SaveInteger(NewAI_Data, 1749233713, 5, 0)
SaveInteger(NewAI_Data, 1749233714, 5, 0)
SaveInteger(NewAI_Data, 1749828174, 5, 0)
    ExecuteFunc("Petain63_AIData0")
    ExecuteFunc("Petain63_AIData1")
    ExecuteFunc("Petain63_AIData2")
    ExecuteFunc("Petain63_AIData3")
    ExecuteFunc("Petain63_AIData4")
    ExecuteFunc("Petain63_AIData5")
    ExecuteFunc("Petain63_AIData6")
    ExecuteFunc("Petain63_AIData7")
    ExecuteFunc("Petain63_AIData8")
    ExecuteFunc("Petain63_AIData9")
    ExecuteFunc("Petain63_AIData10")
    ExecuteFunc("Petain63_AIData11")
    ExecuteFunc("Petain63_AIData12")
    ExecuteFunc("Petain63_AIData13")
    ExecuteFunc("Petain63_AIData14")
    ExecuteFunc("Petain63_AIData15")
    ExecuteFunc("Petain63_AIData16")
    ExecuteFunc("Petain63_AIData17")
    ExecuteFunc("Petain63_AIData18")
    ExecuteFunc("Petain63_AIData19")
    ExecuteFunc("Petain63_AIData20")
    ExecuteFunc("Petain63_AIData21")
    ExecuteFunc("Petain63_AIData22")
    ExecuteFunc("Petain63_AIData23")
    ExecuteFunc("Petain63_AIData24")
    ExecuteFunc("Petain63_AIData25")
ExecuteFunc("Italy75_AI0")
ExecuteFunc("Italy75_AI1")
ExecuteFunc("Italy75_AI2")
ExecuteFunc("Italy75_AI3")
ExecuteFunc("Italy75_AI4")
ExecuteFunc("Italy75_AI5")
ExecuteFunc("Italy75_AI6")
ExecuteFunc("Vehicles78_AI0")
ExecuteFunc("Vehicles78_AI1")
ExecuteFunc("Vehicles78_AI2")
ExecuteFunc("Vehicles78_AI3")
ExecuteFunc("Tanks79_AI0")
ExecuteFunc("Tanks79_AI1")
ExecuteFunc("Tanks79_AI2")
ExecuteFunc("Tanks79_AI3")
ExecuteFunc("Tanks79_AI4")
ExecuteFunc("Tanks79_AI5")
ExecuteFunc("Artillery81_AI0")
ExecuteFunc("Artillery81_AI1")
ExecuteFunc("Artillery81_AI2")
ExecuteFunc("Forces82_AI0")
ExecuteFunc("Forces82_AI1")
ExecuteFunc("Forces82_AI2")
ExecuteFunc("Forces82_AI3")
ExecuteFunc("Forces82_AI4")
ExecuteFunc("Forces82_AI5")
ExecuteFunc("Forces82_AI6")
ExecuteFunc("Forces82_AI7")
ExecuteFunc("Forces82_AI8")
ExecuteFunc("Forces82_AI9")
ExecuteFunc("Forces82_AI10")
ExecuteFunc("Forces82_AI11")
ExecuteFunc("Forces82_AI12")
end
