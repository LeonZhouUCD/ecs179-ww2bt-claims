function US95_IsAircraft(t)
    --  New US aircraft attack the opponent's spawn site in versus rounds, like the
    --  other flying units listed in Battle77_InitialOrder, instead of flying to the center.
    do return (t == 1750421556) or (t == 1750421557) or (t == 1750421555) or (t == 1750421561) or (t == 1750417970) or (t == 1750417975) or (t == 1750417977) end
end

function US95_Spawn(p, g, tid, facing)
    --  US-only producers added in 0.6.95. Shared P-40/P-51/B-17 producers are unchanged.
    if (tid == 1750414384) then
        DoSpawn2(p, g, 1750421556, 3, facing)
    elseif (tid == 1750414641) then
        DoSpawn2(p, g, 1750421557, 3, facing)
    elseif (tid == 1750414136) then
        DoSpawn2(p, g, 1750421555, 2, facing)
    elseif (tid == 1750413877) then
        DoSpawn2(p, g, 1750417970, 2, facing)
    elseif (tid == 1750413623) then
        DoSpawn2(p, g, 1750417975, 1, facing)
    elseif (tid == 1750413881) then
        DoSpawn2(p, g, 1750417977, 1, facing)
    elseif ((tid == 1750422321) or (tid == 1750422322)) then
        --  Same troops as US American Infantry (10), plus P-39 air support.
        DoSpawn2(p, g, 1747989045, 5, facing)
        DoSpawn2(p, g, 1747988529, 1, facing)
        DoSpawn2(p, g, 1747988531, 1, facing)
        DoSpawn2(p, g, 1747988530, 2, facing)
        DoSpawn2(p, g, 1747988532, 1, facing)
        if (tid == 1750422321) then
            DoSpawn2(p, g, 1750421561, 1, facing)
        else
            DoSpawn2(p, g, 1750421561, 3, facing)
        end
    end
end

function US95_RegisterEconomy()
    --  Step price paid, cumulative total, and upgrade children for refunds.
    ArmyEconomy_Register(1750414384, 0, 1200, 0, 1200, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1750414384, 100, 1750414641)
    SaveInteger(ArmyEconomy_Types, 1750414384, 101, 1750414136)
    ArmyEconomy_Register(1750414641, 0, 1600, 0, 2800, 3, 0)
    ArmyEconomy_Register(1750414136, 0, 1600, 0, 2800, 3, 0)
    ArmyEconomy_Register(1750413877, 0, 2200, 0, 2200, 3, 0)
    ArmyEconomy_Register(1750413623, 0, 3200, 0, 3200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750413623, 100, 1750413881)
    ArmyEconomy_Register(1750413881, 0, 4300, 0, 7500, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1750413881, 100, 1747993422)
    SaveInteger(ArmyEconomy_Types, 1750413881, 101, 1747993419)
    ArmyEconomy_Register(1750422321, 0, 300, 200, 300, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750422321, 100, 1750422322)
    ArmyEconomy_Register(1750422322, 0, 500, 200, 800, 3, 0)
    --  US American Infantry (10) gains its ninth upgrade path.
    SaveInteger(ArmyEconomy_Types, 1747989044, 6, 9)
    SaveInteger(ArmyEconomy_Types, 1747989044, 108, 1750422321)
    --  Nuclear upgrades now follow B-17 -> B-29 (7500) instead of the 6000 B-29.
    ArmyEconomy_Register(1747993419, 0, 17000, 0, 24500, 3, 0)
    ArmyEconomy_Register(1747993422, 0, 17000, 0, 24500, 3, 0)
end

