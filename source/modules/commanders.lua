function Agent_Value(target)
    if HaveSavedInteger(Bounty_Data, GetHandleId(target), 90) then
        do return LoadInteger(Bounty_Data, GetHandleId(target), 90) end
    end
    if (GetUnitTypeId(target) == 1749242933) then
        do return 150 end
    end
    do return IMaxBJ(0, GetUnitPointValue(target)) end
end

function Agent_Valid(u, target)
    local dx = 0.0
    local dy = 0.0
    local owner = 0
    if (((target == nil) or (GetWidgetLife(target) <= 0.4050000011920929)) or IsUnitHidden(target)) then
        do return false end
    end
    owner = GetPlayerId(GetOwningPlayer(target))
    dx = J88_real(GetUnitX(target) - GetUnitX(u))
    dy = J88_real(GetUnitY(target) - GetUnitY(u))
    do return ((((((((((((owner >= 9) and (owner <= 16)) or ((owner == 18) and (CavalryCharge_Mode == 2))) and IsUnitEnemy(target, GetOwningPlayer(u))) and IsUnitVisible(target, GetOwningPlayer(u))) and IsUnitType(target, UNIT_TYPE_MECHANICAL)) and (not IsUnitType(target, UNIT_TYPE_STRUCTURE))) and (not IsUnitType(target, UNIT_TYPE_FLYING))) and (GetUnitAbilityLevel(target, 1098282348) == 0)) and (GetUnitAbilityLevel(target, 1097625443) == 0)) and (not BlzIsUnitInvulnerable(target))) and (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= 4840000.0)) end
end

function Agent_Release(u)
    local key = GetHandleId(u)
    local target = LoadUnitHandle(Agent_Data, key, 0)
    local slot = LoadInteger(Agent_Data, key, 1)
    if ((target ~= nil) and (LoadUnitHandle(Agent_Data, GetHandleId(target), slot) == u)) then
        RemoveSavedHandle(Agent_Data, GetHandleId(target), slot)
    end
    RemoveSavedHandle(Agent_Data, key, 0)
    target = nil
end

function Agent_Find(u)
    local v = nil
    local best = nil
    local reserved = nil
    local value = 0
    local bestValue = J88_int(-1)
    local distance = 0.0
    local bestDistance = 1000000000.0
    local dx = 0.0
    local dy = 0.0
    local slot = J88_int(100 + GetPlayerId(GetOwningPlayer(u)))
    GroupEnumUnitsInRange(Agent_Search, GetUnitX(u), GetUnitY(u), 1600.0, nil)
    while true do
        v = FirstOfGroup(Agent_Search)
        if (v == nil) then break end
        GroupRemoveUnit(Agent_Search, v)
        reserved = LoadUnitHandle(Agent_Data, GetHandleId(v), slot)
        if ((Agent_Valid(u, v) and (((reserved == nil) or (GetWidgetLife(reserved) <= 0.4050000011920929)) or IsUnitInGroup(reserved, Agent_Spent))) and (v ~= LoadUnitHandle(Agent_Data, GetHandleId(u), 5))) then
            value = Agent_Value(v)
            dx = J88_real(GetUnitX(v) - GetUnitX(u))
            dy = J88_real(GetUnitY(v) - GetUnitY(u))
            distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if ((value > bestValue) or ((value == bestValue) and ((distance < bestDistance) or ((distance == bestDistance) and (GetHandleId(v) < GetHandleId(best)))))) then
                best = v
                bestValue = value
                bestDistance = distance
            end
        end
    end
    if (best ~= nil) then
        SaveBoolean(Agent_Data, GetHandleId(u), 7, false)
        SaveUnitHandle(Agent_Data, GetHandleId(best), slot, u)
        SaveUnitHandle(Agent_Data, GetHandleId(u), 0, best)
        SaveInteger(Agent_Data, GetHandleId(u), 1, slot)
        SaveReal(Agent_Data, GetHandleId(u), 2, GetUnitX(u))
        SaveReal(Agent_Data, GetHandleId(u), 3, GetUnitY(u))
        SaveInteger(Agent_Data, GetHandleId(u), 4, 0)
    end
    reserved = nil
    v = nil
    do return best end
end

