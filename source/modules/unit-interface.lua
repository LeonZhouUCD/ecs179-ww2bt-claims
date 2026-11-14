function UI5_Frame(key)
    do return LoadFrameHandle(ww2_ui5_frames, 0, key) end
end

function UI5_Cache(key, frame)
    SaveFrameHandle(ww2_ui5_frames, 0, key, frame)
end

function UI5_Box(frame, x, y, width, height)
    if (frame ~= nil) then
        BlzFrameClearAllPoints(frame)
        BlzFrameSetAbsPoint(frame, FRAMEPOINT_BOTTOMLEFT, x, y)
        BlzFrameSetSize(frame, width, height)
    end
end

function UI44_X(x)
    do return J88_real(0.4000000059604645 + J88_real(J88_real(x - 0.4000000059604645) * 0.8999999761581421)) end
end

function UI44_Scale(frame, scale)
    if (frame ~= nil) then
        BlzFrameSetScale(frame, scale)
    end
end

function UI44_Box(frame, x, y, width, height)
    UI5_Box(frame, UI44_X(x), J88_real(y * 0.8999999761581421), J88_real(width * 0.8999999761581421), J88_real(height * 0.8999999761581421))
end

function UI44_NativeBox(frame, x, y, width, height)
    --  Native child artwork follows its container scale. Do not shrink dimensions twice.
    UI5_Box(frame, UI44_X(x), J88_real(y * 0.8999999761581421), width, height)
end

function UI5_Hide(frame)
    if (frame ~= nil) then
        BlzFrameSetVisible(frame, false)
    end
end

function UI5_Backdrop(key, texture)
    local frame = BlzCreateFrameByType("BACKDROP", J88_concat("WW2HUD", I2S(key)), UI5_Frame(3), "", 0)
    BlzFrameSetTexture(frame, texture, 0, true)
    BlzFrameSetLevel(frame, 0)
    UI5_Cache(key, frame)
    frame = nil
end