function US95_AOUnit(tid, label, art, attackKind, dps, ground, air, cooldown, range, armor, speed, low, high)
    AO_Register(tid, label, art, "", 3, dps, ground, air)
    SaveInteger(AO_Data, tid, 7, attackKind)
    SaveInteger(AO_Data, tid, 8, 5)
    SaveReal(AO_Data, tid, 9, cooldown)
    SaveReal(AO_Data, tid, 10, range)
    SaveReal(AO_Data, tid, 11, armor)
    SaveReal(AO_Data, tid, 12, speed)
    SaveInteger(AO_Data, tid, 13, low)
    SaveInteger(AO_Data, tid, 14, high)
end

function US95_AOProducer(producer, unit, count, label, art, attackKind, dps, ground, air, cooldown, range, armor, speed, low, high)
    US95_AOUnit(producer, label, art, attackKind, dps, ground, air, cooldown, range, armor, speed, low, high)
    SaveInteger(AO_Data, producer, 20, 1)
    SaveInteger(AO_Data, producer, 100, unit)
    SaveInteger(AO_Data, producer, 200, count)
end

function US95_AOSupport(producer, planes)
    --  Same five infantry types as US American Infantry (10), then P-39s.
    SaveInteger(AO_Data, producer, 20, 6)
    SaveInteger(AO_Data, producer, 100, 1747989045)
    SaveInteger(AO_Data, producer, 200, 5)
    SaveInteger(AO_Data, producer, 101, 1747988529)
    SaveInteger(AO_Data, producer, 201, 1)
    SaveInteger(AO_Data, producer, 102, 1747988531)
    SaveInteger(AO_Data, producer, 202, 1)
    SaveInteger(AO_Data, producer, 103, 1747988530)
    SaveInteger(AO_Data, producer, 203, 2)
    SaveInteger(AO_Data, producer, 104, 1747988532)
    SaveInteger(AO_Data, producer, 204, 1)
    SaveInteger(AO_Data, producer, 105, 1750421561)
    SaveInteger(AO_Data, producer, 205, planes)
end

function US95_RegisterOverview()
    --  Base DPS = average damage / interval; attack kind 6 = Hero, 3 = Siege.
    US95_AOUnit(1750421556, "P-40 Warhawk", "war3mapImported\\IconP51Mustang.blp", 6, 40.0, 21.11111068725586, 40.0, 0.8999999761581421, 450.0, 0.0, 200.0, 32, 40)
    US95_AOUnit(1750421557, "P-51 Mustang", "war3mapImported\\IconP51Mustang.blp", 6, 75.0, 32.94117736816406, 75.0, 0.800000011920929, 525.0, 0.0, 210.0, 54, 66)
    US95_AOUnit(1750421555, "P-38 Lightning", "ReplaceableTextures\\CommandButtons\\BTNUS95P38.blp", 6, 81.81818389892578, 25.454544067382812, 81.81818389892578, 1.100000023841858, 600.0, 0.0, 200.0, 80, 100)
    US95_AOUnit(1750421561, "P-39 Airacobra", "ReplaceableTextures\\CommandButtons\\BTNUS95P39.blp", 6, 17.0, 15.454545021057129, 17.0, 1.0, 450.0, 0.0, 180.0, 14, 20)
    US95_AOUnit(1750417970, "B-25 Mitchell", "ReplaceableTextures\\CommandButtons\\BTNUS95B25.blp", 3, 115.0, 115.0, 0.0, 1.0, 220.0, 0.0, 190.0, 100, 130)
    US95_AOUnit(1750417975, "B-17 Flying Fortress", "war3mapImported\\IconBomber.blp", 3, 260.0, 260.0, 0.0, 1.0, 230.0, 0.0, 180.0, 230, 290)
    US95_AOUnit(1750417977, "B-29 Superfortress", "war3mapImported\\IconBomber.blp", 3, 350.0, 350.0, 0.0, 1.2000000476837158, 250.0, 2.0, 180.0, 380, 460)
    US95_AOProducer(1750414384, 1750421556, 3, "P-40 Warhawk", "war3mapImported\\IconP51Mustang.blp", 6, 40.0, 21.11111068725586, 40.0, 0.8999999761581421, 450.0, 0.0, 200.0, 32, 40)
    US95_AOProducer(1750414641, 1750421557, 3, "P-51 Mustang", "war3mapImported\\IconP51Mustang.blp", 6, 75.0, 32.94117736816406, 75.0, 0.800000011920929, 525.0, 0.0, 210.0, 54, 66)
    US95_AOProducer(1750414136, 1750421555, 2, "P-38 Lightning", "ReplaceableTextures\\CommandButtons\\BTNUS95P38.blp", 6, 81.81818389892578, 25.454544067382812, 81.81818389892578, 1.100000023841858, 600.0, 0.0, 200.0, 80, 100)
    US95_AOProducer(1750413877, 1750417970, 2, "B-25 Mitchell", "ReplaceableTextures\\CommandButtons\\BTNUS95B25.blp", 3, 115.0, 115.0, 0.0, 1.0, 220.0, 0.0, 190.0, 100, 130)
    US95_AOProducer(1750413623, 1750417975, 1, "B-17 Flying Fortress", "war3mapImported\\IconBomber.blp", 3, 260.0, 260.0, 0.0, 1.0, 230.0, 0.0, 180.0, 230, 290)
    US95_AOProducer(1750413881, 1750417977, 1, "B-29 Superfortress", "war3mapImported\\IconBomber.blp", 3, 350.0, 350.0, 0.0, 1.2000000476837158, 250.0, 2.0, 180.0, 380, 460)
    US95_AOSupport(1750422321, 1)
    US95_AOSupport(1750422322, 3)
