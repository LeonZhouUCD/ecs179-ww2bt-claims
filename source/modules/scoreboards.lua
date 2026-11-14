function SetMultiboardItemPlayerColor(i, color)
if (color == PLAYER_COLOR_RED) then
MultiboardSetItemValueColor(i, 255, 3, 3, 255)
elseif (color == PLAYER_COLOR_BLUE) then
MultiboardSetItemValueColor(i, 0, 66, 255, 255)
elseif (color == PLAYER_COLOR_CYAN) then
MultiboardSetItemValueColor(i, 28, 230, 185, 255)
elseif (color == PLAYER_COLOR_PURPLE) then
MultiboardSetItemValueColor(i, 84, 0, 129, 255)
elseif (color == PLAYER_COLOR_YELLOW) then
MultiboardSetItemValueColor(i, 255, 252, 1, 255)
elseif (color == PLAYER_COLOR_ORANGE) then
MultiboardSetItemValueColor(i, 254, 138, 14, 255)
elseif (color == PLAYER_COLOR_GREEN) then
MultiboardSetItemValueColor(i, 32, 192, 0, 255)
elseif (color == PLAYER_COLOR_PINK) then
MultiboardSetItemValueColor(i, 229, 91, 176, 255)
end
end

function ScoreFaction_CountryName(pid)
    if (ScoreFaction_Country[pid] == 1) then
        do return "United Kingdom" end
    end
    if (ScoreFaction_Country[pid] == 2) then
        do return "France" end
    end
    if (ScoreFaction_Country[pid] == 3) then
        do return "Italy" end
    end
    if (ScoreFaction_Country[pid] == 4) then
        do return "Germany" end
    end
    if (ScoreFaction_Country[pid] == 5) then
        do return "Poland" end
    end
    if (ScoreFaction_Country[pid] == 6) then
        do return "United States" end
    end
    if (ScoreFaction_Country[pid] == 7) then
        do return "Japan" end
    end
    if (ScoreFaction_Country[pid] == 8) then
        do return "China" end
    end
    if (ScoreFaction_Country[pid] == 9) then
        do return "Soviet Union" end
    end
    do return "Not selected" end
end

function ScoreFaction_Flag(pid)
    if (ScoreFaction_Country[pid] == 8) then
        if (China_Route[pid] == 1) then
            do return "ReplaceableTextures\\CommandButtons\\BTNChinaNationalist.blp" end
        elseif (China_Route[pid] == 2) then
            do return "ReplaceableTextures\\CommandButtons\\BTNChinaCommunist.blp" end
        end
    end
    if (ScoreFaction_Country[pid] == 1) then
        do return "war3mapImported\\BTNUK.blp" end
    end
    if (ScoreFaction_Country[pid] == 2) then
        do return "war3mapImported\\BTNFrance.blp" end
    end
    if (ScoreFaction_Country[pid] == 3) then
        do return "war3mapImported\\BTNFascistItaly.blp" end
    end
    if (ScoreFaction_Country[pid] == 4) then
        do return "war3mapImported\\BTNGermany.blp" end
    end
    if (ScoreFaction_Country[pid] == 5) then
        do return "war3mapImported\\BTNPoland.blp" end
    end
    if (ScoreFaction_Country[pid] == 6) then
        do return "war3mapImported\\BTNUSA.blp" end
    end
    if (ScoreFaction_Country[pid] == 7) then
        do return "war3mapImported\\BTNJapanEmpire.blp" end
    end
    if (ScoreFaction_Country[pid] == 8) then
        do return "war3mapImported\\BTNRepublicChina.blp" end
    end
    if (ScoreFaction_Country[pid] == 9) then
        do return "war3mapImported\\BTNSovietUnion.blp" end
    end
    do return "" end
end

