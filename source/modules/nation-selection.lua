function Nation50_EnsureBuilder(flag, t)
    local owner = GetOwningPlayer(flag)
    local pid = GetPlayerId(owner)
    local workers = nil
    local worker = nil
    if ((((pid < 0) or (pid >= 8)) or (t == 0)) or LoadBoolean(Nation50_Granted, pid, t)) then
        owner = nil
        do return end
    end
    workers = GetUnitsOfPlayerAndTypeId(owner, t)
    worker = FirstOfGroup(workers)
    if (worker == nil) then
        worker = CreateUnit(owner, t, J88_real(GetUnitX(flag) + 160.0), GetUnitY(flag), 270.0)
        if (worker ~= nil) then
            SetUnitPosition(worker, J88_real(GetUnitX(flag) + 160.0), GetUnitY(flag))
            SelectUnitForPlayerSingle(worker, owner)
        end
    end
    if (worker ~= nil) then
        Nation62_Worker[pid] = worker
        SaveBoolean(Nation50_Granted, pid, t, true)
        SetPlayerTechMaxAllowed(owner, t, 1)
    end
    DestroyGroup(workers)
    workers = nil
    worker = nil
    owner = nil
end

function Nation50_Grant(flag)
    local t = GetUnitTypeId(flag)
    if (t == 1747988567) then
        Nation50_EnsureBuilder(flag, 1747989322)
    elseif ((t == 1747989848) and (Nation58_Faction[GetPlayerId(GetOwningPlayer(flag))] < 3)) then
        Nation50_EnsureBuilder(flag, 1747993155)
    elseif (t == 1747992898) then
        Nation50_EnsureBuilder(flag, 1749628725)
    elseif (t == 1747989296) then
        Nation50_EnsureBuilder(flag, 1747989058)
    elseif (t == 1747990604) then
        Nation50_EnsureBuilder(flag, 1747993153)
    elseif (t == 1747990344) then
        Nation50_EnsureBuilder(flag, 1747993170)
    elseif (t == 1747990598) then
        Nation50_EnsureBuilder(flag, 1747990347)
    elseif (t == 1747993156) then
        Nation50_EnsureBuilder(flag, 1747993674)
    elseif (t == 1747993684) then
        Nation50_EnsureBuilder(flag, 1747989058)
        Nation50_EnsureBuilder(flag, 1747993913)
    elseif (t == 1747993683) then
        Nation50_EnsureBuilder(flag, 1747989058)
    elseif (t == 1747993682) then
        Nation50_EnsureBuilder(flag, 1750217010)
    elseif (t == 1747994192) then
        Nation50_EnsureBuilder(flag, 1747993170)
    elseif (t == 1747994960) then
        Nation50_EnsureBuilder(flag, 1747993155)
        Nation50_EnsureBuilder(flag, 1747994959)
    elseif (t == 1749435463) then
        Nation50_EnsureBuilder(flag, 1747993155)
    elseif (t == 1747993657) then
        Nation50_EnsureBuilder(flag, 1747993656)
    elseif (t == ZK_HQ) then
        Zhukov_Begin(flag)
    elseif (t == 1747994191) then
        Nation50_EnsureBuilder(flag, 1747989322)
    elseif (t == 1747988570) then
        Nation50_EnsureBuilder(flag, 1747989845)
    elseif (t == 1747990359) then
        Nation50_EnsureBuilder(flag, 1747990346)
    end
end

function Nation50_OnChosen()
    Nation50_Grant(GetTriggerUnit())
end

function Nation50_Init()
    local t = CreateTrigger()
    Nation50_Granted = InitHashtable()
    TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerAddAction(t, Nation50_OnChosen)
    t = nil
end

function Nation58_Type(card)
    if (card == 0) then
        do return 1747988567 end
    elseif (card == 1) then
        do return 1747989848 end
    elseif (card == 2) then
        do return 1747989296 end
    elseif (card == 3) then
        do return 1747993156 end
    elseif (card == 4) then
        do return 1747990344 end
    elseif (card == 5) then
        do return 1747990598 end
    elseif (card == 6) then
        do return 1747990604 end
    elseif (card == 7) then
        do return 1747988569 end
    elseif (card == 8) then
        do return 1747992898 end
    end
    do return 0 end
end

function Nation58_Name(card)
    if (card == 0) then
        do return "United Kingdom" end
    elseif (card == 1) then
        do return "France" end
    elseif (card == 2) then
        do return "Germany" end
    elseif (card == 3) then
        do return "Soviet Union" end
    elseif (card == 4) then
        do return "United States" end
    elseif (card == 5) then
        do return "Japan" end
    elseif (card == 6) then
        do return "Poland" end
    elseif (card == 7) then
        do return "China" end
    end
    do return "Italy" end
end

function Nation58_Description(card)
    if (card == 0) then
        do return "Build a flexible Commonwealth army of infantry, tanks and aircraft." end
    elseif (card == 1) then
        do return "Choose fortified defense with Petain or advanced armor with de Gaulle." end
    elseif (card == 2) then
        do return "Lead mechanized formations backed by powerful infantry and heavy guns." end
    elseif (card == 3) then
        do return "Overwhelm the enemy with massed infantry, artillery and heavy tanks." end
    elseif (card == 4) then
        do return "Combine versatile ground troops with fighters, bombers and air support." end
    elseif (card == 5) then
        do return "Press the attack with charging infantry, aircraft and naval support." end
    elseif (card == 6) then
        do return "Field determined infantry, cavalry and fast support vehicles." end
    elseif (card == 7) then
        do return "Choose Nationalist or Communist forces to shape your Chinese army." end
    end
    do return "Deploy infantry squads supported by motorcycles, armoured cars and specialist vehicles." end
end

function Nation58_Strengths(card)
    if (card == 0) then
        do return "Many infantry upgrades, specialist troops and balanced support." end
    elseif (card == 1) then
        do return "Durable infantry, free commanders and powerful late-game units." end
    elseif (card == 2) then
        do return "Strong tanks, specialist infantry and heavy firepower." end
    elseif (card == 3) then
        do return "Cheap troops in large numbers, varied artillery and heavy armor." end
    elseif (card == 4) then
        do return "Strong aircraft, flexible armor and airborne reinforcements." end
    elseif (card == 5) then
        do return "Infantry charges, suicide attacks and powerful naval support." end
    elseif (card == 6) then
        do return "Cavalry charges, mobile formations and commander weapon access." end
    elseif (card == 7) then
        do return "Large infantry squads; imported armor or recruitment and artillery." end
    end
    do return "Versatile infantry, mobile fire support and anti-aircraft vehicles." end
end

function Nation58_Weaknesses(card)
    if (card == 0) then
        do return "Basic infantry need anti-tank support against armored armies." end
    elseif (card == 1) then
        do return "Top tanks are costly; Maginot fortresses cannot move." end
    elseif (card == 2) then
        do return "Elite troops and heavy armor require a large investment." end
    elseif (card == 3) then
        do return "Basic infantry are fragile and suffer against concentrated fire." end
    elseif (card == 4) then
        do return "Air-heavy armies are vulnerable to dedicated anti-air units." end
    elseif (card == 5) then
        do return "Charging infantry are exposed to machine guns and artillery." end
    elseif (card == 6) then
        do return "Limited native heavy armor and aircraft choices." end
    elseif (card == 7) then
        do return "Basic infantry are fragile and need support against armor." end
    end
    do return "Light vehicles are vulnerable to artillery and heavy tanks." end
end

function Nation58_Icon(card)
    if (card == 0) then
        do return "war3mapImported\\Nation59UK.blp" end
    elseif (card == 1) then
        do return "war3mapImported\\Nation66France.blp" end
    elseif (card == 2) then
        do return "war3mapImported\\Nation59Germany.blp" end
    elseif (card == 3) then
        do return "war3mapImported\\Nation59SovietUnion.blp" end
    elseif (card == 4) then
        do return "war3mapImported\\Nation59USA.blp" end
    elseif (card == 5) then
        do return "war3mapImported\\Nation59JapanEmpire.blp" end
    elseif (card == 6) then
        do return "war3mapImported\\Nation59Poland.blp" end
    elseif (card == 7) then
        do return "war3mapImported\\Nation59RepublicChina.blp" end
    end
    do return "war3mapImported\\Nation59FascistItaly.blp" end