end

function US95_AIMultiplier(kind, index)
    --  Catalog damage multipliers by armor class (same values as existing entries):
    --  1 = Hero, 2 = Siege, 3 = Pierce.
    local m = nil
    if (kind == 1) then
        m = {1.0, 2.0, 3.0, 1.0, 2.0, 2.0, 1.0, 0.5}
    elseif (kind == 2) then
        m = {1.0, 2.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0}
    else
        m = {1.0, 0.5, 0.30000001192092896, 1.0, 1.0, 0.5, 1.0, 1.5}
    end
    do return m[J88_int(index + 1)] end
end

function US95_AIAccumulate(uid, key, value)
    SaveReal(NewAI_Data, uid, key, J88_real(LoadReal(NewAI_Data, uid, key) + value))
end

function US95_AIAdd(uid, count, hp, range, groundDps, groundKind, airDps, airKind)
    --  Accumulate one aircraft type into a producer's AI combat profile.
    local i = 0
    US95_AIAccumulate(uid, 500, J88_real(I2R(count) * hp))
    US95_AIAccumulate(uid, 502, J88_real(I2R(count) * hp))
    US95_AIAccumulate(uid, 515, J88_real(I2R(count) * hp))
    US95_AIAccumulate(uid, 565, J88_real(I2R(count) * hp))
    SaveReal(NewAI_Data, uid, 501, RMaxBJ(LoadReal(NewAI_Data, uid, 501), range))
    US95_AIAccumulate(uid, 531, J88_real(I2R(count) * groundDps))
    if (airDps > 0.0) then
        US95_AIAccumulate(uid, 530, J88_real(J88_real(I2R(count) * airDps) * US95_AIMultiplier(airKind, 5)))
    end
    while true do
        if (i >= 8) then break end
        US95_AIAccumulate(uid, J88_int(520 + i), J88_real(J88_real(I2R(count) * groundDps) * US95_AIMultiplier(groundKind, i)))
        if (airDps > 0.0) then
            US95_AIAccumulate(uid, J88_int(550 + i), J88_real(J88_real(I2R(count) * airDps) * US95_AIMultiplier(airKind, i)))
        end
        i = J88_int(i + 1)
    end
end