function Agent_Tick()
    local u = nil
    local target = nil
    local key = 0
    local dx = 0.0
    local dy = 0.0
    local stuck = 0
    GroupAddGroup(Agent_Units, Agent_Work)
    while true do
        u = FirstOfGroup(Agent_Work)
        if (u == nil) then break end
        GroupRemoveUnit(Agent_Work, u)
        key = GetHandleId(u)
        if ((GetUnitTypeId(u) == 0) or (GetWidgetLife(u) <= 0.4050000011920929)) then
            Agent_Release(u)
            GroupRemoveUnit(Agent_Units, u)
            GroupRemoveUnit(Agent_Spent, u)
            FlushChildHashtable(Agent_Data, key)
        elseif IsUnitInGroup(u, Agent_Spent) then
            Agent_Release(u)
        elseif (((((CavalryCharge_Mode ~= 0) and (COUNTDOWN_TICK_TIMER == nil)) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd))) and (not IsUnitHidden(u))) and (not IsUnitPaused(u))) then
            target = LoadUnitHandle(Agent_Data, key, 0)
            if ((not Agent_Valid(u, target)) or (LoadInteger(Agent_Data, key, 1) ~= J88_int(100 + GetPlayerId(GetOwningPlayer(u))))) then
                Agent_Release(u)
                target = Agent_Find(u)
            end
            if (target ~= nil) then
                dx = J88_real(GetUnitX(target) - GetUnitX(u))
                dy = J88_real(GetUnitY(target) - GetUnitY(u))
                if (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) <= 22500.0) then
                    --  Mark and decloak before damage callbacks can reenter.
                    GroupAddUnit(Agent_Spent, u)
                    UnitRemoveAbility(u, 1097886070)
                    SetUnitAcquireRange(u, 525.0)
                    SetUnitAnimation(u, "attack")
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", target, "origin"))
                    UnitDamageTarget(u, target, 200.0, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
                    Agent_Release(u)
                    FlushChildHashtable(Agent_Data, key)
                    IssuePointOrder(u, "attack", 0.0, 0.0)
                else
                    dx = J88_real(GetUnitX(u) - LoadReal(Agent_Data, key, 2))
                    dy = J88_real(GetUnitY(u) - LoadReal(Agent_Data, key, 3))
                    stuck = LoadInteger(Agent_Data, key, 4)
                    if (J88_real(J88_real(dx * dx) + J88_real(dy * dy)) < 64.0) then
                        stuck = J88_int(stuck + 1)
                    else
                        stuck = 0
                    end
                    SaveReal(Agent_Data, key, 2, GetUnitX(u))
                    SaveReal(Agent_Data, key, 3, GetUnitY(u))
                    SaveInteger(Agent_Data, key, 4, stuck)
                    if (stuck >= 16) then
                        SaveUnitHandle(Agent_Data, key, 5, target)
                        SaveInteger(Agent_Data, key, 6, 20)
                        Agent_Release(u)
                    else
                        IssuePointOrder(u, "move", GetUnitX(target), GetUnitY(target))
                    end
                end
            elseif (not LoadBoolean(Agent_Data, key, 7)) then
                IssuePointOrder(u, "attack", 0.0, 0.0)
                SaveBoolean(Agent_Data, key, 7, true)
            end
            if (LoadInteger(Agent_Data, key, 6) > 0) then
                SaveInteger(Agent_Data, key, 6, J88_int(LoadInteger(Agent_Data, key, 6) - 1))
            else
                RemoveSavedHandle(Agent_Data, key, 5)
            end
        else
            Agent_Release(u)
        end
    end
    if (FirstOfGroup(Agent_Units) == nil) then
        PauseTimer(Agent_Timer)
    end
    u = nil
    target = nil
end

function Agent_Register(u)
    if ((GetUnitTypeId(u) == 1749108529) and (Agent_Data ~= nil)) then
        if IsUnitInGroup(u, Agent_Spent) then
            UnitRemoveAbility(u, 1097886070)
            SetUnitAcquireRange(u, 525.0)
        else
            UnitAddAbility(u, 1097886070)
            UnitMakeAbilityPermanent(u, true, 1097886070)
            SetUnitAcquireRange(u, 0.0)
        end
        if (FirstOfGroup(Agent_Units) == nil) then
            TimerStart(Agent_Timer, 0.5, true, Agent_Tick)
        end
        GroupAddUnit(Agent_Units, u)
    end
end

function Agent_Init()
    Agent_Data = InitHashtable()
    Agent_Units = CreateGroup()
    Agent_Work = CreateGroup()
    Agent_Search = CreateGroup()
    Agent_Spent = CreateGroup()
    Agent_Timer = CreateTimer()
end

function CM67_Load()
    SaveInteger(CM67_Data, 1747988567, 101, 1747994690)
    SaveInteger(CM67_Data, 1747994690, 0, 1747988567)
    SaveInteger(CM67_Data, 1747994690, 1, 0)
    SaveInteger(CM67_Data, 1747994690, 2, 12000)
    SaveStr(CM67_Data, 1747994690, 3, "Bernard Montgomery")
    SaveStr(CM67_Data, 1747994690, 4, "war3mapImported\\BTNBernardMontgomery.blp")
    SaveStr(CM67_Data, 1747994690, 5, "|cFFFFC850Special:|r Deploy Montgomery, 3 SAS squads and 6 Matilda tanks. Montgomery supports nearby troops with his aura.")
    SaveInteger(CM67_Data, 1747988567, 102, 1747994445)
    SaveInteger(CM67_Data, 1747994445, 0, 1747988567)
    SaveInteger(CM67_Data, 1747994445, 1, 0)
    SaveInteger(CM67_Data, 1747994445, 2, 6000)
    SaveStr(CM67_Data, 1747994445, 3, "Alan Turing")
    SaveStr(CM67_Data, 1747994445, 4, "ReplaceableTextures\\CommandButtons\\BTNElfVillager.blp")
    SaveStr(CM67_Data, 1747994445, 5, "|cFFFFC850Special:|r Gain full vision of your opponents.")
    SaveInteger(CM67_Data, 1747988567, 103, 1747994192)
    SaveInteger(CM67_Data, 1747994192, 0, 1747988567)
    SaveInteger(CM67_Data, 1747994192, 1, 0)
    SaveInteger(CM67_Data, 1747994192, 2, 6000)
    SaveStr(CM67_Data, 1747994192, 3, "Dwight Eisenhower")
    SaveStr(CM67_Data, 1747994192, 4, "war3mapImported\\BTNDwightEisenhower.blp")
    SaveStr(CM67_Data, 1747994192, 5, "|cFFFFC850Special:|r Receive an American builder and gain access to American reinforcements.")
    SaveInteger(CM67_Data, 1747989848, 101, 1747994960)
    SaveInteger(CM67_Data, 1747994960, 0, 1747989848)
    SaveInteger(CM67_Data, 1747994960, 1, 0)
    SaveInteger(CM67_Data, 1747994960, 2, 0)
    SaveStr(CM67_Data, 1747994960, 3, "President Philippe Petain")
    SaveStr(CM67_Data, 1747994960, 4, "ReplaceableTextures\\CommandButtons\\BTNFrancePetain.blp")
    SaveStr(CM67_Data, 1747994960, 5, "|cFFFFC850Special:|r Receive a Vichy Builder with German units. German construction and upgrades cost an extra 500 Blood Points.|n|n|cFFFFC850Final Battle:|r Unlock Maginot Line for 6000 Blood Points (up to 2): 10000 hitpoints, 0 Fortified armor, four anti-tank guns and four machine guns with 1800 range; every 8 seconds it taunts enemies within 1000 into attacking it.")
    SaveInteger(CM67_Data, 1747989848, 102, 1749435463)
    SaveInteger(CM67_Data, 1749435463, 0, 1747989848)
    SaveInteger(CM67_Data, 1749435463, 1, 0)
    SaveInteger(CM67_Data, 1749435463, 2, 0)
    SaveStr(CM67_Data, 1749435463, 3, "General Charles de Gaulle")
    SaveStr(CM67_Data, 1749435463, 4, "ReplaceableTextures\\CommandButtons\\BTNFranceDeGaulle.blp")
    SaveStr(CM67_Data, 1749435463, 5, "|cFFFFC850Special:|r Unlock Panhard 178 47mm (900 Blood Points), Lorraine 37L (500), AMX 50 100 (4500) and AMX 50 Surblinde (4000) upgrades.|n|n|cFFFFC850Final Battle:|r Unlock FCM F1 for 12000 Blood Points.")
    SaveInteger(CM67_Data, 1747989296, 101, 1747993912)
    SaveInteger(CM67_Data, 1747993912, 0, 1747989296)
    SaveInteger(CM67_Data, 1747993912, 1, 0)
    SaveInteger(CM67_Data, 1747993912, 2, 6000)
    SaveStr(CM67_Data, 1747993912, 3, "Hermann Goring")
    SaveStr(CM67_Data, 1747993912, 4, "war3mapImported\\BTNGoring.blp")
    SaveStr(CM67_Data, 1747993912, 5, "|cFFFFC850Special:|r Unlock advanced aircraft, stealth bombers and the nuclear-armed Amerika Bomber. Requires the aircraft command unlock.")
    SaveInteger(CM67_Data, 1747989296, 102, 1747993684)
    SaveInteger(CM67_Data, 1747993684, 0, 1747989296)
    SaveInteger(CM67_Data, 1747993684, 1, 0)
    SaveInteger(CM67_Data, 1747993684, 2, 0)
    SaveStr(CM67_Data, 1747993684, 3, "Adolf Hitler")
    SaveStr(CM67_Data, 1747993684, 4, "war3mapImported\\BTNHitlerparody.blp")
    SaveStr(CM67_Data, 1747993684, 5, "|cFFFFC850Special:|r Receive an additional builder with access to German experimental weapons.")
    SaveInteger(CM67_Data, 1747989296, 103, 1747993683)
    SaveInteger(CM67_Data, 1747993683, 0, 1747989296)
    SaveInteger(CM67_Data, 1747993683, 1, 0)
    SaveInteger(CM67_Data, 1747993683, 2, 0)
    SaveStr(CM67_Data, 1747993683, 3, "Heinrich Himmler")
    SaveStr(CM67_Data, 1747993683, 4, "war3mapImported\\BTNMemeHimmler.blp")
    SaveStr(CM67_Data, 1747993683, 5, "|cFFFFC850Strength:|r Unlock Ubermensch and cheaper SS infantry.|n|n|cFFFFC850Weakness:|r Lose access to Wehrmacht units. Existing incompatible forces are refunded.")
    SaveInteger(CM67_Data, 1747989296, 104, 1747993682)
    SaveInteger(CM67_Data, 1747993682, 0, 1747989296)
    SaveInteger(CM67_Data, 1747993682, 1, 0)
    SaveInteger(CM67_Data, 1747993682, 2, 0)
    SaveStr(CM67_Data, 1747993682, 3, "Erwin Rommel")
    SaveStr(CM67_Data, 1747993682, 4, "war3mapImported\\BTNChadRommel.blp")
    SaveStr(CM67_Data, 1747993682, 5, "|cFFFFC850Strength:|r Unlock the Afrika Korps and improved Wehrmacht forces. Receive the Afrika Korps builder.|n|n|cFFFFC850Weakness:|r Lose access to SS units. Existing incompatible forces are refunded.")
    SaveInteger(CM67_Data, 1747990344, 101, 1747994456)
    SaveInteger(CM67_Data, 1747994456, 0, 1747990344)
    SaveInteger(CM67_Data, 1747994456, 1, 0)
    SaveInteger(CM67_Data, 1747994456, 2, 10000)
    SaveStr(CM67_Data, 1747994456, 3, "George S. Patton")
    SaveStr(CM67_Data, 1747994456, 4, "war3mapImported\\BTNGeorgeSPatton.blp")
    SaveStr(CM67_Data, 1747994456, 5, "|cFFFFC850Special:|r Deploy Patton and 6 Veteran Sherman tanks. Patton supports nearby troops with his patriotic aura.")
    SaveInteger(CM67_Data, 1747990344, 102, 1747994196)
    SaveInteger(CM67_Data, 1747994196, 0, 1747990344)
    SaveInteger(CM67_Data, 1747994196, 1, 0)
    SaveInteger(CM67_Data, 1747994196, 2, 12000)
    SaveStr(CM67_Data, 1747994196, 3, "Chester Nimitz")
    SaveStr(CM67_Data, 1747994196, 4, "war3mapImported\\BTNChesterNimitz.blp")
    SaveStr(CM67_Data, 1747994196, 5, "|cFFFFC850Special:|r Gain coastal bombardment during your battles and deploy 12 SBD Dauntless naval bombers.")
    SaveInteger(CM67_Data, 1747990344, 103, 1747994191)
    SaveInteger(CM67_Data, 1747994191, 0, 1747990344)
    SaveInteger(CM67_Data, 1747994191, 1, 0)
    SaveInteger(CM67_Data, 1747994191, 2, 6000)
    SaveStr(CM67_Data, 1747994191, 3, "Dwight Eisenhower")
    SaveStr(CM67_Data, 1747994191, 4, "war3mapImported\\BTNDwightEisenhower.blp")
    SaveStr(CM67_Data, 1747994191, 5, "|cFFFFC850Special:|r Receive a British builder and gain access to British reinforcements.")
    SaveInteger(CM67_Data, 1747990344, 104, 1749889330)
    SaveInteger(CM67_Data, 1749889330, 0, 1747990344)
    SaveInteger(CM67_Data, 1749889330, 1, 0)
    SaveInteger(CM67_Data, 1749889330, 2, 0)
    SaveStr(CM67_Data, 1749889330, 3, "Douglas MacArthur")
    SaveStr(CM67_Data, 1749889330, 4, "war3mapImported\\BTNMacArthur.blp")
    SaveStr(CM67_Data, 1749889330, 5, "|cFFFFC850Special:|r Free commander with Essex-class carrier support. Upgrade MacArthur up to Level 5: Level 2 and 3 cost 2000 Blood Points each, Level 4 costs 3000 and Level 5 costs 4000. Select MacArthur's aircraft carrier building to use his reinforcement abilities.|n|cFFFFC850Level 1:|r No reinforcements.|n|cFFFFC850Level 2:|r F4F Reinforcements, 3 F4F Wildcats (40 mana).|n|cFFFFC850Level 3:|r F6F Reinforcements, 3 F6F Hellcats (40 mana); replaces F4F Reinforcements.|n|cFFFFC850Level 4:|r SB2C Precision Strike, 4000 damage to one enemy ground unit (60 mana).|n|cFFFFC850Level 5:|r SB2C Group Strike, 3 precision strikes every 2 seconds for 8 seconds on the most valuable enemy ground units in a 500 radius (120 mana).|n|nThe carrier holds 120 mana. Aircraft last for the current battle.")
    SaveInteger(CM67_Data, 1747990598, 101, 1747994195)
    SaveInteger(CM67_Data, 1747994195, 0, 1747990598)
    SaveInteger(CM67_Data, 1747994195, 1, 0)
    SaveInteger(CM67_Data, 1747994195, 2, 12000)
    SaveStr(CM67_Data, 1747994195, 3, "Isoroku Yamamoto")
    SaveStr(CM67_Data, 1747994195, 4, "war3mapImported\\BTNYamamoto.blp")
    SaveStr(CM67_Data, 1747994195, 5, "|cFFFFC850Special:|r Gain coastal bombardment during your battles and deploy 12 Aichi D3A naval bombers.")
    SaveInteger(CM67_Data, 1747990598, 102, 1749954866)
    SaveInteger(CM67_Data, 1749954866, 0, 1747990598)
    SaveInteger(CM67_Data, 1749954866, 1, 0)
    SaveInteger(CM67_Data, 1749954866, 2, 10000)
    SaveStr(CM67_Data, 1749954866, 3, "Chuichi Nagumo")
    SaveStr(CM67_Data, 1749954866, 4, "war3mapImported\\BTNNagumo.blp")
    SaveStr(CM67_Data, 1749954866, 5, "|cFFFFC850Special:|r IJN Akagi carrier support. Call 5 A6M Zero fighters to a target location during your battles. Aircraft last for the current battle.")
    SaveInteger(CM67_Data, 1747990604, 101, 1747993162)
    SaveInteger(CM67_Data, 1747993162, 0, 1747990604)
    SaveInteger(CM67_Data, 1747993162, 1, 0)
    SaveInteger(CM67_Data, 1747993162, 2, 10000)
    SaveStr(CM67_Data, 1747993162, 3, "Destroyer ORP Piorun")
    SaveStr(CM67_Data, 1747993162, 4, "war3mapImported\\IconShip3.blp")
    SaveStr(CM67_Data, 1747993162, 5, "|cFFFFC850Special:|r ORP Piorun inspires patriotic pride, increasing attack speed by 35%.")
    SaveInteger(CM67_Data, 1747990604, 102, 1747993657)
    SaveInteger(CM67_Data, 1747993657, 0, 1747990604)
    SaveInteger(CM67_Data, 1747993657, 1, 0)
    SaveInteger(CM67_Data, 1747993657, 2, 4000)
    SaveStr(CM67_Data, 1747993657, 3, "Polish Soviet State")
    SaveStr(CM67_Data, 1747993657, 4, "war3mapImported\\BTNSovietUnion.blp")
    SaveStr(CM67_Data, 1747993657, 5, "|cFFFFC850Special:|r Receive a Soviet builder and gain access to Soviet weaponry.")
    SaveInteger(CM67_Data, 1747990604, 103, PL_MACZEK)
    SaveInteger(CM67_Data, PL_MACZEK, 0, 1747990604)
    SaveInteger(CM67_Data, PL_MACZEK, 1, 0)
    SaveInteger(CM67_Data, PL_MACZEK, 2, 10000)
    SaveStr(CM67_Data, PL_MACZEK, 3, "Stanislaw Maczek")
    SaveStr(CM67_Data, PL_MACZEK, 4, "ReplaceableTextures\\CommandButtons\\BTNPolishMaczek.blp")
    SaveStr(CM67_Data, PL_MACZEK, 5, "|cFFFFC850Special:|r Every battle, deploy Maczek's command Cromwell with 4 Shermans and 2 Sherman Fireflies (7 tanks). The command tank gives friendly units within 5000 +1 armour and +20% movement speed.|n|n|cFFFFC850Mark Target:|r select the commander building to mark an enemy on your battlefield: it takes 30% more damage for 6 seconds (40 mana, 6-second cooldown, 120 mana).|n|n|cFFFFC850Cost:|r 10000 Blood Points.")
    SaveInteger(CM67_Data, 1747993156, 101, ZK_HQ)
    SaveInteger(CM67_Data, ZK_HQ, 0, 1747993156)
    SaveInteger(CM67_Data, ZK_HQ, 1, 0)
    SaveInteger(CM67_Data, ZK_HQ, 2, 5000)
    SaveStr(CM67_Data, ZK_HQ, 3, "Georgy Zhukov")
    SaveStr(CM67_Data, ZK_HQ, 4, "ReplaceableTextures\\CommandButtons\\BTNZhukovCommander.blp")
    SaveStr(CM67_Data, ZK_HQ, 5, "|cFFFFC850Strength:|r Existing and newly built T-34 tanks become T-34-85 tanks at no additional cost. SU-85 tank destroyers become SU-100s. Unlock T-60 support for standard infantry squads, IS-7 heavy tanks, ISU-152 assault guns and T-28 infantry-support tanks.|n|n|cFFFFC850Weakness:|r Partisans and cavalry are unavailable; existing formations are refunded. Aircraft purchases and upgrades cost 30% more.|n|n|cFFFFC850Cost:|r 5000 Blood Points.")
    SaveInteger(CM67_Data, 1747988570, 101, 1749233713)
    SaveInteger(CM67_Data, 1749233713, 0, 1747988570)
    SaveInteger(CM67_Data, 1749233713, 1, 0)
    SaveInteger(CM67_Data, 1749233713, 2, 0)
    SaveStr(CM67_Data, 1749233713, 3, "Chiang Kai-shek (Unavailable)")
    SaveStr(CM67_Data, 1749233713, 4, "ReplaceableTextures\\CommandButtons\\BTNChiangKaiShek.blp")
    SaveStr(CM67_Data, 1749233713, 5, "|cFFFFC850Special:|r This commander is unavailable.")
    SaveInteger(CM67_Data, 1747990359, 101, 1749233714)
    SaveInteger(CM67_Data, 1749233714, 0, 1747990359)
    SaveInteger(CM67_Data, 1749233714, 1, 0)
    SaveInteger(CM67_Data, 1749233714, 2, 3000)
    SaveStr(CM67_Data, 1749233714, 3, "Chairman Mao")
    SaveStr(CM67_Data, 1749233714, 4, "ReplaceableTextures\\CommandButtons\\BTNMaoZedong.blp")
    SaveStr(CM67_Data, 1749233714, 5, "|cFFFFC850Special:|r Battle Blood Points rewards increase by 8%.|n|n|cFFFFC850Infantry:|r Gain 5% evasion, +10% attack speed and +10% attack damage.|n|n|cFFFFC850Capture:|r Recruitment chance increases from 6% to 10%. Bonus enemies and previously recruited units cannot be recruited.")
    SaveInteger(CM67_Data, 1747990359, 102, 1749828174)
    SaveInteger(CM67_Data, 1749828174, 0, 1747990359)
    SaveInteger(CM67_Data, 1749828174, 1, 0)
    SaveInteger(CM67_Data, 1749828174, 2, 3000)
    SaveStr(CM67_Data, 1749828174, 3, "Lin Biao")
    SaveStr(CM67_Data, 1749828174, 4, "ReplaceableTextures\\CommandButtons\\BTNLinBiao.blp")
    SaveStr(CM67_Data, 1749828174, 5, "|cFFFFC850Artillery:|r +15% attack damage and +15% attack speed. A 20% chance to fire a second shell after hitting an enemy.|n|n|cFFFFC850Special:|r Existing Mountain Gun buildings are removed and fully refunded. New Mountain Guns cost 1500 Blood Points.|n|nUpgrade Mountain Guns to Type 4 150mm Howitzers for 1000 Blood Points.")
end

function CM67_Frame(key)
    do return LoadFrameHandle(CM67_Frames, 0, key) end
end

function CM67_Parent(t)
    local parent = LoadInteger(CM67_Data, t, 0)
    if (parent ~= 0) then
        do return parent end
    end
    do return t end
end

function CM67_Option(parent, index)
    if ((index < 1) or (index > 4)) then
        do return 0 end
    end
    do return LoadInteger(CM67_Data, parent, J88_int(100 + index)) end
end

function CM67_Status(pid, t)
    local flag = CM67_Flag[pid]
    local parent = CM67_Parent(GetUnitTypeId(flag))
    local costG = LoadInteger(CM67_Data, t, 1)
    local costB = LoadInteger(CM67_Data, t, 2)
    flag = nil
    if (CM67_Chosen[pid] ~= 0) then
        do return "A commander has already been selected." end
    elseif (CM67_Pending[pid] ~= 0) then
        do return "Appointing commander..." end
    elseif ((parent == 1747989296) and (udg_int_CurVsRound < 2)) then
        do return "Commanders unlock in Round 2." end
    elseif (t == 0) then
        do return "No commanders are available for this nation." end
    elseif (t == 1749233713) then
        do return "This commander is unavailable." end
    elseif (GetWidgetLife(CM67_Flag[pid]) <= 0.4050000011920929) then
        do return "Your headquarters is unavailable." end
    elseif (GetUnitCurrentOrder(CM67_Flag[pid]) ~= 0) then
        do return "Your headquarters is busy." end
    elseif ((GetPlayerState(Player(pid), PLAYER_STATE_RESOURCE_GOLD) < costG) or (GetPlayerState(Player(pid), PLAYER_STATE_RESOURCE_LUMBER) < costB)) then
        do return "Not enough resources." end
    elseif (not NewAI_CanBuy(pid, t, CM67_Flag[pid])) then
        do return "This commander is not available yet." end
    end
    do return "Ready to purchase." end
end

function CM67_Request(pid, index)
    local flag = nil
    local parent = 0
    local t = 0
    if (((not Nation58_ValidHuman(pid)) or (not Nation58_Done[pid])) or DifficultyChoice_Pending) then
        do return false end
    end
    flag = CM67_Flag[pid]
    parent = GetUnitTypeId(flag)
    t = CM67_Option(parent, index)
    if ((((((flag == nil) or (GetOwningPlayer(flag) ~= Player(pid))) or (t == 0)) or (CM67_Chosen[pid] ~= 0)) or (CM67_Pending[pid] ~= 0)) or (parent == 1747989848)) then
        flag = nil
        do return false end
    end
    if (CM67_Status(pid, t) ~= "Ready to purchase.") then
        CM67_Error[pid] = 1
        flag = nil
        do return false end
    end
    CM67_Pending[pid] = t
    CM67_Ticks[pid] = 0
    CM67_Error[pid] = 0
    --  The native upgrade owns the payment, refund and all existing route callbacks.
    if (not IssueImmediateOrderById(flag, t)) then
        CM67_Pending[pid] = 0
        CM67_Error[pid] = 1
        flag = nil
        do return false end
    end
    flag = nil
    do return true end
end

function CM67_OnSync()
    local data = BlzGetTriggerSyncData()
    local index = S2I(data)
    if ((((BlzGetTriggerSyncPrefix() == "WW2Commander67") and (data == I2S(index))) and (index >= 1)) and (index <= 4)) then
        CM67_Request(GetPlayerId(GetTriggerPlayer()), index)
    end
end

function CM67_OnUpgrade()
    local flag = GetTriggerUnit()
    local pid = GetPlayerId(GetOwningPlayer(flag))
    local t = GetUnitTypeId(flag)
    if ((pid >= 0) and (pid < 8)) then
        if ((GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_FINISH) and (LoadInteger(CM67_Data, t, 0) ~= 0)) then
            CM67_Flag[pid] = flag
            CM67_Chosen[pid] = t
            CM67_Pending[pid] = 0
            CM67_Error[pid] = 0
        elseif ((GetTriggerEventId() == EVENT_PLAYER_UNIT_UPGRADE_CANCEL) and (flag == CM67_Flag[pid])) then
            CM67_Pending[pid] = 0
            CM67_Error[pid] = 1
        end
    end
    flag = nil
end

function CM67_Layout()
    local x = 0.11999999731779099
    local y = 0.19499999284744263
    local width = 0.5600000023841858
    local height = 0.3499999940395355
    local font = 0.008999999612569809
    local i = 1
    local top = 0.0
    if CM67_Large then
        x = 0.03500000014901161
        y = 0.14499999582767487
        width = 0.7300000190734863
        height = 0.4000000059604645
        font = 0.010999999940395355
    end
    top = J88_real(y + height)
    UI5_Box(CM67_Frame(1), x, y, width, height)
    UI5_Box(CM67_Frame(2), J88_real(x + 0.014000000432133675), J88_real(top - 0.03799999877810478), J88_real(width - 0.22499999403953552), 0.024000000208616257)
    UI5_Box(CM67_Frame(3), J88_real(J88_real(x + width) - 0.19599999487400055), J88_real(top - 0.03799999877810478), 0.08699999749660492, 0.024000000208616257)
    UI5_Box(CM67_Frame(4), J88_real(J88_real(x + width) - 0.10100000351667404), J88_real(top - 0.03799999877810478), 0.08699999749660492, 0.024000000208616257)
    while true do
        if (i > 4) then break end
        UI5_Box(CM67_Frame(J88_int(20 + i)), J88_real(x + 0.009999999776482582), J88_real(J88_real(top - 0.05400000140070915) - J88_real(I2R(i) * 0.05700000002980232)), 0.1850000023841858, 0.05000000074505806)
        UI5_Box(CM67_Frame(J88_int(30 + i)), J88_real(x + 0.020999999716877937), J88_real(J88_real(top - 0.04800000041723251) - J88_real(I2R(i) * 0.05700000002980232)), 0.03200000151991844, 0.03200000151991844)
        UI5_Box(CM67_Frame(J88_int(40 + i)), J88_real(x + 0.05900000035762787), J88_real(J88_real(top - 0.05000000074505806) - J88_real(I2R(i) * 0.05700000002980232)), 0.12200000137090683, 0.039000000804662704)
        i = J88_int(i + 1)
    end
    UI5_Box(CM67_Frame(5), J88_real(x + 0.20999999344348907), J88_real(top - 0.10300000011920929), J88_real(width - 0.2280000001192093), 0.05000000074505806)
    UI5_Box(CM67_Frame(6), J88_real(x + 0.20999999344348907), J88_real(y + 0.09000000357627869), J88_real(width - 0.2280000001192093), J88_real(height - 0.20000000298023224))
    BlzFrameSetFont(CM67_Frame(6), "Fonts\\FRIZQT__.TTF", font, 0)
    BlzFrameSetTextAlignment(CM67_Frame(6), TEXT_JUSTIFY_TOP, TEXT_JUSTIFY_LEFT)
    UI5_Box(CM67_Frame(7), J88_real(x + 0.20999999344348907), J88_real(y + 0.05999999865889549), J88_real(width - 0.2280000001192093), 0.024000000208616257)
    UI5_Box(CM67_Frame(8), J88_real(J88_real(x + width) - 0.14499999582767487), J88_real(y + 0.014000000432133675), 0.12700000405311584, 0.032999999821186066)
    UI5_Box(CM67_Frame(9), J88_real(x + 0.014000000432133675), J88_real(y + 0.014000000432133675), J88_real(width - 0.1720000058412552), 0.03700000047683716)
end

function CM67_Render()
    local pid = GetPlayerId(GetLocalPlayer())
    local parent = 0
    local i = 1
    local t = 0
    local selected = 0
    local show = false
    local cost = nil
    local status = nil
    UI70_Entries()
    if ((pid < 0) or (pid >= 8)) then
        BlzFrameSetVisible(CM67_Frame(0), false)
        BlzFrameSetVisible(CM67_Frame(1), false)
        do return end
    end
    show = ((Nation58_ValidHuman(pid) and Nation58_Done[pid]) and (not DifficultyChoice_Pending))
    parent = CM67_Parent(GetUnitTypeId(CM67_Flag[pid]))
    BlzFrameSetVisible(CM67_Frame(0), show)
    if (show and (not CM67_Announced)) then
        CM67_Announced = true
        i = 1
        while true do
            if (i > 4) then break end
            if ((CM67_Option(parent, i) == CM67_Chosen[pid]) and (CM67_Chosen[pid] ~= 0)) then
                CM67_Index = i
            end
            i = J88_int(i + 1)
        end
    end
    if (((show and (parent == 1747989296)) and (udg_int_CurVsRound >= 2)) and (not CM67_GermanNotice)) then
        CM67_GermanNotice = true
    end
    if ((CM67_Chosen[pid] ~= 0) and (not CM68_SelectionSeen)) then
        CM68_SelectionSeen = true
        CM67_Open = false
    end
    BlzFrameSetVisible(CM67_Frame(1), (show and CM67_Open))
    if ((not show) or (not CM67_Open)) then
        do return end
    end
    i = 1
    --  Only presentation changes below this point; no local game-state writes.
    BlzFrameSetText(CM67_Frame(2), "Commanders")
    if CM67_Large then
        BlzFrameSetText(CM67_Frame(3), "Shrink")
    else
        BlzFrameSetText(CM67_Frame(3), "Enlarge")
    end
    while true do
        if (i > 4) then break end
        t = CM67_Option(parent, i)
        BlzFrameSetVisible(CM67_Frame(J88_int(20 + i)), (t ~= 0))
        BlzFrameSetVisible(CM67_Frame(J88_int(30 + i)), (t ~= 0))
        BlzFrameSetVisible(CM67_Frame(J88_int(40 + i)), (t ~= 0))
        if (t ~= 0) then
            BlzFrameSetTexture(CM67_Frame(J88_int(30 + i)), LoadStr(CM67_Data, t, 4), 0, true)
            if (i == CM67_Index) then
                BlzFrameSetText(CM67_Frame(J88_int(40 + i)), J88_concat(J88_concat("|cffffcc00", LoadStr(CM67_Data, t, 3)), "|r"))
            else
                BlzFrameSetText(CM67_Frame(J88_int(40 + i)), LoadStr(CM67_Data, t, 3))
            end
        end
        i = J88_int(i + 1)
    end
    selected = CM67_Option(parent, CM67_Index)
    if (selected == 0) then
        CM67_Index = 1
        selected = CM67_Option(parent, 1)
    end
    if (selected ~= 0) then
        BlzFrameSetText(CM67_Frame(5), J88_concat(J88_concat("|cffffcc00", LoadStr(CM67_Data, selected, 3)), "|r"))
        BlzFrameSetText(CM67_Frame(6), LoadStr(CM67_Data, selected, 5))
        cost = "Free"
        if ((LoadInteger(CM67_Data, selected, 1) ~= 0) or (LoadInteger(CM67_Data, selected, 2) ~= 0)) then
            cost = J88_concat(J88_concat(J88_concat(I2S(LoadInteger(CM67_Data, selected, 1)), " Gold, "), I2S(LoadInteger(CM67_Data, selected, 2))), " Blood Points")
            if (LoadInteger(CM67_Data, selected, 1) == 0) then
                cost = J88_concat(I2S(LoadInteger(CM67_Data, selected, 2)), " Blood Points")
            end
        end
        BlzFrameSetText(CM67_Frame(7), J88_concat("|cFFFFC850Cost:|r ", cost))
    else
        BlzFrameSetText(CM67_Frame(5), "No commanders available")
        BlzFrameSetText(CM67_Frame(6), "This nation has no commander upgrades.")
        BlzFrameSetText(CM67_Frame(7), "")
    end
    status = CM67_Status(pid, selected)
    if (CM67_Chosen[pid] ~= 0) then
        status = J88_concat("Selected: ", LoadStr(CM67_Data, CM67_Chosen[pid], 3))
    elseif (CM67_LocalWait > 0) then
        status = "Confirming purchase..."
    elseif ((CM67_Error[pid] ~= 0) and (status == "Ready to purchase.")) then
        status = "Purchase cancelled or interrupted. You may try again."
    end
    BlzFrameSetText(CM67_Frame(9), status)
    BlzFrameSetText(CM67_Frame(8), "Purchase")
    BlzFrameSetEnable(CM67_Frame(8), ((((selected ~= 0) and (CM67_Status(pid, selected) == "Ready to purchase.")) and (CM67_LocalWait == 0)) and (parent ~= 1747989848)))
    if Mac70_PanelActive(pid) then
        --  MacArthur's level, unlocks and upgrade button replace the purchase view.
        Mac70_RenderPanel(pid)
    end
end

function CM67_Click()
    local f = BlzGetTriggerFrame()
    local i = 1
    if (GetTriggerPlayer() == GetLocalPlayer()) then
        BlzFrameSetFocus(f, false)
        if (f == CM67_Frame(0)) then
            CM67_Open = (not CM67_Open)
        elseif (f == CM67_Frame(4)) then
            CM67_Open = false
        elseif (f == CM67_Frame(3)) then
            CM67_Large = (not CM67_Large)
            CM67_Layout()
        elseif (((f == CM67_Frame(8)) and BlzFrameGetEnable(f)) and (CM67_LocalWait == 0)) then
            if Mac70_PanelActive(GetPlayerId(GetLocalPlayer())) then
                Mac70_RequestUpgrade()
            elseif BlzSendSyncData("WW2Commander67", I2S(CM67_Index)) then
                CM67_LocalWait = 12
            end
        else
            while true do
                if (i > 4) then break end
                if (f == CM67_Frame(J88_int(20 + i))) then
                    CM67_Index = i
                end
                i = J88_int(i + 1)
            end
        end
        if CM67_Open then
            PM69_Activate(1)
        end
        CM67_Render()
    end
    f = nil
end

function CM67_Tick()
    local pid = 0
    local t = 0
    local flag = nil
    while true do
        if (pid >= 8) then break end
        flag = Nation58_Selector[pid]
        if ((flag ~= nil) and (GetOwningPlayer(flag) == Player(pid))) then
            CM67_Flag[pid] = flag
            t = GetUnitTypeId(flag)
            if ((LoadInteger(CM67_Data, t, 0) ~= 0) and (GetUnitCurrentOrder(flag) == 0)) then
                CM67_Chosen[pid] = t
                CM67_Pending[pid] = 0
            end
        end
        if (CM67_Pending[pid] ~= 0) then
            CM67_Ticks[pid] = J88_int(CM67_Ticks[pid] + 1)
            if ((CM67_Ticks[pid] >= 12) and (GetUnitCurrentOrder(CM67_Flag[pid]) == 0)) then
                CM67_Pending[pid] = 0
                CM67_Error[pid] = 1
            end
        end
        pid = J88_int(pid + 1)
    end
    if (CM67_LocalWait > 0) then
        CM67_LocalWait = J88_int(CM67_LocalWait - 1)
    end
    if (Mac70_LocalWait > 0) then
        Mac70_LocalWait = Mac70_LocalWait - 1
    end
    CM67_Render()
    flag = nil
end

function CM67_Text(key, size)
    SaveFrameHandle(CM67_Frames, 0, key, BlzCreateFrameByType("TEXT", "CommanderText", CM67_Frame(1), "", key))
    BlzFrameSetFont(CM67_Frame(key), "Fonts\\FRIZQT__.TTF", size, 0)
    BlzFrameSetTextAlignment(CM67_Frame(key), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
    BlzFrameSetTextColor(CM67_Frame(key), BlzConvertColor(255, 216, 225, 207))
    BlzFrameSetEnable(CM67_Frame(key), false)
    BlzFrameSetLevel(CM67_Frame(key), 3)
end

function CM67_Button(key, parent, label)
    SaveFrameHandle(CM67_Frames, 0, key, BlzCreateFrame("ScriptDialogButton", parent, 0, key))
    BlzFrameSetText(CM67_Frame(key), label)
    BlzTriggerRegisterFrameEvent(CM67_ClickTrigger, CM67_Frame(key), FRAMEEVENT_CONTROL_CLICK)
end

function CM67_Init()
    local root = UI5_Frame(3)
    local sync = CreateTrigger()
    local upgraded = CreateTrigger()
    local i = 0
    CM67_Data = InitHashtable()
    CM67_Frames = InitHashtable()
    CM67_ClickTrigger = CreateTrigger()
    CM67_Load()
    TriggerAddAction(CM67_ClickTrigger, CM67_Click)
    TriggerAddAction(sync, CM67_OnSync)
    TriggerRegisterAnyUnitEventBJ(upgraded, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerRegisterAnyUnitEventBJ(upgraded, EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
    TriggerAddAction(upgraded, CM67_OnUpgrade)
    while true do
        if (i >= 8) then break end
        BlzTriggerRegisterPlayerSyncEvent(sync, Player(i), "WW2Commander67", false)
        i = J88_int(i + 1)
    end
    CM67_Button(0, root, "Commanders")
    UI5_Box(CM67_Frame(0), UI70_Left(), 0.5659999847412109, 0.0949999988079071, 0.024000000208616257)
    BlzFrameSetVisible(CM67_Frame(0), false)
    SaveFrameHandle(CM67_Frames, 0, 1, BlzCreateFrameByType("BACKDROP", "Commanders", root, "", 1))
    BlzFrameSetTexture(CM67_Frame(1), "UI\\WW2HUD\\panel.blp", 0, true)
    BlzFrameSetLevel(CM67_Frame(1), 30)
    CM67_Text(2, 0.014000000432133675)
    CM67_Button(3, CM67_Frame(1), "Enlarge")
    CM67_Button(4, CM67_Frame(1), "Minimize")
    CM67_Text(5, 0.012000000104308128)
    CM67_Text(6, 0.008999999612569809)
    CM67_Text(7, 0.008999999612569809)
    CM67_Button(8, CM67_Frame(1), "Purchase")
    CM67_Text(9, 0.008999999612569809)
    i = 1
    while true do
        if (i > 4) then break end
        CM67_Button(J88_int(20 + i), CM67_Frame(1), "")
        SaveFrameHandle(CM67_Frames, 0, J88_int(30 + i), BlzCreateFrameByType("BACKDROP", "CommanderIcon", CM67_Frame(1), "", i))
        BlzFrameSetEnable(CM67_Frame(J88_int(30 + i)), false)
        BlzFrameSetLevel(CM67_Frame(J88_int(30 + i)), 3)
        CM67_Text(J88_int(40 + i), 0.008999999612569809)
        i = J88_int(i + 1)
    end
    CM67_Layout()
    BlzFrameSetVisible(CM67_Frame(1), false)
    TimerStart(CreateTimer(), 0.25, true, CM67_Tick)
    root = nil
    sync = nil
    upgraded = nil
end