function ScoreFaction_IsFlag()
    local u = GetFilterUnit()
    local t = GetUnitTypeId(u)
    local valid = ((GetWidgetLife(u) > 0.4050000011920929) and ((((((((((((((((((((((((((((((t == 1749435463) or (t == 1749828174)) or (t == 1749233714)) or (t == 1747988567)) or (t == 1747989848)) or (t == 1747992898)) or (t == 1747989296)) or (t == 1747990604)) or (t == 1747990344)) or (t == 1747990598)) or (t == 1747988569)) or (t == 1747993156)) or (t == 1747994690)) or (t == 1747994445)) or (t == 1747994192)) or (t == 1747994960)) or (t == 1747993912)) or (t == 1747993684)) or (t == 1747993683)) or (t == 1747993682)) or (t == 1747994456)) or (t == 1747994196)) or (t == 1747994191)) or (t == 1749889330)) or (t == 1747994195)) or (t == 1749954866)) or (t == 1747988570)) or (t == 1747990359)) or (t == 1747993162)) or (t == 1747993657) or (t == ZK_HQ)))
    u = nil
    do return valid end
end

function ScoreFaction_Observe(pid, t)
    if (t == 1747988567) then
        ScoreFaction_Country[pid] = 1
    end
    if (t == 1747989848) then
        ScoreFaction_Country[pid] = 2
    end
    if (t == 1747992898) then
        ScoreFaction_Country[pid] = 3
    end
    if (t == 1747989296) then
        ScoreFaction_Country[pid] = 4
    end
    if (t == 1747990604) then
        ScoreFaction_Country[pid] = 5
    end
    if (t == 1747990344) then
        ScoreFaction_Country[pid] = 6
    end
    if (t == 1747990598) then
        ScoreFaction_Country[pid] = 7
    end
    if (t == 1747988569) then
        ScoreFaction_Country[pid] = 8
    end
    if (t == 1747993156) then
        ScoreFaction_Country[pid] = 9
    end
    if (t == 1747994690) then
        ScoreFaction_Country[pid] = 1
        ScoreFaction_Commander[pid] = "Bernard Montgomery"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNBernardMontgomery.blp"
    end
    if (t == 1747994445) then
        ScoreFaction_Country[pid] = 1
        ScoreFaction_Commander[pid] = "Alan Turing"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNElfVillager.blp"
    end
    if (t == 1747994192) then
        ScoreFaction_Country[pid] = 1
        ScoreFaction_Commander[pid] = "Dwight Eisenhower"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNDwightEisenhower.blp"
    end
    if (t == 1749435463) then
        ScoreFaction_Country[pid] = 2
        ScoreFaction_Commander[pid] = "Charles de Gaulle"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNFranceDeGaulle.blp"
    end
    if (t == 1747994960) then
        ScoreFaction_Country[pid] = 2
        ScoreFaction_Commander[pid] = "Philippe Petain"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNFrancePetain.blp"
    end
    if (t == 1747993912) then
        ScoreFaction_Country[pid] = 4
        ScoreFaction_Commander[pid] = "Hermann Goring"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNGoring.blp"
    end
    if (t == 1747993684) then
        ScoreFaction_Country[pid] = 4
        ScoreFaction_Commander[pid] = "Adolf Hitler"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNHitlerparody.blp"
    end
    if (t == 1747993683) then
        ScoreFaction_Country[pid] = 4
        ScoreFaction_Commander[pid] = "Heinrich Himmler"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNMemeHimmler.blp"
    end
    if (t == 1747993682) then
        ScoreFaction_Country[pid] = 4
        ScoreFaction_Commander[pid] = "Erwin Rommel"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNChadRommel.blp"
    end
    if (t == 1747994456) then
        ScoreFaction_Country[pid] = 6
        ScoreFaction_Commander[pid] = "George S. Patton"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNGeorgeSPatton.blp"
    end
    if (t == 1747994196) then
        ScoreFaction_Country[pid] = 6
        ScoreFaction_Commander[pid] = "Chester Nimitz"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNChesterNimitz.blp"
    end
    if (t == 1747994191) then
        ScoreFaction_Country[pid] = 6
        ScoreFaction_Commander[pid] = "Dwight Eisenhower"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNDwightEisenhower.blp"
    end
    if (t == 1749889330) then
        ScoreFaction_Country[pid] = 6
        ScoreFaction_Commander[pid] = "Douglas MacArthur"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNMacArthur.blp"
    end
    if (t == 1747994195) then
        ScoreFaction_Country[pid] = 7
        ScoreFaction_Commander[pid] = "Isoroku Yamamoto"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNYamamoto.blp"
    end
    if (t == 1749954866) then
        ScoreFaction_Country[pid] = 7
        ScoreFaction_Commander[pid] = "Chuichi Nagumo"
        ScoreFaction_CommanderIcon[pid] = "war3mapImported\\BTNNagumo.blp"
    end
    if (t == 1747988570) then
        ScoreFaction_Country[pid] = 8
    end
    if (t == 1747990359) then
        ScoreFaction_Country[pid] = 8
    end
    if (t == 1747993162) then
        ScoreFaction_Country[pid] = 5
    end
    if (t == 1747993657) then
        ScoreFaction_Country[pid] = 5
    end
    if (t == ZK_HQ) then
        ScoreFaction_Country[pid] = 9
        ScoreFaction_Commander[pid] = "Georgy Zhukov"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNZhukovCommander.blp"
    end
    if (t == 1749828174) then
        ScoreFaction_Country[pid] = 8
        ScoreFaction_Commander[pid] = "Lin Biao"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNLinBiao.blp"
    end
    if (t == 1749233714) then
        ScoreFaction_Country[pid] = 8
        ScoreFaction_Commander[pid] = "Chairman Mao"
        ScoreFaction_CommanderIcon[pid] = "ReplaceableTextures\\CommandButtons\\BTNMaoZedong.blp"
    end