function US95_RegisterAI()
    local key = 500
    NewAI_CatalogUnit(1750414384, 0, 1200, 3, 5, 2, 0, 3, 1, 120, "US P-40 Warhawk (3)")
    SaveInteger(NewAI_Data, 1750414384, 100, 1750414641)
    SaveInteger(NewAI_Data, 1750414384, 101, 1750414136)
    NewAI_CatalogUnit(1750414641, 0, 1600, 3, 5, 0, 0, 3, 1, 280, "US P-51 Mustang (3)")
    NewAI_CatalogUnit(1750414136, 0, 1600, 3, 5, 0, 0, 2, 1, 280, "US P-38 Lightning (2)")
    NewAI_CatalogUnit(1750413877, 0, 2200, 3, 5, 0, 0, 2, 1, 220, "US B-25 Mitchell (2)")
    NewAI_CatalogUnit(1750413623, 0, 3200, 3, 5, 1, 0, 1, 1, 320, "US B-17 Flying Fortress (1)")
    SaveInteger(NewAI_Data, 1750413623, 100, 1750413881)
    NewAI_CatalogUnit(1750413881, 0, 4300, 3, 5, 2, 1, 1, 1, 750, "US B-29 Superfortress (1)")
    SaveInteger(NewAI_Data, 1750413881, 100, 1747993422)
    SaveInteger(NewAI_Data, 1750413881, 101, 1747993419)
    SaveInteger(NewAI_Data, 1750413881, 200, 1378889776)
    SaveInteger(NewAI_Data, 1750413881, 300, 1)
    NewAI_CatalogUnit(1750422321, 0, 300, 3, 1, 1, 0, 11, 1, 230, "US Infantry with Air Support I (10+1)")
    SaveInteger(NewAI_Data, 1750422321, 100, 1750422322)
    NewAI_CatalogUnit(1750422322, 0, 500, 3, 1, 0, 0, 13, 1, 280, "US Infantry with Air Support II (10+3)")
    --  Combat profiles: count, hit points, range, ground DPS/kind, air DPS/kind.
    US95_AIAdd(1750414384, 3, 650.0, 450.0, 21.11111068725586, 3, 40.0, 1)
    US95_AIAdd(1750414641, 3, 1150.0, 525.0, 32.94117736816406, 3, 75.0, 1)
    US95_AIAdd(1750414136, 2, 1400.0, 600.0, 25.454544067382812, 3, 81.81818389892578, 1)
    US95_AIAdd(1750413877, 2, 900.0, 220.0, 115.0, 2, 0.0, 1)
    US95_AIAdd(1750413623, 1, 2000.0, 230.0, 260.0, 2, 0.0, 1)
    US95_AIAdd(1750413881, 1, 3400.0, 250.0, 350.0, 2, 0.0, 1)
    --  Air support squads: the American Infantry profile plus P-39s.
    while true do
        if (key > 567) then break end
        SaveReal(NewAI_Data, 1750422321, key, LoadReal(NewAI_Data, 1747989044, key))
        SaveReal(NewAI_Data, 1750422322, key, LoadReal(NewAI_Data, 1747989044, key))
        key = J88_int(key + 1)
    end
    US95_AIAdd(1750422321, 1, 300.0, 450.0, 15.454545021057129, 3, 17.0, 1)
    US95_AIAdd(1750422322, 3, 300.0, 450.0, 15.454545021057129, 3, 17.0, 1)
    --  American Builder: P-40 -> US P-40, B-17 -> US B-17, standalone B-29 -> B-25.
    SaveInteger(NewAI_Data, 1747993170, 100, 1750413877)
    SaveInteger(NewAI_Data, 1747993170, 103, 1750413623)
    SaveInteger(NewAI_Data, 1747993170, 104, 1750414384)
    --  US American Infantry (10) gains Air Support I as its ninth upgrade.
    SaveInteger(NewAI_Data, 1747989044, 5, 9)
    SaveInteger(NewAI_Data, 1747989044, 108, 1750422321)
end