end

function Nation58_FactionName(faction)
    if (faction == 3) then
        do return "Vichy France" end
    end
    if (faction == 4) then
        do return "Free France" end
    end
    if (faction == 1) then
        do return "Nationalist China" end
    elseif (faction == 2) then
        do return "Communist China" end
    end
    do return "" end
end

function Nation58_FactionDescription(faction)
    if (faction == 3) then
        do return "Serve under Philippe Petain with fortified defenses and German reinforcements." end
    end
    if (faction == 4) then
        do return "Serve under Charles de Gaulle with advanced armor and tank destroyers." end
    end
    if (faction == 1) then
        do return "Field large infantry formations supported by imported tanks and aircraft." end
    elseif (faction == 2) then
        do return "Build an infantry army with recruitment, mountain guns and covert agents." end
    end
    do return "" end
end

function Nation58_FactionStrengths(faction)
    if (faction == 3) then
        do return "German reinforcements and Maginot fortresses in the final battle." end
    end
    if (faction == 4) then
        do return "Panhard upgrades, Lorraine tank destroyers, AMX tanks and the FCM F1." end
    end
    if (faction == 1) then
        do return "Massed infantry, armored cars, Sherman tanks and fighter support." end
    elseif (faction == 2) then
        do return "Recruit defeated enemies; specialize in infantry or artillery commanders." end
    end
    do return "" end
end

function Nation58_FactionWeaknesses(faction)
    if (faction == 3) then
        do return "German reinforcements are costly; Maginot fortresses cannot move." end
    end
    if (faction == 4) then
        do return "Advanced tanks require a large investment and protection from anti-tank fire." end
    end
    if (faction == 1) then
        do return "Basic infantry are fragile and rely on vehicles for heavier firepower." end
    elseif (faction == 2) then
        do return "Basic troops and mountain guns need protection from concentrated fire." end
    end
    do return "" end
end

function Nation58_FactionType(faction)
    if (faction == 3) then
        do return 1747994960 end
    end
    if (faction == 4) then
        do return 1749435463 end
    end
    if (faction == 1) then
        do return 1747988570 end
    elseif (faction == 2) then
        do return 1747990359 end
    end
    do return 0 end
end

function Nation58_FactionIcon(faction)
    if (faction == 3) then
        do return "war3mapImported\\Nation66Vichy.blp" end
    end
    if (faction == 4) then
        do return "war3mapImported\\Nation66Free.blp" end
    end
    if (faction == 1) then
        do return "war3mapImported\\Nation59NationalistChina.blp" end
    end
    do return "war3mapImported\\Nation59CommunistChina.blp" end
end

function Nation58_ValidHuman(pid)
    if ((pid < 0) or (pid >= 8)) then
        do return false end
    end
    do return (((GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING) and (GetPlayerController(Player(pid)) == MAP_CONTROL_USER)) and (not NewAI_Controlled[pid])) end
end

function Nation58_IsNation(t)
    local card = 0
    while true do
        if (card >= 9) then break end
        if (Nation58_Type(card) == t) then
            do return true end
        end
        card = J88_int(card + 1)
    end
    do return false end
end

function Nation58_Request(pid, card)
    local selector = nil
    local t = Nation58_Type(card)
    if ((not Nation58_ValidHuman(pid)) or (t == 0)) then
        do return false end
    end
    if (((Nation58_Done[pid] or (Nation58_Pending[pid] ~= 0)) or (not DifficultyChoice_Initialized)) or DifficultyChoice_Pending) then
        do return false end
    end
    selector = Nation58_Selector[pid]
    if ((((selector == nil) or (GetUnitTypeId(selector) ~= 1747988568)) or (GetOwningPlayer(selector) ~= Player(pid))) or (GetWidgetLife(selector) <= 0.4050000011920929)) then
        Nation58_Error[pid] = 1
        selector = nil
        do return false end
    end
    if ((GetUnitCurrentOrder(selector) ~= 0) or (not NewAI_CanBuy(pid, t, selector))) then
        Nation58_Error[pid] = 1
        selector = nil
        do return false end
    end
    Nation58_Error[pid] = 0
    Nation58_Pending[pid] = t
    Nation58_PendingTicks[pid] = 0
    --  Native upgrades preserve faction, automatic-builder and economy callbacks.
    if (not IssueImmediateOrderById(selector, t)) then
        Nation58_Pending[pid] = 0
        Nation58_Error[pid] = 1
        selector = nil
        do return false end
    end
    selector = nil
    do return true end
end

function Nation58_FactionParent(faction)
    if ((faction == 3) or (faction == 4)) then
        do return 1747989848 end
    end
    do return 1747988569 end
end

function Nation58_RequestFaction(pid, faction)
    local selector = nil
    local accepted = false
    if ((not Nation58_ValidHuman(pid)) or (Nation58_FactionType(faction) == 0)) then
        do return false end
    end
    if ((((Nation58_Done[pid] or (Nation58_Pending[pid] ~= 0)) or Nation58_FactionReady[pid]) or (not DifficultyChoice_Initialized)) or DifficultyChoice_Pending) then
        do return false end
    end
    selector = Nation58_Selector[pid]
    if ((((selector == nil) or (GetOwningPlayer(selector) ~= Player(pid))) or (GetWidgetLife(selector) <= 0.4050000011920929)) or (GetUnitCurrentOrder(selector) ~= 0)) then
        Nation58_Error[pid] = 1
        selector = nil
        do return false end
    end
    if (GetUnitTypeId(selector) == 1747988568) then
        Nation58_Faction[pid] = faction
        if (faction > 2) then
            accepted = Nation58_Request(pid, 1)
        else
            accepted = Nation58_Request(pid, 7)
        end
        if (not accepted) then
            Nation58_Faction[pid] = 0
        end
        selector = nil
        do return accepted end
    elseif (GetUnitTypeId(selector) == Nation58_FactionParent(faction)) then
        --  A failed second upgrade can be retried without choosing China again.
        Nation58_Faction[pid] = faction
        Nation58_FactionReady[pid] = true
        Nation58_Error[pid] = 0
        selector = nil
        do return true end
    end
    selector = nil
    do return false end
end

function Nation58_OrderFaction(pid)
    local selector = Nation58_Selector[pid]
    local target = Nation58_FactionType(Nation58_Faction[pid])
    --  Called only by the synchronized polling timer, after all parent-upgrade callbacks.
    Nation58_FactionReady[pid] = false
    if (((((((target == 0) or (selector == nil)) or (GetUnitTypeId(selector) ~= Nation58_FactionParent(Nation58_Faction[pid]))) or (GetOwningPlayer(selector) ~= Player(pid))) or (GetWidgetLife(selector) <= 0.4050000011920929)) or (GetUnitCurrentOrder(selector) ~= 0)) or (not NewAI_CanBuy(pid, target, selector))) then
        Nation58_Error[pid] = 1
        selector = nil
        do return end
    end
    Nation58_Pending[pid] = target
    Nation58_PendingTicks[pid] = 0
    Nation58_Error[pid] = 0
    if (not IssueImmediateOrderById(selector, target)) then
        Nation58_Pending[pid] = 0
        Nation58_Error[pid] = 1
    end
    selector = nil
end