end

function ScoreFaction_ReadPlayer(pid)
    local u = nil
    ScoreFaction_Commander[pid] = "None"
    ScoreFaction_CommanderIcon[pid] = ""
    GroupEnumUnitsOfPlayer(ScoreFaction_Search, Player(pid), LoadBooleanExprHandle(ScoreFaction_State, 0, 0))
    while true do
        u = FirstOfGroup(ScoreFaction_Search)
        if (u == nil) then break end
        GroupRemoveUnit(ScoreFaction_Search, u)
        ScoreFaction_Observe(pid, GetUnitTypeId(u))
    end
    if (China_Route[pid] ~= 0) then
        ScoreFaction_Country[pid] = 8
    end
    u = nil
end

function ScoreFaction_SetRow(mb, row, pid)
    local mi = nil
    local icon = nil
    local country = nil
    local changed = false
    mi = MultiboardGetItem(mb, row, 0)
    MultiboardSetItemStyle(mi, true, true)
    MultiboardSetItemIcon(mi, PF73_Icon(PF73_Rank(pid)))
    MultiboardSetItemValue(mi, J88_concat(J88_concat(PF73_RankName[PF73_Rank(pid)], "  "), GetPlayerName(Player(pid))))
    MultiboardReleaseItem(mi)
    ScoreFaction_Row[pid] = row
    --  Preserve the scan and its ordering: flags/commanders can change at runtime.
    ScoreFaction_ReadPlayer(pid)
    icon = ScoreFaction_Flag(pid)
    country = ScoreFaction_CountryName(pid)
    changed = (((not PerfUI_RowKnown[pid]) or (PerfUI_RowBoard[pid] ~= mb)) or (PerfUI_RowNumber[pid] ~= row))
    if ((changed or (PerfUI_Country[pid] ~= country)) or (PerfUI_Flag[pid] ~= icon)) then
        mi = MultiboardGetItem(mb, row, 1)
        MultiboardSetItemStyle(mi, true, (icon ~= ""))
        MultiboardSetItemValueColor(mi, 255, 255, 255, 255)
        MultiboardSetItemValue(mi, country)
        MultiboardSetItemIcon(mi, icon)
        MultiboardReleaseItem(mi)
        PerfUI_Country[pid] = country
        PerfUI_Flag[pid] = icon
        PerfUI_BoardStyled = false
    end
    if ((changed or (PerfUI_Commander[pid] ~= ScoreFaction_Commander[pid])) or (PerfUI_CommanderIcon[pid] ~= ScoreFaction_CommanderIcon[pid])) then
        mi = MultiboardGetItem(mb, row, 2)
        MultiboardSetItemStyle(mi, true, (ScoreFaction_CommanderIcon[pid] ~= ""))
        MultiboardSetItemIcon(mi, ScoreFaction_CommanderIcon[pid])
        MultiboardSetItemValueColor(mi, 255, 255, 255, 255)
        MultiboardSetItemValue(mi, ScoreFaction_Commander[pid])
        MultiboardReleaseItem(mi)
        PerfUI_Commander[pid] = ScoreFaction_Commander[pid]
        PerfUI_CommanderIcon[pid] = ScoreFaction_CommanderIcon[pid]
        PerfUI_BoardStyled = false
    end
    PerfUI_RowKnown[pid] = true
    PerfUI_RowBoard[pid] = mb
    PerfUI_RowNumber[pid] = row
    mi = nil