function UI5_Text(key, fontSize)
    local frame = BlzCreateFrameByType("TEXT", J88_concat("WW2HUD", I2S(key)), UI5_Frame(3), "", 0)
    BlzFrameSetFont(frame, "Fonts\\FRIZQT__.TTF", J88_real(fontSize * 0.8999999761581421), 0)
    BlzFrameSetTextAlignment(frame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
    BlzFrameSetTextColor(frame, BlzConvertColor(255, 181, 201, 153))
    BlzFrameSetLevel(frame, 3)
    UI5_Cache(key, frame)
    frame = nil
end

function UI6_AttackIcon(kind)
    if (kind == 0) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalSpellAttack.blp" end
    elseif (kind == 1) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalMelee.blp" end
    elseif (kind == 2) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalRifles.blp" end
    elseif (kind == 3) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalArtillery.blp" end
    elseif (kind == 4) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalForceAttack.blp" end
    elseif (kind == 5) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalHeavyCannon.blp" end
    elseif (kind == 6) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalAirAttack.blp" end
    end
    do return "ReplaceableTextures\\CommandButtons\\BTNTacticalSpellAttack.blp" end
end

function UI6_ArmorIcon(kind)
    if (kind == 0) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalInfantry.blp" end
    elseif (kind == 1) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalLightVehicle.blp" end
    elseif (kind == 2) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalHeavyArmor.blp" end
    elseif (kind == 3) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalFortified.blp" end
    elseif (kind == 4) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalMeleeArmor.blp" end
    elseif (kind == 5) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalAircraft.blp" end
    elseif (kind == 6) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalForceArmor.blp" end
    elseif (kind == 7) then
        do return "ReplaceableTextures\\CommandButtons\\BTNTacticalLightInfantry.blp" end
    end
    do return "ReplaceableTextures\\CommandButtons\\BTNTacticalInfantry.blp" end
end

function UI6_BoardStyle()
    local row = 0
    local column = 0
    local rows = 0
    local columns = 0
    local cell = nil
    if (CURRENT_SCOREBOARD == nil) then
        do return end
    end
    --  This loop runs identically on every client; selection is not involved.
    --  Preserve all player colors, values, flags and scoreboard calculations.
    MultiboardSetTitleTextColor(CURRENT_SCOREBOARD, 166, 188, 126, 255)
    rows = MultiboardGetRowCount(CURRENT_SCOREBOARD)
    columns = MultiboardGetColumnCount(CURRENT_SCOREBOARD)
    --  Value changes retain their colors. Recolor only a new/resized board or
    --  country/commander cells explicitly refreshed by ScoreFaction_SetRow.
    if (((PerfUI_BoardStyled and (PerfUI_StyledBoard == CURRENT_SCOREBOARD)) and (PerfUI_StyledRows == rows)) and (PerfUI_StyledColumns == columns)) then
        do return end
    end
    PerfUI_BoardStyled = true
    PerfUI_StyledBoard = CURRENT_SCOREBOARD
    PerfUI_StyledRows = rows
    PerfUI_StyledColumns = columns
    while true do
        if (row >= rows) then break end
        column = 1
        while true do
            if (column >= columns) then break end
            cell = MultiboardGetItem(CURRENT_SCOREBOARD, row, column)
            if (row == 0) then
                MultiboardSetItemValueColor(cell, 166, 188, 126, 255)
            else
                MultiboardSetItemValueColor(cell, 209, 220, 188, 255)
            end
            MultiboardReleaseItem(cell)
            column = J88_int(column + 1)
        end
        row = J88_int(row + 1)
    end
    cell = nil
end

function UI5_InventoryHide()
    local i = 0
    local frame = nil
    while true do
        if (i == 6) then break end
        frame = UI5_Frame(J88_int(40 + i))
        if (frame ~= nil) then
            UI5_Box(frame, J88_real(-1.0), J88_real(-1.0), 0.0010000000474974513, 0.0010000000474974513)
            BlzFrameSetEnable(frame, false)
            BlzFrameSetVisible(frame, false)
        end
        i = J88_int(i + 1)
    end
    UI5_Hide(UI5_Frame(12))
    --  InventoryText is a SimpleString: hide through its font, not visibility.
    if (UI5_Frame(13) ~= nil) then
        BlzFrameSetFont(UI5_Frame(13), "", 0.0, 0)
    end
    frame = nil
end

function UI9_NativeBase()
    --  Options Save can restore the client's HUD scale without a resize.
    --  Normalize the two documented HUD scale roots, never individual buttons.
    if ((UI5_Frame(3) ~= nil) and (UI5_Frame(3) ~= UI5_Frame(1))) then
        BlzFrameSetScale(UI5_Frame(3), 1.0)
    end
    if (UI5_Frame(15) ~= nil) then
        BlzFrameSetScale(UI5_Frame(15), 1.0)
        if (ww2_ui9_bottom_height <= 0.0) then
            ww2_ui9_bottom_height = BlzFrameGetHeight(UI5_Frame(15))
        end
        --  Keep the native bottom-control reference stable. Tooltip placement
        --  and screen-edge clamping are owned by the engine, not a second timer.
        BlzFrameClearAllPoints(UI5_Frame(15))
        BlzFrameSetSize(UI5_Frame(15), 0.800000011920929, ww2_ui9_bottom_height)
        BlzFrameSetAbsPoint(UI5_Frame(15), FRAMEPOINT_BOTTOMRIGHT, 0.6097000241279602, J88_real(-0.002199999988079071))
        BlzFrameSetVisible(UI5_Frame(15), false)
    end
    --  Scale native containers, never lazy CommandButton art handles.
    UI44_Scale(UI5_Frame(17), 0.8999999761581421)
    UI44_Scale(UI5_Frame(6), 0.8999999761581421)
    UI44_Scale(UI5_Frame(7), 0.8999999761581421)
    if (UI5_Frame(72) ~= nil) then
        BlzFrameSetScale(UI5_Frame(72), 0.8999999761581421)
    end
    if (UI5_Frame(5) ~= nil) then
        BlzFrameSetScale(UI5_Frame(5), 1.0)
    end
    UI44_Scale(UI5_Frame(50), 0.8999999761581421)
    UI44_Scale(UI5_Frame(51), 0.8999999761581421)
    UI44_Scale(UI5_Frame(52), 0.8999999761581421)
    UI44_Scale(UI5_Frame(53), 0.8999999761581421)
    UI44_Scale(UI5_Frame(54), 0.8999999761581421)
end

function UI9_MoveCommand(frame, left, top)
    if (frame ~= nil) then
        --  SetSize no longer resizes native command art; SetScale can crash.
        --  Preserve the engine's button, cooldown, hotkey and click geometry.
        BlzFrameClearAllPoints(frame)
        BlzFrameSetAbsPoint(frame, FRAMEPOINT_TOPLEFT, UI44_X(left), J88_real(top * 0.8999999761581421))
    end
end

function UI9_LayoutProgress()
    local key = 81
    local page = nil
    while true do
        if (key > 82) then break end
        page = UI5_Frame(key)
        if (page ~= nil) then
            --  These are SIMPLEFRAME pages, not command/queue buttons.
            --  Keep the native queue and progress relationships together.
            BlzFrameSetScale(page, 0.75)
            BlzFrameClearAllPoints(page)
            BlzFrameSetSize(page, 0.18812499940395355, 0.11406250298023224)
            BlzFrameSetAbsPoint(page, FRAMEPOINT_TOPLEFT, UI44_X(0.24699999392032623), 0.12780000269412994)
        end
        key = J88_int(key + 1)
    end
    --  Named String objects must not receive visibility/alpha/container calls.
    if (UI5_Frame(83) ~= nil) then
        BlzFrameSetFont(UI5_Frame(83), "", 0.0, 0)
    end
    if (UI5_Frame(84) ~= nil) then
        BlzFrameSetFont(UI5_Frame(84), "", 0.0, 0)
    end
    page = nil
end

function UI9_NativeDetailActive(count)
    if (count ~= 1) then
        do return false end
    end
    if (UI5_Frame(81) ~= nil) then
        if BlzFrameIsVisible(UI5_Frame(81)) then
            do return true end
        end
    end
    if (UI5_Frame(82) ~= nil) then
        if BlzFrameIsVisible(UI5_Frame(82)) then
            do return true end
        end
    end
    do return false end
end

function UI70_Left()
    local w = BlzGetLocalClientWidth()
    local h = BlzGetLocalClientHeight()
    if ((w <= 0) or (h <= 0)) then
        do return 0.00800000037997961 end
    end
    do return J88_real(J88_real(0.4000000059604645 - J88_real(J88_real(0.30000001192092896 * I2R(w)) / I2R(h))) + 0.00800000037997961) end
end

function UI5_Layout()
    local i = 0
    local column = 0
    local row = 0
    local pixelWidth = BlzGetLocalClientWidth()
    local pixelHeight = BlzGetLocalClientHeight()
    local screenWidth = 0.0
    local left = 0.0
    local portraitFactor = 0.0
    local x = 0.0
    local y = 0.0
    local frame = nil
    if ((pixelWidth <= 0) or (pixelHeight <= 0)) then
        do return end
    end
    screenWidth = J88_real(J88_real(0.6000000238418579 * I2R(pixelWidth)) / I2R(pixelHeight))
    left = J88_real(0.4000000059604645 - J88_real(screenWidth * 0.5))
    portraitFactor = J88_real(0.800000011920929 / screenWidth)
    UI9_NativeBase()
    BlzEnableUIAutoPosition(false)
    BlzFrameSetVisible(UI5_Frame(3), true)
    if (UI5_Frame(3) ~= UI5_Frame(1)) then
        BlzFrameSetSize(UI5_Frame(3), 0.0, 9.999999747378752e-05)
    end
    UI5_Hide(UI5_Frame(14))
    UI5_Hide(UI5_Frame(15))
    UI5_Hide(UI5_Frame(10))
    UI5_Hide(UI5_Frame(16))
    UI5_InventoryHide()

    --  A centered, contiguous row: minimap | character | commands | resources.
    UI44_Box(UI5_Frame(102), 0.009999999776482582, 0.0, 0.19200000166893005, 0.1720000058412552)
    UI44_Box(UI5_Frame(100), 0.20200000703334808, 0.0, 0.23000000417232513, 0.1720000058412552)
    UI44_Box(UI5_Frame(121), 0.4320000112056732, 0.0, 0.20800000429153442, 0.1720000058412552)
    UI44_Box(UI5_Frame(103), 0.6399999856948853, 0.0, 0.15000000596046448, 0.1720000058412552)
    UI44_Box(UI5_Frame(111), 0.20999999344348907, 0.14900000393390656, 0.21400000154972076, 0.017000000923871994)
    UI44_Box(UI5_Frame(101), 0.20999999344348907, 0.06700000166893005, 0.05999999865889549, 0.07400000095367432)
    UI5_Box(UI5_Frame(4), J88_real(J88_real(UI44_X(0.21400000154972076) - left) * portraitFactor), 0.06390000134706497, J88_real(0.046799998730421066 * portraitFactor), 0.05939999967813492)
    UI44_Box(UI5_Frame(119), 0.27799999713897705, 0.11500000208616257, 0.02199999988079071, 0.02199999988079071)
    UI44_Box(UI5_Frame(112), 0.3050000071525574, 0.11900000274181366, 0.11699999868869781, 0.014000000432133675)
    UI44_Box(UI5_Frame(120), 0.27799999713897705, 0.09099999815225601, 0.02199999988079071, 0.02199999988079071)
    UI44_Box(UI5_Frame(113), 0.3050000071525574, 0.0949999988079071, 0.11699999868869781, 0.014000000432133675)
    UI44_Box(UI5_Frame(118), 0.27799999713897705, 0.06800000369548798, 0.02500000037252903, 0.014000000432133675)
    UI44_NativeBox(UI5_Frame(7), 0.3050000071525574, 0.06700000166893005, 0.11699999868869781, 0.017000000923871994)
    if (UI5_Frame(71) ~= nil) then
        BlzFrameSetFont(UI5_Frame(71), "", 0.0, 0)
    end
    --  The native group page replaces the single-unit middle area. The engine
    --  owns its children, including the 3.0 transition between 12 and 24 units.
    UI44_NativeBox(UI5_Frame(6), 0.20999999344348907, 0.05400000140070915, 0.2160000056028366, 0.09000000357627869)
    UI9_LayoutProgress()
    UI44_Box(UI5_Frame(105), 0.20999999344348907, 0.03500000014901161, 0.21400000154972076, 0.014999999664723873)
    UI44_Box(UI5_Frame(106), 0.20999999344348907, 0.014999999664723873, 0.21400000154972076, 0.014999999664723873)
    UI44_Box(UI5_Frame(109), 0.21199999749660492, 0.035999998450279236, 0.20999999344348907, 0.013000000268220901)
    UI44_Box(UI5_Frame(110), 0.21199999749660492, 0.01600000075995922, 0.20999999344348907, 0.013000000268220901)

    UI44_NativeBox(UI5_Frame(17), 0.4390000104904175, 0.008999999612569809, 0.1940000057220459, 0.1509999930858612)
    while true do
        if (i == 12) then break end
        column = ModuloInteger(i, 4)
        row = J88_div(i, 4)
        x = J88_real(0.4449999928474426 + J88_real(I2R(column) * 0.04699999839067459))
        y = J88_real(0.01850000023841858 + J88_real(I2R(J88_int(2 - row)) * 0.04699999839067459))
        UI44_Box(UI5_Frame(J88_int(140 + i)), x, y, 0.04100000113248825, 0.04100000113248825)
        UI9_MoveCommand(UI5_Frame(J88_int(20 + i)), J88_real(x + 0.0010000000474974513), J88_real(y + 0.03999999910593033))
        i = J88_int(i + 1)
    end
    frame = UI5_Frame(5)
    if (frame ~= nil) then
        BlzFrameClearAllPoints(frame)
        BlzFrameSetAbsPoint(frame, FRAMEPOINT_BOTTOMLEFT, UI44_X(0.014000000432133675), 0.003599999938160181)
        BlzFrameSetAbsPoint(frame, FRAMEPOINT_TOPRIGHT, UI44_X(0.17800000309944153), 0.15119999647140503)
        BlzFrameSetVisible(frame, true)
    end
    i = 0
    while true do
        if (i == 5) then break end
        UI44_NativeBox(UI5_Frame(J88_int(50 + i)), 0.18000000715255737, J88_real(0.13899999856948853 - J88_real(I2R(i) * 0.029999999329447746)), 0.019999999552965164, 0.023000000044703484)
        i = J88_int(i + 1)
    end
    UI44_NativeBox(UI5_Frame(72), 0.014000000432133675, 0.1720000058412552, 0.02800000086426735, 0.02800000086426735)
    UI44_NativeBox(UI5_Frame(73), 0.014000000432133675, 0.1720000058412552, 0.02800000086426735, 0.02800000086426735)
    UI44_Box(UI5_Frame(115), 0.6800000071525574, 0.11900000274181366, 0.10000000149011612, 0.020999999716877937)
    UI44_Box(UI5_Frame(180), 0.6499999761581421, 0.11900000274181366, 0.020999999716877937, 0.020999999716877937)
    UI44_Box(UI5_Frame(116), 0.6800000071525574, 0.07999999821186066, 0.10000000149011612, 0.020999999716877937)
    UI44_Box(UI5_Frame(181), 0.6499999761581421, 0.07999999821186066, 0.020999999716877937, 0.020999999716877937)
    UI44_Box(UI5_Frame(117), 0.6800000071525574, 0.04100000113248825, 0.10000000149011612, 0.020999999716877937)
    UI44_Box(UI5_Frame(182), 0.6499999761581421, 0.04100000113248825, 0.020999999716877937, 0.020999999716877937)

    --  All four actual system buttons are centered along the top edge.
    UI5_Box(UI5_Frame(104), 0.22599999606609344, 0.5720000267028809, 0.3479999899864197, 0.02800000086426735)
    i = 0
    while true do
        if (i == 4) then break end
        UI5_Box(UI5_Frame(J88_int(60 + i)), J88_real(0.23000000417232513 + J88_real(I2R(i) * 0.08500000089406967)), 0.5759999752044678, 0.08500000089406967, 0.02199999988079071)
        if (UI5_Frame(J88_int(60 + i)) ~= nil) then
            BlzFrameSetTextColor(UI5_Frame(J88_int(60 + i)), BlzConvertColor(255, 181, 201, 153))
        end
        i = J88_int(i + 1)
    end
    if (UI5_Frame(11) ~= nil) then
        BlzFrameSetAlpha(UI5_Frame(11), 0)
        UI5_Box(UI5_Frame(11), 2.0, 2.0, 0.2160000056028366, 0.09000000357627869)
    end
    --  Type-icon hover targets; each tooltip is bound once during initialization.
    UI44_Box(UI5_Frame(160), 0.27799999713897705, 0.11500000208616257, 0.02199999988079071, 0.02199999988079071)
    UI44_Box(UI5_Frame(170), 0.27799999713897705, 0.09099999815225601, 0.02199999988079071, 0.02199999988079071)
    BlzFrameSetScale(UI5_Frame(161), 0.8999999761581421)
    BlzFrameSetScale(UI5_Frame(171), 0.8999999761581421)
    --  Custom type descriptions share the command tooltip's fixed screen area.
    UI44_NativeBox(UI5_Frame(161), 0.30300000309944153, 0.18199999630451202, 0.33000001311302185, 0.2240000069141388)
    UI44_NativeBox(UI5_Frame(171), 0.30300000309944153, 0.18199999630451202, 0.33000001311302185, 0.2240000069141388)
    --  The native tooltip positions itself when hovered. Do not compete with
    --  that layout using absolute points, size writes or a periodic timer.
    frame = nil
    UI64_Conceal()
end

function UI8_CheckLayout()
    local width = BlzGetLocalClientWidth()
    local height = BlzGetLocalClientHeight()
    local changed = false
    local nativeWidth = 0.0
    if ((width <= 0) or (height <= 0)) then
        do return end
    end
    if ((width ~= ww2_ui8_width) or (height ~= ww2_ui8_height)) then
        changed = true
    end
    --  The options dialog may change HUD scale while resolution stays the same.
    if (UI5_Frame(15) ~= nil) then
        nativeWidth = BlzFrameGetWidth(UI5_Frame(15))
        if ((nativeWidth < 0.7990000247955322) or (nativeWidth > 0.8009999990463257)) then
            changed = true
        end
    end
    if (UI5_Frame(5) ~= nil) then
        nativeWidth = BlzFrameGetWidth(UI5_Frame(5))
        if ((nativeWidth < 0.14710000157356262) or (nativeWidth > 0.14810000360012054)) then
            changed = true
        end
        nativeWidth = BlzFrameGetHeight(UI5_Frame(5))
        if ((nativeWidth < 0.14710000157356262) or (nativeWidth > 0.14810000360012054)) then
            changed = true
        end
    end
    if changed then
        ww2_ui8_width = width
        ww2_ui8_height = height
        UI5_Layout()
    end
end

function UI5_Fill(key, y, value, maximum)
    local ratio = 0.0
    if (maximum > 0.0) then
        ratio = J88_real(value / maximum)
    end
    if (ratio < 0.0) then
        ratio = 0.0
    elseif (ratio > 1.0) then
        ratio = 1.0
    end
    PerfUI_SetVisible(key, (ratio > 0.0))
    if (ratio > 0.0) then
        if (((not PerfUI_FillKnown[key]) or (PerfUI_FillRatio[key] ~= ratio)) or (PerfUI_FillY[key] ~= y)) then
            PerfUI_FillKnown[key] = true
            PerfUI_FillRatio[key] = ratio
            PerfUI_FillY[key] = y
            UI44_Box(UI5_Frame(key), 0.21199999749660492, y, J88_real(0.20999999344348907 * ratio), 0.010999999940395355)
        end
    end
end

function UI7_UpdateResources()
    --  Original portrait numbers are hidden by PortraitStats=0 in map Misc.
    --  Never acquire, inspect or modify the engine's lazy portrait text handles.
    PerfUI_SetText(115, I2S(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_GOLD)))
    PerfUI_SetText(116, I2S(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_LUMBER)))
    PerfUI_SetText(117, J88_concat(J88_concat(I2S(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)), " / "), I2S(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_FOOD_CAP))))