function Nation58_OnSync()
    local pid = GetPlayerId(GetTriggerPlayer())
    local data = BlzGetTriggerSyncData()
    local card = S2I(data)
    if (BlzGetTriggerSyncPrefix() ~= "WW2Nation58") then
        do return end
    end
    --  Canonical faction payloads carry intent only; the sender always owns the selector.
    if (data == "1:1") then
        Nation58_RequestFaction(pid, 3)
    elseif (data == "1:2") then
        Nation58_RequestFaction(pid, 4)
    elseif (data == "7:1") then
        Nation58_RequestFaction(pid, 1)
    elseif (data == "7:2") then
        Nation58_RequestFaction(pid, 2)
    elseif (((((StringLength(data) == 1) and (data == I2S(card))) and (card >= 0)) and (card < 9)) and (card ~= 1)) then
        Nation58_Request(pid, card)
    end
end

function Nation58_OnUpgrade()
    local u = GetTriggerUnit()
    local pid = GetPlayerId(GetOwningPlayer(u))
    local t = GetUnitTypeId(u)
    if ((pid >= 0) and (pid < 8)) then
        if (((u == Nation58_Selector[pid]) and (Nation58_Faction[pid] > 0)) and (t == Nation58_FactionParent(Nation58_Faction[pid]))) then
            Nation58_FactionReady[pid] = true
            Nation58_Pending[pid] = 0
            Nation58_Error[pid] = 0
            --  Never issue the next order inside this event: other flag callbacks still need to run.
        elseif (((u == Nation58_Selector[pid]) and (Nation58_Faction[pid] > 0)) and (t == Nation58_FactionType(Nation58_Faction[pid]))) then
            Nation58_Done[pid] = true
            Nation58_FactionReady[pid] = false
            Nation58_Pending[pid] = 0
            Nation58_Error[pid] = 0
        elseif Nation58_IsNation(t) then
            Nation58_Done[pid] = true
            Nation58_Pending[pid] = 0
            Nation58_Error[pid] = 0
            if (t == Nation58_FactionParent(Nation58_Faction[pid])) then
                SelectUnitForPlayerSingle(u, Player(pid))
            end
        end
    end
    u = nil
end

function Nation58_OnCancel()
    local pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
    if ((((pid >= 0) and (pid < 8)) and (GetTriggerUnit() == Nation58_Selector[pid])) and (not Nation58_Done[pid])) then
        Nation58_Pending[pid] = 0
        Nation58_Error[pid] = 1
        Nation58_FactionReady[pid] = false
        if (GetUnitTypeId(GetTriggerUnit()) == 1747988568) then
            Nation58_Faction[pid] = 0
        end
    end
end

function Nation58_Frame(key)
    do return LoadFrameHandle(Nation58_Frames, 0, key) end
end

function Nation58_Show(f, flag)
    if (BlzFrameIsVisible(f) ~= flag) then
        BlzFrameSetVisible(f, flag)
    end
end

function Nation58_Enable(f, flag)
    if (BlzFrameGetEnable(f) ~= flag) then
        BlzFrameSetEnable(f, flag)
    end
end

function Nation58_Feedback(confirm)
    if confirm then
        StopSound(Nation61_ClickSound, false, false)
        StartSound(Nation61_ClickSound)
    else
        StopSound(Nation61_HoverSound, false, false)
        StartSound(Nation61_HoverSound)
    end
end

function Nation58_HoverCode(f)
    local i = 0
    if ((f == Nation58_Frame(18)) or (f == Nation58_Frame(6))) then
        if BlzFrameGetEnable(Nation58_Frame(18)) then
            do return 11 end
        end
    elseif ((f == Nation58_Frame(19)) or (f == Nation58_Frame(14))) then
        if ((Nation58_LocalPage == 1) and BlzFrameGetEnable(Nation58_Frame(19))) then
            do return 12 end
        end
    elseif (Nation58_LocalPage == 0) then
        while true do
            if (i >= 9) then break end
            if (((f == Nation58_Frame(J88_int(J88_int(20 + J88_int(i * 10)) + 6))) or (f == Nation58_Frame(J88_int(20 + J88_int(i * 10))))) and BlzFrameGetEnable(Nation58_Frame(J88_int(J88_int(20 + J88_int(i * 10)) + 6)))) then
                do return i end
            end
            i = J88_int(i + 1)
        end
    else
        if (((f == Nation58_Frame(126)) or (f == Nation58_Frame(120))) and BlzFrameGetEnable(Nation58_Frame(126))) then
            do return 9 end
        elseif (((f == Nation58_Frame(136)) or (f == Nation58_Frame(130))) and BlzFrameGetEnable(Nation58_Frame(136))) then
            do return 10 end
        end
    end
    do return J88_int(-1) end
end

function Nation58_ModalBoard(active)
    --  No native frame lookup: acquiring a frame during local hover can expose
    --  its first JASS handle at different times on different clients.
    --  This native also covers boards created while the modal is open.
    if (Nation63_BoardSuppressed ~= active) then
        Nation63_BoardSuppressed = active
        MultiboardSuppressDisplay(active)
    end
end

function Nation58_FocusWorker()
    local pid = GetPlayerId(GetLocalPlayer())
    local worker = nil
    if (((pid >= 0) and (pid < 8)) and (not Nation62_Focused)) then
        worker = Nation62_Worker[pid]
        if (((Nation58_Done[pid] and (worker ~= nil)) and (GetWidgetLife(worker) > 0.4050000011920929)) and (GetOwningPlayer(worker) == GetLocalPlayer())) then
            Nation62_Focused = true
            ClearSelection()
            SelectUnit(worker, true)
            PanCameraToTimed(GetUnitX(worker), GetUnitY(worker), 0.0)
        end
    end
    worker = nil
end

function Nation58_DifficultyName(level)
    if (level == 1) then
        do return "EASY" end
    elseif (level == 3) then
        do return "HARD" end
    elseif (level == 4) then
        do return "HELL" end
    end
    do return "NORMAL" end
end

function Nation58_DifficultyView()
    local i = 0
    local key = 0
    local seconds = 10
    local host = (GetPlayerId(GetLocalPlayer()) == Opening63_Host)
    while true do
        if (i >= 9) then break end
        Nation58_Show(Nation58_Frame(J88_int(20 + J88_int(i * 10))), false)
        Nation58_Show(Nation58_Frame(J88_int(26 + J88_int(i * 10))), false)
        i = J88_int(i + 1)
    end
    Nation58_Show(Nation58_Frame(120), false)
    Nation58_Show(Nation58_Frame(126), false)
    Nation58_Show(Nation58_Frame(130), false)
    Nation58_Show(Nation58_Frame(136), false)
    Nation58_Show(Nation58_Frame(6), false)
    Nation58_Show(Nation58_Frame(18), false)
    Nation58_Show(Nation58_Frame(14), false)
    Nation58_Show(Nation58_Frame(19), false)
    Nation58_Show(AO_Frame(0), false)
    Nation58_Show(AO_Frame(1), false)
    BlzFrameSetText(Nation58_Frame(2), "AI DIFFICULTY")
    BlzFrameSetText(Nation58_Frame(3), J88_concat("HOST  /  ", GetPlayerName(Player(Opening63_Host))))
    if (DifficultyChoice_TimeoutTimer ~= nil) then
        seconds = R2I(J88_real(TimerGetRemaining(DifficultyChoice_TimeoutTimer) + 0.9990000128746033))
    end
    BlzFrameSetText(Nation58_Frame(4), J88_concat(J88_concat("Normal will be selected in ", I2S(seconds)), " seconds."))
    BlzFrameSetText(Nation58_Frame(10), "All players will choose their nation once the difficulty is set.")
    BlzFrameSetText(Nation58_Frame(11), "")
    BlzFrameSetText(Nation58_Frame(12), "")
    BlzFrameSetText(Nation58_Frame(5), "")
    Nation58_Show(Nation58_Frame(220), true)
    if host then
        BlzFrameSetText(Nation58_Frame(220), "Choose the AI difficulty")
    else
        BlzFrameSetText(Nation58_Frame(220), "Waiting for the host to choose AI difficulty...")
    end
    i = 1
    while true do
        if (i > 4) then break end
        key = J88_int(150 + J88_int(i * 10))
        Nation58_Show(Nation58_Frame(key), host)
        Nation58_Show(Nation58_Frame(J88_int(key + 6)), host)
        Nation58_Enable(Nation58_Frame(J88_int(key + 6)), host)
        if (Opening63_Hover == i) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
        else
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Idle.blp", 0, true)
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), "UI\\WW2HUD\\panel.blp", 0, true)
        end
        i = J88_int(i + 1)
    end