end

function ScoreFaction_ResetRows()
    local pid = 0
    PerfUI_BoardStyled = false
    PerfUI_StyledBoard = nil
    while true do
        if (pid >= 8) then break end
        ScoreFaction_Row[pid] = 0
        PerfUI_RowKnown[pid] = false
        PerfUI_RowBoard[pid] = nil
        pid = J88_int(pid + 1)
    end
end

function ScoreFaction_Refresh()
    local pid = 0
    if (CURRENT_SCOREBOARD == nil) then
        do return end
    end
    while true do
        if (pid >= 8) then break end
        if (ScoreFaction_Row[pid] > 0) then
            ScoreFaction_SetRow(CURRENT_SCOREBOARD, ScoreFaction_Row[pid], pid)
        end
        pid = J88_int(pid + 1)
    end
end

function ScoreFaction_Init()
    ScoreFaction_Search = CreateGroup()
    ScoreFaction_State = InitHashtable()
    SaveBooleanExprHandle(ScoreFaction_State, 0, 0, Condition(ScoreFaction_IsFlag))
    ScoreFaction_Timer = CreateTimer()
    TimerStart(ScoreFaction_Timer, 1.0, true, ScoreFaction_Refresh)
end

function Score63_DestroyCurrent()
    local board = CURRENT_SCOREBOARD
    local pid = 0
    --  Invalidate all script references before native destruction. A unit event
    --  during the next spawn pass must not update the previous board or cells.
    CURRENT_SCOREBOARD = nil
    ScoreFaction_ResetRows()
    while true do
        if (pid >= 8) then break end
        if (KILL_POINT_ITEM[pid] ~= nil) then
            MultiboardReleaseItem(KILL_POINT_ITEM[pid])
            KILL_POINT_ITEM[pid] = nil
        end
        if (FINAL_TOUR_PLAYERNAME_MI[pid] ~= nil) then
            MultiboardReleaseItem(FINAL_TOUR_PLAYERNAME_MI[pid])
            FINAL_TOUR_PLAYERNAME_MI[pid] = nil
        end
        pid = J88_int(pid + 1)
    end
    if (board ~= nil) then
        DestroyMultiboard(board)
    end
    board = nil
end