end

function UI45_Representative(u)
    local tid = Mao_CanonicalType(GetUnitTypeId(u))
    local count = LoadInteger(AO_Data, tid, 20)
    local i = 0
    local best = 0
    local number = 0
    local current = 0
    while true do
        if (i >= count) then break end
        current = LoadInteger(AO_Data, tid, J88_int(200 + i))
        if (current > number) then
            number = current
            best = LoadInteger(AO_Data, tid, J88_int(100 + i))
        end
        i = J88_int(i + 1)
    end
    do return best end
end

function UI10_ArmorStats(u, representative)
    local speed = 0.0
    local armor = 0.0
    local percent = 0.0
    local result = nil
    if (representative ~= 0) then
        armor = LoadReal(AO_Data, representative, 11)
        speed = LoadReal(AO_Data, representative, 12)
        result = J88_concat("|cffffd36bBase armor: |r", R2SW(armor, 1, 1))
    else
        armor = BlzGetUnitArmor(u)
        speed = GetUnitMoveSpeed(u)
        result = J88_concat("|cffffd36bArmor: |r", R2SW(armor, 1, 1))
    end
    if (armor >= 0.0) then
        percent = J88_real(J88_real(J88_real(100.0 * armor) * 0.05999999865889549) / J88_real(1.0 + J88_real(armor * 0.05999999865889549)))
        result = J88_concat(J88_concat(J88_concat(result, "    |cff80ff80Damage reduction: "), R2SW(percent, 1, 1)), "%|r")
    else
        percent = J88_real(100.0 * J88_real(1.0 - Pow(0.9399999976158142, J88_real(-armor))))
        result = J88_concat(J88_concat(J88_concat(result, "    |cffff6666Extra damage taken: "), R2SW(percent, 1, 1)), "%|r")
    end
    do return J88_concat(J88_concat(J88_concat(result, "|n|cffffd36bMove speed: |r"), R2SW(speed, 1, 0)), "|nArmor effect applies separately from type multipliers.|n|n") end