end

function Nation58_UpdateHighlights()
    local i = 0
    local key = 0
    local ready = false
    if DifficultyChoice_Pending then
        i = 1
        while true do
            if (i > 4) then break end
            key = J88_int(150 + J88_int(i * 10))
            if (Opening63_Hover == i) then
                BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
                BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
            else
                BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Idle.blp", 0, true)
                BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), "UI\\WW2HUD\\panel.blp", 0, true)
            end
            i = J88_int(i + 1)
        end
        do return end
    end
    while true do
        if (i >= 9) then break end
        key = J88_int(20 + J88_int(i * 10))
        Nation58_Show(Nation58_Frame(J88_int(key + 1)), (((Nation58_LocalPage == 0) and (i < 9)) and ((i == Nation58_LocalChoice) or (i == Nation58_LocalHover))))
        if (i == Nation58_LocalChoice) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
        elseif ((i == Nation58_LocalHover) and (i < 9)) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Hover.blp", 0, true)
        end
        i = J88_int(i + 1)
    end
    i = 1
    while true do
        if (i > 2) then break end
        key = J88_int(110 + J88_int(i * 10))
        Nation58_Show(Nation58_Frame(J88_int(key + 1)), ((Nation58_LocalPage == 1) and ((i == Nation58_LocalFaction) or (Nation58_LocalHover == J88_int(8 + i)))))
        if (i == Nation58_LocalFaction) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
        else
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Hover.blp", 0, true)
        end
        i = J88_int(i + 1)
    end
    ready = BlzFrameGetEnable(Nation58_Frame(18))
    if ((Nation58_LocalHover == 11) and ready) then
        BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Selected.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(9), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
    else
        if ready then
            BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Ready.blp", 0, true)
        else
            BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Idle.blp", 0, true)
        end
        BlzFrameSetTexture(Nation58_Frame(9), "UI\\WW2HUD\\panel.blp", 0, true)
    end
    if ((Nation58_LocalHover == 12) and BlzFrameGetEnable(Nation58_Frame(19))) then
        BlzFrameSetTexture(Nation58_Frame(15), "war3mapImported\\Nation60Selected.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(16), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
    else
        BlzFrameSetTexture(Nation58_Frame(15), "war3mapImported\\Nation60Back.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(16), "UI\\WW2HUD\\panel.blp", 0, true)
    end
end

function Nation58_Render()
    local pid = GetPlayerId(GetLocalPlayer())
    local i = 0
    local key = 0
    local show = false
    local waiting = false
    local validChoice = false
    local locked = false
    if Nation58_LocalRendering then
        do return end
    end
    Nation58_LocalRendering = true
    if ((pid >= 0) and (pid < 8)) then
        show = ((Nation58_ValidHuman(pid) and (not Nation58_Done[pid])) and DifficultyChoice_Initialized)
        waiting = (((Nation58_Pending[pid] ~= 0) or (Nation58_LocalWait > 0)) or Nation58_FactionReady[pid])
        locked = ((Nation58_Faction[pid] > 0) and (GetUnitTypeId(Nation58_Selector[pid]) == Nation58_FactionParent(Nation58_Faction[pid])))
    end
    if (not DifficultyChoice_Pending) then
        BlzFrameSetText(Nation58_Frame(220), "")
    end
    UI64_SetModal(show)
    Nation58_ModalBoard(show)
    Nation58_Show(Nation58_Frame(0), show)
    Nation58_Show(AO_Frame(0), (((not show) and (pid >= 0)) and (pid < 8)))
    if (not show) then
        Nation58_LocalRendering = false
        do return end
    end
    if DifficultyChoice_Pending then
        Nation58_DifficultyView()
        Nation58_LocalRendering = false
        do return end
    end
    Nation58_Show(Nation58_Frame(220), false)
    i = 1
    while true do
        if (i > 4) then break end
        Nation58_Show(Nation58_Frame(J88_int(150 + J88_int(i * 10))), false)
        Nation58_Show(Nation58_Frame(J88_int(156 + J88_int(i * 10))), false)
        i = J88_int(i + 1)
    end
    i = 0
    Nation58_Show(Nation58_Frame(6), true)
    Nation58_Show(Nation58_Frame(18), true)
    if (locked and (Nation58_Faction[pid] > 0)) then
        Nation58_LocalPage = 1
        if (Nation58_LocalFaction == 0) then
            Nation58_LocalFaction = Nation58_Faction[pid]
            if (Nation58_LocalFaction > 2) then
                Nation58_LocalChoice = 1
                Nation58_LocalFaction = J88_int(Nation58_LocalFaction - 2)
            end
        end
    end
    Nation58_Show(AO_Frame(1), false)
    BlzFrameSetText(Nation58_Frame(3), J88_concat("COMMAND BRIEFING  /  ", GetPlayerName(GetLocalPlayer())))
    while true do
        if (i >= 9) then break end
        key = J88_int(20 + J88_int(i * 10))
        Nation58_Show(Nation58_Frame(key), (Nation58_LocalPage == 0))
        Nation58_Show(Nation58_Frame(J88_int(key + 6)), (Nation58_LocalPage == 0))
        Nation58_Show(Nation58_Frame(J88_int(key + 1)), ((i < 9) and ((i == Nation58_LocalChoice) or (i == Nation58_LocalHover))))
        if (i == Nation58_LocalChoice) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
        elseif ((i == Nation58_LocalHover) and (i < 9)) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Hover.blp", 0, true)
        end
        Nation58_Enable(Nation58_Frame(J88_int(key + 6)), (((Nation58_LocalPage == 0) and (i < 9)) and (not waiting)))
        i = J88_int(i + 1)
    end
    i = 1
    while true do
        if (i > 2) then break end
        key = J88_int(110 + J88_int(i * 10))
        if (Nation58_LocalChoice == 1) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), Nation58_FactionIcon(J88_int(i + 2)), 0, true)
            UI5_Box(Nation58_Frame(J88_int(key + 2)), J88_real(0.27000001072883606 + J88_real(I2R(J88_int(i - 1)) * 0.18000000715255737)), 0.30000001192092896, 0.0729999989271164, 0.18000000715255737)
            if (i == 1) then
                BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "VICHY")
            else
                BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "FREE")
            end
        else
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 2)), Nation58_FactionIcon(i), 0, true)
            BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 2)), Nation58_Frame(key))
            if (i == 1) then
                BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "KMT")
            else
                BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "CPC")
            end
        end
        Nation58_Show(Nation58_Frame(key), (Nation58_LocalPage == 1))
        Nation58_Show(Nation58_Frame(J88_int(key + 6)), (Nation58_LocalPage == 1))
        Nation58_Show(Nation58_Frame(J88_int(key + 1)), ((i == Nation58_LocalFaction) or (Nation58_LocalHover == J88_int(8 + i))))
        if (i == Nation58_LocalFaction) then
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Selected.blp", 0, true)
        else
            BlzFrameSetTexture(Nation58_Frame(J88_int(key + 1)), "war3mapImported\\Nation60Hover.blp", 0, true)
        end
        Nation58_Enable(Nation58_Frame(J88_int(key + 6)), ((Nation58_LocalPage == 1) and (not waiting)))
        i = J88_int(i + 1)
    end
    Nation58_Show(Nation58_Frame(14), (Nation58_LocalPage == 1))
    Nation58_Show(Nation58_Frame(19), (Nation58_LocalPage == 1))
    Nation58_Enable(Nation58_Frame(19), (((Nation58_LocalPage == 1) and (not waiting)) and (not locked)))
    if (Nation58_LocalPage == 1) then
        if (Nation58_LocalChoice == 1) then
            BlzFrameSetText(Nation58_Frame(2), "CHOOSE YOUR FRENCH FACTION")
        else
            BlzFrameSetText(Nation58_Frame(2), "CHOOSE YOUR CHINESE FACTION")
        end
        validChoice = ((Nation58_LocalFaction == 1) or (Nation58_LocalFaction == 2))
        key = Nation58_LocalFaction
        if (Nation58_LocalChoice == 1) then
            key = J88_int(key + 2)
        end
        if validChoice then
            BlzFrameSetText(Nation58_Frame(4), J88_concat(J88_concat("|cffffdda0", Nation58_FactionName(key)), "|r"))
            BlzFrameSetText(Nation58_Frame(10), Nation58_FactionDescription(key))
            BlzFrameSetText(Nation58_Frame(11), J88_concat("|cffb7d99aSTRENGTHS:|r  ", Nation58_FactionStrengths(key)))
            BlzFrameSetText(Nation58_Frame(12), J88_concat("|cffe0b18bWEAKNESSES:|r  ", Nation58_FactionWeaknesses(key)))
        else
            BlzFrameSetText(Nation58_Frame(4), "SELECT A FACTION")
            BlzFrameSetText(Nation58_Frame(10), "Choose a faction to read its strengths and weaknesses before deploying.")
            BlzFrameSetText(Nation58_Frame(11), "")
            BlzFrameSetText(Nation58_Frame(12), "")
        end
    else
        BlzFrameSetText(Nation58_Frame(2), "CHOOSE YOUR NATION")
        validChoice = ((((Nation58_LocalChoice >= 0) and (Nation58_LocalChoice < 9)) and (Nation58_LocalChoice ~= 7)) and (Nation58_LocalChoice ~= 1))
        if validChoice then
            BlzFrameSetText(Nation58_Frame(4), J88_concat(J88_concat("|cffffdda0", Nation58_Name(Nation58_LocalChoice)), "|r"))
            BlzFrameSetText(Nation58_Frame(10), Nation58_Description(Nation58_LocalChoice))
            BlzFrameSetText(Nation58_Frame(11), J88_concat("|cffb7d99aSTRENGTHS:|r  ", Nation58_Strengths(Nation58_LocalChoice)))
            BlzFrameSetText(Nation58_Frame(12), J88_concat("|cffe0b18bWEAKNESSES:|r  ", Nation58_Weaknesses(Nation58_LocalChoice)))
        else
            BlzFrameSetText(Nation58_Frame(4), "SELECT A FLAG")
            BlzFrameSetText(Nation58_Frame(10), "Choose a nation to read its strengths and weaknesses before deploying.")
            BlzFrameSetText(Nation58_Frame(11), "")
            BlzFrameSetText(Nation58_Frame(12), "")
        end
    end
    Nation58_Enable(Nation58_Frame(18), (validChoice and (not waiting)))
    if waiting then
        BlzFrameSetText(Nation58_Frame(7), "DEPLOYING...")
        BlzFrameSetText(Nation58_Frame(5), "Preparing your headquarters...")
    else
        BlzFrameSetText(Nation58_Frame(7), "DEPLOY")
        BlzFrameSetText(Nation58_Frame(5), "Select your forces, then deploy.")
        if (Nation58_Error[pid] ~= 0) then
            BlzFrameSetText(Nation58_Frame(5), "Unable to deploy. Please choose your forces and try again.")
        end
    end
    if (validChoice and (not waiting)) then
        BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Ready.blp", 0, true)
    else
        BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Idle.blp", 0, true)
    end
    if (((Nation58_LocalHover == 11) and validChoice) and (not waiting)) then
        BlzFrameSetTexture(Nation58_Frame(8), "war3mapImported\\Nation60Selected.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(9), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
    else
        BlzFrameSetTexture(Nation58_Frame(9), "UI\\WW2HUD\\panel.blp", 0, true)
    end
    if (((Nation58_LocalHover == 12) and (not waiting)) and (not locked)) then
        BlzFrameSetTexture(Nation58_Frame(15), "war3mapImported\\Nation60Selected.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(16), "war3mapImported\\Nation61ButtonHover.blp", 0, true)
    else
        BlzFrameSetTexture(Nation58_Frame(15), "war3mapImported\\Nation60Back.blp", 0, true)
        BlzFrameSetTexture(Nation58_Frame(16), "UI\\WW2HUD\\panel.blp", 0, true)
    end
    Nation58_LocalRendering = false
end

function Nation58_Click()
    local clicked = BlzGetTriggerFrame()
    local i = 0
    local pid = GetPlayerId(GetLocalPlayer())
    local payload = ""
    local accepted = false
    if (((GetLocalPlayer() == GetTriggerPlayer()) and (pid >= 0)) and (pid < 8)) then
        BlzFrameSetFocus(clicked, false)
        if DifficultyChoice_Pending then
            if (pid == Opening63_Host) then
                i = 1
                while true do
                    if (i > 4) then break end
                    if (clicked == Nation58_Frame(J88_int(156 + J88_int(i * 10)))) then
                        BlzSendSyncData("WW2Difficulty63", I2S(i))
                        Nation58_Feedback(true)
                    end
                    i = J88_int(i + 1)
                end
            end
            clicked = nil
            do return end
        end
        if (clicked == Nation58_Frame(18)) then
            clicked = Nation58_Frame(6)
        elseif (clicked == Nation58_Frame(19)) then
            clicked = Nation58_Frame(14)
        end
        if (((Nation58_LocalWait == 0) and (Nation58_Pending[pid] == 0)) and (not Nation58_FactionReady[pid])) then
            if (clicked == Nation58_Frame(6)) then
                if ((Nation58_LocalPage == 1) and ((Nation58_LocalFaction == 1) or (Nation58_LocalFaction == 2))) then
                    payload = J88_concat(J88_concat(I2S(Nation58_LocalChoice), ":"), I2S(Nation58_LocalFaction))
                elseif (((((Nation58_LocalPage == 0) and (Nation58_LocalChoice >= 0)) and (Nation58_LocalChoice < 9)) and (Nation58_LocalChoice ~= 7)) and (Nation58_LocalChoice ~= 1)) then
                    payload = I2S(Nation58_LocalChoice)
                end
                if (payload ~= "") then
                    if BlzSendSyncData("WW2Nation58", payload) then
                        Nation58_LocalWait = 20
                        accepted = true
                    end
                end
            elseif (((clicked == Nation58_Frame(14)) and (Nation58_LocalPage == 1)) and (GetUnitTypeId(Nation58_Selector[pid]) == 1747988568)) then
                accepted = true
                Nation58_LocalPage = 0
                Nation58_LocalChoice = J88_int(-1)
                Nation58_LocalFaction = 0
                Nation58_LocalHover = J88_int(-1)
            elseif (Nation58_LocalPage == 0) then
                while true do
                    if (i >= 9) then break end
                    if ((clicked == Nation58_Frame(J88_int(20 + J88_int(i * 10)))) or (clicked == Nation58_Frame(J88_int(J88_int(20 + J88_int(i * 10)) + 6)))) then
                        accepted = true
                        Nation58_LocalChoice = i
                        if ((i == 7) or (i == 1)) then
                            Nation58_LocalPage = 1
                            Nation58_LocalFaction = 0
                            Nation58_LocalHover = J88_int(-1)
                        end
                    end
                    i = J88_int(i + 1)
                end
            else
                if ((clicked == Nation58_Frame(120)) or (clicked == Nation58_Frame(J88_int(120 + 6)))) then
                    accepted = true
                    Nation58_LocalFaction = 1
                elseif ((clicked == Nation58_Frame(130)) or (clicked == Nation58_Frame(J88_int(130 + 6)))) then
                    accepted = true
                    Nation58_LocalFaction = 2
                end
            end
        end
        if accepted then
            Nation58_LocalHover = J88_int(-1)
            Nation58_Feedback(true)
        end
        Nation58_Render()
    end
    clicked = nil
end

function Nation58_Hover()
    local hovered = J88_int(-1)
    local i = 1
    if ((((GetLocalPlayer() == GetTriggerPlayer()) and (not Nation58_LocalRendering)) and BlzFrameIsVisible(Nation58_Frame(0))) and BlzFrameIsVisible(BlzGetTriggerFrame())) then
        if DifficultyChoice_Pending then
            if (GetPlayerId(GetLocalPlayer()) == Opening63_Host) then
                while true do
                    if (i > 4) then break end
                    if ((BlzGetTriggerFrame() == Nation58_Frame(J88_int(156 + J88_int(i * 10)))) and BlzFrameGetEnable(Nation58_Frame(J88_int(156 + J88_int(i * 10))))) then
                        hovered = i
                    end
                    i = J88_int(i + 1)
                end
                if (BlzGetTriggerFrameEvent() == FRAMEEVENT_MOUSE_ENTER) then
                    if ((hovered > 0) and (Opening63_Hover ~= hovered)) then
                        Opening63_Hover = hovered
                        Nation58_Feedback(false)
                    end
                elseif ((hovered > 0) and (Opening63_Hover == hovered)) then
                    Opening63_Hover = 0
                end
            end
        else
            hovered = Nation58_HoverCode(BlzGetTriggerFrame())
            if (BlzGetTriggerFrameEvent() == FRAMEEVENT_MOUSE_ENTER) then
                if ((hovered >= 0) and (Nation58_LocalHover ~= hovered)) then
                    Nation58_LocalHover = hovered
                    Nation58_Feedback(false)
                end
            elseif ((hovered >= 0) and (Nation58_LocalHover == hovered)) then
                Nation58_LocalHover = J88_int(-1)
            end
        end
        --  Hover only paints borders and plays feedback. It never rebuilds input state.
        Nation58_UpdateHighlights()
    end
end

function Nation58_Poll()
    local pid = 0
    local u = nil
    local t = 0
    while true do
        if (pid >= 8) then break end
        if (not Nation58_Done[pid]) then
            u = Nation58_Selector[pid]
            t = GetUnitTypeId(u)
            --  Also recognize a successful legacy/Random selection made before opening.
            --  ScoreFaction_Country is synchronized and only records actual HQ types.
            if (Nation58_FactionReady[pid] and (Nation58_Pending[pid] == 0)) then
                Nation58_OrderFaction(pid)
            elseif ((((ScoreFaction_Country[pid] ~= 0) and (Nation58_Pending[pid] == 0)) and (t ~= 1747988568)) and (not ((Nation58_Faction[pid] > 0) and (t == Nation58_FactionParent(Nation58_Faction[pid]))))) then
                Nation58_Done[pid] = true
            elseif (Nation58_Pending[pid] ~= 0) then
                Nation58_PendingTicks[pid] = J88_int(Nation58_PendingTicks[pid] + 1)
                if ((Nation58_PendingTicks[pid] >= 16) and (GetUnitCurrentOrder(u) == 0)) then
                    if ((t == Nation58_Pending[pid]) and (GetWidgetLife(u) > 0.4050000011920929)) then
                        if ((t == Nation58_FactionParent(Nation58_Faction[pid])) and (Nation58_Faction[pid] > 0)) then
                            Nation58_FactionReady[pid] = true
                        else
                            Nation58_Done[pid] = true
                        end
                        Nation58_Error[pid] = 0
                    else
                        Nation58_Error[pid] = 1
                        if (t == 1747988568) then
                            Nation58_Faction[pid] = 0
                        end
                    end
                    Nation58_Pending[pid] = 0
                end
            end
        end
        pid = J88_int(pid + 1)
    end
    --  Local timeout only unlocks the view; the synchronized pending guard remains.
    if (Nation58_LocalWait > 0) then
        Nation58_LocalWait = J88_int(Nation58_LocalWait - 1)
        pid = GetPlayerId(GetLocalPlayer())
        if ((pid >= 0) and (pid < 8)) then
            if (((Nation58_Pending[pid] ~= 0) or (Nation58_Error[pid] ~= 0)) or Nation58_Done[pid]) then
                Nation58_LocalWait = 0
            end
        end
    end
    Nation58_Render()
    Nation58_FocusWorker()
    u = nil
end

function Nation58_Backdrop(key, parent, texture)
    SaveFrameHandle(Nation58_Frames, 0, key, BlzCreateFrameByType("BACKDROP", "Nation58Art", parent, "", key))
    BlzFrameSetTexture(Nation58_Frame(key), texture, 0, true)
    BlzFrameSetLevel(Nation58_Frame(key), 0)
    BlzFrameSetEnable(Nation58_Frame(key), false)
end

function Nation58_Text(key, parent, size)
    SaveFrameHandle(Nation58_Frames, 0, key, BlzCreateFrameByType("TEXT", "Nation58Text", parent, "", key))
    BlzFrameSetFont(Nation58_Frame(key), "Fonts\\FRIZQT__.TTF", size, 0)
    BlzFrameSetTextAlignment(Nation58_Frame(key), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
    BlzFrameSetTextColor(Nation58_Frame(key), BlzConvertColor(255, 216, 220, 200))
    BlzFrameSetLevel(Nation58_Frame(key), 3)
    BlzFrameSetEnable(Nation58_Frame(key), false)
end

function Nation58_BannerLabel(card)
    if (card == 0) then
        do return "UK" end
    end
    if (card == 1) then
        do return "FRANCE" end
    end
    if (card == 2) then
        do return "GERMANY" end
    end
    if (card == 3) then
        do return "USSR" end
    end
    if (card == 4) then
        do return "USA" end
    end
    if (card == 5) then
        do return "JAPAN" end
    end
    if (card == 6) then
        do return "POLAND" end
    end
    if (card == 7) then
        do return "CHINA" end
    end
    if (card == 8) then
        do return "ITALY" end
    end
    do return "" end
end

function Nation58_Init()
    local root = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
    local sync = CreateTrigger()
    local chosen = CreateTrigger()
    local cancel = CreateTrigger()
    local selectors = nil
    local i = 0
    local key = 0
    local x = 0.0
    local y = 0.0
    if (root == nil) then
        root = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
    end
    Nation61_HoverSound = CreateSound("Sound\\Interface\\MouseOver1.wav", false, false, false, 0, 0, "")
    Nation61_ClickSound = CreateSound("Sound\\Interface\\MouseClick1.wav", false, false, false, 0, 0, "")
    SetSoundChannel(Nation61_HoverSound, 8)
    SetSoundChannel(Nation61_ClickSound, 8)
    SetSoundVolume(Nation61_HoverSound, 65)
    SetSoundVolume(Nation61_ClickSound, 95)
    Nation58_Frames = InitHashtable()
    Nation58_ClickTrigger = CreateTrigger()
    Nation58_HoverTrigger = CreateTrigger()
    TriggerAddAction(Nation58_ClickTrigger, Nation58_Click)
    TriggerAddAction(Nation58_HoverTrigger, Nation58_Hover)
    TriggerAddAction(sync, Nation58_OnSync)
    TriggerRegisterAnyUnitEventBJ(chosen, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerAddAction(chosen, Nation58_OnUpgrade)
    TriggerRegisterAnyUnitEventBJ(cancel, EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
    TriggerAddAction(cancel, Nation58_OnCancel)
    while true do
        if (i >= 8) then break end
        SetPlayerTechMaxAllowed(Player(i), 1747992898, 1)
        BlzTriggerRegisterPlayerSyncEvent(sync, Player(i), "WW2Nation58", false)
        selectors = GetUnitsOfPlayerAndTypeId(Player(i), 1747988568)
        Nation58_Selector[i] = FirstOfGroup(selectors)
        DestroyGroup(selectors)
        i = J88_int(i + 1)
    end
    --  A button root consumes pointer clicks across the full panel surface.
    SaveFrameHandle(Nation58_Frames, 0, 0, BlzCreateFrameByType("FRAME", "Nation58Root", root, "", 0))
    BlzFrameSetLevel(Nation58_Frame(0), 100)
    UI5_Box(Nation58_Frame(0), 0.019999999552965164, 0.07000000029802322, 0.7599999904632568, 0.47999998927116394)
    SaveFrameHandle(Nation58_Frames, 0, 140, BlzCreateFrameByType("BUTTON", "Nation61BackgroundInput", Nation58_Frame(0), "", 140))
    BlzFrameSetLevel(Nation58_Frame(140), 0)
    BlzFrameSetAllPoints(Nation58_Frame(140), Nation58_Frame(0))
    Nation58_Backdrop(1, Nation58_Frame(0), "war3mapImported\\Nation58Backdrop.blp")
    BlzFrameSetAllPoints(Nation58_Frame(1), Nation58_Frame(0))
    Nation58_Text(2, Nation58_Frame(0), 0.017999999225139618)
    UI5_Box(Nation58_Frame(2), 0.04500000178813934, 0.5049999952316284, 0.7099999785423279, 0.026000000536441803)
    BlzFrameSetText(Nation58_Frame(2), "CHOOSE YOUR NATION")
    BlzFrameSetTextColor(Nation58_Frame(2), BlzConvertColor(255, 239, 216, 169))
    Nation58_Text(3, Nation58_Frame(0), 0.00800000037997961)
    UI5_Box(Nation58_Frame(3), 0.04500000178813934, 0.4830000102519989, 0.7099999785423279, 0.01600000075995922)
    Nation58_Text(4, Nation58_Frame(0), 0.012000000104308128)
    UI5_Box(Nation58_Frame(4), 0.04500000178813934, 0.20200000703334808, 0.5350000262260437, 0.026000000536441803)
    Nation58_Text(10, Nation58_Frame(0), 0.00800000037997961)
    UI5_Box(Nation58_Frame(10), 0.04500000178813934, 0.17499999701976776, 0.7099999785423279, 0.02500000037252903)
    Nation58_Text(11, Nation58_Frame(0), 0.00800000037997961)
    UI5_Box(Nation58_Frame(11), 0.04500000178813934, 0.14499999582767487, 0.7099999785423279, 0.024000000208616257)
    Nation58_Text(12, Nation58_Frame(0), 0.00800000037997961)
    UI5_Box(Nation58_Frame(12), 0.04500000178813934, 0.11599999666213989, 0.7099999785423279, 0.024000000208616257)
    Nation58_Text(5, Nation58_Frame(0), 0.007000000216066837)
    UI5_Box(Nation58_Frame(5), 0.04500000178813934, 0.07999999821186066, 0.5350000262260437, 0.02500000037252903)
    SaveFrameHandle(Nation58_Frames, 0, 6, BlzCreateFrameByType("FRAME", "Nation58Deploy", Nation58_Frame(0), "", 6))
        BlzFrameSetEnable(Nation58_Frame(6), false)
    BlzFrameSetLevel(Nation58_Frame(6), 2)
    UI5_Box(Nation58_Frame(6), 0.6000000238418579, 0.07999999821186066, 0.15000000596046448, 0.029999999329447746)

    Nation58_Backdrop(8, Nation58_Frame(6), "war3mapImported\\Nation60Idle.blp")
    BlzFrameSetAllPoints(Nation58_Frame(8), Nation58_Frame(6))
    Nation58_Backdrop(9, Nation58_Frame(6), "UI\\WW2HUD\\panel.blp")
    BlzFrameSetLevel(Nation58_Frame(9), 1)
    UI5_Box(Nation58_Frame(9), 0.6019999980926514, 0.0820000022649765, 0.1459999978542328, 0.026000000536441803)
    Nation58_Text(7, Nation58_Frame(6), 0.012000000104308128)
    BlzFrameSetAllPoints(Nation58_Frame(7), Nation58_Frame(6))
    BlzFrameSetTextAlignment(Nation58_Frame(7), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
    BlzFrameSetTextColor(Nation58_Frame(7), BlzConvertColor(255, 244, 222, 171))
    SaveFrameHandle(Nation58_Frames, 0, 14, BlzCreateFrameByType("FRAME", "Nation59Back", Nation58_Frame(0), "", 14))
        BlzFrameSetEnable(Nation58_Frame(14), false)
    BlzFrameSetLevel(Nation58_Frame(14), 2)
    UI5_Box(Nation58_Frame(14), 0.6000000238418579, 0.20200000703334808, 0.15000000596046448, 0.026000000536441803)

    Nation58_Backdrop(15, Nation58_Frame(14), "war3mapImported\\Nation60Back.blp")
    BlzFrameSetAllPoints(Nation58_Frame(15), Nation58_Frame(14))
    BlzFrameSetTexture(Nation58_Frame(15), "war3mapImported\\Nation60Back.blp", 0, true)
    Nation58_Backdrop(16, Nation58_Frame(14), "UI\\WW2HUD\\panel.blp")
    BlzFrameSetLevel(Nation58_Frame(16), 1)
    UI5_Box(Nation58_Frame(16), 0.6019999980926514, 0.20399999618530273, 0.1459999978542328, 0.02199999988079071)
    Nation58_Text(17, Nation58_Frame(14), 0.009999999776482582)
    BlzFrameSetAllPoints(Nation58_Frame(17), Nation58_Frame(14))
    BlzFrameSetTextAlignment(Nation58_Frame(17), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
    BlzFrameSetText(Nation58_Frame(17), "BACK")
    SaveFrameHandle(Nation58_Frames, 0, 18, BlzCreateFrameByType("BUTTON", "Nation61ActionInput", Nation58_Frame(0), "", 18))
    BlzFrameSetLevel(Nation58_Frame(18), 50)
    BlzFrameSetAllPoints(Nation58_Frame(18), Nation58_Frame(6))
    BlzTriggerRegisterFrameEvent(Nation58_ClickTrigger, Nation58_Frame(18), FRAMEEVENT_CONTROL_CLICK)
    BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(18), FRAMEEVENT_MOUSE_ENTER)
    BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(18), FRAMEEVENT_MOUSE_LEAVE)
    SaveFrameHandle(Nation58_Frames, 0, 19, BlzCreateFrameByType("BUTTON", "Nation61ActionInput", Nation58_Frame(0), "", 19))
    BlzFrameSetLevel(Nation58_Frame(19), 50)
    BlzFrameSetAllPoints(Nation58_Frame(19), Nation58_Frame(14))
    BlzTriggerRegisterFrameEvent(Nation58_ClickTrigger, Nation58_Frame(19), FRAMEEVENT_CONTROL_CLICK)
    BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(19), FRAMEEVENT_MOUSE_ENTER)
    BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(19), FRAMEEVENT_MOUSE_LEAVE)
    i = 0
    while true do
        if (i >= 9) then break end
        key = J88_int(20 + J88_int(i * 10))
        x = J88_real(0.04500000178813934 + J88_real(I2R(i) * 0.07900000363588333))
        y = 0.23999999463558197
        --  The complete flag image is the clickable surface; its country name is baked into the art.
        SaveFrameHandle(Nation58_Frames, 0, key, BlzCreateFrameByType("FRAME", "Nation59Banner", Nation58_Frame(0), "", key))
        BlzFrameSetEnable(Nation58_Frame(key), false)
        BlzFrameSetLevel(Nation58_Frame(key), 2)
        UI5_Box(Nation58_Frame(key), x, y, 0.0729999989271164, 0.23999999463558197)
        Nation58_Backdrop(J88_int(key + 1), Nation58_Frame(key), "war3mapImported\\Nation60Idle.blp")
        UI5_Box(Nation58_Frame(J88_int(key + 1)), J88_real(x - 0.001500000013038516), J88_real(y - 0.001500000013038516), 0.07599999755620956, 0.24300000071525574)
        Nation58_Backdrop(J88_int(key + 2), Nation58_Frame(key), Nation58_Icon(i))
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 2)), 1)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 2)), Nation58_Frame(key))
        if (key == 30) then
            UI5_Box(Nation58_Frame(J88_int(key + 2)), x, J88_real(y + 0.05999999865889549), 0.0729999989271164, 0.18000000715255737)
        end
        SaveFrameHandle(Nation58_Frames, 0, J88_int(key + 6), BlzCreateFrameByType("BUTTON", "Nation61Input", Nation58_Frame(0), "", J88_int(key + 6)))
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 6)), 50)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 6)), Nation58_Frame(key))
        BlzTriggerRegisterFrameEvent(Nation58_ClickTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_CONTROL_CLICK)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_ENTER)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_LEAVE)
        --  Identical dimensions, face, size and color; art cannot capture input.
        Nation58_Backdrop(J88_int(key + 7), Nation58_Frame(key), "war3mapImported\\Nation60Idle.blp")
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 7)), 2)
        UI5_Box(Nation58_Frame(J88_int(key + 7)), x, y, 0.0729999989271164, 0.05999999865889549)
        Nation58_Backdrop(J88_int(key + 8), Nation58_Frame(key), "war3mapImported\\Nation60Unavailable.blp")
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 8)), 3)
        UI5_Box(Nation58_Frame(J88_int(key + 8)), J88_real(x + 0.0010000000474974513), J88_real(y + 0.0010000000474974513), 0.07100000232458115, 0.057999998331069946)
        Nation58_Text(J88_int(key + 9), Nation58_Frame(key), 0.012000000104308128)
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 9)), 4)
        UI5_Box(Nation58_Frame(J88_int(key + 9)), J88_real(x + 0.0010000000474974513), J88_real(y + 0.0010000000474974513), 0.07100000232458115, 0.057999998331069946)
        BlzFrameSetTextAlignment(Nation58_Frame(J88_int(key + 9)), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        BlzFrameSetTextColor(Nation58_Frame(J88_int(key + 9)), BlzConvertColor(255, 230, 207, 154))
        BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), Nation58_BannerLabel(i))
        i = J88_int(i + 1)
    end
    i = 1
    while true do
        if (i > 2) then break end
        key = J88_int(110 + J88_int(i * 10))
        x = J88_real(0.27000001072883606 + J88_real(I2R(J88_int(i - 1)) * 0.18000000715255737))
        y = 0.23999999463558197
        SaveFrameHandle(Nation58_Frames, 0, key, BlzCreateFrameByType("FRAME", "Nation59Faction", Nation58_Frame(0), "", key))
        BlzFrameSetEnable(Nation58_Frame(key), false)
        BlzFrameSetLevel(Nation58_Frame(key), 2)
        UI5_Box(Nation58_Frame(key), x, y, 0.0729999989271164, 0.23999999463558197)
        Nation58_Backdrop(J88_int(key + 1), Nation58_Frame(key), "war3mapImported\\Nation60Idle.blp")
        UI5_Box(Nation58_Frame(J88_int(key + 1)), J88_real(x - 0.001500000013038516), J88_real(y - 0.001500000013038516), 0.07599999755620956, 0.24300000071525574)
        Nation58_Backdrop(J88_int(key + 2), Nation58_Frame(key), Nation58_FactionIcon(i))
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 2)), 1)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 2)), Nation58_Frame(key))
        SaveFrameHandle(Nation58_Frames, 0, J88_int(key + 6), BlzCreateFrameByType("BUTTON", "Nation61Input", Nation58_Frame(0), "", J88_int(key + 6)))
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 6)), 50)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 6)), Nation58_Frame(key))
        BlzTriggerRegisterFrameEvent(Nation58_ClickTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_CONTROL_CLICK)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_ENTER)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_LEAVE)
        --  Identical dimensions, face, size and color; art cannot capture input.
        Nation58_Backdrop(J88_int(key + 7), Nation58_Frame(key), "war3mapImported\\Nation60Idle.blp")
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 7)), 2)
        UI5_Box(Nation58_Frame(J88_int(key + 7)), x, y, 0.0729999989271164, 0.05999999865889549)
        Nation58_Backdrop(J88_int(key + 8), Nation58_Frame(key), "war3mapImported\\Nation60Unavailable.blp")
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 8)), 3)
        UI5_Box(Nation58_Frame(J88_int(key + 8)), J88_real(x + 0.0010000000474974513), J88_real(y + 0.0010000000474974513), 0.07100000232458115, 0.057999998331069946)
        Nation58_Text(J88_int(key + 9), Nation58_Frame(key), 0.012000000104308128)
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 9)), 4)
        UI5_Box(Nation58_Frame(J88_int(key + 9)), J88_real(x + 0.0010000000474974513), J88_real(y + 0.0010000000474974513), 0.07100000232458115, 0.057999998331069946)
        BlzFrameSetTextAlignment(Nation58_Frame(J88_int(key + 9)), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        BlzFrameSetTextColor(Nation58_Frame(J88_int(key + 9)), BlzConvertColor(255, 230, 207, 154))
        BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "KMT")
        if (i == 2) then
            BlzFrameSetText(Nation58_Frame(J88_int(key + 9)), "CPC")
        end
        i = J88_int(i + 1)
    end
    Nation58_Text(220, Nation58_Frame(0), 0.017999999225139618)
    UI5_Box(Nation58_Frame(220), 0.05999999865889549, 0.36500000953674316, 0.6800000071525574, 0.05999999865889549)
    BlzFrameSetTextAlignment(Nation58_Frame(220), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
    i = 1
    while true do
        if (i > 4) then break end
        key = J88_int(150 + J88_int(i * 10))
        x = J88_real(0.08500000089406967 + J88_real(I2R(J88_int(i - 1)) * 0.1599999964237213))
        SaveFrameHandle(Nation58_Frames, 0, key, BlzCreateFrameByType("FRAME", "Opening63Option", Nation58_Frame(0), "", key))
        BlzFrameSetEnable(Nation58_Frame(key), false)
        BlzFrameSetLevel(Nation58_Frame(key), 2)
        UI5_Box(Nation58_Frame(key), x, 0.28999999165534973, 0.15000000596046448, 0.05000000074505806)
        Nation58_Backdrop(J88_int(key + 1), Nation58_Frame(key), "war3mapImported\\Nation60Idle.blp")
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 1)), Nation58_Frame(key))
        Nation58_Backdrop(J88_int(key + 2), Nation58_Frame(key), "UI\\WW2HUD\\panel.blp")
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 2)), 1)
        UI5_Box(Nation58_Frame(J88_int(key + 2)), J88_real(x + 0.0020000000949949026), 0.2919999957084656, 0.1459999978542328, 0.04600000008940697)
        Nation58_Text(J88_int(key + 3), Nation58_Frame(key), 0.014000000432133675)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 3)), Nation58_Frame(key))
        BlzFrameSetTextAlignment(Nation58_Frame(J88_int(key + 3)), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        BlzFrameSetText(Nation58_Frame(J88_int(key + 3)), Nation58_DifficultyName(i))
        SaveFrameHandle(Nation58_Frames, 0, J88_int(key + 6), BlzCreateFrameByType("BUTTON", "Opening63Input", Nation58_Frame(0), "", J88_int(key + 6)))
        BlzFrameSetLevel(Nation58_Frame(J88_int(key + 6)), 50)
        BlzFrameSetAllPoints(Nation58_Frame(J88_int(key + 6)), Nation58_Frame(key))
        BlzTriggerRegisterFrameEvent(Nation58_ClickTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_CONTROL_CLICK)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_ENTER)
        BlzTriggerRegisterFrameEvent(Nation58_HoverTrigger, Nation58_Frame(J88_int(key + 6)), FRAMEEVENT_MOUSE_LEAVE)
        i = J88_int(i + 1)
    end
    BlzFrameSetVisible(Nation58_Frame(0), false)
    Nation58_Render()
    TimerStart(CreateTimer(), 0.25, true, Nation58_Poll)
    root = nil
    sync = nil
    chosen = nil
    cancel = nil
    selectors = nil
end