function CreateVsRoundScoreboard()
local mb = CreateMultiboardBJ(5, 16, J88_concat("Round ", I2S(udg_int_CurVsRound)))
local mi = nil
local i = 0
local current = 0
ScoreFaction_ResetRows()
MultiboardSetItemsStyle(mb, true, false)
MultiboardSetItemWidthBJ(mb, 2, 0, 7.199999809265137)
MultiboardSetItemWidthBJ(mb, 3, 0, 9.899999618530273)
mi = MultiboardGetItem(mb, 0, 1)
MultiboardSetItemValue(mi, "Country")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, 0, 2)
MultiboardSetItemValue(mi, "Commander")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 1, 0, 14.0)
mi = MultiboardGetItem(mb, 0, 3)
MultiboardSetItemValue(mi, "Army Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 4, 0, 5.400000095367432)
mi = MultiboardGetItem(mb, 0, 4)
MultiboardSetItemValue(mi, "Kill Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 5, 0, 3.5999999046325684)
while true do
if (i == 4) then break end
current = udg_int_OpponentHelper[i]
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 0)
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(current)))
MultiboardSetItemValue(mi, GetPlayerName(Player(current)))
ScoreFaction_SetRow(mb, J88_int(1 + J88_int(i * 4)), current)
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 3)
ARMY_POINTS[current] = CalcArmyPoints(Player(current))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[current]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 4)
MultiboardSetItemValue(mi, "0")
KILL_POINT_ITEM[current] = mi
mi = MultiboardGetItem(mb, J88_int(2 + J88_int(i * 4)), 0)
MultiboardSetItemValue(mi, "    VS")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 0)
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(udg_int_Opponent[current])))
MultiboardSetItemValue(mi, GetPlayerName(Player(udg_int_Opponent[current])))
ScoreFaction_SetRow(mb, J88_int(3 + J88_int(i * 4)), udg_int_Opponent[current])
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 3)
ARMY_POINTS[udg_int_Opponent[current]] = CalcArmyPoints(Player(udg_int_Opponent[current]))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[udg_int_Opponent[current]]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 4)
MultiboardSetItemValue(mi, "0")
KILL_POINT_ITEM[udg_int_Opponent[current]] = mi
i = J88_int(i + 1)
end
if (IsMultiboardMinimized(mb) ~= true) then
MultiboardMinimize(mb, true)
MultiboardMinimize(mb, false)
end
mi = nil
do return mb end
end

function CreatePreRoundScoreboard()
local mb = CreateMultiboardBJ(5, 9, "Statistics")
local mi = nil
local i = 0
ScoreFaction_ResetRows()
MultiboardSetItemsStyle(mb, true, false)
MultiboardSetItemWidthBJ(mb, 2, 0, 7.199999809265137)
MultiboardSetItemWidthBJ(mb, 3, 0, 9.899999618530273)
mi = MultiboardGetItem(mb, 0, 1)
MultiboardSetItemValue(mi, "Country")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, 0, 2)
MultiboardSetItemValue(mi, "Commander")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 1, 0, 14.0)
mi = MultiboardGetItem(mb, 0, 3)
MultiboardSetItemValue(mi, "Army Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 4, 0, 5.400000095367432)
mi = MultiboardGetItem(mb, 0, 4)
MultiboardSetItemValue(mi, "Blood Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 5, 0, 5.400000095367432)
while true do
if (i == 8) then break end
mi = MultiboardGetItem(mb, J88_int(i + 1), 0)
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(i)))
MultiboardSetItemValue(mi, GetPlayerName(Player(i)))
ScoreFaction_SetRow(mb, J88_int(i + 1), i)
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(i + 1), 3)
ARMY_POINTS[i] = CalcArmyPoints(Player(i))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[i]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(i + 1), 4)
MultiboardSetItemValue(mi, I2S(GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_LUMBER)))
MultiboardReleaseItem(mi)
i = J88_int(i + 1)
end
if (IsMultiboardMinimized(mb) ~= true) then
MultiboardMinimize(mb, true)
MultiboardMinimize(mb, false)
end
mi = nil
do return mb end
end