end

function UI10_AttackStats(u, representative)
    local cooldown = 0.0
    local range = 0.0
    if (representative ~= 0) then
        cooldown = LoadReal(AO_Data, representative, 9)
        range = LoadReal(AO_Data, representative, 10)
    else
        cooldown = BlzGetUnitAttackCooldown(u, 0)
        range = BlzGetUnitWeaponRealField(u, UNIT_WEAPON_RF_ATTACK_RANGE, 0)
    end
    do return J88_concat(J88_concat(J88_concat(J88_concat("|cffffd36bAttack interval (base): |r", R2SW(cooldown, 1, 2)), " s|n|cffffd36bRange: |r"), R2SW(range, 1, 0)), "|nAttack-speed bonuses / slows modify this interval.|n|n") end
end

function UI8_AttackTip(kind)
    if (kind == 0) then
        do return "|cffb5c999Attack type: Melee (Spell attack)|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 1) then
        do return "|cffb5c999Attack type: Melee|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 2) then
        do return "|cffb5c999Attack type: Rifles|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 3) then
        do return "|cffb5c999Attack type: Artillery|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 4) then
        do return "|cffb5c999Attack type: Force/Lightsaber|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 5) then
        do return "|cffb5c999Attack type: Heavy Canon Attack|r|n|cffffd36bDamage against armor:|r" end
    elseif (kind == 6) then
        do return "|cffb5c999Attack type: Air|r|n|cffffd36bDamage against armor:|r" end
    end
    do return "Attack type unavailable." end
end

