function KMT106_Spawn(p, g, tid, facing)
    if (tid == KMT_FIREFLY) then
        DoSpawn2(p, g, KMT_C_FIREFLY, 1, facing)
    elseif (tid == KMT_LVT4) then
        DoSpawn2(p, g, KMT_C_LVT4, 3, facing)
        --  Summon Chinese Troops (a Raise Dead clone) starts with autocast on.
        local pid = GetPlayerId(p)
        local i = 1
        while i <= 3 do
            IssueImmediateOrder(SPAWN_UNITS_SORTED[J88_int(J88_int(J88_int(pid * 1000) + SPAWN_UNITS_COUNT[pid]) - i)], "raisedeadon")
            i = i + 1
        end
    end
end

function KMT106_AddChild(table, parent, child, countKey)
    local count = LoadInteger(table, parent, countKey)
    SaveInteger(table, parent, J88_int(100 + count), child)
    SaveInteger(table, parent, countKey, J88_int(count + 1))
end

function KMT106_Economy()
    --  CHN M4 Sherman -> Sherman Firefly (British prices); CHN Peugeot Armoured Car -> LVT-4.
    KMT106_AddChild(ArmyEconomy_Types, KMT_SHERMAN, KMT_FIREFLY, 6)
    ArmyEconomy_Register(KMT_FIREFLY, 0, 1500, 0, 3000, 3, 0)
    KMT106_AddChild(ArmyEconomy_Types, KMT_PEUGEOT, KMT_LVT4, 6)
    ArmyEconomy_Register(KMT_LVT4, 0, 1200, 300, 1200, 3, 0)
end

function KMT106_Overview()
    UK103_AO(KMT_C_FIREFLY, "Sherman Firefly", "ReplaceableTextures\\CommandButtons\\BTNKMTFirefly.blp", 2, 112.0, 112.0, 0.0, 5, 2, 2.5, 800.0, 1.0, 145.0, 240, 320)
    UK103_AO(KMT_C_LVT4, "LVT-4 Water Buffalo", "ReplaceableTextures\\CommandButtons\\BTNKMTLVT4.blp", 1, 65.0, 65.0, 65.0, 2, 1, 0.5, 550.0, 0.0, 200.0, 30, 35)
    Zhukov_AOProducer(KMT_FIREFLY, KMT_C_FIREFLY, 1)
    Zhukov_AOProducer(KMT_LVT4, KMT_C_LVT4, 3)
end

function KMT106_RegisterAI()
    KMT106_AddChild(NewAI_Data, KMT_SHERMAN, KMT_FIREFLY, 5)
    NewAI_CatalogUnit(KMT_FIREFLY, 0, 1500, 3, 2, 0, 0, 1, 1, 300, "CHN Sherman Firefly Tank(1)")
    Zhukov_AIAdd(KMT_FIREFLY, 1, 1800.0, 800.0, 137.0)
    KMT106_AddChild(NewAI_Data, KMT_PEUGEOT, KMT_LVT4, 5)
    NewAI_CatalogUnit(KMT_LVT4, 0, 1200, 3, 2, 0, 0, 3, 1, 420, "CHN LVT-4 Water Buffalo (3)")
    US95_AIAdd(KMT_LVT4, 3, 800.0, 550.0, 65.0, 3, 65.0, 3)
    SaveReal(NewAI_Data, KMT_C_FIREFLY, 540, 800.0)
    SaveReal(NewAI_Data, KMT_C_FIREFLY, 541, 800.0)
    SaveReal(NewAI_Data, KMT_C_LVT4, 540, 550.0)
    SaveReal(NewAI_Data, KMT_C_LVT4, 541, 550.0)
end