function CreateBonusScoreboard(title)
local mb = CreateMultiboardBJ(5, 9, title)
local mi = nil
local i = 0
local current = 0
ScoreFaction_ResetRows()
MultiboardSetItemsStyle(mb, true, false)
MultiboardSetItemWidthBJ(mb, 2, 0, 7.199999809265137)
MultiboardSetItemWidthBJ(mb, 3, 0, 9.899999618530273)
mi = MultiboardGetItem(mb, 0, 1)
MultiboardSetItemValue(mi, "Country")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, 0, 2)
MultiboardSetItemValue(mi, "Commander")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 1, 0, 14.0)
mi = MultiboardGetItem(mb, 0, 3)
MultiboardSetItemValue(mi, "Army Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 4, 0, 5.400000095367432)
mi = MultiboardGetItem(mb, 0, 4)
MultiboardSetItemValue(mi, "Blood Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 5, 0, 5.400000095367432)
while true do
if (i == 8) then break end
current = RANDOM_PLAYER_ORDER[i]
mi = MultiboardGetItem(mb, J88_int(i + 1), 0)
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(current)))
MultiboardSetItemValue(mi, GetPlayerName(Player(current)))
ScoreFaction_SetRow(mb, J88_int(i + 1), current)
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(i + 1), 3)
ARMY_POINTS[current] = CalcArmyPoints(Player(current))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[current]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(i + 1), 4)
KILL_POINT_ITEM[current] = mi
MultiboardSetItemValue(mi, "?")
i = J88_int(i + 1)
end
if (IsMultiboardMinimized(mb) ~= true) then
MultiboardMinimize(mb, true)
MultiboardMinimize(mb, false)
end
mi = nil
do return mb end
end

function CreateTournamentScoreboard(title, num, offset)
local mb = CreateMultiboardBJ(5, J88_int(4 * J88_div(num, 2)), title)
local mi = nil
local i = 0
local current = 0
ScoreFaction_ResetRows()
MultiboardSetItemsStyle(mb, true, false)
MultiboardSetItemWidthBJ(mb, 2, 0, 7.199999809265137)
MultiboardSetItemWidthBJ(mb, 3, 0, 9.899999618530273)
mi = MultiboardGetItem(mb, 0, 1)
MultiboardSetItemValue(mi, "Country")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, 0, 2)
MultiboardSetItemValue(mi, "Commander")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 1, 0, 14.0)
mi = MultiboardGetItem(mb, 0, 3)
MultiboardSetItemValue(mi, "Army Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 4, 0, 5.400000095367432)
mi = MultiboardGetItem(mb, 0, 4)
MultiboardSetItemValue(mi, "Blood Pts")
MultiboardReleaseItem(mi)
MultiboardSetItemWidthBJ(mb, 5, 0, 5.400000095367432)
while true do
if (i == J88_div(num, 2)) then break end
current = FINAL_TOUR_ORDER[J88_int(offset + J88_int(i * 2))]
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 0)
FINAL_TOUR_PLAYERNAME_MI[current] = mi
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(current)))
MultiboardSetItemValue(mi, GetPlayerName(Player(current)))
ScoreFaction_SetRow(mb, J88_int(1 + J88_int(i * 4)), current)
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 3)
ARMY_POINTS[current] = CalcArmyPoints(Player(current))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[current]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(1 + J88_int(i * 4)), 4)
BLOOD_POINTS[current] = GetPlayerState(Player(current), PLAYER_STATE_RESOURCE_LUMBER)
MultiboardSetItemValue(mi, I2S(BLOOD_POINTS[current]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(2 + J88_int(i * 4)), 0)
MultiboardSetItemValue(mi, "    VS")
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 0)
current = FINAL_TOUR_ORDER[J88_int(offset + J88_int(1 + J88_int(i * 2)))]
SetMultiboardItemPlayerColor(mi, GetPlayerColor(Player(current)))
FINAL_TOUR_PLAYERNAME_MI[current] = mi
MultiboardSetItemValue(mi, GetPlayerName(Player(current)))
ScoreFaction_SetRow(mb, J88_int(3 + J88_int(i * 4)), current)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 3)
ARMY_POINTS[current] = CalcArmyPoints(Player(current))
MultiboardSetItemValue(mi, I2S(ARMY_POINTS[current]))
MultiboardReleaseItem(mi)
mi = MultiboardGetItem(mb, J88_int(3 + J88_int(i * 4)), 4)
BLOOD_POINTS[current] = GetPlayerState(Player(current), PLAYER_STATE_RESOURCE_LUMBER)
MultiboardSetItemValue(mi, I2S(BLOOD_POINTS[current]))
MultiboardReleaseItem(mi)
i = J88_int(i + 1)
end
if (IsMultiboardMinimized(mb) ~= true) then
MultiboardMinimize(mb, true)
MultiboardMinimize(mb, false)
end
mi = nil
do return mb end
end