function UI8_ArmorTip(kind)
    if (kind == 0) then
        do return "|cffb5c999Armor type: Infantry|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 1) then
        do return "|cffb5c999Armor type: Light Vehicles|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 2) then
        do return "|cffb5c999Armor type: Heavy Armoured Vehicles|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 3) then
        do return "|cffb5c999Armor type: Fortified|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 4) then
        do return "|cffb5c999Armor type: Melee|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 5) then
        do return "|cffb5c999Armor type: Planes|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 6) then
        do return "|cffb5c999Armor type: Force User|r|n|cffffd36bDamage received from:|r" end
    elseif (kind == 7) then
        do return "|cffb5c999Armor type: Light Infantry|r|n|cffffd36bDamage received from:|r" end
    end
    do return "Armor type unavailable." end
end

function UI8_AttackTipRow(kind, row)
    if (kind == 0) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 100%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 100%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 100%" end
        end
        if (row == 5) then
            do return "Planes: 100%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 200%" end
        end
    end
    if (kind == 1) then
        if (row == 0) then
            do return "Infantry: 150%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 30%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 50%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 100%" end
        end
        if (row == 5) then
            do return "Planes: 50%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 95%" end
        end
    end
    if (kind == 2) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 50%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 30%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 100%" end
        end
        if (row == 5) then
            do return "Planes: 50%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 150%" end
        end
    end
    if (kind == 3) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 200%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 100%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 200%" end
        end
        if (row == 5) then
            do return "Planes: 100%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 100%" end
        end
    end
    if (kind == 4) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 100%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 100%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 100%" end
        end
        if (row == 5) then
            do return "Planes: 100%" end
        end
        if (row == 6) then
            do return "Force User: 10%" end
        end
        if (row == 7) then
            do return "Light Infantry: 100%" end
        end
    end
    if (kind == 5) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 300%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 200%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 50%" end
        end
        if (row == 5) then
            do return "Planes: 100%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 50%" end
        end
    end
    if (kind == 6) then
        if (row == 0) then
            do return "Infantry: 100%" end
        end
        if (row == 1) then
            do return "Light Vehicles: 200%" end
        end
        if (row == 2) then
            do return "Heavy Armoured Vehicles: 300%" end
        end
        if (row == 3) then
            do return "Fortified: 100%" end
        end
        if (row == 4) then
            do return "Melee: 200%" end
        end
        if (row == 5) then
            do return "Planes: 200%" end
        end
        if (row == 6) then
            do return "Force User: 100%" end
        end
        if (row == 7) then
            do return "Light Infantry: 50%" end
        end
    end
    do return "--" end
end

function UI8_ArmorTipRow(kind, row)
    if (kind == 0) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 150%" end
        end
        if (row == 2) then
            do return "Rifles: 100%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 100%" end
        end
        if (row == 6) then
            do return "Air: 100%" end
        end
    end
    if (kind == 1) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 30%" end
        end
        if (row == 2) then
            do return "Rifles: 50%" end
        end
        if (row == 3) then
            do return "Artillery: 200%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 300%" end
        end
        if (row == 6) then
            do return "Air: 200%" end
        end
    end
    if (kind == 2) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 50%" end
        end
        if (row == 2) then
            do return "Rifles: 30%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 200%" end
        end
        if (row == 6) then
            do return "Air: 300%" end
        end
    end
    if (kind == 3) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 100%" end
        end
        if (row == 2) then
            do return "Rifles: 100%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 100%" end
        end
        if (row == 6) then
            do return "Air: 100%" end
        end
    end
    if (kind == 4) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 100%" end
        end
        if (row == 2) then
            do return "Rifles: 100%" end
        end
        if (row == 3) then
            do return "Artillery: 200%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 50%" end
        end
        if (row == 6) then
            do return "Air: 200%" end
        end
    end
    if (kind == 5) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 50%" end
        end
        if (row == 2) then
            do return "Rifles: 50%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 100%" end
        end
        if (row == 6) then
            do return "Air: 200%" end
        end
    end
    if (kind == 6) then
        if (row == 0) then
            do return "Melee (Spell attack): 100%" end
        end
        if (row == 1) then
            do return "Melee: 100%" end
        end
        if (row == 2) then
            do return "Rifles: 100%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 10%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 100%" end
        end
        if (row == 6) then
            do return "Air: 100%" end
        end
    end
    if (kind == 7) then
        if (row == 0) then
            do return "Melee (Spell attack): 200%" end
        end
        if (row == 1) then
            do return "Melee: 95%" end
        end
        if (row == 2) then
            do return "Rifles: 150%" end
        end
        if (row == 3) then
            do return "Artillery: 100%" end
        end
        if (row == 4) then
            do return "Force/Lightsaber: 100%" end
        end
        if (row == 5) then
            do return "Heavy Canon Attack: 50%" end
        end
        if (row == 6) then
            do return "Air: 50%" end
        end
    end
    do return "--" end
end

function UI11_UpdateRows(attackKind, armorKind)
    local row = 0
    if (HP88_LastAttackRows ~= attackKind) then
        HP88_LastAttackRows = attackKind
        while true do
            if (row == 8) then break end
            PerfUI_SetText(J88_int(300 + row), UI8_AttackTipRow(attackKind, row))
            row = J88_int(row + 1)
        end
    end
    if (HP88_LastArmorRows ~= armorKind) then
        HP88_LastArmorRows = armorKind
        row = 0
        while true do
            if (row == 7) then break end
            PerfUI_SetText(J88_int(320 + row), UI8_ArmorTipRow(armorKind, row))
            row = J88_int(row + 1)
        end
    end
end

