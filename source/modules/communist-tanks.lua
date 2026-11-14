function CT102_Spawn(p, g, tid, facing)
    if (tid == CT_T3485) then
        DoSpawn2(p, g, CT_C_T3485, 1, facing)
    elseif (tid == CT_IS2) then
        DoSpawn2(p, g, CT_C_IS2, 1, facing)
    elseif ((tid == CT_T59) and RoundSchedule_IsFinalRound(udg_int_CurRound)) then
        DoSpawn2(p, g, CT_C_T59, 1, facing)
    end
end

function CT102_Economy()
    --  Gongchen -> T-34-85 (+500) -> IS-2 (+3500); Type 59 is a separate final-tournament purchase.
    ArmyEconomy_Register(CT_GONGCHEN, 0, 2000, 0, 2000, 3, 1)
    SaveInteger(ArmyEconomy_Types, CT_GONGCHEN, 100, CT_T3485)
    ArmyEconomy_Register(CT_T3485, 0, 500, 0, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, CT_T3485, 100, CT_IS2)
    ArmyEconomy_Register(CT_IS2, 0, 3500, 0, 6000, 3, 0)
    ArmyEconomy_Register(CT_T59, 0, 4500, 0, 4500, 3, 0)
end

function CT102_Overview()
    Zhukov_AOVehicle(CT_C_T3485, "T-34-85", "ReplaceableTextures\\CommandButtons\\BTNZhukovT3485.blp", 2, 100.0, 135.0, 1.8, 650.0, 2.0, 165.0, 130, 230)
    Zhukov_AOVehicle(CT_C_IS2, "IS-2", "war3mapImported\\IconM18.blp", 2, 150.0, 175.0, 2.0, 600.0, 0.0, 120.0, 260, 340)
    Zhukov_AOVehicle(CT_C_T59, "Type 59", "ReplaceableTextures\\CommandButtons\\BTNCommunistType59.blp", 2, 156.25, 191.25, 1.6, 650.0, 2.0, 165.0, 210, 290)
    Zhukov_AOProducer(CT_T3485, CT_C_T3485, 1)
    Zhukov_AOProducer(CT_IS2, CT_C_IS2, 1)
    Zhukov_AOProducer(CT_T59, CT_C_T59, 1)
end

function CT102_RegisterAI()
    local builder = 1747990346
    SaveInteger(NewAI_Data, CT_GONGCHEN, 5, 1)
    SaveInteger(NewAI_Data, CT_GONGCHEN, 100, CT_T3485)
    NewAI_CatalogUnit(CT_T3485, 0, 500, 3, 2, 1, 0, 1, 1, 250, "CC T-34-85 Tank (1)")
    SaveInteger(NewAI_Data, CT_T3485, 100, CT_IS2)
    Zhukov_AIAdd(CT_T3485, 1, 1400.0, 650.0, 135.0)
    NewAI_CatalogUnit(CT_IS2, 0, 3500, 3, 2, 0, 0, 1, 1, 600, "CC IS-2 Tank (1)")
    Zhukov_AIAdd(CT_IS2, 1, 7000.0, 600.0, 175.0)
    --  Type 59 requires the final-tournament tech, like other final-round purchases.
    NewAI_CatalogUnit(CT_T59, 0, 4500, 3, 2, 0, 1, 1, 1, 450, "CC Type 59 Tank (1)")
    SaveInteger(NewAI_Data, CT_T59, 200, 1378889776)
    SaveInteger(NewAI_Data, CT_T59, 300, 1)
    Zhukov_AIAdd(CT_T59, 1, 4200.0, 650.0, 191.25)
    SaveInteger(NewAI_Data, builder, J88_int(100 + LoadInteger(NewAI_Data, builder, 5)), CT_T59)
    SaveInteger(NewAI_Data, builder, 5, J88_int(LoadInteger(NewAI_Data, builder, 5) + 1))
end
