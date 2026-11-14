function UK103_Spawn(p, g, tid, facing)
    if (tid == UK_FIREFLY) then
        DoSpawn2(p, g, UK_C_FIREFLY, 1, facing)
    elseif (tid == UK_COMET) then
        DoSpawn2(p, g, UK_C_COMET, 1, facing)
    elseif (tid == UK_ARCHER) then
        DoSpawn2(p, g, UK_C_ARCHER, 3, facing)
    elseif (tid == UK_SEXTON) then
        DoSpawn2(p, g, UK_C_SEXTON, 1, facing)
    elseif (tid == UK_TYPHOON) then
        DoSpawn2(p, g, UK_C_TYPHOON, 2, facing)
    end
end

function UK103_AddChild(table, parent, child)
    local count = LoadInteger(table, parent, 6)
    SaveInteger(table, parent, J88_int(100 + count), child)
    SaveInteger(table, parent, 6, J88_int(count + 1))
end

function UK103_Economy()
    --  Crusader -> Firefly; Cromwell -> Comet -> Centurion (replaces Cromwell -> Centurion);
    --  Valentine -> Archer; Canadian Heavy Squad -> Sexton; Hurricane -> Typhoon.
    UK103_AddChild(ArmyEconomy_Types, UK_CRUSADER, UK_FIREFLY)
    ArmyEconomy_Register(UK_FIREFLY, 0, 1500, 0, 3000, 3, 0)
    SaveInteger(ArmyEconomy_Types, UK_CROMWELL, 101, UK_COMET)
    ArmyEconomy_Register(UK_COMET, 0, 1500, 0, 4000, 3, 1)
    SaveInteger(ArmyEconomy_Types, UK_COMET, 100, UK_CENTURION)
    ArmyEconomy_Register(UK_CENTURION, 0, 3500, 0, 7500, 3, 0)
    UK103_AddChild(ArmyEconomy_Types, UK_VALENTINE, UK_ARCHER)
    ArmyEconomy_Register(UK_ARCHER, 0, 1500, 0, 3500, 3, 0)
    UK103_AddChild(ArmyEconomy_Types, UK_CANADIAN_HEAVY, UK_SEXTON)
    ArmyEconomy_Register(UK_SEXTON, 0, 1200, 250, 2000, 3, 0)
    UK103_AddChild(ArmyEconomy_Types, UK_HURRICANE, UK_TYPHOON)
    ArmyEconomy_Register(UK_TYPHOON, 0, 2000, 0, 3500, 3, 0)
end

function UK103_AO(tid, label, icon, category, dps, ground, air, attack, armorType, cooldown, range, armor, speed, low, high)
    AO_Register(tid, label, icon, "", category, dps, ground, air)
    SaveInteger(AO_Data, tid, 7, attack)
    SaveInteger(AO_Data, tid, 8, armorType)
    SaveReal(AO_Data, tid, 9, cooldown)
    SaveReal(AO_Data, tid, 10, range)
    SaveReal(AO_Data, tid, 11, armor)
    SaveReal(AO_Data, tid, 12, speed)
    SaveInteger(AO_Data, tid, 13, low)
    SaveInteger(AO_Data, tid, 14, high)
end

function UK103_Overview()
    --  Base DPS is the main gun; machine guns are listed separately in the unit text.
    UK103_AO(UK_C_FIREFLY, "Sherman Firefly", "ReplaceableTextures\\CommandButtons\\BTNBritishFirefly.blp", 2, 112.0, 112.0, 0.0, 5, 2, 2.5, 800.0, 1.0, 145.0, 240, 320)
    UK103_AO(UK_C_COMET, "A34 Comet", "ReplaceableTextures\\CommandButtons\\BTNBritishComet.blp", 2, 137.5, 137.5, 0.0, 5, 2, 1.6, 650.0, 2.0, 180.0, 180, 260)
    UK103_AO(UK_C_ARCHER, "Archer", "ReplaceableTextures\\CommandButtons\\BTNBritishArcher.blp", 2, 68.75, 68.75, 0.0, 5, 1, 3.2, 950.0, 0.0, 100.0, 190, 250)
    UK103_AO(UK_C_SEXTON, "Sexton", "ReplaceableTextures\\CommandButtons\\BTNBritishSexton.blp", 1, 41.67, 41.67, 0.0, 3, 2, 3.0, 1200.0, 0.0, 150.0, 100, 150)
    UK103_AO(UK_C_TYPHOON, "Hawker Typhoon", "ReplaceableTextures\\CommandButtons\\BTNBritishTyphoon.blp", 3, 30.0, 30.0, 0.0, 3, 5, 1.0, 1200.0, 0.0, 190.0, 15, 45)
    Zhukov_AOProducer(UK_FIREFLY, UK_C_FIREFLY, 1)
    Zhukov_AOProducer(UK_COMET, UK_C_COMET, 1)
    Zhukov_AOProducer(UK_ARCHER, UK_C_ARCHER, 3)
    Zhukov_AOProducer(UK_SEXTON, UK_C_SEXTON, 1)
    Zhukov_AOProducer(UK_TYPHOON, UK_C_TYPHOON, 2)
end

function UK103_AIChild(parent, child)
    local count = LoadInteger(NewAI_Data, parent, 5)
    SaveInteger(NewAI_Data, parent, J88_int(100 + count), child)
    SaveInteger(NewAI_Data, parent, 5, J88_int(count + 1))
end

function UK103_RegisterAI()
    UK103_AIChild(UK_CRUSADER, UK_FIREFLY)
    NewAI_CatalogUnit(UK_FIREFLY, 0, 1500, 3, 2, 0, 0, 1, 1, 300, "UK Sherman Firefly Tank(1)")
    Zhukov_AIAdd(UK_FIREFLY, 1, 1800.0, 800.0, 137.0)
    SaveInteger(NewAI_Data, UK_CROMWELL, 101, UK_COMET)
    NewAI_CatalogUnit(UK_COMET, 0, 1500, 3, 2, 1, 0, 1, 1, 400, "UK A34 Comet Tank(1)")
    SaveInteger(NewAI_Data, UK_COMET, 100, UK_CENTURION)
    Zhukov_AIAdd(UK_COMET, 1, 3000.0, 650.0, 172.5)
    SaveInteger(NewAI_Data, UK_CENTURION, 2, 3500)
    UK103_AIChild(UK_VALENTINE, UK_ARCHER)
    NewAI_CatalogUnit(UK_ARCHER, 0, 1500, 3, 2, 0, 0, 3, 1, 350, "UK Archer Tank Destroyer(3)")
    Zhukov_AIAdd(UK_ARCHER, 3, 650.0, 950.0, 68.75)
    UK103_AIChild(UK_CANADIAN_HEAVY, UK_SEXTON)
    NewAI_CatalogUnit(UK_SEXTON, 0, 1200, 3, 3, 0, 0, 1, 1, 450, "UK Canadian Sexton (1)")
    Zhukov_AIAdd(UK_SEXTON, 1, 650.0, 1200.0, 41.67)
    --  Typhoon is ground-attack rocket artillery on an aircraft, not an anti-air fighter.
    UK103_AIChild(UK_HURRICANE, UK_TYPHOON)
    NewAI_CatalogUnit(UK_TYPHOON, 0, 2000, 3, 3, 0, 0, 2, 1, 350, "UK Hawker Typhoon (2)")
    US95_AIAdd(UK_TYPHOON, 2, 900.0, 1200.0, 30.0, 2, 0.0, 0)
end