function UI76_SyncLists(lists, selected)
    --  Synchronized: runs on every client with the same players and units.
    local list = nil
    local u = nil
    for pid = 0, 7 do
        list = lists[pid]
        if (list == nil) then
            list = {}
            lists[pid] = list
        end
        for i = #list, 1, -1 do
            list[i] = nil
        end
        GroupClear(ww2_ui5_selection)
        if selected then
            GroupEnumUnitsSelected(ww2_ui5_selection, Player(pid), nil)
        else
            GroupEnumUnitsOfPlayer(ww2_ui5_selection, Player(pid), nil)
        end
        while true do
            u = FirstOfGroup(ww2_ui5_selection)
            if (u == nil) then break end
            GroupRemoveUnit(ww2_ui5_selection, u)
            list[#list + 1] = u
        end
    end
    list = nil
    u = nil
end

function UI5_Update()
    local u = nil
    local only = nil
    local count = 0
    local nativeDetails = false
    local dice = 0
    local sides = 0
    local base = 0
    local representative = 0
    local attackKind = 0
    local armorKind = 0
    local hp = 0.0
    local maxHP = 0.0
    local mana = 0.0
    local maxMana = 0.0
    local prefix = ""
    local attack = ""
    --  Every client lists every player's selection; the local view only reads its own list.
    UI76_SyncLists(UI76_Selected, true)
    for _, picked in ipairs(UI76_Selected[GetPlayerId(GetLocalPlayer())] or {}) do
        u = picked
        count = J88_int(count + 1)
        only = u
        hp = J88_real(hp + RMaxBJ(0.0, GetWidgetLife(u)))
        maxHP = J88_real(maxHP + I2R(BlzGetUnitMaxHP(u)))
        mana = J88_real(mana + RMaxBJ(0.0, GetUnitState(u, UNIT_STATE_MANA)))
        maxMana = J88_real(maxMana + I2R(BlzGetUnitMaxMana(u)))
    end
    nativeDetails = UI9_NativeDetailActive(count)
    if (count == 1) then
        PerfUI_SetText(111, GetUnitName(only))
        attackKind = BlzGetUnitWeaponIntegerField(only, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0)
        armorKind = BlzGetUnitIntegerField(only, UNIT_IF_DEFENSE_TYPE)
        representative = UI45_Representative(only)
        if (representative ~= 0) then
            attackKind = LoadInteger(AO_Data, representative, 7)
            armorKind = LoadInteger(AO_Data, representative, 8)
        end
        PerfUI_SetTexture(119, UI6_AttackIcon(attackKind))
        PerfUI_SetTexture(120, UI6_ArmorIcon(armorKind))
        UI11_UpdateRows(attackKind, armorKind)
        if (UI5_Frame(80) ~= nil) then
            attack = BlzFrameGetText(UI5_Frame(80))
        end
        if ((attack == nil) or (attack == "")) then
            base = BlzGetUnitBaseDamage(only, 0)
            dice = BlzGetUnitDiceNumber(only, 0)
            sides = BlzGetUnitDiceSides(only, 0)
            attack = J88_concat(J88_concat(I2S(J88_int(base + dice)), " - "), I2S(J88_int(base + J88_int(dice * sides))))
        end
        if (representative ~= 0) then
            attack = J88_concat(J88_concat(I2S(LoadInteger(AO_Data, representative, 13)), " - "), I2S(LoadInteger(AO_Data, representative, 14)))
            PerfUI_SetText(112, J88_concat("Attack: ", attack))
            PerfUI_SetText(113, J88_concat("Armor: ", R2SW(LoadReal(AO_Data, representative, 11), 1, 1)))
        else
        PerfUI_SetText(112, J88_concat("Attack: ", attack))
        PerfUI_SetText(113, J88_concat("Armor: ", R2SW(BlzGetUnitArmor(only), 1, 1)))
        end
    elseif (count > 1) then
        prefix = "Selection "
        PerfUI_SetText(111, J88_concat(J88_concat("Selection (", I2S(count)), " units)"))
        PerfUI_SetText(112, "Attack: varies by unit")
        PerfUI_SetText(113, "Armor: varies by unit")
    else
        PerfUI_SetText(111, "No unit selected")
        PerfUI_SetText(112, "Attack: --")
        PerfUI_SetText(113, "Armor: --")
    end
    PerfUI_SetText(109, J88_concat(J88_concat(J88_concat(J88_concat(prefix, "HP  "), I2S(R2I(hp))), " / "), I2S(R2I(maxHP))))
    PerfUI_SetText(110, J88_concat(J88_concat(J88_concat(J88_concat(prefix, "MP  "), I2S(R2I(mana))), " / "), I2S(R2I(maxMana))))
    PerfUI_SetVisible(119, ((count == 1) and (not nativeDetails)))
    PerfUI_SetVisible(120, ((count == 1) and (not nativeDetails)))
    UI5_Fill(107, 0.03700000047683716, hp, maxHP)
    UI5_Fill(108, 0.017000000923871994, mana, maxMana)
    if (UI5_Frame(7) ~= nil) then
        BlzFrameSetVisible(UI5_Frame(7), ((count == 1) and (not nativeDetails)))
    end
    PerfUI_SetVisible(101, ((count <= 1) and (not nativeDetails)))
    BlzFrameSetVisible(UI5_Frame(4), ((count == 1) and (not nativeDetails)))
    PerfUI_SetVisible(112, ((count <= 1) and (not nativeDetails)))
    PerfUI_SetVisible(113, ((count <= 1) and (not nativeDetails)))
    PerfUI_SetVisible(118, ((count <= 1) and (not nativeDetails)))
    PerfUI_SetVisible(160, ((count == 1) and (not nativeDetails)))
    PerfUI_SetVisible(170, ((count == 1) and (not nativeDetails)))
    if ((count ~= 1) or nativeDetails) then
        UI5_Hide(UI5_Frame(161))
        UI5_Hide(UI5_Frame(171))
    else
        PerfUI_SetText(163, J88_concat(UI10_AttackStats(only, representative), UI8_AttackTip(attackKind)))
        PerfUI_SetText(173, J88_concat(UI10_ArmorStats(only, representative), UI8_ArmorTip(armorKind)))
    end
    only = nil
    u = nil
    UI64_Conceal()
end

function UI8_CreateTypeTip(key)
    local hover = BlzCreateFrameByType("BUTTON", J88_concat("WW2TypeHover", I2S(key)), UI5_Frame(3), "", 0)
    local tip = BlzCreateFrameByType("FRAME", J88_concat("WW2TypeTip", I2S(key)), UI5_Frame(3), "", 0)
    local background = BlzCreateFrameByType("BACKDROP", J88_concat("WW2TypeTipBackground", I2S(key)), tip, "", 0)
    local label = BlzCreateFrameByType("TEXT", J88_concat("WW2TypeTipText", I2S(key)), tip, "", 0)
    local icon = nil
    local rowText = nil
    local row = 0
    local count = 8
    local first = 300
    local texture = nil
    UI5_Cache(key, hover)
    UI5_Cache(J88_int(key + 1), tip)
    UI5_Cache(J88_int(key + 3), label)
    BlzFrameSetTexture(background, "UI\\WW2HUD\\panel.blp", 0, true)
    BlzFrameSetAllPoints(background, tip)
    BlzFrameSetFont(label, "Fonts\\FRIZQT__.TTF", 0.008500000461935997, 0)
    BlzFrameSetTextColor(label, BlzConvertColor(255, 209, 220, 188))
    BlzFrameSetTextAlignment(label, TEXT_JUSTIFY_TOP, TEXT_JUSTIFY_LEFT)
    BlzFrameSetPoint(label, FRAMEPOINT_TOPLEFT, tip, FRAMEPOINT_TOPLEFT, 0.008999999612569809, J88_real(-0.008999999612569809))
    BlzFrameSetPoint(label, FRAMEPOINT_BOTTOMRIGHT, tip, FRAMEPOINT_BOTTOMRIGHT, J88_real(-0.008999999612569809), 0.008999999612569809)
    BlzFrameSetEnable(tip, false)
    BlzFrameSetEnable(label, false)
    BlzFrameSetLevel(hover, 5)
    BlzFrameSetLevel(tip, 8)
    BlzFrameSetTooltip(hover, tip)
    BlzFrameSetVisible(tip, false)
    BlzFrameSetVisible(hover, false)
    if (key == 170) then
        count = 7
        first = 320
    end
    while true do
        if (row == count) then break end
        icon = BlzCreateFrameByType("BACKDROP", "WW2TypeRowIcon", tip, "", 0)
        rowText = BlzCreateFrameByType("TEXT", "WW2TypeRowText", tip, "", 0)
        if (key == 160) then
            texture = UI6_ArmorIcon(row)
        else
            texture = UI6_AttackIcon(row)
        end
        BlzFrameSetTexture(icon, texture, 0, true)
        BlzFrameSetSize(icon, 0.012000000104308128, 0.012000000104308128)
        BlzFrameSetPoint(icon, FRAMEPOINT_TOPLEFT, tip, FRAMEPOINT_TOPLEFT, 0.009999999776482582, J88_real(J88_real(-0.07800000160932541) - J88_real(I2R(row) * 0.014999999664723873)))
        BlzFrameSetFont(rowText, "Fonts\\FRIZQT__.TTF", 0.008500000461935997, 0)
        BlzFrameSetTextAlignment(rowText, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        BlzFrameSetSize(rowText, 0.28700000047683716, 0.013000000268220901)
        BlzFrameSetPoint(rowText, FRAMEPOINT_TOPLEFT, tip, FRAMEPOINT_TOPLEFT, 0.02800000086426735, J88_real(J88_real(-0.07800000160932541) - J88_real(I2R(row) * 0.014999999664723873)))
        BlzFrameSetLevel(icon, 2)
        BlzFrameSetLevel(rowText, 3)
        BlzFrameSetEnable(icon, false)
        BlzFrameSetEnable(rowText, false)
        UI5_Cache(J88_int(first + row), rowText)
        row = J88_int(row + 1)
    end
    rowText = nil
    hover = nil
    tip = nil
    background = nil
    label = nil
    icon = nil
end

function UI70_Entries()
    local x = UI70_Left()
    local scale = RMinBJ(1.0, J88_real(J88_real(0.21799999475479126 - x) / 0.20800000429153442))
    UI5_Box(CM67_Frame(0), x, 0.5659999847412109, J88_real(0.0949999988079071 * scale), 0.024000000208616257)
    UI5_Box(AO_Frame(0), J88_real(x + J88_real(0.10300000011920929 * scale)), 0.5659999847412109, J88_real(0.10499999672174454 * scale), 0.024000000208616257)
end

function UI5_Initialize()
    local i = 0
    local frame = nil
    if ww2_ui5_ready then
        do return end
    end
    ww2_ui5_ready = true
    ww2_ui5_frames = InitHashtable()
    ww2_ui5_selection = CreateGroup()
    UI5_Cache(1, BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0))
    UI5_Cache(2, BlzGetFrameByName("ConsoleUI", 0))
    UI5_Cache(3, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    if (UI5_Frame(3) == nil) then
        UI5_Cache(3, UI5_Frame(1))
    end
    UI5_Cache(4, BlzGetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0))
    UI5_Cache(5, BlzGetOriginFrame(ORIGIN_FRAME_MINIMAP, 0))
    UI5_Cache(11, BlzGetFrameByName("SimpleInfoPanelUnitDetail", 0))
    UI5_Cache(81, BlzGetFrameByName("SimpleInfoPanelBuildingDetail", 1))
    UI5_Cache(82, BlzGetFrameByName("SimpleInfoPanelCargoDetail", 2))
    UI5_Cache(83, BlzGetFrameByName("SimpleBuildingNameValue", 1))
    UI5_Cache(84, BlzGetFrameByName("SimpleHoldNameValue", 2))
    if (UI5_Frame(11) ~= nil) then
        UI5_Cache(6, BlzFrameGetParent(UI5_Frame(11)))
    end
    UI5_Cache(7, BlzGetOriginFrame(ORIGIN_FRAME_UNIT_PANEL_BUFF_BAR, 0))
    UI5_Cache(8, BlzGetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0))
    UI5_Cache(9, BlzGetFrameByName("UpperButtonBarFrame", 0))
    UI5_Cache(10, BlzGetFrameByName("ResourceBarFrame", 0))
    UI5_Cache(12, BlzGetFrameByName("SimpleInventoryCover", 0))
    UI5_Cache(13, BlzGetFrameByName("InventoryText", 0))
    UI5_Cache(14, BlzGetFrameByName("ConsoleTopBar", 0))
    UI5_Cache(15, BlzGetFrameByName("ConsoleBottomBar", 0))
    UI5_Cache(16, BlzGetFrameByName("TimeOfDayIndicator", 0))
    UI5_Cache(17, BlzGetFrameByName("CommandBarFrame", 0))
    UI5_Cache(80, BlzGetFrameByName("InfoPanelIconValue", 0))
    UI5_Cache(71, BlzGetOriginFrame(ORIGIN_FRAME_UNIT_PANEL_BUFF_BAR_LABEL, 0))
    --  Author-documented post-2.0 idle-worker container, before hiding bottom bar.
    if ((UI5_Frame(15) ~= nil) and (BlzFrameGetChildrenCount(UI5_Frame(15)) > 3)) then
        UI5_Cache(72, BlzFrameGetChild(UI5_Frame(15), 3))
        if (BlzFrameGetChildrenCount(UI5_Frame(72)) > 0) then
            UI5_Cache(73, BlzFrameGetChild(UI5_Frame(72), 0))
        end
        BlzFrameSetParent(UI5_Frame(72), UI5_Frame(2))
    end
    --  Completed/error text has no public origin. Its position follows
    --  ConsoleUI BOTTOM; move this anchor once, then restore all controls.
    BlzEnableUIAutoPosition(false)
    BlzFrameSetAbsPoint(UI5_Frame(2), FRAMEPOINT_BOTTOM, 0.4000000059604645, 0.2800000011920929)
    UI5_Cache(74, BlzGetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
    UI5_Cache(75, BlzGetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
    UI5_Box(UI5_Frame(74), 0.03999999910593033, 0.23499999940395355, 0.6000000238418579, 0.14000000059604645)
    UI5_Box(UI5_Frame(75), 0.03999999910593033, 0.375, 0.6000000238418579, 0.14000000059604645)
    --  Preserve stable native interaction containers before hiding backgrounds.
    if (UI5_Frame(17) ~= nil) then
        BlzFrameSetParent(UI5_Frame(17), UI5_Frame(2))
    end
    if (UI5_Frame(6) ~= nil) then
        BlzFrameSetParent(UI5_Frame(6), UI5_Frame(2))
    end
    if (UI5_Frame(7) ~= nil) then
        BlzFrameSetParent(UI5_Frame(7), UI5_Frame(2))
    end
    --  Keep the tooltip logically visible while the console artwork is hidden.
    --  Its engine fallback references ConsoleBottomBar, positioned separately.
    if (UI5_Frame(8) ~= nil) then
        BlzFrameSetParent(UI5_Frame(8), UI5_Frame(2))
        --  One-time visual scale only. The engine owns hover positioning.
        BlzFrameSetScale(UI5_Frame(8), 0.8999999761581421)
    end
    if (UI5_Frame(5) ~= nil) then
        BlzFrameSetParent(UI5_Frame(5), UI5_Frame(3))
    end
    while true do
        if (i == 12) then break end
        UI5_Cache(J88_int(20 + i), BlzGetFrameByName(J88_concat("CommandButton_", I2S(i)), 0))
        UI5_Backdrop(J88_int(140 + i), "UI\\WW2HUD\\well.blp")
        BlzFrameSetLevel(UI5_Frame(J88_int(140 + i)), 1)
        i = J88_int(i + 1)
    end
    i = 0
    while true do
        if (i == 6) then break end
        UI5_Cache(J88_int(40 + i), BlzGetFrameByName(J88_concat("InventoryButton_", I2S(i)), 0))
        i = J88_int(i + 1)
    end
    i = 0
    while true do
        if (i == 5) then break end
        UI5_Cache(J88_int(50 + i), BlzGetOriginFrame(ORIGIN_FRAME_MINIMAP_BUTTON, i))
        i = J88_int(i + 1)
    end
    UI5_Cache(60, BlzGetFrameByName("UpperButtonBarQuestsButton", 0))
    UI5_Cache(61, BlzGetFrameByName("UpperButtonBarMenuButton", 0))
    UI5_Cache(62, BlzGetFrameByName("UpperButtonBarAlliesButton", 0))
    UI5_Cache(63, BlzGetFrameByName("UpperButtonBarChatButton", 0))
    UI5_Backdrop(100, "UI\\WW2HUD\\panel.blp")
    UI5_Backdrop(101, "UI\\WW2HUD\\well.blp")
    UI5_Backdrop(102, "UI\\WW2HUD\\panel.blp")
    UI5_Backdrop(103, "UI\\WW2HUD\\panel.blp")
    UI5_Backdrop(104, "UI\\WW2HUD\\panel.blp")
    UI5_Backdrop(121, "UI\\WW2HUD\\panel.blp")
    UI5_Backdrop(105, "UI\\WW2HUD\\well.blp")
    UI5_Backdrop(106, "UI\\WW2HUD\\well.blp")
    UI5_Backdrop(107, "UI\\WW2HUD\\hp.blp")
    UI5_Backdrop(108, "UI\\WW2HUD\\mp.blp")
    BlzFrameSetLevel(UI5_Frame(107), 1)
    BlzFrameSetLevel(UI5_Frame(108), 1)
    UI5_Text(109, 0.00800000037997961)
    UI5_Text(110, 0.00800000037997961)
    BlzFrameSetTextAlignment(UI5_Frame(109), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
    BlzFrameSetTextAlignment(UI5_Frame(110), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
    UI5_Text(111, 0.008999999612569809)
    UI5_Text(112, 0.00800000037997961)
    UI5_Text(113, 0.00800000037997961)
    UI5_Text(115, 0.009999999776482582)
    UI5_Text(116, 0.009999999776482582)
    UI5_Text(117, 0.009999999776482582)
    UI5_Backdrop(180, "UI\\Feedback\\Resources\\ResourceGold.blp")
    BlzFrameSetLevel(UI5_Frame(180), 2)
    BlzFrameSetTextColor(UI5_Frame(115), BlzConvertColor(255, 255, 215, 0))
    UI5_Backdrop(181, "war3mapImported\\BTNBloodDrinking.blp")
    BlzFrameSetLevel(UI5_Frame(181), 2)
    BlzFrameSetTextColor(UI5_Frame(116), BlzConvertColor(255, 255, 64, 64))
    UI5_Backdrop(182, "UI\\Feedback\\Resources\\ResourceSupply.blp")
    BlzFrameSetLevel(UI5_Frame(182), 2)
    BlzFrameSetTextColor(UI5_Frame(117), BlzConvertColor(255, 255, 255, 255))
    UI5_Text(118, 0.006500000134110451)
    UI5_Backdrop(119, UI6_AttackIcon(0))
    UI5_Backdrop(120, UI6_ArmorIcon(0))
    BlzFrameSetLevel(UI5_Frame(119), 2)
    BlzFrameSetLevel(UI5_Frame(120), 2)
    BlzFrameSetTextColor(UI5_Frame(109), BlzConvertColor(255, 244, 248, 234))
    BlzFrameSetTextColor(UI5_Frame(110), BlzConvertColor(255, 244, 248, 234))
    BlzFrameSetText(UI5_Frame(118), "Buff")
    UI8_CreateTypeTip(160)
    UI8_CreateTypeTip(170)
    ww2_ui7_layout_timer = CreateTimer()
    ww2_ui7_resource_timer = CreateTimer()
    ww2_ui7_board_timer = CreateTimer()
    TimerStart(ww2_ui5_timer, 0.10000000149011612, true, UI5_Update)
    TimerStart(ww2_ui7_resource_timer, 0.10000000149011612, true, UI7_UpdateResources)
    TimerStart(ww2_ui7_layout_timer, 0.25, true, UI8_CheckLayout)
    TimerStart(ww2_ui7_board_timer, 1.0, true, UI6_BoardStyle)
    AO_Init()
    Nation58_Init()
    CM67_Init()
    PM69_Init()
    ExecuteFunc("PF73_UIInit")
    UI8_CheckLayout()
    frame = nil
end

function UI5_Start()
    ww2_ui5_timer = CreateTimer()
    TimerStart(ww2_ui5_timer, 0.5, false, UI5_Initialize)
end
