function UI64_Target(index)
    if (index == 0) then
        do return UI5_Frame(5) end
    elseif (index <= 5) then
        do return UI5_Frame(J88_int(49 + index)) end
    elseif (index == 6) then
        do return UI5_Frame(74) end
    end
    do return UI5_Frame(75) end
end

function UI64_Conceal()
    local i = 0
    local f = nil
    if (not UI64_Modal) then
        do return end
    end
    while true do
        if (i >= 8) then break end
        f = UI64_Target(i)
        if (f ~= nil) then
            --  Alpha also conceals messages if the engine makes them visible again.
            BlzFrameSetAlpha(f, 0)
            BlzFrameSetVisible(f, false)
        end
        i = J88_int(i + 1)
    end
    f = nil
end

function UI64_SetModal(active)
    local i = 0
    local f = nil
    if (active ~= UI64_Modal) then
        while true do
            if (i >= 8) then break end
            f = UI64_Target(i)
            if (f ~= nil) then
                if active then
                    UI64_Visible[i] = BlzFrameIsVisible(f)
                    UI64_Alpha[i] = BlzFrameGetAlpha(f)
                else
                    BlzFrameSetAlpha(f, UI64_Alpha[i])
                    BlzFrameSetVisible(f, UI64_Visible[i])
                end
            end
            i = J88_int(i + 1)
        end
        UI64_Modal = active
    end
    UI64_Conceal()
    f = nil
end

function PM69_Register(query, close)
    --  Plain Lua callbacks. Panel state is client-specific, so it must never evaluate or
    --  execute engine triggers (that would change engine state on one client only).
    PM69_Count = J88_int(PM69_Count + 1)
    PM69_Query[PM69_Count] = query
    PM69_Close[PM69_Count] = close
    do return PM69_Count end
end

function PM69_Activate(id)
    local i = 1
    if ((id < 1) or (id > PM69_Count)) then
        do return end
    end
    PM69_Active = id
    while true do
        if (i > PM69_Count) then break end
        if ((i ~= id) and PM69_Query[i]()) then
            PM69_Close[i]()
        end
        PM69_WasOpen[i] = PM69_Query[i]()
        i = J88_int(i + 1)
    end
    --  Click handlers may lay out/show the incoming frame after claiming focus.
    PM69_WasOpen[id] = true
end

function PM69_Poll()
    local i = 1
    local opened = false
    --  A rebuilt scoreboard must not steal focus from a player-opened panel.
    --  Never call natives on the previous board: it may have been destroyed.
    if (CURRENT_SCOREBOARD ~= PM69_Board) then
        PM69_Board = CURRENT_SCOREBOARD
        if (((CURRENT_SCOREBOARD ~= nil) and (PM69_Active ~= 0)) and (PM69_Active ~= 3)) then
            MultiboardMinimize(CURRENT_SCOREBOARD, true)
        end
    end
    while true do
        if (i > PM69_Count) then break end
        opened = PM69_Query[i]()
        if (opened and (not PM69_WasOpen[i])) then
            PM69_Activate(i)
        else
            PM69_WasOpen[i] = opened
        end
        i = J88_int(i + 1)
    end
    if (PM69_Active > 0) then
        if (not PM69_Query[PM69_Active]()) then
            PM69_Active = 0
        end
    end
end

function PM69_CommanderOpen()
    do return (CM67_Open and BlzFrameIsVisible(CM67_Frame(1))) end
end

function PM69_CommanderClose()
    CM67_Open = false
    BlzFrameSetVisible(CM67_Frame(1), false)
end

function PM69_ArmyOpen()
    do return (AO_Open and BlzFrameIsVisible(AO_Frame(1))) end
end

function PM69_ArmyClose()
    AO_Open = false
    BlzFrameSetVisible(AO_Frame(1), false)
end

function PM69_ScoreOpen()
    if (CURRENT_SCOREBOARD == nil) then
        do return false end
    end
    do return (IsMultiboardDisplayed(CURRENT_SCOREBOARD) and (not IsMultiboardMinimized(CURRENT_SCOREBOARD))) end
end

function PM69_ScoreClose()
    if (CURRENT_SCOREBOARD ~= nil) then
        MultiboardMinimize(CURRENT_SCOREBOARD, true)
    end
end

function PM69_Init()
    PM69_Register(PM69_CommanderOpen, PM69_CommanderClose)
    PM69_Register(PM69_ArmyOpen, PM69_ArmyClose)
    PM69_Register(PM69_ScoreOpen, PM69_ScoreClose)
    TimerStart(CreateTimer(), 0.05000000074505806, true, PM69_Poll)
end
