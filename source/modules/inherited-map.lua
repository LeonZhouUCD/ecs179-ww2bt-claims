function InitGlobals()
local i = 0
udg_EmptyPlayers = CreateForce()
udg_TempUnitGroup = CreateGroup()
udg_MatchInSession = false
udg_tempgroup = CreateGroup()
udg_SpawnedBonusUnits = CreateGroup()
udg_RoundCount = 0
udg_StuckUnits = CreateGroup()
udg_FlyGroup = CreateGroup()
udg_Offset = J88_real(0)
udg_Degrees = J88_real(0)
udg_Damage = J88_real(0)
end

function InitSounds()
gg_snd_IP_HIT_5 = CreateSound("war3mapImported/IP_HIT_5.WAV", false, false, false, 0, 0, "DefaultEAXON")
SetSoundDuration(gg_snd_IP_HIT_5, 32759)
SetSoundChannel(gg_snd_IP_HIT_5, 0)
SetSoundVolume(gg_snd_IP_HIT_5, 127)
SetSoundPitch(gg_snd_IP_HIT_5, 1.0)
gg_snd_OUSE_DROID_1 = CreateSound("war3mapImported/OUSE_DROID_1.WAV", false, false, false, 0, 0, "DefaultEAXON")
SetSoundDuration(gg_snd_OUSE_DROID_1, 32759)
SetSoundChannel(gg_snd_OUSE_DROID_1, 0)
SetSoundVolume(gg_snd_OUSE_DROID_1, 127)
SetSoundPitch(gg_snd_OUSE_DROID_1, 1.0)
gg_snd_blasterfire = CreateSound("war3mapImported/blasterfire.wav", false, false, false, 0, 0, "DefaultEAXON")
SetSoundDuration(gg_snd_blasterfire, 32759)
SetSoundChannel(gg_snd_blasterfire, 0)
SetSoundVolume(gg_snd_blasterfire, 127)
SetSoundPitch(gg_snd_blasterfire, 1.0)
gg_snd_03_Victory___Battlecry___Two_Steps_From_Hell__2_u = "war3mapImported/03 Victory - Battlecry - Two Steps From Hell (2).mp3"
gg_snd_Red_Alert_3_soundtrack___Hell_March_1_Fftl_Remix__online_audio_converter_com___1_u = "war3mapImported/Red Alert 3 soundtrack - Hell March 1 Fftl Remix (online-audio-converter.com) (1).mp3"
gg_snd_Hearts_of_Iron_IV___Main_Theme__online_audio_converter_com_u = "war3mapImported/Hearts of Iron IV - Main Theme (online-audio-converter.com).mp3"
gg_snd_Medal_Of_Honor_European_Assault_Soundtrack___Main_Theme__HQ___online_audio_converter_com_u = "war3mapImported/Medal Of Honor European Assault Soundtrack - Main Theme (HQ) (online-audio-converter.com).mp3"
gg_snd_Battlefield_1942_theme = "war3mapImported/Battlefield 1942 theme.mp3"
end

function CreateBuildingsForPlayer0()
local p = Player(0)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, 2784.0, 4192.0, 270.0, 1747988568)
end

function CreateBuildingsForPlayer1()
local p = Player(1)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, 4192.0, 3424.0, 270.0, 1747988568)
end

function CreateBuildingsForPlayer2()
local p = Player(2)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, 4192.0, J88_real(-2976.0), 270.0, 1747988568)
end

function CreateBuildingsForPlayer3()
local p = Player(3)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, 2784.0, J88_real(-3744.0), 270.0, 1747988568)
end

function CreateBuildingsForPlayer4()
local p = Player(4)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, J88_real(-2976.0), J88_real(-3744.0), 270.0, 1747988568)
end

function CreateBuildingsForPlayer5()
local p = Player(5)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, J88_real(-4384.0), J88_real(-2976.0), 270.0, 1747988568)
end

function CreateBuildingsForPlayer6()
local p = Player(6)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, J88_real(-4384.0), 3424.0, 270.0, 1747988568)
end

function CreateBuildingsForPlayer7()
local p = Player(7)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
u = BlzCreateUnitWithSkin(p, 1747988568, J88_real(-2976.0), 4192.0, 270.0, 1747988568)
end

function CreateNeutralHostile()
local p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
local u = nil
local unitID = 0
local t = nil
local life = 0.0
gg_unit_e000_0017 = BlzCreateUnitWithSkin(p, 1697656880, J88_real(-2410.60009765625), 2526.300048828125, 270.0, 1697656880)
end

function CreatePlayerBuildings()
CreateBuildingsForPlayer0()
CreateBuildingsForPlayer1()
CreateBuildingsForPlayer2()
CreateBuildingsForPlayer3()
CreateBuildingsForPlayer4()
CreateBuildingsForPlayer5()
CreateBuildingsForPlayer6()
CreateBuildingsForPlayer7()
end

function CreatePlayerUnits()
end

function CreateAllUnits()
CreatePlayerBuildings()
CreateNeutralHostile()
CreatePlayerUnits()
end

function CreateRegions()
local we = nil
gg_rct_Frontrank_1a = Rect(J88_real(-704.0), J88_real(-3456.0), J88_real(-512.0), J88_real(-3200.0))
gg_rct_Frontrank_3a = Rect(672.0, 2880.0, 864.0, 3072.0)
gg_rct_Frontrank_2a = Rect(3040.0, J88_real(-608.0), 3232.0, J88_real(-416.0))
gg_rct_Frontrank_4a = Rect(J88_real(-3200.0), 672.0, J88_real(-3008.0), 864.0)
gg_rct_Reinforcements_1a = Rect(J88_real(-1088.0), J88_real(-5184.0), J88_real(-896.0), J88_real(-4992.0))
gg_rct_Reinforcements_2a = Rect(4768.0, J88_real(-1984.0), 4960.0, J88_real(-1792.0))
gg_rct_Reinforcements_3a = Rect(1344.0, 4384.0, 1568.0, 4736.0)
gg_rct_Reinforcements_4a = Rect(J88_real(-5056.0), 1120.0, J88_real(-4864.0), 1312.0)
gg_rct_Frontrank_1b = Rect(448.0, J88_real(-3456.0), 640.0, J88_real(-3264.0))
gg_rct_Frontrank_2b = Rect(2976.0, 448.0, 3232.0, 640.0)
gg_rct_Frontrank_3b = Rect(J88_real(-608.0), 2848.0, J88_real(-416.0), 3040.0)
gg_rct_Frontrank_4b = Rect(J88_real(-3264.0), J88_real(-608.0), J88_real(-3072.0), J88_real(-416.0))
gg_rct_Reinforcements_1b = Rect(1120.0, J88_real(-5280.0), 1344.0, J88_real(-5088.0))
gg_rct_Reinforcements_2b = Rect(4992.0, 1568.0, 5184.0, 1824.0)
gg_rct_Reinforcements_3b = Rect(J88_real(-1216.0), 4320.0, J88_real(-992.0), 4512.0)
gg_rct_Reinforcements_4b = Rect(J88_real(-5024.0), J88_real(-1184.0), J88_real(-4800.0), J88_real(-992.0))
gg_rct_Red = Rect(2240.0, 3616.0, 3520.0, 4288.0)
gg_rct_Blue = Rect(3552.0, 2880.0, 4992.0, 3520.0)
gg_rct_Teal = Rect(3520.0, J88_real(-3520.0), 4992.0, J88_real(-2624.0))
gg_rct_Purple = Rect(2080.0, J88_real(-4288.0), 3584.0, J88_real(-3648.0))
gg_rct_Yellow = Rect(J88_real(-3520.0), J88_real(-4288.0), J88_real(-2176.0), J88_real(-3648.0))
gg_rct_Orange = Rect(J88_real(-4928.0), J88_real(-3552.0), J88_real(-3584.0), J88_real(-2880.0))
gg_rct_Green = Rect(J88_real(-4928.0), 2880.0, J88_real(-3584.0), 3776.0)
gg_rct_Pink = Rect(J88_real(-3648.0), 3648.0, J88_real(-2176.0), 4288.0)
gg_rct_Pacific = Rect(J88_real(-5216.0), J88_real(-992.0), J88_real(-4320.0), J88_real(-608.0))
gg_rct_East_Europe = Rect(J88_real(-192.0), 3904.0, 288.0, 4416.0)
gg_rct_West_Europe = Rect(3840.0, J88_real(-1280.0), 4672.0, J88_real(-864.0))
gg_rct_Africa = Rect(J88_real(-224.0), J88_real(-5376.0), 608.0, J88_real(-4768.0))
end

function Trig_Hashtable_Actions()
InitHashtableBJ()
udg_Hashtable = GetLastCreatedHashtableBJ()
end

function InitTrig_Hashtable()
gg_trg_Hashtable = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Hashtable, 0.009999999776482582)
TriggerAddAction(gg_trg_Hashtable, Trig_Hashtable_Actions)
end

function Trig_Fly_Func001Func007C()
if (not (LoadRealBJ(StringHashBJ("Speed"), GetHandleIdBJ(GetEnumUnit()), udg_Hashtable) <= 0.4000000059604645)) then
do return false end
end
do return true end
end

function Trig_Fly_Func001Func008C()
do return (FirstOfGroup(udg_FlyGroup) == nil) end
end

function Trig_Fly_Func001A()
local u = GetEnumUnit()
local key = GetHandleId(u)
local speedKey = StringHash("Speed")
local increaseKey = StringHash("Increase")
local speed = J88_real(LoadReal(udg_Hashtable, key, speedKey) - 0.10000000149011612)
local angle = J88_real(LoadReal(udg_Hashtable, key, StringHash("Degrees")) * bj_DEGTORAD)
local increase = 0.0
SaveReal(udg_Hashtable, key, speedKey, speed)
--  Same collision-aware movement and arithmetic as PolarProjectionBJ, without locations.
SetUnitPosition(u, J88_real(GetUnitX(u) + J88_real(speed * Cos(angle))), J88_real(GetUnitY(u) + J88_real(speed * Sin(angle))))
increase = J88_real(LoadReal(udg_Hashtable, key, increaseKey) + 0.4000000059604645)
SaveReal(udg_Hashtable, key, increaseKey, increase)
SetUnitFlyHeight(u, J88_real(J88_real(GetUnitFlyHeight(u) + 10.0) - increase), 0.0)
if (LoadReal(udg_Hashtable, key, speedKey) <= 0.4000000059604645) then
GroupRemoveUnit(udg_FlyGroup, u)
SetUnitPathing(u, true)
Advance_RequestUnit = u
ExecuteFunc("Advance_Manual")
Advance_RequestUnit = nil
FlushChildHashtable(udg_Hashtable, key)
end
if (FirstOfGroup(udg_FlyGroup) == nil) then
DisableTrigger(GetTriggeringTrigger())
end
u = nil
end

function Trig_Fly_Actions()
--  This is a persistent group; its lifetime never belongs to a BJ scratch flag.
ForGroup(udg_FlyGroup, Trig_Fly_Func001A)
end

function InitTrig_Fly()
gg_trg_Fly = CreateTrigger()
DisableTrigger(gg_trg_Fly)
TriggerRegisterTimerEventPeriodic(gg_trg_Fly, 0.05000000074505806)
TriggerAddAction(gg_trg_Fly, Trig_Fly_Actions)
end

function Trig_Credits_Actions()
CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "TRIGSTR_1489", "TRIGSTR_1510", "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp")
end

function InitTrig_Credits()
gg_trg_Credits = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Credits, 0.009999999776482582)
TriggerAddAction(gg_trg_Credits, Trig_Credits_Actions)
end

function Bounty_Value(u)
    if (u == nil) then
        do return 0 end
    end
    if HaveSavedInteger(Bounty_Data, GetHandleId(u), 0) then
        do return LoadInteger(Bounty_Data, GetHandleId(u), 0) end
    end
    --  Bonus enemies do not come from player production buildings.
    if (GetPlayerId(GetOwningPlayer(u)) == 18) then
        do return GetUnitPointValue(u) end
    end
    --  Free summons, free fallback troops and recruited copies add no paid value.
    do return 0 end
end

function Trig_Naval_Bombard_Conditions()
if (not (GetSpellAbilityId() == 1093678403)) then
do return false end
end
do return true end
end

function Trig_Naval_Bombard_Func001C()
local units = GetUnitsInRectOfPlayer(GetPlayableMapRect(), ConvertedPlayer(J88_int(GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) + 9)))
local found = (FirstOfGroup(units) ~= nil)
DestroyGroup(units)
units = nil
do return found end
end

function Trig_Naval_Bombard_Actions()
if Trig_Naval_Bombard_Func001C() then
else
IssueImmediateOrderBJ(GetSpellAbilityUnit(), "stop")
DisplayTextToForce(bj_FORCE_PLAYER[GetPlayerId(GetOwningPlayer(GetSpellAbilityUnit()))], "TRIGSTR_1641")
end
end

function InitTrig_Naval_Bombard()
gg_trg_Naval_Bombard = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Naval_Bombard, EVENT_PLAYER_UNIT_SPELL_CAST)
TriggerAddCondition(gg_trg_Naval_Bombard, Condition(Trig_Naval_Bombard_Conditions))
TriggerAddAction(gg_trg_Naval_Bombard, Trig_Naval_Bombard_Actions)
end

function Trig_Artillery_Cast_Normal_Conditions()
if (not (GetSpellAbilityId() == 1093678412)) then
do return false end
end
do return true end
end

function Trig_Artillery_Cast_Normal_Func001C()
local units = GetUnitsInRectOfPlayer(GetPlayableMapRect(), ConvertedPlayer(J88_int(GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) + 9)))
local found = (FirstOfGroup(units) ~= nil)
DestroyGroup(units)
units = nil
do return found end
end

function Trig_Artillery_Cast_Normal_Actions()
if Naval_IsAdmiral(GetTriggerUnit()) then
Naval_Begin(GetTriggerUnit(), GetSpellTargetX(), GetSpellTargetY())
do return end
end
if Trig_Artillery_Cast_Normal_Func001C() then
udg_ArtilleryPoint = GetSpellTargetLoc()
CreateNUnitsAtLoc(1, 1747995184, GetOwningPlayer(GetTriggerUnit()), udg_ArtilleryPoint, 90.0)
UnitApplyTimedLifeBJ(3.0, 1112820806, GetLastCreatedUnit())
SaveLocationHandleBJ(GetSpellTargetLoc(), StringHashBJ("Point"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
SaveIntegerBJ(3, StringHashBJ("Strikes"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
SaveRealBJ(1000.0, StringHashBJ("Damage"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
RemoveLocation(udg_ArtilleryPoint)
else
IssueImmediateOrderBJ(GetTriggerUnit(), "stop")
DisplayTextToForce(bj_FORCE_PLAYER[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))], "TRIGSTR_1734")
end
end

function InitTrig_Artillery_Cast_Normal()
Naval_Init()
gg_trg_Artillery_Cast_Normal = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Artillery_Cast_Normal, EVENT_PLAYER_UNIT_SPELL_EFFECT)
TriggerAddCondition(gg_trg_Artillery_Cast_Normal, Condition(Trig_Artillery_Cast_Normal_Conditions))
TriggerAddAction(gg_trg_Artillery_Cast_Normal, Trig_Artillery_Cast_Normal_Actions)
end

function Trig_Artillery_Continue_Normal_Func001C()
if (GetUnitTypeId(GetDyingUnit()) == 1747994970) then
do return true end
end
if (GetUnitTypeId(GetDyingUnit()) == 1747995184) then
do return true end
end
do return false end
end

function Trig_Artillery_Continue_Normal_Conditions()
if (not Trig_Artillery_Continue_Normal_Func001C()) then
do return false end
end
do return true end
end

function Trig_Artillery_Continue_Normal_Func006C()
if (not (LoadIntegerBJ(StringHashBJ("Strikes"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable) <= 0)) then
do return false end
end
do return true end
end

function Trig_Artillery_Continue_Normal_Func008001003001()
do return (IsUnitAliveBJ(GetFilterUnit()) == true) end
end

function Trig_Artillery_Continue_Normal_Func008001003002001()
do return (IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false) end
end

function Trig_Artillery_Continue_Normal_Func008001003002002()
do return (GetOwningPlayer(GetFilterUnit()) ~= ConvertedPlayer(J88_int(GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit())) + 9))) end
end

function Trig_Artillery_Continue_Normal_Func008001003002()
do return GetBooleanAnd((IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false), (GetOwningPlayer(GetFilterUnit()) ~= ConvertedPlayer(J88_int(GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit())) + 9)))) end
end

function Trig_Artillery_Continue_Normal_Func008001003()
do return GetBooleanAnd((IsUnitAliveBJ(GetFilterUnit()) == true), GetBooleanAnd((IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false), (GetOwningPlayer(GetFilterUnit()) ~= ConvertedPlayer(J88_int(GetConvertedPlayerId(GetOwningPlayer(GetDyingUnit())) + 9))))) end
end

function Trig_Artillery_Continue_Normal_Func008A()
udg_DamagePoint = GetUnitLoc(GetEnumUnit())
SetUnitExplodedBJ(GetEnumUnit(), true)
UnitAddAbilityBJ(1097691750, GetEnumUnit())
UnitRemoveAbilityBJ(1097691750, GetEnumUnit())
UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_Damage, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL)
SetUnitFlyHeightBJ(GetEnumUnit(), GetUnitDefaultFlyHeight(GetEnumUnit()), 0.0)
SaveRealBJ(12.5, StringHashBJ("Speed"), GetHandleIdBJ(GetEnumUnit()), udg_Hashtable)
SaveRealBJ(AngleBetweenPoints(udg_ArtilleryPlace, udg_DamagePoint), StringHashBJ("Degrees"), GetHandleIdBJ(GetEnumUnit()), udg_Hashtable)
SaveRealBJ(1.0, StringHashBJ("Increase"), GetHandleIdBJ(GetEnumUnit()), udg_Hashtable)
GroupAddUnitSimple(GetEnumUnit(), udg_FlyGroup)
SetUnitPathing(GetEnumUnit(), false)
RemoveLocation(udg_DamagePoint)
end

function Trig_Artillery_Continue_Normal_Actions()
local scatter = nil
local targets = nil
udg_Offset = GetRandomReal(J88_real(0), 500.0)
udg_Degrees = GetRandomReal(J88_real(0), 360.0)
udg_Damage = LoadRealBJ(StringHashBJ("Damage"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable)
udg_ArtilleryPlace = LoadLocationHandleBJ(StringHashBJ("Point"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable)
if Trig_Artillery_Continue_Normal_Func006C() then
else
scatter = PolarProjectionBJ(udg_ArtilleryPlace, udg_Offset, udg_Degrees)
CreateNUnitsAtLoc(1, 1747995184, GetOwningPlayer(GetTriggerUnit()), scatter, bj_UNIT_FACING)
RemoveLocation(scatter)
scatter = nil
udg_ArtilleryPlace = GetUnitLoc(GetLastCreatedUnit())
UnitApplyTimedLifeBJ(0.30000001192092896, 1112820806, GetLastCreatedUnit())
SaveLocationHandleBJ(LoadLocationHandleBJ(StringHashBJ("Point"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable), StringHashBJ("Point"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
SaveIntegerBJ(J88_int(LoadIntegerBJ(StringHashBJ("Strikes"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable) - 1), StringHashBJ("Strikes"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
SaveRealBJ(LoadRealBJ(StringHashBJ("Damage"), GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable), StringHashBJ("Damage"), GetHandleIdBJ(GetLastCreatedUnit()), udg_Hashtable)
TerrainDeformationCraterBJ(3.0, false, udg_ArtilleryPlace, 100.0, 100.0)
end
targets = GetUnitsInRangeOfLocMatching(300.0, udg_ArtilleryPlace, Condition(Trig_Artillery_Continue_Normal_Func008001003))
ForGroup(targets, Trig_Artillery_Continue_Normal_Func008A)
DestroyGroup(targets)
targets = nil
AddSpecialEffectLocBJ(udg_ArtilleryPlace, "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl")
DestroyEffectBJ(GetLastCreatedEffectBJ())
EnableTrigger(gg_trg_Fly)
RemoveLocation(udg_ArtilleryPlace)
FlushChildHashtableBJ(GetHandleIdBJ(GetTriggerUnit()), udg_Hashtable)
end

function InitTrig_Artillery_Continue_Normal()
gg_trg_Artillery_Continue_Normal = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Artillery_Continue_Normal, EVENT_PLAYER_UNIT_DEATH)
TriggerAddCondition(gg_trg_Artillery_Continue_Normal, Condition(Trig_Artillery_Continue_Normal_Conditions))
TriggerAddAction(gg_trg_Artillery_Continue_Normal, Trig_Artillery_Continue_Normal_Actions)
end

function Trig_BotColorName_Func041Func002Func002C()
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 8) == "Krackles") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 9) == "WorldEdit") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 6) == "Moogle") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 8) == "Redbaron") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 10) == "SlashNDash") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 9) == "Commander") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 6) == "Hamish") then
do return true end
end
if (SubStringBJ(GetPlayerName(ConvertedPlayer(GetForLoopIndexA())), 1, 10) == "Reanimated") then
do return true end
end
do return false end
end

function Trig_BotColorName_Func041Func002C()
if (not Trig_BotColorName_Func041Func002Func002C()) then
do return false end
end
do return true end
end

function ResourceTrading_Lock()
    SetMapFlag(MAP_LOCK_RESOURCE_TRADING, true)
end

function Trig_BotColorName_Actions()
ResourceTrading_Lock()
bj_forLoopAIndex = 9
bj_forLoopAIndexEnd = 20
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
bj_forLoopBIndex = 1
bj_forLoopBIndexEnd = 8
while true do
if (bj_forLoopBIndex > bj_forLoopBIndexEnd) then break end
SetPlayerAllianceStateBJ(ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_NEUTRAL)
bj_forLoopBIndex = J88_int(bj_forLoopBIndex + 1)
end
bj_forLoopBIndex = 9
bj_forLoopBIndexEnd = 20
while true do
if (bj_forLoopBIndex > bj_forLoopBIndexEnd) then break end
SetPlayerAllianceStateBJ(ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_UNALLIED)
bj_forLoopBIndex = J88_int(bj_forLoopBIndex + 1)
end
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
bj_forLoopAIndex = 1
bj_forLoopAIndexEnd = 8
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
bj_forLoopBIndex = 1
bj_forLoopBIndexEnd = 20
while true do
if (bj_forLoopBIndex > bj_forLoopBIndexEnd) then break end
SetPlayerAllianceStateBJ(ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_NEUTRAL)
bj_forLoopBIndex = J88_int(bj_forLoopBIndex + 1)
end
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
SetPlayerName(Player(9), GetPlayerName(Player(0)))
SetPlayerName(Player(10), GetPlayerName(Player(1)))
SetPlayerName(Player(11), GetPlayerName(Player(2)))
SetPlayerName(Player(12), GetPlayerName(Player(3)))
SetPlayerName(Player(13), GetPlayerName(Player(4)))
SetPlayerName(Player(14), GetPlayerName(Player(5)))
SetPlayerName(Player(15), GetPlayerName(Player(6)))
SetPlayerName(Player(16), GetPlayerName(Player(7)))
SetPlayerColorBJ(Player(9), GetPlayerColor(Player(0)), true)
SetPlayerColorBJ(Player(10), GetPlayerColor(Player(1)), true)
SetPlayerColorBJ(Player(11), GetPlayerColor(Player(2)), true)
SetPlayerColorBJ(Player(12), GetPlayerColor(Player(3)), true)
SetPlayerColorBJ(Player(13), GetPlayerColor(Player(4)), true)
SetPlayerColorBJ(Player(14), GetPlayerColor(Player(5)), true)
SetPlayerColorBJ(Player(15), GetPlayerColor(Player(6)), true)
SetPlayerColorBJ(Player(16), GetPlayerColor(Player(7)), true)
SetPlayerAllianceStateBJ(Player(9), Player(0), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(0), Player(9), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(10), Player(1), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(1), Player(10), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(11), Player(2), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(2), Player(11), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(12), Player(3), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(3), Player(12), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(13), Player(4), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(4), Player(13), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(14), Player(5), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(5), Player(14), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(15), Player(6), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(6), Player(15), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(16), Player(7), bj_ALLIANCE_ALLIED_VISION)
SetPlayerAllianceStateBJ(Player(7), Player(16), bj_ALLIANCE_ALLIED_VISION)
udg_Random[1] = 1747990344
udg_Random[2] = 1747988567
udg_Random[3] = 1747993156
udg_Random[4] = 1747989296
udg_Random[5] = 1747990598
bj_forLoopAIndex = 1
bj_forLoopAIndexEnd = 8
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
SetPlayerStateBJ(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_FOOD_CAP, 3)
if Trig_BotColorName_Func041Func002C() then
SetPlayerTechResearchedSwap(1378889781, 1, ConvertedPlayer(GetForLoopIndexA()))
else
end
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
end

function InitTrig_BotColorName()
gg_trg_BotColorName = CreateTrigger()
TriggerAddAction(gg_trg_BotColorName, Trig_BotColorName_Actions)
end

function Trig_Region_names_Actions()
local center = nil
center = GetRectCenter(gg_rct_Africa)
CreateTextTagLocBJ("TRIGSTR_1188", center, J88_real(0), 20.0, J88_real(100), J88_real(100), 50.0, J88_real(0))
RemoveLocation(center)
center = GetRectCenter(gg_rct_East_Europe)
CreateTextTagLocBJ("TRIGSTR_1189", center, J88_real(0), 20.0, J88_real(100), 0.0, 0.0, J88_real(0))
RemoveLocation(center)
center = GetRectCenter(gg_rct_West_Europe)
CreateTextTagLocBJ("TRIGSTR_1190", center, J88_real(0), 20.0, 0.0, 50.0, 100.0, J88_real(0))
RemoveLocation(center)
center = GetRectCenter(gg_rct_Pacific)
CreateTextTagLocBJ("TRIGSTR_1191", center, J88_real(0), 20.0, 20.0, 100.0, 20.0, J88_real(0))
RemoveLocation(center)
center = nil
end

function InitTrig_Region_names()
gg_trg_Region_names = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Region_names, J88_real(5))
TriggerAddAction(gg_trg_Region_names, Trig_Region_names_Actions)
end

function Print(s)
DisplayTextToForce(GetPlayersAll(), s)
end

function RandomPlayerOrder()
local a = 0
local b = 0
local c = 0
local d = 0
while true do
if (a == 8) then break end
RANDOM_PLAYER_ORDER[a] = J88_int(-1)
a = J88_int(a + 1)
end
a = 0
while true do
if (a == 8) then break end
b = GetRandomInt(1, 8)
c = 0
while true do
if (c == 8) then break end
d = ModuloInteger(J88_int(b + c), 8)
if (RANDOM_PLAYER_ORDER[d] == J88_int(-1)) then
RANDOM_PLAYER_ORDER[d] = a
if (1 == 1) then break end
end
c = J88_int(c + 1)
end
a = J88_int(a + 1)
end
end

function GetPlayerColorFlag(color)
if (color == PLAYER_COLOR_RED) then
do return "|cffff0303" end
elseif (color == PLAYER_COLOR_BLUE) then
do return "|cff0042ff" end
elseif (color == PLAYER_COLOR_CYAN) then
do return "|cff1ce6b9" end
elseif (color == PLAYER_COLOR_PURPLE) then
do return "|cff540081" end
elseif (color == PLAYER_COLOR_YELLOW) then
do return "|cfffffc01" end
elseif (color == PLAYER_COLOR_ORANGE) then
do return "|cfffe8a0e" end
elseif (color == PLAYER_COLOR_GREEN) then
do return "|cff20c000" end
elseif (color == PLAYER_COLOR_PINK) then
do return "|cffe55bb0" end
elseif (color == PLAYER_COLOR_LIGHT_GRAY) then
do return "|cff959697" end
elseif (color == PLAYER_COLOR_LIGHT_BLUE) then
do return "|cff7ebff1" end
elseif (color == PLAYER_COLOR_AQUA) then
do return "|cff106246" end
elseif (color == PLAYER_COLOR_BROWN) then
do return "|cff4e2a04" end
end
do return "|cffffffff" end
end

function GetColorEnd()
do return "|r" end
end

function GetColorPlayerName(p)
do return J88_concat(J88_concat(GetPlayerColorFlag(GetPlayerColor(p)), GetPlayerName(p)), "|r") end
end

function RoundSchedule_IsBonusRound(round)
    do return ((round == 4) or (round == 9)) end
end

function RoundSchedule_IsFinalRound(round)
    do return (round == RoundSchedule_FinalRound) end
end

function GetOpponentPlayer(p)
do return Player(udg_int_Opponent[GetPlayerId(p)]) end
end

function OpponentSetMatchup(a, b)
local x = udg_int_playersShuffled[J88_int(a - 1)]
local y = udg_int_playersShuffled[J88_int(b - 1)]
udg_int_Opponent[x] = y
udg_int_Opponent[y] = x
end

function SetOpponents(round)
if (round > 7) then
round = GetRandomInt(1, 7)
end
if (round == 1) then
OpponentSetMatchup(1, 2)
OpponentSetMatchup(3, 4)
OpponentSetMatchup(5, 6)
OpponentSetMatchup(7, 8)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(5 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(7 - 1)]
end
if (round == 2) then
OpponentSetMatchup(1, 3)
OpponentSetMatchup(2, 4)
OpponentSetMatchup(5, 7)
OpponentSetMatchup(6, 8)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(5 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(6 - 1)]
end
if (round == 3) then
OpponentSetMatchup(1, 4)
OpponentSetMatchup(2, 3)
OpponentSetMatchup(5, 8)
OpponentSetMatchup(6, 7)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(5 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(6 - 1)]
end
if (round == 4) then
OpponentSetMatchup(1, 5)
OpponentSetMatchup(2, 6)
OpponentSetMatchup(3, 7)
OpponentSetMatchup(4, 8)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
if (round == 5) then
OpponentSetMatchup(1, 6)
OpponentSetMatchup(2, 8)
OpponentSetMatchup(3, 5)
OpponentSetMatchup(4, 7)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
if (round == 6) then
OpponentSetMatchup(1, 7)
OpponentSetMatchup(2, 5)
OpponentSetMatchup(3, 8)
OpponentSetMatchup(4, 6)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
if (round == 7) then
OpponentSetMatchup(1, 8)
OpponentSetMatchup(2, 7)
OpponentSetMatchup(3, 6)
OpponentSetMatchup(4, 5)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
if (round == 8) then
OpponentSetMatchup(1, 2)
OpponentSetMatchup(3, 4)
OpponentSetMatchup(5, 6)
OpponentSetMatchup(7, 8)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(5 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(7 - 1)]
end
if (round == 9) then
OpponentSetMatchup(1, 5)
OpponentSetMatchup(2, 6)
OpponentSetMatchup(3, 7)
OpponentSetMatchup(4, 8)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
if (round == 10) then
OpponentSetMatchup(1, 8)
OpponentSetMatchup(2, 7)
OpponentSetMatchup(3, 6)
OpponentSetMatchup(4, 5)
udg_int_OpponentHelper[0] = udg_int_playersShuffled[J88_int(1 - 1)]
udg_int_OpponentHelper[1] = udg_int_playersShuffled[J88_int(2 - 1)]
udg_int_OpponentHelper[2] = udg_int_playersShuffled[J88_int(3 - 1)]
udg_int_OpponentHelper[3] = udg_int_playersShuffled[J88_int(4 - 1)]
end
end

function SetBonusDisplay(text)
if (BONUS_DISPLAY == nil) then
BONUS_DISPLAY = CreateTextTag()
SetTextTagPos(BONUS_DISPLAY, J88_real(J88_int(-70)), J88_real(0), J88_real(0))
SetTextTagColor(BONUS_DISPLAY, 0, 200, 0, 255)
SetTextTagVisibility(BONUS_DISPLAY, true)
end
SetTextTagText(BONUS_DISPLAY, text, TextTagSize2Height(J88_real(12)))
do return BONUS_DISPLAY end
end

function UpdateBonusDisplay()
SetBonusDisplay(J88_concat("Bonus: ", I2S(BONUS_AMOUNT)))
end

function AddBonus(amount)
BONUS_AMOUNT = J88_int(amount + BONUS_AMOUNT)
SetBonusDisplay(J88_concat("Bonus: ", I2S(BONUS_AMOUNT)))
end

function DestroyBonusDisplay()
if (BONUS_DISPLAY == nil) then
do return end
end
DestroyTextTag(BONUS_DISPLAY)
BONUS_DISPLAY = nil
end

function GetNextByPriority(pid)
if (SPAWN_UNITS_COUNT[pid] == 0) then
do return nil end
end
SPAWN_UNITS_COUNT[pid] = J88_int(SPAWN_UNITS_COUNT[pid] - 1)
do return SPAWN_UNITS_SORTED[J88_int(J88_int(pid * 1000) + SPAWN_UNITS_COUNT[pid])] end
end

function DoSpawn(p, g, bid, uid, mult)
local amount = J88_int(CountLivingPlayerUnitsOfTypeId(bid, p) * mult)
if (amount == 0) then
do return end
end
CreateNUnitsAtLoc(amount, uid, p, udg_point_CenterOfMap, bj_UNIT_FACING)
GroupAddGroup(GetLastCreatedGroup(), g)
end

function GroupHideUnitsEnum()
ShowUnitHide(GetEnumUnit())
end

function SpreadHideRemainder(pid)
local i = SPAWN_UNITS_COUNT[pid]
while true do
if (i < 0) then break end
i = J88_int(i - 1)
ShowUnit(SPAWN_UNITS_SORTED[J88_int(J88_int(pid * 1000) + i)], false)
end
end

function SpreadInSite()
local g = SPAWN_G
local site = SPAWN_SITE
local pid = SPAWN_PID
local dx = 0
local xmax = 0
local dy = 0
local ymax = 0
local x_first = false
local u = nil
local x = 0
local y = 0
local step = 80.0
local start_x = GetRectCenterX(udg_region_Spawns[site])
local start_y = GetRectCenterY(udg_region_Spawns[site])
local dir = 0.0
if (SPAWN_REINFORCEMENTS[site] == nil) then
SPAWN_REINFORCEMENTS[site] = CreateGroup()
else
GroupClear(SPAWN_REINFORCEMENTS[site])
end
if (site < 2) then
dy = J88_int(-1)
if (site == 0) then
dx = J88_int(-1)
else
dx = 1
end
x_first = false
xmax = SPAWN_DEPTH
ymax = SPAWN_WIDTH
elseif (site < 4) then
dx = 1
if (site == 2) then
dy = J88_int(-1)
else
dy = 1
end
x_first = true
xmax = SPAWN_WIDTH
ymax = SPAWN_DEPTH
elseif (site < 6) then
dy = 1
if (site == 4) then
dx = 1
else
dx = J88_int(-1)
end
x_first = false
xmax = SPAWN_DEPTH
ymax = SPAWN_WIDTH
else
dx = J88_int(-1)
if (site == 6) then
dy = 1
else
dy = J88_int(-1)
end
x_first = true
xmax = SPAWN_WIDTH
ymax = SPAWN_DEPTH
end
if x_first then
while true do
u = GetNextByPriority(pid)
if (u == nil) then break end
SetUnitX(u, J88_real(start_x + J88_real(I2R(x) * step)))
SetUnitY(u, J88_real(start_y + J88_real(I2R(y) * step)))
x = J88_int(x + dx)
if (IAbsBJ(x) == xmax) then
x = 0
y = J88_int(y + dy)
end
if (IAbsBJ(y) == ymax) then
SpreadHideRemainder(pid)
if (1 == 1) then break end
end
end
else
while true do
u = GetNextByPriority(pid)
if (u == nil) then break end
SetUnitX(u, J88_real(start_x + J88_real(I2R(x) * step)))
SetUnitY(u, J88_real(start_y + J88_real(I2R(y) * step)))
y = J88_int(y + dy)
if (IAbsBJ(y) == ymax) then
y = 0
x = J88_int(x + dx)
end
if (IAbsBJ(x) == xmax) then
SpreadHideRemainder(pid)
if (1 == 1) then break end
end
end
end
end

function Yamato_IsAirTarget(ship, target)
    local owner = 0
    if ((target == nil) or (GetWidgetLife(target) <= 0.4050000011920929)) then
        do return false end
    end
    owner = GetPlayerId(GetOwningPlayer(target))
    do return (((((((IsUnitType(target, UNIT_TYPE_FLYING) and (GetUnitAbilityLevel(target, 1097625443) == 0)) and (not BlzIsUnitInvulnerable(target))) and (((owner >= 9) and (owner <= 16)) or (owner == 18))) and IsUnitEnemy(target, GetOwningPlayer(ship))) and IsUnitVisible(target, GetOwningPlayer(ship))) and (not IsUnitHidden(target)))) end
end

function Yamato_FireAA(ship)
    local candidate = nil
    local x = GetUnitX(ship)
    local y = GetUnitY(ship)
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local count = 0
    local slot = 0
    local shift = 0
    --  One area search per battery, followed by a fixed six-slot insertion.
    while true do
        if (count >= 6) then break end
        Yamato_Target[count] = nil
        Yamato_Distance[count] = 640001.0
        count = J88_int(count + 1)
    end
    GroupEnumUnitsInRange(Yamato_Search, x, y, 800.0, nil)
    while true do
        candidate = FirstOfGroup(Yamato_Search)
        if (candidate == nil) then break end
        GroupRemoveUnit(Yamato_Search, candidate)
        if Yamato_IsAirTarget(ship, candidate) then
            dx = J88_real(GetUnitX(candidate) - x)
            dy = J88_real(GetUnitY(candidate) - y)
            distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
            if (distance <= 640000.0) then
                slot = 0
                while true do
                    if ((slot >= 6) or (distance < Yamato_Distance[slot])) then break end
                    slot = J88_int(slot + 1)
                end
                if (slot < 6) then
                    shift = 5
                    while true do
                        if (shift <= slot) then break end
                        Yamato_Target[shift] = Yamato_Target[J88_int(shift - 1)]
                        Yamato_Distance[shift] = Yamato_Distance[J88_int(shift - 1)]
                        shift = J88_int(shift - 1)
                    end
                    Yamato_Target[slot] = candidate
                    Yamato_Distance[slot] = distance
                end
            end
        end
    end
    count = 0
    while true do
        if (count >= 6) then break end
        candidate = Yamato_Target[count]
        Yamato_Target[count] = nil
        if ((Yamato_Active and (GetWidgetLife(ship) > 0.4050000011920929)) and Yamato_IsAirTarget(ship, candidate)) then
            --  A visible flak shell per target; Yamato81_AAHit applies the damage on arrival.
            Missile81_Launch(ship, candidate, "Abilities\\Weapons\\FlyingMachine\\FlyingMachineMissile.mdl", 1500.0, 120.0, Yamato81_AAHit)
        end
        count = J88_int(count + 1)
    end
    candidate = nil
end

function Yamato_TickShip()
    local ship = GetEnumUnit()
    if ((GetUnitTypeId(ship) ~= 1750675761) or (GetWidgetLife(ship) <= 0.4050000011920929)) then
        GroupRemoveUnit(Yamato_Ships, ship)
    elseif ((((GetPlayerId(GetOwningPlayer(ship)) >= 9) and (GetPlayerId(GetOwningPlayer(ship)) <= 16)) and (not IsUnitPaused(ship))) and (not IsUnitHidden(ship))) then
        Yamato_FireAA(ship)
    end
    ship = nil
end

function Yamato81_ShipBattery()
    local ship = GetEnumUnit()
    if ((GetUnitTypeId(ship) == 1750675761) and (GetWidgetLife(ship) > 0.4050000011920929) and (GetPlayerId(GetOwningPlayer(ship)) >= 9) and (GetPlayerId(GetOwningPlayer(ship)) <= 16) and (not IsUnitPaused(ship)) and (not IsUnitHidden(ship))) then
        if (Yamato81_Next[ship] == nil) then
            Yamato81_Next[ship] = Yamato_Clock
        end
        if (Yamato_Clock >= Yamato81_Next[ship]) then
            if Yamato81_FireBattery(ship) then
                Yamato81_Next[ship] = J88_int(Yamato_Clock + Yamato81_COOLDOWN)
            else
                --  No target in range: look again in one second.
                Yamato81_Next[ship] = J88_int(Yamato_Clock + 10)
            end
        end
    end
    ship = nil
end

function Yamato_OnTick()
    if (not Yamato_Active) then
        do return end
    end
    Yamato_Clock = J88_int(Yamato_Clock + 1)
    Yamato81_TickVolleys()
    ForGroup(Yamato_Ships, Yamato81_ShipBattery)
    Yamato_Tick = J88_int(Yamato_Tick + 1)
    if (Yamato_Tick >= 14) then
        Yamato_Tick = 0
        ForGroup(Yamato_Ships, Yamato_TickShip)
        if ((FirstOfGroup(Yamato_Ships) == nil) and (#Yamato81_Volleys == 0)) then
            PauseTimer(Yamato_Timer)
        end
    end
end

function Yamato_Register(ship)
    if (GetUnitTypeId(ship) ~= 1750675761) then
        do return end
    end
    if (Yamato_Ships == nil) then
        Yamato_Ships = CreateGroup()
        Yamato_Search = CreateGroup()
        Yamato_Timer = CreateTimer()
    end
    GroupAddUnit(Yamato_Ships, ship)
    if Yamato_Active then
        TimerStart(Yamato_Timer, 0.10000000149011612, true, Yamato_OnTick)
    end
end

function Yamato_Begin()
    Yamato_Active = true
    Yamato_Tick = 0
    if ((Yamato_Timer ~= nil) and (FirstOfGroup(Yamato_Ships) ~= nil)) then
        TimerStart(Yamato_Timer, 0.10000000149011612, true, Yamato_OnTick)
    end
end

function Yamato_Stop()
    local index = 0
    France_Epoch = J88_int(France_Epoch + 1)
    Yamato_Active = false
    Yamato_Tick = 0
    if (Yamato_Timer ~= nil) then
        PauseTimer(Yamato_Timer)
        GroupClear(Yamato_Ships)
        GroupClear(Yamato_Search)
    end
    while true do
        if (index >= 7) then break end
        Yamato_Target[index] = nil
        index = J88_int(index + 1)
    end
    for i = #Yamato81_Volleys, 1, -1 do
        Yamato81_Volleys[i] = nil
    end
    Yamato81_Next = {}
    Missile81_Clear()
end

function Yamato_UpdateAvailability()
    local pid = 0
    --  Keep the button visible. R000 gates construction until Elimination Phase.
    --  Limit 1 per player (1.0.1): never reopen it to unlimited here.
    while true do
        if (pid >= 8) then break end
        SetPlayerTechMaxAllowed(Player(pid), 1750675762, 1)
        pid = J88_int(pid + 1)
    end
end

function FCM53_FireSecondary(source)
    local key = GetHandleId(source)
    local sourceX = 0.0
    local sourceY = 0.0
    local dx = 0.0
    local dy = 0.0
    local primary = LoadUnitHandle(France_Data, key, 201)
    local u = nil
    local best = nil
    local fallback = nil
    local distance = 0.0
    local closest = 1000000000.0
    if ((not France_Active(source)) or (J88_real(France_Time + 9.999999747378752e-06) < LoadReal(France_Data, key, 101))) then
        primary = nil
        do return end
    end
    --  The first native attack establishes the actual primary target, rather
    --  than guessing from proximity before the engine acquires an enemy.
    if ((primary == nil) or (LoadInteger(France_Data, key, 202) ~= France_Epoch)) then
        primary = nil
        do return end
    end
    sourceX = GetUnitX(source)
    sourceY = GetUnitY(source)
    GroupEnumUnitsInRange(France_Search, sourceX, sourceY, 728.0, nil)
    while true do
        u = FirstOfGroup(France_Search)
        if (u == nil) then break end
        GroupRemoveUnit(France_Search, u)
        if (France_Target(source, u, false, false) and IsUnitInRange(source, u, 600.0)) then
            if (u == primary) then
                fallback = u
            else
                dx = J88_real(GetUnitX(u) - sourceX)
                dy = J88_real(GetUnitY(u) - sourceY)
                distance = J88_real(J88_real(dx * dx) + J88_real(dy * dy))
                if (((best == nil) or (distance < closest)) or ((distance == closest) and (GetHandleId(u) < GetHandleId(best)))) then
                    best = u
                    closest = distance
                end
            end
        end
    end
    if (best == nil) then
        best = fallback
    end
    if (best ~= nil) then
        SaveReal(France_Data, key, 101, J88_real(France_Time + 1.5))
        France_Shot(source, best, I2R(GetRandomInt(250, 350)), 5, false, false)
    end
    primary = nil
    best = nil
    fallback = nil
    u = nil
end

function FCM53_OnAttack()
    local source = GetAttacker()
    if ((GetUnitTypeId(source) == 1749435953) and France_Active(source)) then
        SaveUnitHandle(France_Data, GetHandleId(source), 201, GetTriggerUnit())
        SaveInteger(France_Data, GetHandleId(source), 202, France_Epoch)
        FCM53_FireSecondary(source)
    end
    source = nil
end

function FCM53_Init()
    local t = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ATTACKED)
    TriggerAddAction(t, FCM53_OnAttack)
    t = nil
end

function HP88_OnlyFortresses(army)
    local index = 0
    local count = BlzGroupGetSize(army)
    local u = nil
    while true do
        if (index >= count) then break end
        u = BlzGroupUnitAt(army, index)
        if (France_Alive(u) and (GetUnitTypeId(u) ~= 1749437762)) then
            u = nil
            do return false end
        end
        index = J88_int(index + 1)
    end
    u = nil
    do return true end
end

function DoSpawn2(p, g, id, num, facing)
local u = nil
local i = 0
local pid = GetPlayerId(p)
while true do
if (i == num) then break end
u = CreateUnit(Player(J88_int(pid + 9)), id, 5000.0, 5000.0, facing)
FlushChildHashtable(Bounty_Data, GetHandleId(u))
CavalryCharge_Register(u)
Yamato_Register(u)
China_Register(u)
France_Register(u)
PL104_Register(u)
SPAWN_UNITS_SORTED[J88_int(J88_int(pid * 1000) + SPAWN_UNITS_COUNT[pid])] = u
SPAWN_UNITS_COUNT[pid] = J88_int(SPAWN_UNITS_COUNT[pid] + 1)
GroupAddUnit(g, u)
i = J88_int(i + 1)
end
end

function France57_DeployFortress(u, facing, index)
local row = ModuloInteger(index, 7)
local x = J88_real(320.0 + J88_real(I2R(J88_div(index, 7)) * 256.0))
local y = 0.0
if (GetUnitTypeId(u) ~= 1749437762) then
do return end
end
if (row > 0) then
y = J88_real(I2R(J88_div(J88_int(row + 1), 2)) * 256.0)
if (ModuloInteger(row, 2) == 0) then
y = J88_real(-y)
end
end
if (facing < 90.0) then
x = J88_real(-x)
end
SetUnitPathing(u, false)
SetUnitX(u, x)
SetUnitY(u, y)
France_FaceFortress(u, facing)
end

function CenterSpawn(p, dir)
local pid = GetPlayerId(p)
local i = 0
local fortressIndex = 0
local u = nil
local facing = 0.0
local g = nil
local xCoord = J88_real(0)
local xCoordShifted = J88_real(0)
local initX = 512.0
local initY = 1152.0
local unshiftedY = 384.0
local uPerCol = 30
local ogUPerCol = 12
local uSpawnBox = 64.0
local breakoff = 1250.0
local shiftWidth = 22
if (dir == 1) then
facing = 0.0
else
facing = 180.0
end
g = CreateSpawnArray(p, facing)
while true do
u = GetNextByPriority(pid)
if (u == nil) then break end
PauseUnit(u, true)
if (dir == 0) then
xCoord = J88_real(initX + J88_real(J88_real(R2I(J88_real(J88_div(i, uPerCol)))) * uSpawnBox))
xCoordShifted = J88_real(initX + J88_real(J88_real(J88_int(R2I(J88_real(J88_div(i, ogUPerCol))) - shiftWidth)) * uSpawnBox))
else
xCoord = J88_real(J88_real(-initX) - J88_real(J88_real(R2I(J88_real(J88_div(i, uPerCol)))) * uSpawnBox))
xCoordShifted = J88_real(J88_real(-initX) - J88_real(J88_real(J88_int(R2I(J88_real(J88_div(i, ogUPerCol))) - shiftWidth)) * uSpawnBox))
end
if ((xCoord > breakoff) or (xCoord < J88_real(-breakoff))) then
SetUnitX(u, xCoordShifted)
SetUnitY(u, J88_real(unshiftedY - J88_real(J88_real(ModuloInteger(i, ogUPerCol)) * uSpawnBox)))
else
SetUnitX(u, xCoord)
SetUnitY(u, J88_real(initY - J88_real(J88_real(ModuloInteger(i, uPerCol)) * uSpawnBox)))
end
if (GetUnitTypeId(u) == 1749437762) then
France57_DeployFortress(u, facing, fortressIndex)
fortressIndex = J88_int(fortressIndex + 1)
end
i = J88_int(i + 1)
end
do return g end
end

function AttackEnum()
PauseUnit(GetEnumUnit(), false)
Battle77_InitialOrder(GetEnumUnit())
end

function Italy75_Economy0()
ArmyEconomy_Register(1749626928, 200, 0, 200, 0, 3, 6)
SaveInteger(ArmyEconomy_Types, 1749626928, 100, 1749626929)
SaveInteger(ArmyEconomy_Types, 1749626928, 101, 1749626930)
SaveInteger(ArmyEconomy_Types, 1749626928, 102, 1749626931)
SaveInteger(ArmyEconomy_Types, 1749626928, 103, 1749626932)
SaveInteger(ArmyEconomy_Types, 1749626928, 104, 1749626933)
SaveInteger(ArmyEconomy_Types, 1749626928, 105, 1749626934)
ArmyEconomy_Register(1749626929, 0, 800, 200, 800, 3, 0)
ArmyEconomy_Register(1749626930, 100, 0, 300, 0, 3, 0)
ArmyEconomy_Register(1749626931, 100, 0, 300, 0, 3, 0)
ArmyEconomy_Register(1749626932, 50, 0, 250, 0, 3, 0)
ArmyEconomy_Register(1749626933, 100, 0, 300, 0, 3, 0)
ArmyEconomy_Register(1749626934, 0, 300, 200, 300, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749626934, 100, 1749626935)
ArmyEconomy_Register(1749626935, 0, 500, 200, 800, 3, 0)
end

function Vehicles78_Economy0()
ArmyEconomy_Register(1749627696, 300, 0, 300, 0, 3, 3)
SaveInteger(ArmyEconomy_Types, 1749627696, 100, 1749627698)
SaveInteger(ArmyEconomy_Types, 1749627696, 101, 1749627697)
SaveInteger(ArmyEconomy_Types, 1749627696, 102, 1747989582)
ArmyEconomy_Register(1749627698, 0, 1200, 300, 1200, 3, 0)
ArmyEconomy_Register(1749627697, 0, 750, 300, 750, 3, 0)
SaveInteger(ArmyEconomy_Types, 1749627696, 6, 2)
SaveInteger(ArmyEconomy_Types, 1749627696, 100, 1749627697)
SaveInteger(ArmyEconomy_Types, 1749627696, 101, 1749627698)
end

function Tanks79_Economy0()
ArmyEconomy_Register(1749634096, 0, 1000, 0, 1000, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749634096, 100, 1749634098)
ArmyEconomy_Register(1749634098, 0, 500, 0, 1500, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749634098, 100, 1749634100)
ArmyEconomy_Register(1749634100, 0, 700, 0, 2200, 3, 0)
ArmyEconomy_Register(1749633072, 0, 1500, 0, 1500, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749633072, 100, 1749633074)
ArmyEconomy_Register(1749633074, 0, 1000, 0, 2500, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749633074, 100, 1749633076)
ArmyEconomy_Register(1749633076, 0, 1500, 0, 4000, 3, 0)
end

function Artillery81_Economy0()
ArmyEconomy_Register(1749631280, 200, 0, 200, 0, 3, 2)
SaveInteger(ArmyEconomy_Types, 1749631280, 100, 1749631282)
SaveInteger(ArmyEconomy_Types, 1749631280, 101, 1749631284)
ArmyEconomy_Register(1749631282, 0, 1500, 200, 1500, 3, 0)
ArmyEconomy_Register(1749631284, 0, 1800, 200, 1800, 3, 0)
end

function Forces82_Economy0()
ArmyEconomy_Register(1749112368, 0, 1500, 0, 1500, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749112368, 100, 1749112370)
ArmyEconomy_Register(1749112370, 0, 1300, 0, 2800, 3, 0)
ArmyEconomy_Register(1749112372, 0, 1800, 0, 1800, 3, 0)
ArmyEconomy_Register(1749112374, 0, 1800, 0, 1800, 3, 1)
SaveInteger(ArmyEconomy_Types, 1749112374, 100, 1749112376)
ArmyEconomy_Register(1749112376, 0, 4700, 0, 6500, 3, 0)
ArmyEconomy_Register(1749112624, 0, 6500, 0, 6500, 3, 0)
ArmyEconomy_Register(1749632304, 500, 0, 500, 0, 3, 0)
end

function Bounty_AssignBatch()
    local count = J88_int(SPAWN_UNITS_COUNT[Bounty_Pid] - Bounty_Start)
    local points = ArmyPoints_UnitValue(Bounty_Building)
    Zhukov_RecordBatch()
    local targetPoints = points
    local i = 0
    local value = 0
    local remainder = 0
    if (count <= 0) then
        do return end
    end
    --  Gongchen has a separate authored bounty: 150 Army Points, 200 BP on kill.
    if (GetUnitTypeId(Bounty_Building) == 1749242932) then
        points = 200
    end
    remainder = ModuloInteger(points, count)
    while true do
        if (i >= count) then break end
        --  Whole-resource distribution: every soldier differs by at most one point;
        --  the squad sums to its reward budget (Army Points except Gongchen).
        value = J88_div(points, count)
        if (i < remainder) then
            value = J88_int(value + 1)
        end
        SaveInteger(Bounty_Data, GetHandleId(SPAWN_UNITS_SORTED[J88_int(J88_int(J88_int(Bounty_Pid * 1000) + Bounty_Start) + i)]), 90, J88_div(targetPoints, count))
        SaveInteger(Bounty_Data, GetHandleId(SPAWN_UNITS_SORTED[J88_int(J88_int(J88_int(Bounty_Pid * 1000) + Bounty_Start) + i)]), 0, value)
        i = J88_int(i + 1)
    end
end

function CalcArmyPointsCb()
CALC_ARMY_PTS_TEMP = J88_int(CALC_ARMY_PTS_TEMP + ArmyPoints_UnitValue(GetEnumUnit()))
end

function CalcArmyPoints(p)
local members = nil
CALC_ARMY_PTS_TEMP = 0
members = GetUnitsOfPlayerMatching(p, nil)
ForGroup(members, CalcArmyPointsCb)
DestroyGroup(members)
members = nil
do return CALC_ARMY_PTS_TEMP end
end

function CountdownAttackMidHandler()
ForGroup(udg_group_AllSpawnedUnits, AttackEnum)
CavalryCharge_Begin(CavalryCharge_Mode)
Yamato_Begin()
end

function CountdownTickHandler()
COUNTDOWN_TICK_NUM = J88_int(COUNTDOWN_TICK_NUM - 1)
if (COUNTDOWN_TICK_NUM == 0) then
PauseTimer(COUNTDOWN_TICK_TIMER)
DestroyTimer(COUNTDOWN_TICK_TIMER)
COUNTDOWN_TICK_TIMER = nil
Print("|cffff0000GO!|r")
if ((COUNTDOWN_TICK_FUNC ~= "") and (COUNTDOWN_TICK_FUNC ~= nil)) then
ExecuteFunc(COUNTDOWN_TICK_FUNC)
end
else
PlaySoundBJ(gg_snd_BattleNetTick)
Print(J88_concat(J88_concat("|cffff0000", I2S(COUNTDOWN_TICK_NUM)), "|r..."))
end
end

function CountdownTick(ticks, tick_size, func)
if (COUNTDOWN_TICK_TIMER ~= nil) then
Print("Error creating countdown timer")
do return end
end
COUNTDOWN_TICK_TIMER = CreateTimer()
COUNTDOWN_TICK_NUM = ticks
COUNTDOWN_TICK_FUNC = func
TimerStart(COUNTDOWN_TICK_TIMER, tick_size, true, CountdownTickHandler)
end

function StartVsRound(round)
local spawned = nil
local a = 0
local current = 0
local site = 0
local site_offset = GetRandomInt(1, 4)
udg_bool_WaitingForSacrificeEnd = false
ROUND_WINNER = nil
CavalryCharge_Stop()
Yamato_Stop()
CavalryCharge_Mode = 1
EnableTrigger(gg_trg_PlayerUnitDies)
GroupClear(udg_group_AllSpawnedUnits)
BONUS_AMOUNT = 0
while true do
if (a == 4) then break end
site = J88_int(ModuloInteger(J88_int(a + site_offset), 4) * 2)
current = udg_int_OpponentHelper[a]
PLAYER_CURRENT_SITE[current] = site
spawned = SpawnUnits2(Player(current), site)
GroupAddGroup(spawned, udg_group_AllSpawnedUnits)
DestroyGroup(spawned)
spawned = nil
PLAYER_CURRENT_SITE[udg_int_Opponent[current]] = J88_int(site + 1)
spawned = SpawnUnits2(Player(udg_int_Opponent[current]), J88_int(site + 1))
GroupAddGroup(spawned, udg_group_AllSpawnedUnits)
DestroyGroup(spawned)
spawned = nil
a = J88_int(a + 1)
end
LS103_RoundStart()
CURRENT_SCOREBOARD = CreateVsRoundScoreboard()
end

function SetupPeasantSlaughter()
CreateUnit(Player(18), 1747988560, J88_real(J88_int(-512)), J88_real(0), J88_real(0))
end

function BonusCleanupDefault_Enum()
if (IsUnitDeadBJ(GetEnumUnit()) or (GetPlayerId(GetOwningPlayer(GetEnumUnit())) == 18)) then
RemoveUnit(GetEnumUnit())
end
end

function Perf_CombatForGroupAndDestroy(units, callback)
ForGroup(units, callback)
DestroyGroup(units)
end

function BonusCleanupDefault()
Perf_CombatForGroupAndDestroy(GetUnitsInRectAll(udg_region_EntireMap), BonusCleanupDefault_Enum)
end

function PickHighestBonus(f)
local i = 0
local highest = J88_int(-1)
local hp = J88_int(-1)
local p = nil
while true do
if (i == 8) then break end
p = Player(RANDOM_PLAYER_ORDER[i])
if (IsPlayerInForce(p, f) == false) then
if (GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) > highest) then
highest = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
hp = RANDOM_PLAYER_ORDER[i]
end
end
i = J88_int(i + 1)
end
if (hp == J88_int(-1)) then
Print("|cffff0000Error sorting players for final tournament!")
end
ForceAddPlayer(f, Player(hp))
do return hp end
end

function SetupFinalTournament()
local i = 0
local f = CreateForce()
RandomPlayerOrder()
while true do
if (i == 4) then break end
FINAL_TOUR_ORDER[J88_int(i * 2)] = PickHighestBonus(f)
i = J88_int(i + 1)
end
while true do
if (i == 0) then break end
FINAL_TOUR_ORDER[J88_int(J88_int(i * 2) - 1)] = PickHighestBonus(f)
i = J88_int(i - 1)
end
DestroyForce(f)
f = nil
end

function FinalTournamentCleanup_Enum()
if (GetUnitAbilityLevel(GetEnumUnit(), 1093677105) > 0) then
RemoveUnit(GetEnumUnit())
end
end

function FinalTournamentCleanup()
Perf_CombatForGroupAndDestroy(GetUnitsInRectAll(udg_region_EntireMap), FinalTournamentCleanup_Enum)
end

function DoFinalTournamentRound(title, p1, p2)
local flip = GetRandomInt(0, 1)
China_FinalOwner[0] = p1
China_FinalOwner[1] = p2
CavalryCharge_Stop()
Yamato_Stop()
CavalryCharge_Mode = 3
EnableTrigger(FINAL_TOUR_ON_DEATH_TRG)
udg_PreventOrder = false
udg_bool_InFinalRound = true
if (FINAL_TOUR_SPAWNS[0] ~= nil) then
DestroyGroup(FINAL_TOUR_SPAWNS[0])
FINAL_TOUR_SPAWNS[0] = nil
end
FINAL_TOUR_SPAWNS[0] = CenterSpawn(Player(p1), flip)
if (FINAL_TOUR_SPAWNS[1] ~= nil) then
DestroyGroup(FINAL_TOUR_SPAWNS[1])
FINAL_TOUR_SPAWNS[1] = nil
end
FINAL_TOUR_SPAWNS[1] = CenterSpawn(Player(p2), J88_int(1 - flip))
GroupClear(udg_group_AllSpawnedUnits)
GroupAddGroup(FINAL_TOUR_SPAWNS[0], udg_group_AllSpawnedUnits)
GroupAddGroup(FINAL_TOUR_SPAWNS[1], udg_group_AllSpawnedUnits)
udg_PreventOrder = true
FINAL_TOUR_ROUND_WINNER = J88_int(-1)
Print(J88_concat(J88_concat(J88_concat(J88_concat(title, ": "), GetColorPlayerName(Player(p1))), " vs "), GetColorPlayerName(Player(p2))))
PanCameraToTimed(J88_real(0), J88_real(0), 1.0)
CountdownTick(6, 1.0, "CountdownAttackMidHandler")
while true do
if (FirstOfGroup(FINAL_TOUR_SPAWNS[1]) == nil) then
FINAL_TOUR_ROUND_WINNER = p1
FINAL_TOUR_ROUND_LOSER = p2
elseif (FirstOfGroup(FINAL_TOUR_SPAWNS[0]) == nil) then
FINAL_TOUR_ROUND_WINNER = p2
FINAL_TOUR_ROUND_LOSER = p1
end
if (FINAL_TOUR_ROUND_WINNER > J88_int(-1)) then break end
TriggerSleepAction(0.5)
end
PF73_Result(FINAL_TOUR_ROUND_WINNER, FINAL_TOUR_ROUND_LOSER)
Print(J88_concat(J88_concat(GetColorPlayerName(Player(FINAL_TOUR_ROUND_WINNER)), " has eliminated "), GetColorPlayerName(Player(FINAL_TOUR_ROUND_LOSER))))
MultiboardSetItemValueColor(FINAL_TOUR_PLAYERNAME_MI[FINAL_TOUR_ROUND_LOSER], 64, 64, 64, 255)
PolledWait(2.0)
CavalryCharge_Stop()
Yamato_Stop()
DisableTrigger(FINAL_TOUR_ON_DEATH_TRG)
Perf_CombatForGroupAndDestroy(GetUnitsInRectAll(udg_region_EntireMap), FinalTournamentCleanup_Enum)
end

function EndRoundCleanUnits()
if IsUnitDeadBJ(GetEnumUnit()) then
RemoveUnit(GetEnumUnit())
end
end

function pizdec()
local i = 0
udg_int_CurRound = 0
udg_timer_PreRoundCount = CreateTimer()
udg_config_real_PreRoundTime = 60.0
i = 0
while true do
if (i > 9) then break end
udg_int_playersShuffled[i] = J88_int(-1)
i = J88_int(i + 1)
end
udg_TEMP_intA = 0
i = 0
while true do
if (i > 9) then break end
udg_int_Opponent[i] = 0
i = J88_int(i + 1)
end
udg_int_CurVsRound = 0
udg_AllPlayers = CreateForce()
udg_group_AllSpawnedUnits = CreateGroup()
i = 0
while true do
if (i > 8) then break end
udg_int_OpponentHelper[i] = 0
i = J88_int(i + 1)
end
udg_bool_WaitingForSacrificeEnd = false
udg_int_CurBonusRound = 0
i = 0
while true do
if (i > 1) then break end
udg_int_RoundGold[i] = 0
i = J88_int(i + 1)
end
end

function InitTrig_pizdec()
ExecuteFunc("pizdec")
end

function Trig_Misc_init_Actions()
udg_region_EntireMap = GetEntireMapRect()
udg_point_CenterOfMap = GetRectCenter(GetPlayableMapRect())
udg_region_Spawns[0] = gg_rct_Frontrank_1a
udg_region_Spawns[1] = gg_rct_Frontrank_1b
udg_region_Spawns[2] = gg_rct_Frontrank_2a
udg_region_Spawns[3] = gg_rct_Frontrank_2b
udg_region_Spawns[4] = gg_rct_Frontrank_3a
udg_region_Spawns[5] = gg_rct_Frontrank_3b
udg_region_Spawns[6] = gg_rct_Frontrank_4a
udg_region_Spawns[7] = gg_rct_Frontrank_4b
udg_region_Reinforcements[0] = gg_rct_Reinforcements_1a
udg_region_Reinforcements[1] = gg_rct_Reinforcements_1b
udg_region_Reinforcements[2] = gg_rct_Reinforcements_2a
udg_region_Reinforcements[3] = gg_rct_Reinforcements_2b
udg_region_Reinforcements[4] = gg_rct_Reinforcements_3a
udg_region_Reinforcements[5] = gg_rct_Reinforcements_3b
udg_region_Reinforcements[6] = gg_rct_Reinforcements_4a
udg_region_Reinforcements[7] = gg_rct_Reinforcements_4b
udg_PlayerLocationArray[0] = gg_rct_Red
udg_PlayerLocationArray[1] = gg_rct_Blue
udg_PlayerLocationArray[2] = gg_rct_Teal
udg_PlayerLocationArray[3] = gg_rct_Purple
udg_PlayerLocationArray[4] = gg_rct_Yellow
udg_PlayerLocationArray[5] = gg_rct_Orange
udg_PlayerLocationArray[6] = gg_rct_Green
udg_PlayerLocationArray[7] = gg_rct_Pink
FogMaskEnableOff()
FogEnableOff()
udg_int_RoundGold[1] = 1000
udg_int_RoundGold[2] = 400
udg_int_RoundGold[3] = 400
udg_int_RoundGold[4] = 600
udg_int_RoundGold[5] = 600
udg_int_RoundGold[6] = 600
udg_int_RoundGold[7] = 600
udg_int_RoundGold[8] = 600
udg_int_RoundGold[9] = 1200
udg_int_RoundGold[10] = 0
end

function InitTrig_Misc_init()
gg_trg_Misc_init = CreateTrigger()
TriggerAddAction(gg_trg_Misc_init, Trig_Misc_init_Actions)
end

function Trig_Create_Shuffled_Array_Actions()
local a = 0
local b = 0
local c = 0
local d = 0
while true do
if (a == 8) then break end
udg_int_playersShuffled[a] = J88_int(-1)
a = J88_int(a + 1)
end
a = 0
while true do
if (a == 8) then break end
b = GetRandomInt(1, 8)
c = 0
while true do
if (c == 8) then break end
d = ModuloInteger(J88_int(b + c), 8)
if (udg_int_playersShuffled[d] == J88_int(-1)) then
udg_int_playersShuffled[d] = a
if (1 == 1) then break end
end
c = J88_int(c + 1)
end
a = J88_int(a + 1)
end
end

function BLEYHR()
local a = 0
local b = 0
local c = 0
local d = 0
while true do
if (a == 8) then break end
b = GetRandomInt(1, 8)
c = 0
while true do
if (c == 8) then break end
d = ModuloInteger(J88_int(b + c), 8)
if (udg_int_playersShuffled[d] == J88_int(-1)) then
udg_int_playersShuffled[d] = a
if (1 == 1) then break end
end
c = J88_int(c + 1)
end
a = J88_int(a + 1)
end
end

function InitTrig_Create_Shuffled_Array()
gg_trg_Create_Shuffled_Array = CreateTrigger()
TriggerAddAction(gg_trg_Create_Shuffled_Array, Trig_Create_Shuffled_Array_Actions)
end

function GermanRoutes_UpdateAvailability()
    local pid = 0
    local level = 0
    if (udg_int_CurVsRound >= 2) then
        level = 1
    end
    while true do
        if (pid >= 8) then break end
        --  Visible from Round 1, with an explicit Round 2 technology prerequisite.
        SetPlayerTechMaxAllowed(Player(pid), 1747993682, J88_int(-1))
        SetPlayerTechMaxAllowed(Player(pid), 1747993683, J88_int(-1))
        SetPlayerTechMaxAllowed(Player(pid), 1747993684, J88_int(-1))
        SetPlayerTechMaxAllowed(Player(pid), 1750217010, 1)
        if GermanRoutes_RommelChosen[pid] then
            SetPlayerTechMaxAllowed(Player(pid), 1747989058, 0)
        end
        SetPlayerTechResearched(Player(pid), 1380397362, level)
        pid = J88_int(pid + 1)
    end
end

function Trig_StartGame_Func007A()
end

function Trig_StartGame_Actions()
DisplayTextToForce(GetPlayersAll(), "TRIGSTR_277")
PolledWait(4.0)
PauseUnitBJ(true, gg_unit_e000_0017)
CreateTimerDialogBJ(udg_timer_PreRoundCount, "TRIGSTR_148")
udg_timerwindow_PreRoundTimer = GetLastCreatedTimerDialogBJ()
bj_forLoopAIndex = 0
bj_forLoopAIndexEnd = 7
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
ForceAddPlayer(udg_AllPlayers, Player(bj_forLoopAIndex))
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
ForForce(udg_AllPlayers, Trig_StartGame_Func007A)
ConditionalTriggerExecute(gg_trg_Start_PreRound)
end

function InitTrig_StartGame()
Yamato_UpdateAvailability()
gg_trg_StartGame = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_StartGame, 0.009999999776482582)
TriggerAddAction(gg_trg_StartGame, Trig_StartGame_Actions)
end

function Trig_Start_PreRound_Func006Func001Func001A()
local origin = GetUnitLoc(GetEnumUnit())
AddSpecialEffectLocBJ(origin, "Doodads\\Cinematic\\TownBurningFireEmitter\\TownBurningFireEmitter.mdl")
RemoveLocation(origin)
origin = nil
SelectUnitForPlayerSingle(GetEnumUnit(), GetOwningPlayer(GetEnumUnit()))
end

function Trig_Start_PreRound_Func006Func001Func002A()
SetPlayerTechResearchedSwap(1378889776, 1, GetEnumPlayer())
end

function Trig_Start_PreRound_Func006Func001C()
do return RoundSchedule_IsFinalRound(udg_int_CurRound) end
end

function Trig_Start_PreRound_Func006Func005A()
DisplayTextToForce(bj_FORCE_PLAYER[GetPlayerId(GetEnumPlayer())], J88_concat("In this round your opponent will be ", GetPlayerName(Player(udg_int_Opponent[GetPlayerId(GetEnumPlayer())]))))
end

function Trig_Start_PreRound_Func006Func007C()
do return (RoundSchedule_IsBonusRound(udg_int_CurRound) or RoundSchedule_IsFinalRound(udg_int_CurRound)) end
end

function Trig_Start_PreRound_Func006C()
if (not Trig_Start_PreRound_Func006Func007C()) then
do return false end
end
do return true end
end

function Trig_Start_PreRound_Func007Func002A()
AdjustPlayerStateBJ(udg_int_RoundGold[udg_int_CurRound], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
end

function Trig_Start_PreRound_Func007Func004C()
if (not (udg_int_CurRound == 1)) then
do return false end
end
do return true end
end

function Trig_Start_PreRound_Func007C()
do return RoundSchedule_IsFinalRound(udg_int_CurRound) end
end

function Trig_Start_PreRound_Func009A()
local target = GetPlayerStartLocationLoc(GetEnumPlayer())
PanCameraToTimedLocForPlayer(GetEnumPlayer(), target, 1.0)
RemoveLocation(target)
target = nil
end

function Trig_Start_PreRound_Actions()
local preparationTime = udg_config_real_PreRoundTime
CavalryCharge_Stop()
Yamato_Stop()
udg_int_CurRound = J88_int(udg_int_CurRound + 1)
if (udg_int_CurRound == 1) then
preparationTime = 75.0
end
udg_PreventOrder = false
PlaySoundBJ(gg_snd_ArrangedTeamInvitation)
CURRENT_SCOREBOARD = CreatePreRoundScoreboard()
if Trig_Start_PreRound_Func006C() then
if Trig_Start_PreRound_Func006Func001C() then
ForGroupBJ(GetUnitsOfTypeIdAll(1747988568), Trig_Start_PreRound_Func006Func001Func001A)
ForForce(udg_AllPlayers, Trig_Start_PreRound_Func006Func001Func002A)
DisplayTextToForce(GetPlayersAll(), "TRIGSTR_167")
else
udg_int_CurBonusRound = J88_int(udg_int_CurBonusRound + 1)
DisplayTextToForce(GetPlayersAll(), J88_concat("Get ready for |cffffcc00BONUS ROUND|r //", J88_concat(I2S(udg_int_CurBonusRound), J88_concat(J88_concat(J88_concat(" of ", I2S(RoundSchedule_BonusRounds)), ", starting in "), J88_concat(I2S(R2I(preparationTime)), " seconds.")))))
end
else
udg_int_CurVsRound = J88_int(udg_int_CurVsRound + 1)
DisplayTextToForce(GetPlayersAll(), J88_concat("Get ready for round ", J88_concat(I2S(udg_int_CurVsRound), J88_concat(J88_concat(J88_concat(" of ", I2S(RoundSchedule_NormalRounds)), ", starting in "), J88_concat(I2S(R2I(preparationTime)), " seconds.")))))
SetOpponents(udg_int_CurVsRound)
ForForce(udg_AllPlayers, Trig_Start_PreRound_Func006Func005A)
DisplayTextToForce(GetPlayersAll(), "TRIGSTR_131")
end
if Trig_Start_PreRound_Func007C() then
StartTimerBJ(udg_timer_PreRoundCount, false, J88_real(udg_config_real_PreRoundTime * 2.0))
else
DisplayTextToForce(GetPlayersAll(), J88_concat("|cffffcc00", J88_concat(I2S(udg_int_RoundGold[udg_int_CurRound]), "|r gold received.")))
ForForce(udg_AllPlayers, Trig_Start_PreRound_Func007Func002A)
PlaySoundBJ(gg_snd_ReceiveGold)
StartTimerBJ(udg_timer_PreRoundCount, false, preparationTime)
end
TimerDialogDisplayBJ(true, udg_timerwindow_PreRoundTimer)
ForForce(udg_AllPlayers, Trig_Start_PreRound_Func009A)
GermanRoutes_UpdateAvailability()
Yamato_UpdateAvailability()
ExecuteFunc("NewAI_OnPrepare")
end

function InitTrig_Start_PreRound()
gg_trg_Start_PreRound = CreateTrigger()
TriggerAddAction(gg_trg_Start_PreRound, Trig_Start_PreRound_Actions)
end

function Trig_PreRoundExpire_Func004Func001Func005A()
PauseUnitBJ(true, GetEnumUnit())
end

function Trig_PreRoundExpire_Func004Func001C()
do return RoundSchedule_IsFinalRound(udg_int_CurRound) end
end

function Trig_PreRoundExpire_Func004Func004C()
do return RoundSchedule_IsBonusRound(udg_int_CurRound) end
end

function Trig_PreRoundExpire_Func004C()
if (not Trig_PreRoundExpire_Func004Func004C()) then
do return false end
end
do return true end
end

function Trig_PreRoundExpire_Actions()
ExecuteFunc("NewAI_OnBattle")
Score63_DestroyCurrent()
TimerDialogDisplayBJ(false, udg_timerwindow_PreRoundTimer)
udg_PreventOrder = true
if Trig_PreRoundExpire_Func004C() then
DisplayTextToForce(GetPlayersAll(), "TRIGSTR_133")
ConditionalTriggerExecute(gg_trg_DoBonusRound)
else
if Trig_PreRoundExpire_Func004Func001C() then
ConditionalTriggerExecute(gg_trg_DoFinalTournament)
else
DisplayTextToForce(GetPlayersAll(), J88_concat("Get ready for round ", J88_concat(I2S(udg_int_CurVsRound), "!")))
StartVsRound(udg_int_CurVsRound)
udg_PreventOrder = false
ForGroup(udg_group_AllSpawnedUnits, Trig_PreRoundExpire_Func004Func001Func005A)
udg_PreventOrder = true
CountdownTick(6, 1.0, "CountdownAttackMidHandler")
end
end
end

function InitTrig_PreRoundExpire()
gg_trg_PreRoundExpire = CreateTrigger()
TriggerRegisterTimerExpireEventBJ(gg_trg_PreRoundExpire, udg_timer_PreRoundCount)
TriggerAddAction(gg_trg_PreRoundExpire, Trig_PreRoundExpire_Actions)
end

function Trig_PlayerUnitDies_Conditions()
local pid = GetPlayerId(GetOwningPlayer(GetDyingUnit()))
do return (((pid >= 9) and (pid <= 16)) and (not udg_bool_WaitingForSacrificeEnd)) end
end

function PUD_CheckSamePlayer()
local bot = GetPlayerId(GetOwningPlayer(GetEnumUnit()))
if (Player(J88_int(bot - 9)) ~= PUD_ENUM_PLAYER) then
PUD_ENUM_RESULT = false
end
end

function Round012_ClearSurvivors()
local candidates = CreateGroup()
local survivors = CreateGroup()
local u = nil
local pid = 0
local remaining_bonus = 0
local artillery_enabled = IsTriggerEnabled(gg_trg_Artillery_Continue_Normal)
if udg_bool_WaitingForSacrificeEnd then
DestroyGroup(candidates)
DestroyGroup(survivors)
candidates = nil
survivors = nil
do return end
end
udg_bool_WaitingForSacrificeEnd = true
CavalryCharge_Stop()
Yamato_Stop()
DisableTrigger(gg_trg_PlayerUnitDies)
DisableTrigger(gg_trg_Artillery_Continue_Normal)
PauseUnit(gg_unit_e000_0017, true)
--  Only the eight clone owners are used here. Purchase/base owners are 0..7.
--  Hidden reserves and summoned combat units also belong to these clone owners.
while true do
if (pid == 8) then break end
SPAWN_UNITS_COUNT[pid] = 0
GroupEnumUnitsOfPlayer(candidates, Player(J88_int(pid + 9)), nil)
while true do
u = FirstOfGroup(candidates)
if (u == nil) then break end
GroupRemoveUnit(candidates, u)
if IsUnitAliveBJ(u) then
PauseUnit(u, true)
GroupAddUnit(survivors, u)
--  Locust spell dummies must be removed, but are not surviving army value.
if ((ROUND_WINNER == Player(pid)) and (GetUnitAbilityLevel(u, 1097625443) == 0)) then
remaining_bonus = J88_int(remaining_bonus + Bounty_Value(u))
end
end
end
pid = J88_int(pid + 1)
end
--  Freeze the payout before deaths can affect another survivor. No sleeps/timers.
AddBonus(remaining_bonus)
while true do
u = FirstOfGroup(survivors)
if (u == nil) then break end
GroupRemoveUnit(survivors, u)
GroupRemoveUnit(udg_group_AllSpawnedUnits, u)
KillUnit(u)
end
GroupClear(udg_group_AllSpawnedUnits)
if artillery_enabled then
EnableTrigger(gg_trg_Artillery_Continue_Normal)
end
DestroyGroup(candidates)
DestroyGroup(survivors)
candidates = nil
survivors = nil
u = nil
TriggerExecute(gg_trg_EndRound)
end

function Trig_PlayerUnitDies_Actions()
local u = GetDyingUnit()
local pid = J88_int(GetPlayerId(GetOwningPlayer(u)) - 9)
local killer = Naval_KillerPlayer(GetKillingUnit())
local site = PLAYER_CURRENT_SITE[pid]
local r = GetNextByPriority(pid)
China_TryRecruit(u, GetKillingUnit())
GroupRemoveUnit(udg_group_AllSpawnedUnits, u)
if (((GetUnitAbilityLevel(u, 1093677105) > 0) and (killer >= 0)) and (killer < 8)) then
KILL_POINTS[killer] = J88_int(KILL_POINTS[killer] + Bounty_Value(u))
if (KILL_POINT_ITEM[killer] ~= nil) then
MultiboardSetItemValue(KILL_POINT_ITEM[killer], I2S(KILL_POINTS[killer]))
end
end
if (killer == 12) then
AddBonus(Bounty_Value(u))
end
if (r ~= nil) then
ShowUnit(r, true)
SetUnitX(r, GetRectCenterX(udg_region_Reinforcements[site]))
SetUnitY(r, GetRectCenterY(udg_region_Reinforcements[site]))
Battle77_InitialOrder(r)
do return end
end
if (not Combat45_EndPending) then
Combat45_EndPending = true
TimerStart(Combat45_EndTimer, 0.0, false, Combat45_CheckEnd)
end
u = nil
r = nil
end

function InitTrig_PlayerUnitDies()
gg_trg_PlayerUnitDies = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_PlayerUnitDies, EVENT_PLAYER_UNIT_DEATH)
TriggerAddCondition(gg_trg_PlayerUnitDies, Condition(Trig_PlayerUnitDies_Conditions))
TriggerAddAction(gg_trg_PlayerUnitDies, Trig_PlayerUnitDies_Actions)
DisableTrigger(gg_trg_PlayerUnitDies)
Combat45_Init()
end

function Trig_EndRound_Actions()
local i = 0
local total_bonus = 0
local s = nil
local round_bonus = 0
local mao_bonus = 0
DisableTrigger(gg_trg_PlayerUnitDies)
Print(J88_concat(J88_concat("Round ", I2S(udg_int_CurVsRound)), " completed!"))
if (ROUND_WINNER ~= nil) then
s = J88_concat(J88_concat(J88_concat(GetColorPlayerName(ROUND_WINNER), " received |cffff0000"), I2S(BONUS_AMOUNT)), "|r blood points for his remaining units")
if (udg_int_CurVsRound < 4) then
round_bonus = J88_int(500 - J88_int(udg_int_CurVsRound * 100))
s = J88_concat(J88_concat(J88_concat(s, " and |cffff0000"), I2S(round_bonus)), "|r extra for winning the round")
end
Print(J88_concat(s, "!"))
end
PolledWait(1.5)
while true do
if (i == 8) then break end
s = J88_concat(J88_concat(J88_concat(J88_concat("|cffff0000Blood points|r earned: |cffff0000", I2S(ARMY_POINTS[i])), "|r Army Points + |cffff0000"), I2S(KILL_POINTS[i])), "|r Kill Points")
total_bonus = J88_int(ARMY_POINTS[i] + KILL_POINTS[i])
if (ROUND_WINNER == Player(i)) then
s = J88_concat(J88_concat(J88_concat(s, " + |cffff0000"), I2S(BONUS_AMOUNT)), "|r Bonus Points")
total_bonus = J88_int(total_bonus + BONUS_AMOUNT)
if (udg_int_CurVsRound < 4) then
total_bonus = J88_int(total_bonus + round_bonus)
s = J88_concat(J88_concat(J88_concat(s, " + |cffff0000"), I2S(round_bonus)), "|r Early Round Winner Bonus")
end
end
mao_bonus = J88_int(Mao_BattleReward(i, total_bonus) - total_bonus)
if (mao_bonus > 0) then
s = J88_concat(J88_concat(J88_concat(s, " + |cffff0000"), I2S(mao_bonus)), "|r Chairman Mao Bonus")
end
total_bonus = J88_int(total_bonus + mao_bonus)
s = J88_concat(J88_concat(J88_concat(s, " = |cffff0000"), I2S(total_bonus)), "|r Points!")
DisplayTextToForce(bj_FORCE_PLAYER[i], s)
AdjustPlayerStateBJ(total_bonus, Player(i), PLAYER_STATE_RESOURCE_LUMBER)
KILL_POINTS[i] = 0
i = J88_int(i + 1)
end
LS103_RoundEnd()
PolledWait(3.0)
Perf_CombatForGroupAndDestroy(GetUnitsInRectAll(udg_region_EntireMap), EndRoundCleanUnits)
udg_PreventOrder = false
PauseUnit(gg_unit_e000_0017, true)
DestroyBonusDisplay()
Score63_DestroyCurrent()
CURRENT_SCOREBOARD = nil
TriggerExecute(gg_trg_Start_PreRound)
end

function InitTrig_EndRound()
gg_trg_EndRound = CreateTrigger()
TriggerAddAction(gg_trg_EndRound, Trig_EndRound_Actions)
end

function Trig_Unstuck_Order_Actions()
Advance_RequestUnit = GetEnumUnit()
ExecuteFunc("Advance_Manual")
Advance_RequestUnit = nil
end

function Trig_Periodic_Unstuck_Copy_Actions()
ForGroup(udg_StuckUnits, Trig_Unstuck_Order_Actions)
end

function InitTrig_Periodic_Unstuck_Copy()
gg_trg_Periodic_Unstuck_Copy = CreateTrigger()
TriggerRegisterTimerEventPeriodic(gg_trg_Periodic_Unstuck_Copy, 1.0)
TriggerAddAction(gg_trg_Periodic_Unstuck_Copy, Trig_Periodic_Unstuck_Copy_Actions)
end

function FirstBonusReward_Award()
    local pid = 0
    if ((FirstBonusReward_Paid or (not RoundSchedule_IsBonusRound(udg_int_CurRound))) or (udg_int_CurBonusRound ~= 1)) then
        do return end
    end
    --  Mark before crediting resources so repeated callbacks cannot pay twice.
    FirstBonusReward_Paid = true
    while true do
        if (pid >= 8) then break end
        if IsPlayerInForce(Player(pid), udg_AllPlayers) then
            AdjustPlayerStateBJ(3000, Player(pid), PLAYER_STATE_RESOURCE_LUMBER)
        end
        pid = J88_int(pid + 1)
    end
    DisplayTextToForce(udg_AllPlayers, "All participating players received |cffff00003000|r bonus Blood Points.")
end

function Bonus94_BloodPoints(amount)
    --  Bonus points above 15000 convert to Blood Points at 20%.
    if (amount <= 15000) then
        do return amount end
    end
    do return J88_int(15000 + J88_div(J88_int(amount - 15000), 5)) end
end

function Trig_DoBonusRound_Actions()
local i = 0
local reward = 0
local bonustype = GetRandomInt(1, 1)
local p = nil
local BonusSetup = nil
local BonusCleanup = "BonusCleanupDefault"
EnableTrigger(BONUS_ON_DEATH_TRG)
RandomPlayerOrder()
BonusUnitDiesCb = ""
if (bonustype == 1) then
Print("|cffff0000Bonus Slaughter!|r Kill the tenticles for |cff00ff00bonus points|r!!")
Print("Bonus points above |cffffcc0015000|r are worth |cffffcc0020%|r of their Blood Point value.")
BonusSetup = "SetupPeasantSlaughter"
BonusUnitDiesCb = "BonusUnitAwardPoint"
CURRENT_SCOREBOARD = CreateBonusScoreboard("Bonus Slaughter")
else
Print("Internal error picking bonus game")
do return end
end
while true do
if (i == 8) then break end
udg_PreventOrder = false
p = Player(RANDOM_PLAYER_ORDER[i])
BonusCurrentPlayer = p
BonusPlayerDefeated = false
BONUS_AMOUNT = 0
if (i == 0) then
Print(J88_concat("First player to attempt the bonus challenge is ", GetColorPlayerName(p)))
else
Print(J88_concat("Next player to attempt the bonus challenge is ", GetColorPlayerName(p)))
end
PanCameraToTimed(0.0, 0.0, 0.5)
CavalryCharge_Stop()
Yamato_Stop()
if (BonusPlayerUnits ~= nil) then
DestroyGroup(BonusPlayerUnits)
BonusPlayerUnits = nil
end
BonusPlayerUnits = CenterSpawn(p, 0)
PolledWait(2.0)
ForGroup(BonusPlayerUnits, AttackEnum)
ExecuteFunc(BonusSetup)
CavalryCharge_Begin(2)
udg_PreventOrder = true
while true do
if BonusPlayerDefeated then break end
TriggerSleepAction(0.10000000149011612)
end
reward = Mao_BattleReward(GetPlayerId(p), Bonus94_BloodPoints(BONUS_AMOUNT))
Print(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(GetColorPlayerName(p), " scored |cffff0000"), I2S(BONUS_AMOUNT)), "|r bonus points and received |cffff0000"), I2S(reward)), "|r Blood Points!"))
AdjustPlayerStateBJ(reward, p, PLAYER_STATE_RESOURCE_LUMBER)
PolledWait(2.0)
CavalryCharge_Stop()
Yamato_Stop()
ExecuteFunc(BonusCleanup)
DestroyBonusDisplay()
i = J88_int(i + 1)
end
DisableTrigger(BONUS_ON_DEATH_TRG)
FirstBonusReward_Award()
Score63_DestroyCurrent()
CURRENT_SCOREBOARD = nil
TriggerExecute(gg_trg_Start_PreRound)
end

function BonusUnitAwardPoint()
if (GetPlayerId(GetOwningPlayer(GetDyingUnit())) == 18) then
AddBonus(Naval_BonusPoints(GetDyingUnit()))
if (KILL_POINT_ITEM[GetPlayerId(BonusCurrentPlayer)] ~= nil) then
MultiboardSetItemValue(KILL_POINT_ITEM[GetPlayerId(BonusCurrentPlayer)], I2S(BONUS_AMOUNT))
end
end
end

function Trig_BonusPlayerUnitDies_Actions()
China_TryRecruit(GetDyingUnit(), GetKillingUnit())
if (BonusUnitDiesCb ~= "") then
ExecuteFunc(BonusUnitDiesCb)
end
GroupRemoveUnit(BonusPlayerUnits, GetDyingUnit())
if (FirstOfGroup(BonusPlayerUnits) == nil) then
BonusPlayerDefeated = true
end
end

function InitTrig_DoBonusRound()
gg_trg_DoBonusRound = CreateTrigger()
TriggerAddAction(gg_trg_DoBonusRound, Trig_DoBonusRound_Actions)
BONUS_ON_DEATH_TRG = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(BONUS_ON_DEATH_TRG, EVENT_PLAYER_UNIT_DEATH)
TriggerAddAction(BONUS_ON_DEATH_TRG, Trig_BonusPlayerUnitDies_Actions)
DisableTrigger(BONUS_ON_DEATH_TRG)
end

function Trig_DoFinalTournament_Actions()
local i = 0
SetupFinalTournament()
CURRENT_SCOREBOARD = CreateTournamentScoreboard("Quarter Finals", 8, 0)
while true do
if (i == 8) then break end
PF73_Stage = 1
DoFinalTournamentRound(J88_concat("Quarter Finals, Round ", I2S(J88_int(1 + J88_div(i, 2)))), FINAL_TOUR_ORDER[i], FINAL_TOUR_ORDER[J88_int(i + 1)])
if (i == 0) then
FINAL_TOUR_ORDER[10] = FINAL_TOUR_ROUND_WINNER
elseif (i == 2) then
FINAL_TOUR_ORDER[11] = FINAL_TOUR_ROUND_WINNER
elseif (i == 4) then
FINAL_TOUR_ORDER[12] = FINAL_TOUR_ROUND_WINNER
else
FINAL_TOUR_ORDER[13] = FINAL_TOUR_ROUND_WINNER
end
i = J88_int(i + 2)
end
i = 0
Score63_DestroyCurrent()
CURRENT_SCOREBOARD = CreateTournamentScoreboard("Semi Finals", 4, 10)
Print("Get ready for the Semi Finals!")
PlaySoundBJ(gg_snd_QuestLog)
PolledWait(3.0)
while true do
if (i == 4) then break end
PF73_Stage = 2
DoFinalTournamentRound(J88_concat("Semi Finals, Round ", I2S(J88_int(1 + J88_div(i, 2)))), FINAL_TOUR_ORDER[J88_int(10 + i)], FINAL_TOUR_ORDER[J88_int(J88_int(10 + i) + 1)])
FINAL_TOUR_ORDER[J88_int(100 + J88_div(i, 2))] = FINAL_TOUR_ROUND_WINNER
i = J88_int(i + 2)
end
Score63_DestroyCurrent()
CURRENT_SCOREBOARD = CreateTournamentScoreboard("Final Match", 2, 100)
Print("|cffffcc00FINAL ROUND!")
PlaySoundBJ(gg_snd_LightningBolt1)
PlaySoundBJ(gg_snd_QuestLog)
PolledWait(3.0)
PF73_Stage = 3
DoFinalTournamentRound("Final Match", FINAL_TOUR_ORDER[100], FINAL_TOUR_ORDER[101])
Print(J88_concat(GetColorPlayerName(Player(FINAL_TOUR_ROUND_WINNER)), " is the |cffff0000World War 2 Blood Tournament Champion|r"))
PolledWait(10.0)
Print("Thank you for playing |cffff0000World War 2 Blood Tournament|r.")
end

function FinalTourOnDeath()
local u = GetDyingUnit()
local i = 0
China_TryRecruit(u, GetKillingUnit())
while true do
if (i == 2) then break end
if IsUnitInGroup(u, FINAL_TOUR_SPAWNS[i]) then
GroupRemoveUnit(FINAL_TOUR_SPAWNS[i], u)
end
i = J88_int(i + 1)
end
udg_bool_InFinalRound = false
end

function InitTrig_DoFinalTournament()
gg_trg_DoFinalTournament = CreateTrigger()
TriggerAddAction(gg_trg_DoFinalTournament, Trig_DoFinalTournament_Actions)
FINAL_TOUR_ON_DEATH_TRG = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(FINAL_TOUR_ON_DEATH_TRG, EVENT_PLAYER_UNIT_DEATH)
TriggerAddAction(FINAL_TOUR_ON_DEATH_TRG, FinalTourOnDeath)
DisableTrigger(FINAL_TOUR_ON_DEATH_TRG)
end

function Trig_Random_Conditions()
if (not (GetUnitTypeId(GetTriggerUnit()) == 1747993925)) then
do return false end
end
do return true end
end

function Trig_Random_Actions()
ExecuteFunc("NewAI_ResolveRandom")
end

function InitTrig_Random()
gg_trg_Random = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Random, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_Random, Condition(Trig_Random_Conditions))
TriggerAddAction(gg_trg_Random, Trig_Random_Actions)
end

function GermanRoutes_CurrentGold(t)
    if (t == 1747989571) then
        do return 0 end
    elseif (t == 1747989572) then
        do return 0 end
    elseif (t == 1747990321) then
        do return 0 end
    elseif (t == 1747990322) then
        do return 0 end
    elseif (t == 1747990324) then
        do return 0 end
    elseif (t == 1747990105) then
        do return 0 end
    elseif (t == 1747990320) then
        do return 0 end
    elseif (t == 1747990323) then
        do return 0 end
    elseif (t == 1747990100) then
        do return 0 end
    elseif (t == 1747990351) then
        do return 0 end
    elseif (t == 1747993679) then
        do return 0 end
    elseif (t == 1747993680) then
        do return 0 end
    elseif (t == 1747993681) then
        do return 0 end
    elseif (t == 1750217012) then
        do return 0 end
    elseif (t == 1750348354) then
        do return 0 end
    elseif (t == 1747993923) then
        do return 0 end
    elseif (t == 1747993924) then
        do return 0 end
    end
    do return 0 end
end

function GermanRoutes_CurrentBP(t)
    if (t == 1747989571) then
        do return 1000 end
    elseif (t == 1747989572) then
        do return 1500 end
    elseif (t == 1747990321) then
        do return 500 end
    elseif (t == 1747990322) then
        do return 500 end
    elseif (t == 1747990324) then
        do return 1500 end
    elseif (t == 1747990105) then
        do return 1000 end
    elseif (t == 1747990320) then
        do return 5500 end
    elseif (t == 1747990323) then
        do return 2500 end
    elseif (t == 1747990100) then
        do return 15000 end
    elseif (t == 1747990351) then
        do return 5000 end
    elseif (t == 1747993679) then
        do return 1000 end
    elseif (t == 1747993680) then
        do return 0 end
    elseif (t == 1747993681) then
        do return 2500 end
    elseif (t == 1750217012) then
        do return 1500 end
    elseif (t == 1750348354) then
        do return 5000 end
    elseif (t == 1747993923) then
        do return 15000 end
    elseif (t == 1747993924) then
        do return 20000 end
    end
    do return 0 end
end

function GermanRoutes_TotalGold(t)
    if (t == 1747989571) then
        do return 0 end
    elseif (t == 1747989572) then
        do return 0 end
    elseif (t == 1747990321) then
        do return 0 end
    elseif (t == 1747990322) then
        do return 0 end
    elseif (t == 1747990324) then
        do return 0 end
    elseif (t == 1747990105) then
        do return 0 end
    elseif (t == 1747990320) then
        do return 0 end
    elseif (t == 1747990323) then
        do return 0 end
    elseif (t == 1747990100) then
        do return 0 end
    elseif (t == 1747990351) then
        do return 0 end
    elseif (t == 1747993679) then
        do return 0 end
    elseif (t == 1747993680) then
        do return 0 end
    elseif (t == 1747993681) then
        do return 0 end
    elseif (t == 1750217012) then
        do return 0 end
    elseif (t == 1750348354) then
        do return 0 end
    elseif (t == 1747993923) then
        do return 0 end
    elseif (t == 1747993924) then
        do return 0 end
    end
    do return 0 end
end

function GermanRoutes_TotalBP(t)
    if (t == 1747989571) then
        do return 1000 end
    elseif (t == 1747989572) then
        do return 1500 end
    elseif (t == 1747990321) then
        do return 2000 end
    elseif (t == 1747990322) then
        do return 2500 end
    elseif (t == 1747990324) then
        do return 4000 end
    elseif (t == 1747990105) then
        do return 2500 end
    elseif (t == 1747990320) then
        do return 8000 end
    elseif (t == 1747990323) then
        do return 4000 end
    elseif (t == 1747990100) then
        do return 15000 end
    elseif (t == 1747990351) then
        do return 20000 end
    elseif (t == 1747993679) then
        do return 1000 end
    elseif (t == 1747993680) then
        do return 1500 end
    elseif (t == 1747993681) then
        do return 4000 end
    elseif (t == 1750217012) then
        do return 1500 end
    elseif (t == 1750348354) then
        do return 9000 end
    elseif (t == 1747993923) then
        do return 15000 end
    elseif (t == 1747993924) then
        do return 20000 end
    end
    do return 0 end
end

function GermanRoutes_IsTank(t)
    do return (((((((((((((((((t == 1747989571) or (t == 1747989572)) or (t == 1747990321)) or (t == 1747990322)) or (t == 1747990324)) or (t == 1747990105)) or (t == 1747990320)) or (t == 1747990323)) or (t == 1747990100)) or (t == 1747990351)) or (t == 1747993679)) or (t == 1747993680)) or (t == 1747993681)) or (t == 1750217012)) or (t == 1750348354)) or (t == 1747993923)) or (t == 1747993924)) end
end

function GermanRoutes_IsTankUpgrade(source, target)
    if (source == 1747989571) then
        do return (target == 1747993679) end
    elseif (source == 1747989572) then
        do return ((((target == 1747993680) or (target == 1747990321)) or (target == 1747990323)) or (target == 1747990105)) end
    elseif (source == 1747990321) then
        do return (target == 1747990322) end
    elseif (source == 1747990322) then
        do return (target == 1747990324) end
    elseif (source == 1747990105) then
        do return (target == 1747990320) end
    elseif (source == 1747990323) then
        do return (target == 1747993681) end
    elseif (source == 1747990100) then
        do return (target == 1747990351) end
    elseif (source == 1747993680) then
        do return (((target == 1747990321) or (target == 1747993681)) or (target == 1747990105)) end
    elseif (source == 1747993681) then
        do return (target == 1750348354) end
    elseif (source == 1750217012) then
        do return ((((target == 1747993680) or (target == 1747990321)) or (target == 1747993681)) or (target == 1747990105)) end
    end
    do return false end
end

function GermanRoutes_ForgetWorker(old, replacement)
    local pid = GetPlayerId(GetOwningPlayer(old))
    if (NewAI_Busy[pid] == old) then
        NewAI_Busy[pid] = nil
        NewAI_BusySince[pid] = 0
    end
    if (NewAI_BuildTargetActor[pid] == old) then
        NewAI_BuildTargetActor[pid] = replacement
        NewAI_BuildSpaceState[pid] = 0
    end
    if (NewAI_BestUnit == old) then
        NewAI_BestUnit = nil
        NewAI_BestType = 0
        NewAI_BestScore = J88_real(-1.0)
    end
    FlushChildHashtable(GermanRoutes_Pending, GetHandleId(old))
    RemoveUnit(old)
end

function GermanRoutes_ReconcileWorker(owner, anchor)
    local pid = GetPlayerId(owner)
    local candidates = nil
    local u = nil
    local worker = nil
    local old = nil
    local x = 0.0
    local y = 0.0
    if ((((pid < 0) or (pid >= 8)) or (not GermanRoutes_RommelChosen[pid])) or GermanRoutes_Reconciling[pid]) then
        do return end
    end
    GermanRoutes_Reconciling[pid] = true
    candidates = CreateGroup()
    GroupEnumUnitsOfPlayer(candidates, owner, nil)
    while true do
        u = FirstOfGroup(candidates)
        if (u == nil) then break end
        GroupRemoveUnit(candidates, u)
        if (GetWidgetLife(u) > 0.4050000011920929) then
            if ((GetUnitTypeId(u) == 1750217010) and (worker == nil)) then
                worker = u
            elseif ((GetUnitTypeId(u) == 1747989058) and (old == nil)) then
                old = u
            end
        end
    end
    if (worker == nil) then
        if (old ~= nil) then
            worker = CreateUnit(owner, 1750217010, GetUnitX(old), GetUnitY(old), GetUnitFacing(old))
            if (worker ~= nil) then
                SetUnitX(worker, GetUnitX(old))
                SetUnitY(worker, GetUnitY(old))
                SetUnitUserData(worker, GetUnitUserData(old))
                ShowUnit(worker, (not IsUnitHidden(old)))
                PauseUnit(worker, IsUnitPaused(old))
            end
        else
            x = GetStartLocationX(GetPlayerStartLocation(owner))
            y = GetStartLocationY(GetPlayerStartLocation(owner))
            if (anchor ~= nil) then
                x = GetUnitX(anchor)
                y = J88_real(GetUnitY(anchor) - 128.0)
            end
            worker = CreateUnit(owner, 1750217010, x, y, 270.0)
        end
    end
    --  Both rawcodes share one worker slot, including units finishing a queued train.
    if (worker ~= nil) then
        GroupEnumUnitsOfPlayer(candidates, owner, nil)
        while true do
            u = FirstOfGroup(candidates)
            if (u == nil) then break end
            GroupRemoveUnit(candidates, u)
            if (u ~= worker) then
                if ((GetUnitTypeId(u) == 1747989058) or (GetUnitTypeId(u) == 1750217010)) then
                    GermanRoutes_ForgetWorker(u, worker)
                end
            end
        end
    end
    SetPlayerTechMaxAllowed(owner, 1747989058, 0)
    SetPlayerTechMaxAllowed(owner, 1750217010, 1)
    DestroyGroup(candidates)
    GermanRoutes_Reconciling[pid] = false
    candidates = nil
    old = nil
    worker = nil
    u = nil
end

function GermanRoutes_RefundTank(u)
    local key = GetHandleId(u)
    local t = GetUnitTypeId(u)
    local gold = 0
    local bp = 0
    local owner = GetOwningPlayer(u)
    local pid = GetPlayerId(owner)
    if ((((((((u == nil) or (GetWidgetLife(u) <= 0.4050000011920929)) or (pid < 0)) or (pid >= 8)) or (not GermanRoutes_IsTank(t))) or (GetUnitAbilityLevel(u, 1093677106) == 0)) or (LoadInteger(GermanRoutes_Pending, key, 99) ~= 0)) or LoadBoolean(ArmyEconomy_Ledger, key, 99)) then
        owner = nil
        do return end
    end
    gold = ArmyEconomy_Gold(u)
    bp = ArmyEconomy_Wood(u)
    SaveInteger(GermanRoutes_Pending, key, 99, 1)
    SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
    if (NewAI_Busy[pid] == u) then
        NewAI_Busy[pid] = nil
        NewAI_BusySince[pid] = 0
    end
    --  Do not issue cancel or Unsummon: those natives have their own refund paths.
    RemoveUnit(u)
    SetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD) + gold))
    SetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER) + bp))
    FlushChildHashtable(GermanRoutes_Pending, key)
    FlushChildHashtable(ArmyEconomy_Ledger, key)
    SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
    owner = nil
end

function GermanRoutes_RefundExistingTanks(owner)
    local tanks = CreateGroup()
    local u = nil
    GroupEnumUnitsOfPlayer(tanks, owner, nil)
    while true do
        u = FirstOfGroup(tanks)
        if (u == nil) then break end
        GroupRemoveUnit(tanks, u)
        if (GetWidgetLife(u) > 0.4050000011920929) then
            GermanRoutes_RefundTank(u)
        end
    end
    DestroyGroup(tanks)
    tanks = nil
    u = nil
end

function GermanRoutes_VeteranType(t)
    if (t == 1747989058) then
        do return 1750217010 end
    elseif (t == 1747989571) then
        do return 1747993679 end
    elseif (t == 1747989572) then
        do return 1747993680 end
    elseif (t == 1747990323) then
        do return 1747993681 end
    elseif (t == 1747989579) then
        do return 1747993672 end
    elseif (t == 1747989580) then
        do return 1747993673 end
    elseif (t == 1747990097) then
        do return 1747993671 end
    end
    do return 0 end
end

function GermanRoutes_ReplaceInGroup(g, old, replacement)
    if ((g ~= nil) and IsUnitInGroup(old, g)) then
        GroupRemoveUnit(g, old)
        GroupAddUnit(g, replacement)
    end
end

function GermanRoutes_PreserveReferences(old, replacement)
    local pid = J88_int(GetPlayerId(GetOwningPlayer(old)) - 9)
    local i = 0
    GermanRoutes_ReplaceInGroup(udg_group_AllSpawnedUnits, old, replacement)
    GermanRoutes_ReplaceInGroup(SPAWN_G, old, replacement)
    GermanRoutes_ReplaceInGroup(BonusPlayerUnits, old, replacement)
    GermanRoutes_ReplaceInGroup(FINAL_TOUR_SPAWNS[0], old, replacement)
    GermanRoutes_ReplaceInGroup(FINAL_TOUR_SPAWNS[1], old, replacement)
    while true do
        if (i >= 8) then break end
        GermanRoutes_ReplaceInGroup(SPAWN_REINFORCEMENTS[i], old, replacement)
        i = J88_int(i + 1)
    end
    if ((pid >= 0) and (pid < 8)) then
        i = 0
        while true do
            if (i >= SPAWN_UNITS_COUNT[pid]) then break end
            if (SPAWN_UNITS_SORTED[J88_int(J88_int(pid * 1000) + i)] == old) then
                SPAWN_UNITS_SORTED[J88_int(J88_int(pid * 1000) + i)] = replacement
            end
            i = J88_int(i + 1)
        end
    end
    if (SPAWN_UNITS_SORT_UNIT == old) then
        SPAWN_UNITS_SORT_UNIT = replacement
    end
end

function GermanRoutes_ReplaceUnit(old, target)
    local owner = GetOwningPlayer(old)
    local x = GetUnitX(old)
    local y = GetUnitY(old)
    local life = J88_real(GetWidgetLife(old) / GetUnitState(old, UNIT_STATE_MAX_LIFE))
    local mana = 0.0
    local hidden = IsUnitHidden(old)
    local paused = IsUnitPaused(old)
    local replacement = nil
    if (GetUnitState(old, UNIT_STATE_MAX_MANA) > 0.0) then
        mana = J88_real(GetUnitState(old, UNIT_STATE_MANA) / GetUnitState(old, UNIT_STATE_MAX_MANA))
    end
    replacement = CreateUnit(owner, target, x, y, GetUnitFacing(old))
    if (replacement == nil) then
        owner = nil
        do return old end
    end
    SetUnitX(replacement, x)
    SetUnitY(replacement, y)
    SetUnitState(replacement, UNIT_STATE_LIFE, J88_real(GetUnitState(replacement, UNIT_STATE_MAX_LIFE) * life))
    SetUnitState(replacement, UNIT_STATE_MANA, J88_real(GetUnitState(replacement, UNIT_STATE_MAX_MANA) * mana))
    SetUnitUserData(replacement, GetUnitUserData(old))
    ArmyEconomy_Transfer(old, replacement, 0, 0)
    ShowUnit(replacement, (not hidden))
    PauseUnit(replacement, paused)
    GermanRoutes_PreserveReferences(old, replacement)
    FlushChildHashtable(GermanRoutes_Pending, GetHandleId(old))
    RemoveUnit(old)
    if (((GetUnitAbilityLevel(replacement, 1093677105) > 0) and (not paused)) and (not hidden)) then
        IssuePointOrder(replacement, "attack", 0.0, 0.0)
    end
    owner = nil
    do return replacement end
end

function GermanRoutes_ConvertOwnedUnit(u)
    local target = 0
    local replacement = nil
    if ((u == nil) or (GetWidgetLife(u) <= 0.4050000011920929)) then
        do return end
    end
    if (GetPlayerTechCount(GetOwningPlayer(u), 1378889783, true) < 1) then
        do return end
    end
    if (LoadInteger(GermanRoutes_Pending, GetHandleId(u), 0) > 0) then
        do return end
    end
    target = GermanRoutes_VeteranType(GetUnitTypeId(u))
    if (target ~= 0) then
        replacement = GermanRoutes_ReplaceUnit(u, target)
    end
    replacement = nil
end

function GermanRoutes_ConvertPlayer(owner)
    local candidates = CreateGroup()
    local u = nil
    GroupEnumUnitsOfPlayer(candidates, owner, nil)
    while true do
        u = FirstOfGroup(candidates)
        if (u == nil) then break end
        GroupRemoveUnit(candidates, u)
        GermanRoutes_ConvertOwnedUnit(u)
    end
    DestroyGroup(candidates)
    candidates = nil
    u = nil
end

function GermanRoutes_OnProduction()
    local eventKind = GetTriggerEventId()
    local u = GetTriggerUnit()
    local key = 0
    local source = 0
    local target = 0
    local pid = 0
    if (eventKind == EVENT_PLAYER_UNIT_TRAIN_FINISH) then
        u = GetTrainedUnit()
    end
    if (u == nil) then
        do return end
    end
    key = GetHandleId(u)
    source = GetUnitTypeId(u)
    pid = GetPlayerId(GetOwningPlayer(u))
    if (eventKind == EVENT_PLAYER_UNIT_ISSUED_ORDER) then
        if (GermanRoutes_IsTank(source) and (LoadInteger(GermanRoutes_Pending, key, 0) ~= 2)) then
            target = GetIssuedOrderId()
            if GermanRoutes_IsTankUpgrade(source, target) then
                --  An order is only a candidate; it is not evidence of payment.
                SaveInteger(GermanRoutes_Pending, key, 10, target)
                SaveInteger(GermanRoutes_Pending, key, 11, source)
            else
                RemoveSavedInteger(GermanRoutes_Pending, key, 10)
                RemoveSavedInteger(GermanRoutes_Pending, key, 11)
            end
        end
    elseif (eventKind == EVENT_PLAYER_UNIT_CONSTRUCT_START) then
        SaveInteger(GermanRoutes_Pending, key, 0, 1)
    elseif (eventKind == EVENT_PLAYER_UNIT_UPGRADE_START) then
        target = LoadInteger(GermanRoutes_Pending, key, 10)
        source = LoadInteger(GermanRoutes_Pending, key, 11)
        if (not GermanRoutes_IsTankUpgrade(source, target)) then
            source = GetUnitTypeId(u)
            target = GetUnitCurrentOrder(u)
        end
        if GermanRoutes_IsTankUpgrade(source, target) then
            --  Upgrade-start occurs after the incremental target cost is paid.
            SaveInteger(GermanRoutes_Pending, key, 20, J88_int(GermanRoutes_TotalGold(source) + GermanRoutes_CurrentGold(target)))
            SaveInteger(GermanRoutes_Pending, key, 21, J88_int(GermanRoutes_TotalBP(source) + GermanRoutes_CurrentBP(target)))
            SaveInteger(GermanRoutes_Pending, key, 0, 2)
        end
    else
        FlushChildHashtable(GermanRoutes_Pending, key)
        if ((((eventKind == EVENT_PLAYER_UNIT_TRAIN_FINISH) and (pid >= 0)) and (pid < 8)) and GermanRoutes_RommelChosen[pid]) then
            if ((source == 1747989058) or (source == 1750217010)) then
                GermanRoutes_ReconcileWorker(GetOwningPlayer(u), GetTriggerUnit())
            end
        end
    end
    u = nil
    eventKind = nil
end

function Trig_Erwin_Rommel_Conditions()
if (not (GetUnitTypeId(GetTriggerUnit()) == 1747993682)) then
do return false end
end
do return true end
end

function Trig_Erwin_Rommel_Func004A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Erwin_Rommel_Actions()
    local flag = GetTriggerUnit()
    local owner = GetOwningPlayer(flag)
    local pid = GetPlayerId(owner)
    local ss = nil
    if (not GermanRoutes_RommelChosen[pid]) then
        --  Only the route transition liquidates the base roster.
        GermanRoutes_RommelChosen[pid] = true
        SetPlayerTechResearched(owner, 1378889783, 1)
        SetPlayerTechResearched(Player(J88_int(pid + 9)), 1378889783, 1)
        SetPlayerUnitAvailableBJ(1747989556, false, owner)
        ss = GetUnitsOfPlayerAndTypeId(owner, 1747989556)
        ForGroup(ss, Trig_Erwin_Rommel_Func004A)
        DestroyGroup(ss)
        GermanRoutes_RefundExistingTanks(owner)
        GermanRoutes_ReconcileWorker(owner, flag)
        ExecuteFunc("NewAI_OnRommelReady")
    else
        GermanRoutes_ReconcileWorker(owner, flag)
    end
    ss = nil
    owner = nil
    flag = nil
end

function InitTrig_Erwin_Rommel()
gg_trg_Erwin_Rommel = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Erwin_Rommel, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_Erwin_Rommel, Condition(Trig_Erwin_Rommel_Conditions))
TriggerAddAction(gg_trg_Erwin_Rommel, Trig_Erwin_Rommel_Actions)
GermanRoutes_Pending = InitHashtable()
GermanRoutes_Production = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_CONSTRUCT_START)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_UPGRADE_START)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_TRAIN_FINISH)
TriggerRegisterAnyUnitEventBJ(GermanRoutes_Production, EVENT_PLAYER_UNIT_ISSUED_ORDER)
TriggerAddAction(GermanRoutes_Production, GermanRoutes_OnProduction)
end

function Trig_Heinrich_Himmler_Conditions()
if (not (GetUnitTypeId(GetTriggerUnit()) == 1747993683)) then
do return false end
end
do return true end
end

function Trig_Heinrich_Himmler_Func004A()
    local old = GetEnumUnit()
    local owner = GetOwningPlayer(old)
    local gold = ArmyEconomy_Gold(old)
    local wood = ArmyEconomy_Wood(old)
    local refund = IMinBJ(200, gold)
    local replacement = nil
    --  This replacement migrates the ledger before removing old. Blizzard's
    --  ReplaceUnitBJ kills a hidden old unit, whose death handler clears it.
    replacement = GermanRoutes_ReplaceUnit(old, 1747993685)
    if ((replacement ~= nil) and (replacement ~= old)) then
        ArmyEconomy_Set(replacement, J88_int(gold - refund), wood)
        SetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD) + refund))
    end
    old = nil
    owner = nil
    replacement = nil
end

function Trig_Heinrich_Himmler_Func005A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Heinrich_Himmler_Func006A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Heinrich_Himmler_Func007A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Heinrich_Himmler_Func008A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Heinrich_Himmler_Func009A()
ArmyEconomy_RefundAndRemove(GetEnumUnit())
end

function Trig_Heinrich_Himmler_Actions()
local members = nil
SetPlayerUnitAvailableBJ(1747989556, false, GetOwningPlayer(GetTriggerUnit()))
SetPlayerUnitAvailableBJ(1747989334, false, GetOwningPlayer(GetTriggerUnit()))
SetPlayerUnitAvailableBJ(1747993685, true, GetOwningPlayer(GetTriggerUnit()))
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989556)
ForGroup(members, Trig_Heinrich_Himmler_Func004A)
DestroyGroup(members)
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989334)
ForGroup(members, Trig_Heinrich_Himmler_Func005A)
DestroyGroup(members)
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989337)
ForGroup(members, Trig_Heinrich_Himmler_Func006A)
DestroyGroup(members)
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989336)
ForGroup(members, Trig_Heinrich_Himmler_Func007A)
DestroyGroup(members)
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989552)
ForGroup(members, Trig_Heinrich_Himmler_Func008A)
DestroyGroup(members)
members = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), 1747989335)
ForGroup(members, Trig_Heinrich_Himmler_Func009A)
DestroyGroup(members)
members = nil
end

function InitTrig_Heinrich_Himmler()
gg_trg_Heinrich_Himmler = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Heinrich_Himmler, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_Heinrich_Himmler, Condition(Trig_Heinrich_Himmler_Conditions))
TriggerAddAction(gg_trg_Heinrich_Himmler, Trig_Heinrich_Himmler_Actions)
end

function Trig_Yamamoto_and_Nimitz_Func001C()
if (GetUnitTypeId(GetTriggerUnit()) == 1747994195) then
do return true end
end
if (GetUnitTypeId(GetTriggerUnit()) == 1747994196) then
do return true end
end
if Carrier_IsCommander(GetTriggerUnit()) then
do return true end
end
do return false end
end

function Trig_Yamamoto_and_Nimitz_Conditions()
if (not Trig_Yamamoto_and_Nimitz_Func001C()) then
do return false end
end
do return true end
end

function Trig_Yamamoto_and_Nimitz_Actions()
if Carrier_IsCommander(GetTriggerUnit()) then
--  Refresh the runtime field after upgrading the zero-mana national flag.
BlzSetUnitRealField(GetTriggerUnit(), UNIT_RF_MANA_REGENERATION, 1.0)
end
SetUnitManaPercentBJ(GetTriggerUnit(), J88_real(100))
end

function InitTrig_Yamamoto_and_Nimitz()
gg_trg_Yamamoto_and_Nimitz = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Yamamoto_and_Nimitz, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_Yamamoto_and_Nimitz, Condition(Trig_Yamamoto_and_Nimitz_Conditions))
TriggerAddAction(gg_trg_Yamamoto_and_Nimitz, Trig_Yamamoto_and_Nimitz_Actions)
end

function Trig_Alan_Turing_Conditions()
if (not (GetUnitTypeId(GetTriggerUnit()) == 1747994445)) then
do return false end
end
do return true end
end

function Trig_Alan_Turing_Actions()
bj_forLoopAIndex = 1
bj_forLoopAIndexEnd = 8
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
SetPlayerAllianceStateBJ(ConvertedPlayer(GetForLoopIndexA()), GetOwningPlayer(GetTriggerUnit()), bj_ALLIANCE_NEUTRAL_VISION)
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
bj_forLoopAIndex = 9
bj_forLoopAIndexEnd = 20
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
SetPlayerAllianceStateBJ(ConvertedPlayer(GetForLoopIndexA()), GetOwningPlayer(GetTriggerUnit()), bj_ALLIANCE_UNALLIED_VISION)
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
end

function InitTrig_Alan_Turing()
gg_trg_Alan_Turing = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Alan_Turing, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_Alan_Turing, Condition(Trig_Alan_Turing_Conditions))
TriggerAddAction(gg_trg_Alan_Turing, Trig_Alan_Turing_Actions)
end

function Trig_Unstuck_Conditions()
if (not (GetSpellAbilityId() == 1093678410)) then
do return false end
end
do return true end
end

function Trig_Unstuck_Actions()
local target = GetSpellTargetUnit()
local pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
if ((((target ~= nil) and (pid >= 0)) and (pid < 8)) and (GetOwningPlayer(target) == Player(J88_int(pid + 9)))) then
GroupAddUnit(udg_StuckUnits, target)
Advance_RequestUnit = target
ExecuteFunc("Advance_Manual")
Advance_RequestUnit = nil
end
target = nil
end

function InitTrig_Unstuck()
gg_trg_Unstuck = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Unstuck, EVENT_PLAYER_UNIT_SPELL_EFFECT)
TriggerAddCondition(gg_trg_Unstuck, Condition(Trig_Unstuck_Conditions))
TriggerAddAction(gg_trg_Unstuck, Trig_Unstuck_Actions)
end

function Trig_Sell_Conditions()
if (not (GetSpellAbilityId() == 1093677131)) then
do return false end
end
do return true end
end

function Trig_Sell_Actions()
    local u = GetSpellTargetUnit()
    local owner = GetOwningPlayer(GetTriggerUnit())
    if ((u ~= nil) and (GetOwningPlayer(u) == owner)) then
        ArmyEconomy_RefundAndRemove(u)
    end
    u = nil
    owner = nil
end

function InitTrig_Sell()
gg_trg_Sell = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Sell, EVENT_PLAYER_UNIT_SPELL_EFFECT)
TriggerAddCondition(gg_trg_Sell, Condition(Trig_Sell_Conditions))
TriggerAddAction(gg_trg_Sell, Trig_Sell_Actions)
end

function Trig_bstone_Actions()
udg_bstone = gg_unit_e000_0017
end

function InitTrig_bstone()
gg_trg_bstone = CreateTrigger()
TriggerAddAction(gg_trg_bstone, Trig_bstone_Actions)
end

function Trig_AddUproot_Func002001()
do return (IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) == true) end
end

function Trig_AddUproot_Func002002()
do return (GetUnitAbilityLevelSwapped(1093678390, GetTriggerUnit()) == 0) end
end

function Trig_AddUproot_Conditions()
if (not GetBooleanAnd((IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) == true), (GetUnitAbilityLevelSwapped(1093678390, GetTriggerUnit()) == 0))) then
do return false end
end
do return true end
end

function Trig_AddUproot_Actions()
UnitAddAbilityBJ(1093678389, GetTriggerUnit())
end

function InitTrig_AddUproot()
gg_trg_AddUproot = CreateTrigger()
TriggerRegisterEnterRectSimple(gg_trg_AddUproot, GetPlayableMapRect())
TriggerRegisterAnyUnitEventBJ(gg_trg_AddUproot, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
TriggerAddCondition(gg_trg_AddUproot, Condition(Trig_AddUproot_Conditions))
TriggerAddAction(gg_trg_AddUproot, Trig_AddUproot_Actions)
end

function Trig_RootMove_AllConditions()
if (not (IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) == true)) then
do return false end
end
if (not (GetSpellAbilityId() == 1093678389)) then
do return false end
end
do return true end
end

function Trig_RootMove_Conditions()
if (not Trig_RootMove_AllConditions()) then
do return false end
end
do return true end
end

function Trig_RootMove_Func002C(pid)
local target = GetSpellTargetLoc()
local allowed = RectContainsLoc(udg_PlayerLocationArray[pid], target)
RemoveLocation(target)
target = nil
do return allowed end
end

function Trig_RootMove_Actions()
local pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local target = nil
if Trig_RootMove_Func002C(pid) then
target = GetSpellTargetLoc()
else
target = GetUnitLoc(GetTriggerUnit())
end
SetUnitPositionLoc(GetTriggerUnit(), target)
RemoveLocation(target)
target = nil
end

function InitTrig_RootMove()
gg_trg_RootMove = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_RootMove, EVENT_PLAYER_UNIT_SPELL_EFFECT)
TriggerAddCondition(gg_trg_RootMove, Condition(Trig_RootMove_Conditions))
TriggerAddAction(gg_trg_RootMove, Trig_RootMove_Actions)
end

function Trig_OpponentChatCommand_Actions()
DisplayTextToForce(bj_FORCE_PLAYER[GetPlayerId(GetTriggerPlayer())], J88_concat("In this round your opponent will be ", GetPlayerName(Player(udg_int_Opponent[GetPlayerId(GetTriggerPlayer())]))))
end

function InitTrig_OpponentChatCommand()
gg_trg_OpponentChatCommand = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(0), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(1), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(2), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(3), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(4), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(5), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(6), "-opponent", true)
TriggerRegisterPlayerChatEvent(gg_trg_OpponentChatCommand, Player(7), "-opponent", true)
TriggerAddAction(gg_trg_OpponentChatCommand, Trig_OpponentChatCommand_Actions)
end

function Trig_Kaboom_Func007C()
if (GetUnitTypeId(GetAttacker()) == 1747989057) then
do return true end
end
do return false end
end

function Trig_Kaboom_Conditions()
if (not Trig_Kaboom_Func007C()) then
do return false end
end
do return true end
end

function Trig_Kaboom_Func003Func001Func001C()
if (not (GetOwningPlayer(GetAttacker()) ~= GetOwningPlayer(GetEnumUnit()))) then
do return false end
end
if (not (IsUnitType(GetTriggerUnit(), UNIT_TYPE_GROUND) == true)) then
do return false end
end
do return true end
end

function Trig_Kaboom_Func003Func001C()
if (not Trig_Kaboom_Func003Func001Func001C()) then
do return false end
end
do return true end
end

function Trig_Kaboom_Func003A()
if Trig_Kaboom_Func003Func001C() then
UnitDamageTargetBJ(GetAttacker(), GetEnumUnit(), GetRandomReal(200.0, 500.0), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_NORMAL)
else
end
end

function Trig_Kaboom_Actions()
local impact = GetTriggerUnit()
local blast = AddSpecialEffect("war3mapImported\\NewGroundEX.mdx", GetUnitX(impact), GetUnitY(impact))
local center = GetUnitLoc(GetTriggerUnit())
local targets = GetUnitsInRangeOfLocAll(75.0, center)
RemoveLocation(center)
center = nil
ForGroup(targets, Trig_Kaboom_Func003A)
DestroyGroup(targets)
DestroyEffect(blast)
KillUnit(GetAttacker())
impact = nil
blast = nil
targets = nil
end

function InitTrig_Kaboom()
gg_trg_Kaboom = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Kaboom, EVENT_PLAYER_UNIT_ATTACKED)
TriggerAddCondition(gg_trg_Kaboom, Condition(Trig_Kaboom_Conditions))
TriggerAddAction(gg_trg_Kaboom, Trig_Kaboom_Actions)
end

function Trig_Kamikaze_Func007C()
if (GetUnitTypeId(GetAttacker()) == 1747989830) then
do return true end
end
do return false end
end

function Trig_Kamikaze_Conditions()
if (not Trig_Kamikaze_Func007C()) then
do return false end
end
do return true end
end

function Trig_Kamikaze_Func003Func001Func001C()
if (not (GetOwningPlayer(GetAttacker()) ~= GetOwningPlayer(GetEnumUnit()))) then
do return false end
end
do return true end
end

function Trig_Kamikaze_Func003Func001C()
if (not Trig_Kamikaze_Func003Func001Func001C()) then
do return false end
end
do return true end
end

function Trig_Kamikaze_Func003A()
if Trig_Kamikaze_Func003Func001C() then
UnitDamageTargetBJ(GetAttacker(), GetEnumUnit(), GetRandomReal(300.0, 2000.0), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_NORMAL)
else
end
end

function Trig_Kamikaze_Actions()
local impact = GetTriggerUnit()
local blast = AddSpecialEffect("war3mapImported\\NewGroundEX.mdx", GetUnitX(impact), GetUnitY(impact))
local center = GetUnitLoc(GetAttackedUnitBJ())
local targets = GetUnitsInRangeOfLocAll(75.0, center)
RemoveLocation(center)
center = nil
ForGroup(targets, Trig_Kamikaze_Func003A)
DestroyGroup(targets)
DestroyEffect(blast)
KillUnit(GetAttacker())
impact = nil
blast = nil
targets = nil
end

function InitTrig_Kamikaze()
gg_trg_Kamikaze = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Kamikaze, EVENT_PLAYER_UNIT_ATTACKED)
TriggerAddCondition(gg_trg_Kamikaze, Condition(Trig_Kamikaze_Conditions))
TriggerAddAction(gg_trg_Kamikaze, Trig_Kamikaze_Actions)
end

function Trig_NUKE_Func007C()
if (GetUnitTypeId(GetAttacker()) == 1747993420) then
do return true end
end
if (GetUnitTypeId(GetAttacker()) == 1747993421) then
do return true end
end
do return false end
end

function Trig_NUKE_Conditions()
if (not Trig_NUKE_Func007C()) then
do return false end
end
do return true end
end

function Trig_NUKE_Func003A()
UnitDamageTargetBJ(GetAttacker(), GetEnumUnit(), GetRandomReal(30000.0, 50000.0), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_NORMAL)
end

function Trig_NUKE_Actions()
local impact = GetTriggerUnit()
local blast = AddSpecialEffect("war3mapImported\\NuclearStrike3.mdx", GetUnitX(impact), GetUnitY(impact))
local center = GetUnitLoc(GetAttackedUnitBJ())
local targets = GetUnitsInRangeOfLocAll(600.0, center)
RemoveLocation(center)
center = nil
ForGroup(targets, Trig_NUKE_Func003A)
DestroyGroup(targets)
DestroyEffect(blast)
KillUnit(GetAttacker())
impact = nil
blast = nil
targets = nil
end

function InitTrig_NUKE()
gg_trg_NUKE = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_NUKE, EVENT_PLAYER_UNIT_ATTACKED)
TriggerAddCondition(gg_trg_NUKE, Condition(Trig_NUKE_Conditions))
TriggerAddAction(gg_trg_NUKE, Trig_NUKE_Actions)
end

function Trig_Victory_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
PlayMusicBJ(gg_snd_03_Victory___Battlecry___Two_Steps_From_Hell__2_u)
end

function InitTrig_Victory()
gg_trg_Victory = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_Victory, Player(0), "-Music Victory", true)
TriggerAddAction(gg_trg_Victory, Trig_Victory_Actions)
end

function Trig_Battlefield_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
PlayMusicBJ(gg_snd_Battlefield_1942_theme)
end

function InitTrig_Battlefield()
gg_trg_Battlefield = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_Battlefield, Player(0), "-Music Battlefield", true)
TriggerAddAction(gg_trg_Battlefield, Trig_Battlefield_Actions)
end

function Trig_Hell_March_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
PlayMusicBJ(gg_snd_Red_Alert_3_soundtrack___Hell_March_1_Fftl_Remix__online_audio_converter_com___1_u)
end

function InitTrig_Hell_March()
gg_trg_Hell_March = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_Hell_March, Player(0), "-Music Hell March", true)
TriggerAddAction(gg_trg_Hell_March, Trig_Hell_March_Actions)
end

function Trig_Medal_of_Honor_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
PlayMusicBJ(gg_snd_Medal_Of_Honor_European_Assault_Soundtrack___Main_Theme__HQ___online_audio_converter_com_u)
end

function InitTrig_Medal_of_Honor()
gg_trg_Medal_of_Honor = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_Medal_of_Honor, Player(0), "-Music Medal of Honor", true)
TriggerAddAction(gg_trg_Medal_of_Honor, Trig_Medal_of_Honor_Actions)
end

function Trig_Heart_of_Iron_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
PlayMusicBJ(gg_snd_Hearts_of_Iron_IV___Main_Theme__online_audio_converter_com_u)
end

function InitTrig_Heart_of_Iron()
gg_trg_Heart_of_Iron = CreateTrigger()
TriggerRegisterPlayerChatEvent(gg_trg_Heart_of_Iron, Player(0), "-Music Heart of Iron", true)
TriggerAddAction(gg_trg_Heart_of_Iron, Trig_Heart_of_Iron_Actions)
end

function Trig_Music_Actions()
StopMusicBJ(false)
ClearMapMusicBJ()
TriggerSleepAction(5.0)
VolumeGroupSetVolumeBJ(SOUND_VOLUMEGROUP_MUSIC, J88_real(100))
PlayMusicBJ(gg_snd_Battlefield_1942_theme)
end

function InitTrig_Music()
gg_trg_Music = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Music, 5.0)
TriggerAddAction(gg_trg_Music, Trig_Music_Actions)
end

function Trig_Music_Finals_Func002C()
if (not (GetPlayerTechCountSimple(1378889776, Player(0)) == 1)) then
do return false end
end
do return true end
end

function Trig_Music_Finals_Actions()
if Trig_Music_Finals_Func002C() then
StopMusicBJ(false)
ClearMapMusicBJ()
VolumeGroupSetVolumeBJ(SOUND_VOLUMEGROUP_MUSIC, J88_real(100))
PlayMusicBJ(gg_snd_Red_Alert_3_soundtrack___Hell_March_1_Fftl_Remix__online_audio_converter_com___1_u)
DisableTrigger(GetTriggeringTrigger())
else
end
end

function InitTrig_Music_Finals()
gg_trg_Music_Finals = CreateTrigger()
TriggerRegisterTimerEventPeriodic(gg_trg_Music_Finals, 5.0)
TriggerAddAction(gg_trg_Music_Finals, Trig_Music_Finals_Actions)
end

function Trig_RaiseDead_Conditions()
if (not (GetTriggerUnit() == GetSummonedUnit())) then
do return false end
end
do return true end
end

function Trig_RaiseDead_Actions()
local target = GetRectCenter(GetPlayableMapRect())
IssuePointOrderLocBJ(GetSummonedUnit(), "attack", target)
RemoveLocation(target)
target = nil
end

function InitTrig_RaiseDead()
gg_trg_RaiseDead = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_RaiseDead, EVENT_PLAYER_UNIT_SUMMON)
TriggerAddCondition(gg_trg_RaiseDead, Condition(Trig_RaiseDead_Conditions))
TriggerAddAction(gg_trg_RaiseDead, Trig_RaiseDead_Actions)
end

function Trig_Limits_Actions()
    local owner = GetOwningPlayer(GetTriggerUnit())
    local tid = GetUnitTypeId(GetTrainedUnit())
    if (tid ~= 0) then
        SetPlayerTechMaxAllowed(owner, tid, 1)
    end
    if GermanRoutes_RommelChosen[GetPlayerId(owner)] then
        SetPlayerTechMaxAllowed(owner, 1747989058, 0)
        SetPlayerTechMaxAllowed(owner, 1750217010, 1)
    end
    owner = nil
end

function InitTrig_Limits()
gg_trg_Limits = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(gg_trg_Limits, EVENT_PLAYER_UNIT_TRAIN_FINISH)
TriggerAddAction(gg_trg_Limits, Trig_Limits_Actions)
end

function Trig_Limits_start_Actions()
bj_forLoopAIndex = 1
bj_forLoopAIndexEnd = 8
while true do
if (bj_forLoopAIndex > bj_forLoopAIndexEnd) then break end
SetPlayerTechMaxAllowedSwap(1747993170, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747989322, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747990346, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993155, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747989058, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747992887, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747990347, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993153, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747989845, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993674, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993913, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerUnitAvailableBJ(1747993685, false, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747988816, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993165, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993941, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994187, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994188, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994424, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994420, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994425, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747994190, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993422, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747993419, 1, ConvertedPlayer(GetForLoopIndexA()))
SetPlayerTechMaxAllowedSwap(1747988805, 8, ConvertedPlayer(GetForLoopIndexA()))
bj_forLoopAIndex = J88_int(bj_forLoopAIndex + 1)
end
end

function LinFire_Active(u)
    local pid = Naval_KillerPlayer(u)
    do return ((((((((((u ~= nil) and (GetUnitTypeId(u) ~= 0)) and (GetWidgetLife(u) > 0.4050000011920929)) and (pid >= 0)) and (pid < 8)) and Lin_Active[pid]) and (not IsUnitType(u, UNIT_TYPE_STRUCTURE))) and (BlzGetUnitWeaponIntegerField(u, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0) == 3)) and (CavalryCharge_Mode ~= 0)) and (COUNTDOWN_TICK_TIMER == nil)) end
end

function LinFire_BattleValid(key)
    do return (((((CavalryCharge_Mode ~= 0) and (CavalryCharge_Mode == LoadInteger(LinFire_Data, key, 20))) and (udg_int_CurRound == LoadInteger(LinFire_Data, key, 21))) and (COUNTDOWN_TICK_TIMER == nil)) and (not ((CavalryCharge_Mode == 1) and udg_bool_WaitingForSacrificeEnd))) end
end

function LinFire_TargetAllowed(u, owner, mask)
    if ((not China_IsEnemyCombatant(u, owner)) or BlzIsUnitInvulnerable(u)) then
        do return false end
    end
    if (BlzBitAnd(mask, 201326592) ~= 0) then
        if IsUnitType(u, UNIT_TYPE_MECHANICAL) then
            if (BlzBitAnd(mask, 134217728) == 0) then
                do return false end
            end
        elseif (BlzBitAnd(mask, 67108864) == 0) then
            do return false end
        end
    end
    if IsUnitType(u, UNIT_TYPE_FLYING) then
        do return (BlzBitAnd(mask, 4) ~= 0) end
    end
    do return (BlzBitAnd(mask, 2) ~= 0) end
end

function LinFire_Impact(key)
    local source = LoadUnitHandle(LinFire_Data, key, 0)
    local x = LoadReal(LinFire_Data, key, 4)
    local y = LoadReal(LinFire_Data, key, 5)
    local full = LoadReal(LinFire_Data, key, 10)
    local medium = LoadReal(LinFire_Data, key, 11)
    local small = LoadReal(LinFire_Data, key, 12)
    local amount = LoadReal(LinFire_Data, key, 6)
    local factor = 0.0
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local victim = nil
    local victims = CreateGroup()
    DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", x, y))
    GroupEnumUnitsInRange(victims, x, y, J88_real(RMaxBJ(full, RMaxBJ(medium, small)) + 128.0), nil)
    while true do
        victim = FirstOfGroup(victims)
        if (victim == nil) then break end
        GroupRemoveUnit(victims, victim)
        if LinFire_TargetAllowed(victim, GetOwningPlayer(source), LoadInteger(LinFire_Data, key, 15)) then
            dx = J88_real(GetUnitX(victim) - x)
            dy = J88_real(GetUnitY(victim) - y)
            distance = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
            factor = 0.0
            if IsUnitInRangeXY(victim, x, y, full) then
                factor = 1.0
            elseif (distance <= medium) then
                factor = LoadReal(LinFire_Data, key, 13)
            elseif (distance <= small) then
                factor = LoadReal(LinFire_Data, key, 14)
            end
            if (factor > 0.0) then
                --  Original gun owns the damage and kill. Non-attack damage avoids
                --  recursively rolling Lin or starting another volunteer volley.
                UnitDamageTarget(source, victim, J88_real(amount * factor), false, true, ATTACK_TYPE_SIEGE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            end
        end
    end
    DestroyGroup(victims)
    source = nil
    victim = nil
    victims = nil
end

function LinFire_Tick()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(LinFire_Data, key, 0)
    local shell = LoadEffectHandle(LinFire_Data, key, 1)
    local t = J88_real(LoadReal(LinFire_Data, key, 2) + 0.03125)
    local duration = LoadReal(LinFire_Data, key, 3)
    local p = RMinBJ(1.0, J88_real(t / duration))
    local active = ((GetUnitTypeId(source) ~= 0) and LinFire_BattleValid(key))
    if (active and (p < 1.0)) then
        BlzSetSpecialEffectPosition(shell, J88_real(LoadReal(LinFire_Data, key, 7) + J88_real(J88_real(LoadReal(LinFire_Data, key, 4) - LoadReal(LinFire_Data, key, 7)) * p)), J88_real(LoadReal(LinFire_Data, key, 8) + J88_real(J88_real(LoadReal(LinFire_Data, key, 5) - LoadReal(LinFire_Data, key, 8)) * p)), J88_real(J88_real(J88_real(LoadReal(LinFire_Data, key, 9) * J88_real(1.0 - p)) + J88_real(LoadReal(LinFire_Data, key, 16) * p)) + J88_real(J88_real(J88_real(4.0 * LoadReal(LinFire_Data, key, 17)) * p) * J88_real(1.0 - p))))
        SaveReal(LinFire_Data, key, 2, t)
    else
        DestroyEffect(shell)
        if active then
            LinFire_Impact(key)
        end
        FlushChildHashtable(LinFire_Data, key)
        DestroyTimer(clock)
    end
    clock = nil
    source = nil
    shell = nil
end

function LinFire_Launch()
    local clock = GetExpiredTimer()
    local key = GetHandleId(clock)
    local source = LoadUnitHandle(LinFire_Data, key, 0)
    local target = LoadUnitHandle(LinFire_Data, key, 30)
    local sx = GetUnitX(source)
    local sy = GetUnitY(source)
    local dx = 0.0
    local dy = 0.0
    local distance = 0.0
    local art = nil
    local shell = nil
    local ground = nil
    if (LinFire_Active(source) and LinFire_BattleValid(key)) then
        --  If the first hit killed its target, fire at the last impact position.
        if ((GetUnitTypeId(target) ~= 0) and (GetWidgetLife(target) > 0.4050000011920929)) then
            SaveReal(LinFire_Data, key, 4, GetUnitX(target))
            SaveReal(LinFire_Data, key, 5, GetUnitY(target))
        end
        dx = J88_real(LoadReal(LinFire_Data, key, 4) - sx)
        dy = J88_real(LoadReal(LinFire_Data, key, 5) - sy)
        distance = SquareRoot(J88_real(J88_real(dx * dx) + J88_real(dy * dy)))
        art = BlzGetUnitWeaponStringField(source, UNIT_WEAPON_SF_ATTACK_PROJECTILE_ART, 0)
        if (art == "") then
            art = "Abilities\\Weapons\\Mortar\\MortarMissile.mdl"
        end
        shell = AddSpecialEffect(art, sx, sy)
        ground = Location(sx, sy)
        SaveReal(LinFire_Data, key, 9, J88_real(J88_real(GetLocationZ(ground) + GetUnitFlyHeight(source)) + 60.0))
        MoveLocation(ground, LoadReal(LinFire_Data, key, 4), LoadReal(LinFire_Data, key, 5))
        SaveReal(LinFire_Data, key, 16, J88_real(GetLocationZ(ground) + 30.0))
        RemoveLocation(ground)
        BlzSetSpecialEffectZ(shell, LoadReal(LinFire_Data, key, 9))
        BlzSetSpecialEffectYaw(shell, Atan2(dy, dx))
        SaveEffectHandle(LinFire_Data, key, 1, shell)
        SaveReal(LinFire_Data, key, 2, 0.0)
        SaveReal(LinFire_Data, key, 3, RMaxBJ(0.10000000149011612, J88_real(distance / RMaxBJ(1.0, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_PROJECTILE_SPEED, 0)))))
        SaveReal(LinFire_Data, key, 7, sx)
        SaveReal(LinFire_Data, key, 8, sy)
        SaveReal(LinFire_Data, key, 17, J88_real(distance * BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_PROJECTILE_ARC, 0)))
        TimerStart(clock, 0.03125, true, LinFire_Tick)
    else
        FlushChildHashtable(LinFire_Data, key)
        DestroyTimer(clock)
    end
    clock = nil
    source = nil
    target = nil
    shell = nil
    ground = nil
end

function LinFire_OnAttack()
    local source = GetAttacker()
    local key = GetHandleId(source)
    if LinFire_Active(source) then
        if ((LinFire_Round ~= udg_int_CurRound) or (LinFire_Mode ~= CavalryCharge_Mode)) then
            FlushChildHashtable(LinFire_Attacks, 0)
            LinFire_Round = udg_int_CurRound
            LinFire_Mode = CavalryCharge_Mode
        end
        SaveInteger(LinFire_Attacks, 0, key, GetHandleId(GetTriggerUnit()))
    end
    source = nil
end

function LinFire_OnDamage()
    local source = GetEventDamageSource()
    local target = GetTriggerUnit()
    local id = GetHandleId(source)
    local clock = nil
    local key = 0
    if ((((BlzGetEventIsAttack() and (GetEventDamage() > 0.0)) and LinFire_Active(source)) and (LoadInteger(LinFire_Attacks, 0, id) == GetHandleId(target))) and China_IsEnemyCombatant(target, GetOwningPlayer(source))) then
        --  Claim once, before the splash victims generate their own damage events.
        RemoveSavedInteger(LinFire_Attacks, 0, id)
        if (GetRandomInt(1, 100) <= 20) then
            clock = CreateTimer()
            key = GetHandleId(clock)
            SaveUnitHandle(LinFire_Data, key, 0, source)
            SaveUnitHandle(LinFire_Data, key, 30, target)
            SaveReal(LinFire_Data, key, 4, GetUnitX(target))
            SaveReal(LinFire_Data, key, 5, GetUnitY(target))
            --  DAMAGING supplies the hit before armor/type reductions. Do not
            --  read the post-armor DAMAGED amount and reduce it a second time.
            SaveReal(LinFire_Data, key, 6, GetEventDamage())
            SaveReal(LinFire_Data, key, 10, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_FULL_DAMAGE, 0))
            SaveReal(LinFire_Data, key, 11, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_MEDIUM_DAMAGE, 0))
            SaveReal(LinFire_Data, key, 12, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_AREA_OF_EFFECT_SMALL_DAMAGE, 0))
            SaveReal(LinFire_Data, key, 13, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_DAMAGE_FACTOR_MEDIUM, 0))
            SaveReal(LinFire_Data, key, 14, BlzGetUnitWeaponRealField(source, UNIT_WEAPON_RF_ATTACK_DAMAGE_FACTOR_SMALL, 0))
            SaveInteger(LinFire_Data, key, 15, BlzGetUnitWeaponIntegerField(source, UNIT_WEAPON_IF_ATTACK_AREA_OF_EFFECT_TARGETS, 0))
            if (BlzBitAnd(LoadInteger(LinFire_Data, key, 15), 6) == 0) then
                --  Inherited empty splash filters on the existing artillery use
                --  the weapon's allowed targets. Never make the follow-up inert.
                SaveInteger(LinFire_Data, key, 15, BlzGetUnitWeaponIntegerField(source, UNIT_WEAPON_IF_ATTACK_TARGETS_ALLOWED, 0))
            end
            SaveInteger(LinFire_Data, key, 20, CavalryCharge_Mode)
            SaveInteger(LinFire_Data, key, 21, udg_int_CurRound)
            TimerStart(clock, 0.20000000298023224, false, LinFire_Launch)
        end
    end
    source = nil
    target = nil
    clock = nil
end

function LinFire_OnDeath()
    --  Timer records use their own live handles; these unit-key records can go.
    RemoveSavedInteger(LinFire_Attacks, 0, GetHandleId(GetTriggerUnit()))
end

function LinFire_ClearPending()
    if ((((LinFire_Round ~= udg_int_CurRound) or (LinFire_Mode ~= CavalryCharge_Mode)) or (CavalryCharge_Mode == 0)) or (COUNTDOWN_TICK_TIMER ~= nil)) then
        FlushChildHashtable(LinFire_Attacks, 0)
        LinFire_Round = udg_int_CurRound
        LinFire_Mode = CavalryCharge_Mode
    end
end

function LinFire_Init()
    local attacks = CreateTrigger()
    local damage = CreateTrigger()
    local death = CreateTrigger()
    local i = 0
    LinFire_Data = InitHashtable()
    LinFire_Attacks = InitHashtable()
    TimerStart(CreateTimer(), 0.5, true, LinFire_ClearPending)
    while true do
        if (i >= bj_MAX_PLAYER_SLOTS) then break end
        TriggerRegisterPlayerUnitEvent(attacks, Player(i), EVENT_PLAYER_UNIT_ATTACKED, nil)
        TriggerRegisterPlayerUnitEvent(damage, Player(i), EVENT_PLAYER_UNIT_DAMAGING, nil)
        TriggerRegisterPlayerUnitEvent(death, Player(i), EVENT_PLAYER_UNIT_DEATH, nil)
        i = J88_int(i + 1)
    end
    TriggerAddAction(attacks, LinFire_OnAttack)
    TriggerAddAction(damage, LinFire_OnDamage)
    TriggerAddAction(death, LinFire_OnDeath)
    attacks = nil
    damage = nil
    death = nil
end

function InitTrig_Limits_start()
China_Init()
GermanRoutes_UpdateAvailability()
gg_trg_Limits_start = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Limits_start, 2.0)
TriggerAddAction(gg_trg_Limits_start, Trig_Limits_start_Actions)
end

function Trig_info_Actions()
CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "China: Factions and Abilities", "Choose China in the opening panel, then select Nationalist or Communist forces and deploy to receive your builder. Both routes are available from the start. Chiang Kai-shek remains unavailable. Chairman Mao costs 3000 Blood Points and grants no extra troops: battle Blood Points rewards increase by 8%. Applies to normal battle settlement and bonus-challenge earnings, excluding refunds and fixed grants. Infantry retain normal prices and gain 5% evasion, +10% attack speed and +10% attack damage. Capture chance becomes 10%.|nSwordman: one grenade per round, 800 range, 100 blast radius, 40 damage on landing (20 in bonus rounds).|nCommunism: kills have a 6% chance to recruit the victim at 30% of its original maximum life. Affects organic and mechanical troops. Bonus enemies cannot be recruited. Previously recruited units cannot be recruited again. A conversion flash marks each successful recruitment.", "ReplaceableTextures\\CommandButtons\\BTNChinaCommunist.blp")
FlashQuestDialogButtonBJ()
CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "TRIGSTR_713", "TRIGSTR_714", "war3mapImported\\BTNUSA.blp")
CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "TRIGSTR_006", "TRIGSTR_1100", "ReplaceableTextures\\CommandButtons\\BTNBookOfTheDead.blp")
CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "TRIGSTR_7037", "TRIGSTR_7038", "war3mapImported\\BTNRussianFlag.blp")
CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "TRIGSTR_1039", "TRIGSTR_1040", "ReplaceableTextures\\CommandButtons\\BTNDrum.blp")
CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "TRIGSTR_5605", "TRIGSTR_5606", "war3mapImported\\IconP51Mustang.blp")
CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "TRIGSTR_711", "TRIGSTR_712", "ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp")
CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "TRIGSTR_703", "TRIGSTR_704", "ReplaceableTextures\\CommandButtons\\BTNSpellBookBLS.blp")
CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "TRIGSTR_6811", "TRIGSTR_6812", "war3mapImported\\BTNEnglishCommando.blp")
end

function InitTrig_info()
gg_trg_info = CreateTrigger()
TriggerAddAction(gg_trg_info, Trig_info_Actions)
end

function Trig_Leavers_announced_Actions()
NewAI_LeavePid = GetPlayerId(GetTriggerPlayer())
ExecuteFunc("NewAI_OnLeave")
end

function InitTrig_Leavers_announced()
gg_trg_Leavers_announced = CreateTrigger()
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(0))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(1))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(2))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(3))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(4))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(5))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(6))
TriggerRegisterPlayerEventLeave(gg_trg_Leavers_announced, Player(7))
TriggerAddAction(gg_trg_Leavers_announced, Trig_Leavers_announced_Actions)
end

function Trig_Bots_Func001Func001C()
if (not (GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_EMPTY)) then
do return false end
end
do return true end
end

function Trig_Bots_Actions()
ExecuteFunc("NewAI_Init")
end

function InitTrig_Bots()
gg_trg_Bots = CreateTrigger()
TriggerRegisterTimerEventSingle(gg_trg_Bots, 2.0)
TriggerAddAction(gg_trg_Bots, Trig_Bots_Actions)
end

function InitCustomTriggers()
ArmyEconomy_Init()
France_Init()
InitTrig_Hashtable()
InitTrig_Fly()
InitTrig_Credits()
InitTrig_Naval_Bombard()
InitTrig_Artillery_Cast_Normal()
InitTrig_Artillery_Continue_Normal()
InitTrig_BotColorName()
InitTrig_Region_names()
ExecuteFunc("pizdec")
InitTrig_Misc_init()
InitTrig_Create_Shuffled_Array()
InitTrig_StartGame()
InitTrig_Start_PreRound()
InitTrig_PreRoundExpire()
InitTrig_PlayerUnitDies()
InitTrig_EndRound()
InitTrig_Periodic_Unstuck_Copy()
InitTrig_DoBonusRound()
InitTrig_DoFinalTournament()
InitTrig_Random()
InitTrig_Erwin_Rommel()
InitTrig_Heinrich_Himmler()
InitTrig_Yamamoto_and_Nimitz()
InitTrig_Alan_Turing()
InitTrig_Unstuck()
InitTrig_Sell()
InitTrig_bstone()
InitTrig_AddUproot()
InitTrig_RootMove()
InitTrig_OpponentChatCommand()
InitTrig_Kaboom()
InitTrig_Kamikaze()
InitTrig_NUKE()
InitTrig_Victory()
InitTrig_Battlefield()
InitTrig_Hell_March()
InitTrig_Medal_of_Honor()
InitTrig_Heart_of_Iron()
InitTrig_Music()
InitTrig_Music_Finals()
InitTrig_RaiseDead()
InitTrig_Limits()
InitTrig_Limits_start()
InitTrig_info()
InitTrig_Leavers_announced()
InitTrig_Bots()
ExecuteFunc("NewAI_RecordLobby")
Nation50_Init()
end

function RunInitializationTriggers()
ConditionalTriggerExecute(gg_trg_BotColorName)
ConditionalTriggerExecute(gg_trg_Misc_init)
ConditionalTriggerExecute(gg_trg_Create_Shuffled_Array)
ConditionalTriggerExecute(gg_trg_info)
end

function InitCustomPlayerSlots()
SetPlayerStartLocation(Player(0), 0)
ForcePlayerStartLocation(Player(0), 0)
SetPlayerColor(Player(0), ConvertPlayerColor(0))
SetPlayerRacePreference(Player(0), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(0), false)
SetPlayerController(Player(0), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(1), 1)
ForcePlayerStartLocation(Player(1), 1)
SetPlayerColor(Player(1), ConvertPlayerColor(1))
SetPlayerRacePreference(Player(1), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(1), false)
SetPlayerController(Player(1), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(2), 2)
ForcePlayerStartLocation(Player(2), 2)
SetPlayerColor(Player(2), ConvertPlayerColor(2))
SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(2), false)
SetPlayerController(Player(2), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(3), 3)
ForcePlayerStartLocation(Player(3), 3)
SetPlayerColor(Player(3), ConvertPlayerColor(3))
SetPlayerRacePreference(Player(3), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(3), false)
SetPlayerController(Player(3), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(4), 4)
ForcePlayerStartLocation(Player(4), 4)
SetPlayerColor(Player(4), ConvertPlayerColor(4))
SetPlayerRacePreference(Player(4), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(4), false)
SetPlayerController(Player(4), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(5), 5)
ForcePlayerStartLocation(Player(5), 5)
SetPlayerColor(Player(5), ConvertPlayerColor(5))
SetPlayerRacePreference(Player(5), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(5), false)
SetPlayerController(Player(5), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(6), 6)
ForcePlayerStartLocation(Player(6), 6)
SetPlayerColor(Player(6), ConvertPlayerColor(6))
SetPlayerRacePreference(Player(6), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(6), false)
SetPlayerController(Player(6), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(7), 7)
ForcePlayerStartLocation(Player(7), 7)
SetPlayerColor(Player(7), ConvertPlayerColor(7))
SetPlayerRacePreference(Player(7), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(7), false)
SetPlayerController(Player(7), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(8), 8)
ForcePlayerStartLocation(Player(8), 8)
SetPlayerColor(Player(8), ConvertPlayerColor(8))
SetPlayerRacePreference(Player(8), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(8), true)
SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
SetPlayerTeam(Player(0), 0)
SetPlayerTeam(Player(1), 0)
SetPlayerTeam(Player(2), 0)
SetPlayerTeam(Player(3), 0)
SetPlayerTeam(Player(4), 0)
SetPlayerTeam(Player(5), 0)
SetPlayerTeam(Player(6), 0)
SetPlayerTeam(Player(7), 0)
SetPlayerTeam(Player(8), 1)
end

function InitAllyPriorities()
SetStartLocPrioCount(0, 1)
SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(1, 1)
SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(2, 1)
SetStartLocPrio(2, 0, 3, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(3, 1)
SetStartLocPrio(3, 0, 2, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(4, 1)
SetStartLocPrio(4, 0, 5, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(5, 1)
SetStartLocPrio(5, 0, 4, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(6, 1)
SetStartLocPrio(6, 0, 7, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(7, 1)
SetStartLocPrio(7, 0, 6, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(8, 8)
SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 1, 1, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 2, 2, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 3, 3, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 4, 4, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 5, 5, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 6, 6, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 7, 7, MAP_LOC_PRIO_HIGH)
end

function DifficultyChoice_Apply(level)
    local pid = 0
    local label = "Normal"
    if (((not DifficultyChoice_Pending) or (level < 1)) or (level > 4)) then
        do return end
    end
    DifficultyChoice_Level = level
    DifficultyChoice_Pending = false
    while true do
        if (pid >= 8) then break end
        NewAI_Level[pid] = level
        NewAI_NextThink[pid] = NewAI_Tick
        pid = J88_int(pid + 1)
    end
    if (level == 1) then
        label = "Easy"
    elseif (level == 3) then
        label = "Hard"
    elseif (level == 4) then
        label = "Hell"
    end
    if (DifficultyChoice_Dialog ~= nil) then
        DialogDisplay(Player(0), DifficultyChoice_Dialog, false)
        DialogClear(DifficultyChoice_Dialog)
        DialogDestroy(DifficultyChoice_Dialog)
        DifficultyChoice_Dialog = nil
    end
    if (DifficultyChoice_TimeoutTimer ~= nil) then
        PauseTimer(DifficultyChoice_TimeoutTimer)
        DestroyTimer(DifficultyChoice_TimeoutTimer)
        DifficultyChoice_TimeoutTimer = nil
    end
    if (DifficultyChoice_ClickTrigger ~= nil) then
        DestroyTrigger(DifficultyChoice_ClickTrigger)
        DifficultyChoice_ClickTrigger = nil
    end
    if (DifficultyChoice_LeaveTrigger ~= nil) then
        DestroyTrigger(DifficultyChoice_LeaveTrigger)
        DifficultyChoice_LeaveTrigger = nil
    end
    if DifficultyChoice_PreRoundPaused then
        DifficultyChoice_PreRoundPaused = false
        ResumeTimer(udg_timer_PreRoundCount)
        TimerDialogDisplay(udg_timerwindow_PreRoundTimer, true)
    end
    DisplayTextToForce(GetPlayersAll(), J88_concat(J88_concat("AI Difficulty: ", label), "."))
    if (Nation58_Frames ~= nil) then
        ExecuteFunc("Nation58_Render")
    end
end

function DifficultyChoice_OnTimeout()
    DifficultyChoice_Apply(2)
end

function DifficultyChoice_OnRedLeave()
    if (GetTriggerPlayer() == Player(Opening63_Host)) then
        DifficultyChoice_Apply(2)
    end
end

function DifficultyChoice_OnClick()
    local data = BlzGetTriggerSyncData()
    local level = S2I(data)
    if (((((DifficultyChoice_Pending and (GetPlayerId(GetTriggerPlayer()) == Opening63_Host)) and (BlzGetTriggerSyncPrefix() == "WW2Difficulty63")) and (level >= 1)) and (level <= 4)) and (data == I2S(level))) then
        DifficultyChoice_Apply(level)
    end
end

function DifficultyChoice_OnPrepare()
    --  Preserve the full opening preparation timer while Red makes the choice.
    if ((DifficultyChoice_Pending and (udg_int_CurRound == 1)) and (not DifficultyChoice_PreRoundPaused)) then
        DifficultyChoice_PreRoundPaused = true
        PauseTimer(udg_timer_PreRoundCount)
        TimerDialogDisplay(udg_timerwindow_PreRoundTimer, false)
    end
end

function DifficultyChoice_Init()
    local pid = 0
    if DifficultyChoice_Initialized then
        do return end
    end
    DifficultyChoice_Initialized = true
    DifficultyChoice_Pending = true
    --  The first occupied human lobby seat owns the opening choice.
    Opening63_Host = J88_int(-1)
    while true do
        if (pid >= 8) then break end
        if (((Opening63_Host == J88_int(-1)) and (GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING)) and (GetPlayerController(Player(pid)) == MAP_CONTROL_USER)) then
            Opening63_Host = pid
        end
        pid = J88_int(pid + 1)
    end
    if (Opening63_Host == J88_int(-1)) then
        DifficultyChoice_Apply(2)
        do return end
    end
    DifficultyChoice_ClickTrigger = CreateTrigger()
    pid = 0
    while true do
        if (pid >= 8) then break end
        BlzTriggerRegisterPlayerSyncEvent(DifficultyChoice_ClickTrigger, Player(pid), "WW2Difficulty63", false)
        pid = J88_int(pid + 1)
    end
    TriggerAddAction(DifficultyChoice_ClickTrigger, DifficultyChoice_OnClick)
    DifficultyChoice_LeaveTrigger = CreateTrigger()
    TriggerRegisterPlayerEvent(DifficultyChoice_LeaveTrigger, Player(Opening63_Host), EVENT_PLAYER_LEAVE)
    TriggerAddAction(DifficultyChoice_LeaveTrigger, DifficultyChoice_OnRedLeave)
    DifficultyChoice_TimeoutTimer = CreateTimer()
    TimerStart(DifficultyChoice_TimeoutTimer, 10.0, false, DifficultyChoice_OnTimeout)
end

function France54_PickRoute(pid, actor)
    local choice = France54_Choice[pid]
    local petain = false
    local gaulle = false
    if (((((GetUnitTypeId(actor) ~= 1747989848) or (NewAI_Workers[pid] <= 0)) or (France_Route[pid] ~= 0)) or (LoadInteger(NewAI_Counts, pid, 1747994960) > 0)) or (LoadInteger(NewAI_Counts, pid, 1749435463) > 0)) then
        do return 0 end
    end
    petain = NewAI_CanBuy(pid, 1747994960, actor)
    gaulle = NewAI_CanBuy(pid, 1749435463, actor)
    if ((not petain) and (not gaulle)) then
        do return 0 end
    end
    if ((choice == 1747994960) and petain) then
        do return choice end
    elseif ((choice == 1749435463) and gaulle) then
        do return choice end
    end
    if (petain and gaulle) then
        if (NewAI_Random(pid, 100) < 50) then
            choice = 1747994960
        else
            choice = 1749435463
        end
    elseif petain then
        choice = 1747994960
    else
        choice = 1749435463
    end
    France54_Choice[pid] = choice
    do return choice end
end

function Petain63_AIData0()
NewAI_CatalogUnit(1750151216, 300, 0, 3, 3, 2, 0, 1, 1, 300, "GER PAK40")
SaveInteger(NewAI_Data, 1750151216, 100, 1750151223)
SaveInteger(NewAI_Data, 1750151216, 101, 1750151224)
SaveReal(NewAI_Data, 1750151216, 500, 200.0)
SaveReal(NewAI_Data, 1750151216, 501, 1000.0)
SaveReal(NewAI_Data, 1750151216, 502, 0.0)
SaveReal(NewAI_Data, 1750151216, 530, 47.5)
SaveReal(NewAI_Data, 1750151216, 531, 47.5)
SaveReal(NewAI_Data, 1750151216, 510, 0.0)
SaveReal(NewAI_Data, 1750151216, 511, 200.0)
SaveReal(NewAI_Data, 1750151216, 512, 0.0)
SaveReal(NewAI_Data, 1750151216, 513, 0.0)
SaveReal(NewAI_Data, 1750151216, 514, 0.0)
SaveReal(NewAI_Data, 1750151216, 515, 0.0)
SaveReal(NewAI_Data, 1750151216, 516, 0.0)
SaveReal(NewAI_Data, 1750151216, 517, 0.0)
SaveReal(NewAI_Data, 1750151216, 520, 53.4375)
SaveReal(NewAI_Data, 1750151216, 521, 160.3125)
SaveReal(NewAI_Data, 1750151216, 522, 106.875)
SaveReal(NewAI_Data, 1750151216, 523, 53.4375)
SaveReal(NewAI_Data, 1750151216, 524, 26.71875)
SaveReal(NewAI_Data, 1750151216, 525, 53.4375)
SaveReal(NewAI_Data, 1750151216, 526, 53.4375)
SaveReal(NewAI_Data, 1750151216, 527, 26.71875)
SaveReal(NewAI_Data, 1750151216, 550, 47.5)
SaveReal(NewAI_Data, 1750151216, 551, 142.5)
SaveReal(NewAI_Data, 1750151216, 552, 95.0)
SaveReal(NewAI_Data, 1750151216, 553, 47.5)
SaveReal(NewAI_Data, 1750151216, 554, 23.75)
SaveReal(NewAI_Data, 1750151216, 555, 47.5)
SaveReal(NewAI_Data, 1750151216, 556, 47.5)
SaveReal(NewAI_Data, 1750151216, 557, 23.75)
SaveReal(NewAI_Data, 1750151216, 560, 0.0)
SaveReal(NewAI_Data, 1750151216, 561, 0.0)
SaveReal(NewAI_Data, 1750151216, 562, 0.0)
SaveReal(NewAI_Data, 1750151216, 563, 0.0)
SaveReal(NewAI_Data, 1750151216, 564, 0.0)
SaveReal(NewAI_Data, 1750151216, 565, 0.0)
SaveReal(NewAI_Data, 1750151216, 566, 0.0)
SaveReal(NewAI_Data, 1750151216, 567, 0.0)
SaveInteger(NewAI_Data, 1750151216, 1, 300)
SaveInteger(NewAI_Data, 1750151216, 2, 500)
SaveInteger(NewAI_Data, 1750151216, 5, 2)
SaveInteger(NewAI_Data, 1750151216, 9, 350)
SaveReal(NewAI_Data, 1750151216, 501, 350.0)
SaveInteger(NewAI_Data, 1750151216, 100, 1750151223)
SaveInteger(NewAI_Data, 1750151216, 101, 1750151224)
NewAI_CatalogUnit(1750151217, 0, 6000, 3, 5, 0, 0, 1, 1, 300, "GER Junkers AmerikaBomber (1)")
SaveReal(NewAI_Data, 1750151217, 500, 3000.0)
SaveReal(NewAI_Data, 1750151217, 501, 150.0)
end

function Petain63_AIData1()
SaveReal(NewAI_Data, 1750151217, 502, 3000.0)
SaveReal(NewAI_Data, 1750151217, 530, 0.0)
SaveReal(NewAI_Data, 1750151217, 531, 415.71429443359375)
SaveReal(NewAI_Data, 1750151217, 510, 0.0)
SaveReal(NewAI_Data, 1750151217, 511, 0.0)
SaveReal(NewAI_Data, 1750151217, 512, 0.0)
SaveReal(NewAI_Data, 1750151217, 513, 0.0)
SaveReal(NewAI_Data, 1750151217, 514, 0.0)
SaveReal(NewAI_Data, 1750151217, 515, 3000.0)
SaveReal(NewAI_Data, 1750151217, 516, 0.0)
SaveReal(NewAI_Data, 1750151217, 517, 0.0)
SaveReal(NewAI_Data, 1750151217, 520, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 521, 935.357177734375)
SaveReal(NewAI_Data, 1750151217, 522, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 523, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 524, 935.357177734375)
SaveReal(NewAI_Data, 1750151217, 525, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 526, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 527, 467.6785888671875)
SaveReal(NewAI_Data, 1750151217, 550, 0.0)
SaveReal(NewAI_Data, 1750151217, 551, 0.0)
SaveReal(NewAI_Data, 1750151217, 552, 0.0)
SaveReal(NewAI_Data, 1750151217, 553, 0.0)
SaveReal(NewAI_Data, 1750151217, 554, 0.0)
SaveReal(NewAI_Data, 1750151217, 555, 0.0)
SaveReal(NewAI_Data, 1750151217, 556, 0.0)
SaveReal(NewAI_Data, 1750151217, 557, 0.0)
SaveReal(NewAI_Data, 1750151217, 560, 0.0)
SaveReal(NewAI_Data, 1750151217, 561, 0.0)
SaveReal(NewAI_Data, 1750151217, 562, 0.0)
SaveReal(NewAI_Data, 1750151217, 563, 0.0)
SaveReal(NewAI_Data, 1750151217, 564, 0.0)
SaveReal(NewAI_Data, 1750151217, 565, 3000.0)
SaveReal(NewAI_Data, 1750151217, 566, 0.0)
SaveReal(NewAI_Data, 1750151217, 567, 0.0)
SaveInteger(NewAI_Data, 1750151217, 1, 0)
SaveInteger(NewAI_Data, 1750151217, 2, 6500)
SaveInteger(NewAI_Data, 1750151217, 5, 0)
SaveInteger(NewAI_Data, 1750151217, 9, 650)
SaveReal(NewAI_Data, 1750151217, 501, 650.0)
NewAI_CatalogUnit(1750151218, 0, 15000, 3, 2, 1, 1, 1, 1, 750, "GER LandKreuzer P.1000 Ratte")
SaveInteger(NewAI_Data, 1750151218, 100, 1750151225)
SaveInteger(NewAI_Data, 1750151218, 200, 1378889776)
SaveInteger(NewAI_Data, 1750151218, 300, 1)
SaveReal(NewAI_Data, 1750151218, 500, 16000.0)
SaveReal(NewAI_Data, 1750151218, 501, 700.0)
SaveReal(NewAI_Data, 1750151218, 502, 0.0)
SaveReal(NewAI_Data, 1750151218, 530, 575.5)
SaveReal(NewAI_Data, 1750151218, 531, 575.5)
SaveReal(NewAI_Data, 1750151218, 510, 0.0)
end

function Petain63_AIData2()
SaveReal(NewAI_Data, 1750151218, 511, 0.0)
SaveReal(NewAI_Data, 1750151218, 512, 16000.0)
SaveReal(NewAI_Data, 1750151218, 513, 0.0)
SaveReal(NewAI_Data, 1750151218, 514, 0.0)
SaveReal(NewAI_Data, 1750151218, 515, 0.0)
SaveReal(NewAI_Data, 1750151218, 516, 0.0)
SaveReal(NewAI_Data, 1750151218, 517, 0.0)
SaveReal(NewAI_Data, 1750151218, 520, 618.6624755859375)
SaveReal(NewAI_Data, 1750151218, 521, 1855.987548828125)
SaveReal(NewAI_Data, 1750151218, 522, 1237.324951171875)
SaveReal(NewAI_Data, 1750151218, 523, 618.6624755859375)
SaveReal(NewAI_Data, 1750151218, 524, 309.33123779296875)
SaveReal(NewAI_Data, 1750151218, 525, 618.6624755859375)
SaveReal(NewAI_Data, 1750151218, 526, 618.6624755859375)
SaveReal(NewAI_Data, 1750151218, 527, 309.33123779296875)
SaveReal(NewAI_Data, 1750151218, 550, 575.5)
SaveReal(NewAI_Data, 1750151218, 551, 1726.5)
SaveReal(NewAI_Data, 1750151218, 552, 1151.0)
SaveReal(NewAI_Data, 1750151218, 553, 575.5)
SaveReal(NewAI_Data, 1750151218, 554, 287.75)
SaveReal(NewAI_Data, 1750151218, 555, 575.5)
SaveReal(NewAI_Data, 1750151218, 556, 575.5)
SaveReal(NewAI_Data, 1750151218, 557, 287.75)
SaveReal(NewAI_Data, 1750151218, 560, 0.0)
SaveReal(NewAI_Data, 1750151218, 561, 0.0)
SaveReal(NewAI_Data, 1750151218, 562, 0.0)
SaveReal(NewAI_Data, 1750151218, 563, 0.0)
SaveReal(NewAI_Data, 1750151218, 564, 0.0)
SaveReal(NewAI_Data, 1750151218, 565, 0.0)
SaveReal(NewAI_Data, 1750151218, 566, 0.0)
SaveReal(NewAI_Data, 1750151218, 567, 0.0)
SaveInteger(NewAI_Data, 1750151218, 1, 0)
SaveInteger(NewAI_Data, 1750151218, 2, 15500)
SaveInteger(NewAI_Data, 1750151218, 5, 1)
SaveInteger(NewAI_Data, 1750151218, 9, 1550)
SaveReal(NewAI_Data, 1750151218, 501, 1550.0)
SaveInteger(NewAI_Data, 1750151218, 100, 1750151225)
NewAI_CatalogUnit(1750151219, 0, 1000, 3, 2, 1, 0, 1, 1, 100, "GER Panzer II Tank(1)")
SaveInteger(NewAI_Data, 1750151219, 100, 1750151472)
SaveReal(NewAI_Data, 1750151219, 500, 550.0)
SaveReal(NewAI_Data, 1750151219, 501, 550.0)
SaveReal(NewAI_Data, 1750151219, 502, 0.0)
SaveReal(NewAI_Data, 1750151219, 530, 26.25)
SaveReal(NewAI_Data, 1750151219, 531, 26.25)
SaveReal(NewAI_Data, 1750151219, 510, 0.0)
SaveReal(NewAI_Data, 1750151219, 511, 0.0)
SaveReal(NewAI_Data, 1750151219, 512, 550.0)
SaveReal(NewAI_Data, 1750151219, 513, 0.0)
SaveReal(NewAI_Data, 1750151219, 514, 0.0)
SaveReal(NewAI_Data, 1750151219, 515, 0.0)
end

function Petain63_AIData3()
SaveReal(NewAI_Data, 1750151219, 516, 0.0)
SaveReal(NewAI_Data, 1750151219, 517, 0.0)
SaveReal(NewAI_Data, 1750151219, 520, 28.21875)
SaveReal(NewAI_Data, 1750151219, 521, 84.65625)
SaveReal(NewAI_Data, 1750151219, 522, 56.4375)
SaveReal(NewAI_Data, 1750151219, 523, 28.21875)
SaveReal(NewAI_Data, 1750151219, 524, 14.109379768371582)
SaveReal(NewAI_Data, 1750151219, 525, 28.21875)
SaveReal(NewAI_Data, 1750151219, 526, 28.21875)
SaveReal(NewAI_Data, 1750151219, 527, 14.109379768371582)
SaveReal(NewAI_Data, 1750151219, 550, 26.25)
SaveReal(NewAI_Data, 1750151219, 551, 78.75)
SaveReal(NewAI_Data, 1750151219, 552, 52.5)
SaveReal(NewAI_Data, 1750151219, 553, 26.25)
SaveReal(NewAI_Data, 1750151219, 554, 13.125)
SaveReal(NewAI_Data, 1750151219, 555, 26.25)
SaveReal(NewAI_Data, 1750151219, 556, 26.25)
SaveReal(NewAI_Data, 1750151219, 557, 13.125)
SaveReal(NewAI_Data, 1750151219, 560, 0.0)
SaveReal(NewAI_Data, 1750151219, 561, 0.0)
SaveReal(NewAI_Data, 1750151219, 562, 0.0)
SaveReal(NewAI_Data, 1750151219, 563, 0.0)
SaveReal(NewAI_Data, 1750151219, 564, 0.0)
SaveReal(NewAI_Data, 1750151219, 565, 0.0)
SaveReal(NewAI_Data, 1750151219, 566, 0.0)
SaveReal(NewAI_Data, 1750151219, 567, 0.0)
SaveInteger(NewAI_Data, 1750151219, 1, 0)
SaveInteger(NewAI_Data, 1750151219, 2, 1500)
SaveInteger(NewAI_Data, 1750151219, 5, 1)
SaveInteger(NewAI_Data, 1750151219, 9, 150)
SaveReal(NewAI_Data, 1750151219, 501, 150.0)
SaveInteger(NewAI_Data, 1750151219, 100, 1750151472)
NewAI_CatalogUnit(1750151220, 0, 1500, 3, 2, 4, 0, 1, 1, 100, "GER Panzer IV Tank(1)")
SaveInteger(NewAI_Data, 1750151220, 100, 1750151473)
SaveInteger(NewAI_Data, 1750151220, 101, 1750151474)
SaveInteger(NewAI_Data, 1750151220, 102, 1750151475)
SaveInteger(NewAI_Data, 1750151220, 103, 1750151476)
SaveReal(NewAI_Data, 1750151220, 500, 800.0)
SaveReal(NewAI_Data, 1750151220, 501, 600.0)
SaveReal(NewAI_Data, 1750151220, 502, 0.0)
SaveReal(NewAI_Data, 1750151220, 530, 65.5)
SaveReal(NewAI_Data, 1750151220, 531, 65.5)
SaveReal(NewAI_Data, 1750151220, 510, 0.0)
SaveReal(NewAI_Data, 1750151220, 511, 0.0)
SaveReal(NewAI_Data, 1750151220, 512, 800.0)
SaveReal(NewAI_Data, 1750151220, 513, 0.0)
SaveReal(NewAI_Data, 1750151220, 514, 0.0)
SaveReal(NewAI_Data, 1750151220, 515, 0.0)
SaveReal(NewAI_Data, 1750151220, 516, 0.0)
SaveReal(NewAI_Data, 1750151220, 517, 0.0)
end

function Petain63_AIData4()
SaveReal(NewAI_Data, 1750151220, 520, 70.4124984741211)
SaveReal(NewAI_Data, 1750151220, 521, 211.2375030517578)
SaveReal(NewAI_Data, 1750151220, 522, 140.8249969482422)
SaveReal(NewAI_Data, 1750151220, 523, 70.4124984741211)
SaveReal(NewAI_Data, 1750151220, 524, 35.20624923706055)
SaveReal(NewAI_Data, 1750151220, 525, 70.4124984741211)
SaveReal(NewAI_Data, 1750151220, 526, 70.4124984741211)
SaveReal(NewAI_Data, 1750151220, 527, 35.20624923706055)
SaveReal(NewAI_Data, 1750151220, 550, 65.5)
SaveReal(NewAI_Data, 1750151220, 551, 196.5)
SaveReal(NewAI_Data, 1750151220, 552, 131.0)
SaveReal(NewAI_Data, 1750151220, 553, 65.5)
SaveReal(NewAI_Data, 1750151220, 554, 32.75)
SaveReal(NewAI_Data, 1750151220, 555, 65.5)
SaveReal(NewAI_Data, 1750151220, 556, 65.5)
SaveReal(NewAI_Data, 1750151220, 557, 32.75)
SaveReal(NewAI_Data, 1750151220, 560, 0.0)
SaveReal(NewAI_Data, 1750151220, 561, 0.0)
SaveReal(NewAI_Data, 1750151220, 562, 0.0)
SaveReal(NewAI_Data, 1750151220, 563, 0.0)
SaveReal(NewAI_Data, 1750151220, 564, 0.0)
SaveReal(NewAI_Data, 1750151220, 565, 0.0)
SaveReal(NewAI_Data, 1750151220, 566, 0.0)
SaveReal(NewAI_Data, 1750151220, 567, 0.0)
SaveInteger(NewAI_Data, 1750151220, 1, 0)
SaveInteger(NewAI_Data, 1750151220, 2, 2000)
SaveInteger(NewAI_Data, 1750151220, 5, 4)
SaveInteger(NewAI_Data, 1750151220, 9, 200)
SaveReal(NewAI_Data, 1750151220, 501, 200.0)
SaveInteger(NewAI_Data, 1750151220, 100, 1750151473)
SaveInteger(NewAI_Data, 1750151220, 101, 1750151474)
SaveInteger(NewAI_Data, 1750151220, 102, 1750151475)
SaveInteger(NewAI_Data, 1750151220, 103, 1750151476)
NewAI_CatalogUnit(1750151221, 300, 0, 3, 2, 3, 0, 6, 1, 300, "GER Werhmacht Motorbike(6)")
SaveInteger(NewAI_Data, 1750151221, 100, 1750151477)
SaveInteger(NewAI_Data, 1750151221, 101, 1750151478)
SaveInteger(NewAI_Data, 1750151221, 102, 1750151479)
SaveReal(NewAI_Data, 1750151221, 500, 1320.0)
SaveReal(NewAI_Data, 1750151221, 501, 550.0)
SaveReal(NewAI_Data, 1750151221, 502, 0.0)
SaveReal(NewAI_Data, 1750151221, 530, 66.42857360839844)
SaveReal(NewAI_Data, 1750151221, 531, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 510, 0.0)
SaveReal(NewAI_Data, 1750151221, 511, 1320.0)
SaveReal(NewAI_Data, 1750151221, 512, 0.0)
SaveReal(NewAI_Data, 1750151221, 513, 0.0)
SaveReal(NewAI_Data, 1750151221, 514, 0.0)
SaveReal(NewAI_Data, 1750151221, 515, 0.0)
SaveReal(NewAI_Data, 1750151221, 516, 0.0)
SaveReal(NewAI_Data, 1750151221, 517, 0.0)
end

function Petain63_AIData5()
SaveReal(NewAI_Data, 1750151221, 520, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 521, 66.42857360839844)
SaveReal(NewAI_Data, 1750151221, 522, 39.857139587402344)
SaveReal(NewAI_Data, 1750151221, 523, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 524, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 525, 66.42857360839844)
SaveReal(NewAI_Data, 1750151221, 526, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 527, 199.2857208251953)
SaveReal(NewAI_Data, 1750151221, 550, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 551, 66.42857360839844)
SaveReal(NewAI_Data, 1750151221, 552, 39.857139587402344)
SaveReal(NewAI_Data, 1750151221, 553, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 554, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 555, 66.42857360839844)
SaveReal(NewAI_Data, 1750151221, 556, 132.85714721679688)
SaveReal(NewAI_Data, 1750151221, 557, 199.2857208251953)
SaveReal(NewAI_Data, 1750151221, 560, 0.0)
SaveReal(NewAI_Data, 1750151221, 561, 0.0)
SaveReal(NewAI_Data, 1750151221, 562, 0.0)
SaveReal(NewAI_Data, 1750151221, 563, 0.0)
SaveReal(NewAI_Data, 1750151221, 564, 0.0)
SaveReal(NewAI_Data, 1750151221, 565, 0.0)
SaveReal(NewAI_Data, 1750151221, 566, 0.0)
SaveReal(NewAI_Data, 1750151221, 567, 0.0)
SaveInteger(NewAI_Data, 1750151221, 1, 300)
SaveInteger(NewAI_Data, 1750151221, 2, 500)
SaveInteger(NewAI_Data, 1750151221, 5, 3)
SaveInteger(NewAI_Data, 1750151221, 9, 350)
SaveReal(NewAI_Data, 1750151221, 501, 350.0)
SaveInteger(NewAI_Data, 1750151221, 100, 1750151477)
SaveInteger(NewAI_Data, 1750151221, 101, 1750151478)
SaveInteger(NewAI_Data, 1750151221, 102, 1750151479)
NewAI_CatalogUnit(1750151222, 0, 1000, 3, 1, 4, 0, 8, 1, 100, "GER Luftwaffe Infantry (8)")
SaveInteger(NewAI_Data, 1750151222, 100, 1750151480)
SaveInteger(NewAI_Data, 1750151222, 101, 1750151481)
SaveInteger(NewAI_Data, 1750151222, 102, 1750151728)
SaveInteger(NewAI_Data, 1750151222, 103, 1750151729)
SaveReal(NewAI_Data, 1750151222, 500, 2400.0)
SaveReal(NewAI_Data, 1750151222, 501, 525.0)
SaveReal(NewAI_Data, 1750151222, 502, 0.0)
SaveReal(NewAI_Data, 1750151222, 530, 36.212120056152344)
SaveReal(NewAI_Data, 1750151222, 531, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 510, 2400.0)
SaveReal(NewAI_Data, 1750151222, 511, 0.0)
SaveReal(NewAI_Data, 1750151222, 512, 0.0)
SaveReal(NewAI_Data, 1750151222, 513, 0.0)
SaveReal(NewAI_Data, 1750151222, 514, 0.0)
SaveReal(NewAI_Data, 1750151222, 515, 0.0)
SaveReal(NewAI_Data, 1750151222, 516, 0.0)
SaveReal(NewAI_Data, 1750151222, 517, 0.0)
end

function Petain63_AIData6()
SaveReal(NewAI_Data, 1750151222, 520, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 521, 36.212120056152344)
SaveReal(NewAI_Data, 1750151222, 522, 21.727270126342773)
SaveReal(NewAI_Data, 1750151222, 523, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 524, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 525, 36.212120056152344)
SaveReal(NewAI_Data, 1750151222, 526, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 527, 108.63636016845703)
SaveReal(NewAI_Data, 1750151222, 550, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 551, 36.212120056152344)
SaveReal(NewAI_Data, 1750151222, 552, 21.727270126342773)
SaveReal(NewAI_Data, 1750151222, 553, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 554, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 555, 36.212120056152344)
SaveReal(NewAI_Data, 1750151222, 556, 72.42424011230469)
SaveReal(NewAI_Data, 1750151222, 557, 108.63636016845703)
SaveReal(NewAI_Data, 1750151222, 560, 0.0)
SaveReal(NewAI_Data, 1750151222, 561, 0.0)
SaveReal(NewAI_Data, 1750151222, 562, 0.0)
SaveReal(NewAI_Data, 1750151222, 563, 0.0)
SaveReal(NewAI_Data, 1750151222, 564, 0.0)
SaveReal(NewAI_Data, 1750151222, 565, 0.0)
SaveReal(NewAI_Data, 1750151222, 566, 0.0)
SaveReal(NewAI_Data, 1750151222, 567, 0.0)
SaveInteger(NewAI_Data, 1750151222, 1, 0)
SaveInteger(NewAI_Data, 1750151222, 2, 1500)
SaveInteger(NewAI_Data, 1750151222, 5, 4)
SaveInteger(NewAI_Data, 1750151222, 9, 150)
SaveReal(NewAI_Data, 1750151222, 501, 150.0)
SaveInteger(NewAI_Data, 1750151222, 100, 1750151480)
SaveInteger(NewAI_Data, 1750151222, 101, 1750151481)
SaveInteger(NewAI_Data, 1750151222, 102, 1750151728)
SaveInteger(NewAI_Data, 1750151222, 103, 1750151729)
NewAI_CatalogUnit(1750151223, 200, 0, 3, 3, 0, 0, 1, 1, 200, "GER 15cm SFH 18")
SaveReal(NewAI_Data, 1750151223, 500, 200.0)
SaveReal(NewAI_Data, 1750151223, 501, 1200.0)
SaveReal(NewAI_Data, 1750151223, 502, 0.0)
SaveReal(NewAI_Data, 1750151223, 530, 31.25)
SaveReal(NewAI_Data, 1750151223, 531, 31.25)
SaveReal(NewAI_Data, 1750151223, 510, 0.0)
SaveReal(NewAI_Data, 1750151223, 511, 200.0)
SaveReal(NewAI_Data, 1750151223, 512, 0.0)
SaveReal(NewAI_Data, 1750151223, 513, 0.0)
SaveReal(NewAI_Data, 1750151223, 514, 0.0)
SaveReal(NewAI_Data, 1750151223, 515, 0.0)
SaveReal(NewAI_Data, 1750151223, 516, 0.0)
SaveReal(NewAI_Data, 1750151223, 517, 0.0)
SaveReal(NewAI_Data, 1750151223, 520, 35.15625)
SaveReal(NewAI_Data, 1750151223, 521, 70.3125)
SaveReal(NewAI_Data, 1750151223, 522, 35.15625)
end

function Petain63_AIData7()
SaveReal(NewAI_Data, 1750151223, 523, 35.15625)
SaveReal(NewAI_Data, 1750151223, 524, 70.3125)
SaveReal(NewAI_Data, 1750151223, 525, 35.15625)
SaveReal(NewAI_Data, 1750151223, 526, 35.15625)
SaveReal(NewAI_Data, 1750151223, 527, 35.15625)
SaveReal(NewAI_Data, 1750151223, 550, 31.25)
SaveReal(NewAI_Data, 1750151223, 551, 62.5)
SaveReal(NewAI_Data, 1750151223, 552, 31.25)
SaveReal(NewAI_Data, 1750151223, 553, 31.25)
SaveReal(NewAI_Data, 1750151223, 554, 62.5)
SaveReal(NewAI_Data, 1750151223, 555, 31.25)
SaveReal(NewAI_Data, 1750151223, 556, 31.25)
SaveReal(NewAI_Data, 1750151223, 557, 31.25)
SaveReal(NewAI_Data, 1750151223, 560, 0.0)
SaveReal(NewAI_Data, 1750151223, 561, 0.0)
SaveReal(NewAI_Data, 1750151223, 562, 0.0)
SaveReal(NewAI_Data, 1750151223, 563, 0.0)
SaveReal(NewAI_Data, 1750151223, 564, 0.0)
SaveReal(NewAI_Data, 1750151223, 565, 0.0)
SaveReal(NewAI_Data, 1750151223, 566, 0.0)
SaveReal(NewAI_Data, 1750151223, 567, 0.0)
SaveInteger(NewAI_Data, 1750151223, 1, 200)
SaveInteger(NewAI_Data, 1750151223, 2, 500)
SaveInteger(NewAI_Data, 1750151223, 5, 0)
SaveInteger(NewAI_Data, 1750151223, 9, 600)
SaveReal(NewAI_Data, 1750151223, 501, 600.0)
NewAI_CatalogUnit(1750151224, 0, 1500, 3, 3, 1, 0, 1, 1, 100, "GER 10.5cm Wespe")
SaveInteger(NewAI_Data, 1750151224, 100, 1750151730)
SaveReal(NewAI_Data, 1750151224, 500, 500.0)
SaveReal(NewAI_Data, 1750151224, 501, 1200.0)
SaveReal(NewAI_Data, 1750151224, 502, 0.0)
SaveReal(NewAI_Data, 1750151224, 530, 35.0)
SaveReal(NewAI_Data, 1750151224, 531, 35.0)
SaveReal(NewAI_Data, 1750151224, 510, 0.0)
SaveReal(NewAI_Data, 1750151224, 511, 0.0)
SaveReal(NewAI_Data, 1750151224, 512, 500.0)
SaveReal(NewAI_Data, 1750151224, 513, 0.0)
SaveReal(NewAI_Data, 1750151224, 514, 0.0)
SaveReal(NewAI_Data, 1750151224, 515, 0.0)
SaveReal(NewAI_Data, 1750151224, 516, 0.0)
SaveReal(NewAI_Data, 1750151224, 517, 0.0)
SaveReal(NewAI_Data, 1750151224, 520, 39.375)
SaveReal(NewAI_Data, 1750151224, 521, 78.75)
SaveReal(NewAI_Data, 1750151224, 522, 39.375)
SaveReal(NewAI_Data, 1750151224, 523, 39.375)
SaveReal(NewAI_Data, 1750151224, 524, 78.75)
SaveReal(NewAI_Data, 1750151224, 525, 39.375)
SaveReal(NewAI_Data, 1750151224, 526, 39.375)
SaveReal(NewAI_Data, 1750151224, 527, 39.375)
SaveReal(NewAI_Data, 1750151224, 550, 35.0)
end

function Petain63_AIData8()
SaveReal(NewAI_Data, 1750151224, 551, 70.0)
SaveReal(NewAI_Data, 1750151224, 552, 35.0)
SaveReal(NewAI_Data, 1750151224, 553, 35.0)
SaveReal(NewAI_Data, 1750151224, 554, 70.0)
SaveReal(NewAI_Data, 1750151224, 555, 35.0)
SaveReal(NewAI_Data, 1750151224, 556, 35.0)
SaveReal(NewAI_Data, 1750151224, 557, 35.0)
SaveReal(NewAI_Data, 1750151224, 560, 0.0)
SaveReal(NewAI_Data, 1750151224, 561, 0.0)
SaveReal(NewAI_Data, 1750151224, 562, 0.0)
SaveReal(NewAI_Data, 1750151224, 563, 0.0)
SaveReal(NewAI_Data, 1750151224, 564, 0.0)
SaveReal(NewAI_Data, 1750151224, 565, 0.0)
SaveReal(NewAI_Data, 1750151224, 566, 0.0)
SaveReal(NewAI_Data, 1750151224, 567, 0.0)
SaveInteger(NewAI_Data, 1750151224, 1, 0)
SaveInteger(NewAI_Data, 1750151224, 2, 2000)
SaveInteger(NewAI_Data, 1750151224, 5, 1)
SaveInteger(NewAI_Data, 1750151224, 9, 550)
SaveReal(NewAI_Data, 1750151224, 501, 550.0)
SaveInteger(NewAI_Data, 1750151224, 100, 1750151730)
NewAI_CatalogUnit(1750151225, 0, 5000, 3, 3, 0, 1, 1, 1, 250, "GER LandKreuzer P.1500 Monster")
SaveInteger(NewAI_Data, 1750151225, 200, 1378889776)
SaveInteger(NewAI_Data, 1750151225, 300, 1)
SaveReal(NewAI_Data, 1750151225, 500, 15000.0)
SaveReal(NewAI_Data, 1750151225, 501, 1500.0)
SaveReal(NewAI_Data, 1750151225, 502, 0.0)
SaveReal(NewAI_Data, 1750151225, 530, 274.75)
SaveReal(NewAI_Data, 1750151225, 531, 274.75)
SaveReal(NewAI_Data, 1750151225, 510, 0.0)
SaveReal(NewAI_Data, 1750151225, 511, 0.0)
SaveReal(NewAI_Data, 1750151225, 512, 15000.0)
SaveReal(NewAI_Data, 1750151225, 513, 0.0)
SaveReal(NewAI_Data, 1750151225, 514, 0.0)
SaveReal(NewAI_Data, 1750151225, 515, 0.0)
SaveReal(NewAI_Data, 1750151225, 516, 0.0)
SaveReal(NewAI_Data, 1750151225, 517, 0.0)
SaveReal(NewAI_Data, 1750151225, 520, 343.4375)
SaveReal(NewAI_Data, 1750151225, 521, 686.875)
SaveReal(NewAI_Data, 1750151225, 522, 343.4375)
SaveReal(NewAI_Data, 1750151225, 523, 343.4375)
SaveReal(NewAI_Data, 1750151225, 524, 686.875)
SaveReal(NewAI_Data, 1750151225, 525, 343.4375)
SaveReal(NewAI_Data, 1750151225, 526, 343.4375)
SaveReal(NewAI_Data, 1750151225, 527, 343.4375)
SaveReal(NewAI_Data, 1750151225, 550, 274.75)
SaveReal(NewAI_Data, 1750151225, 551, 549.5)
SaveReal(NewAI_Data, 1750151225, 552, 274.75)
SaveReal(NewAI_Data, 1750151225, 553, 274.75)
SaveReal(NewAI_Data, 1750151225, 554, 549.5)
end

function Petain63_AIData9()
SaveReal(NewAI_Data, 1750151225, 555, 274.75)
SaveReal(NewAI_Data, 1750151225, 556, 274.75)
SaveReal(NewAI_Data, 1750151225, 557, 274.75)
SaveReal(NewAI_Data, 1750151225, 560, 0.0)
SaveReal(NewAI_Data, 1750151225, 561, 0.0)
SaveReal(NewAI_Data, 1750151225, 562, 0.0)
SaveReal(NewAI_Data, 1750151225, 563, 0.0)
SaveReal(NewAI_Data, 1750151225, 564, 0.0)
SaveReal(NewAI_Data, 1750151225, 565, 0.0)
SaveReal(NewAI_Data, 1750151225, 566, 0.0)
SaveReal(NewAI_Data, 1750151225, 567, 0.0)
SaveInteger(NewAI_Data, 1750151225, 1, 0)
SaveInteger(NewAI_Data, 1750151225, 2, 5500)
SaveInteger(NewAI_Data, 1750151225, 5, 0)
SaveInteger(NewAI_Data, 1750151225, 9, 2100)
SaveReal(NewAI_Data, 1750151225, 501, 2100.0)
NewAI_CatalogUnit(1750151472, 0, 1000, 3, 2, 0, 1, 1, 1, 100, "GER Afrika Korps Panzer II Tank(1)")
SaveInteger(NewAI_Data, 1750151472, 200, 1747993682)
SaveInteger(NewAI_Data, 1750151472, 300, 1)
SaveReal(NewAI_Data, 1750151472, 500, 600.0)
SaveReal(NewAI_Data, 1750151472, 501, 550.0)
SaveReal(NewAI_Data, 1750151472, 502, 0.0)
SaveReal(NewAI_Data, 1750151472, 530, 31.25)
SaveReal(NewAI_Data, 1750151472, 531, 31.25)
SaveReal(NewAI_Data, 1750151472, 510, 0.0)
SaveReal(NewAI_Data, 1750151472, 511, 0.0)
SaveReal(NewAI_Data, 1750151472, 512, 600.0)
SaveReal(NewAI_Data, 1750151472, 513, 0.0)
SaveReal(NewAI_Data, 1750151472, 514, 0.0)
SaveReal(NewAI_Data, 1750151472, 515, 0.0)
SaveReal(NewAI_Data, 1750151472, 516, 0.0)
SaveReal(NewAI_Data, 1750151472, 517, 0.0)
SaveReal(NewAI_Data, 1750151472, 520, 33.59375)
SaveReal(NewAI_Data, 1750151472, 521, 100.78125)
SaveReal(NewAI_Data, 1750151472, 522, 67.1875)
SaveReal(NewAI_Data, 1750151472, 523, 33.59375)
SaveReal(NewAI_Data, 1750151472, 524, 16.7968807220459)
SaveReal(NewAI_Data, 1750151472, 525, 33.59375)
SaveReal(NewAI_Data, 1750151472, 526, 33.59375)
SaveReal(NewAI_Data, 1750151472, 527, 16.7968807220459)
SaveReal(NewAI_Data, 1750151472, 550, 31.25)
SaveReal(NewAI_Data, 1750151472, 551, 93.75)
SaveReal(NewAI_Data, 1750151472, 552, 62.5)
SaveReal(NewAI_Data, 1750151472, 553, 31.25)
SaveReal(NewAI_Data, 1750151472, 554, 15.625)
SaveReal(NewAI_Data, 1750151472, 555, 31.25)
SaveReal(NewAI_Data, 1750151472, 556, 31.25)
SaveReal(NewAI_Data, 1750151472, 557, 15.625)
SaveReal(NewAI_Data, 1750151472, 560, 0.0)
SaveReal(NewAI_Data, 1750151472, 561, 0.0)
end

function Petain63_AIData10()
SaveReal(NewAI_Data, 1750151472, 562, 0.0)
SaveReal(NewAI_Data, 1750151472, 563, 0.0)
SaveReal(NewAI_Data, 1750151472, 564, 0.0)
SaveReal(NewAI_Data, 1750151472, 565, 0.0)
SaveReal(NewAI_Data, 1750151472, 566, 0.0)
SaveReal(NewAI_Data, 1750151472, 567, 0.0)
SaveInteger(NewAI_Data, 1750151472, 1, 0)
SaveInteger(NewAI_Data, 1750151472, 2, 1500)
SaveInteger(NewAI_Data, 1750151472, 5, 0)
SaveInteger(NewAI_Data, 1750151472, 9, 300)
SaveReal(NewAI_Data, 1750151472, 501, 300.0)
NewAI_CatalogUnit(1750151473, 0, 0, 3, 2, 3, 1, 1, 1, 100, "GER Afrika Korps Panzer IV Tank(1)")
SaveInteger(NewAI_Data, 1750151473, 200, 1747993682)
SaveInteger(NewAI_Data, 1750151473, 300, 1)
SaveInteger(NewAI_Data, 1750151473, 100, 1750151474)
SaveInteger(NewAI_Data, 1750151473, 101, 1750151731)
SaveInteger(NewAI_Data, 1750151473, 102, 1750151476)
SaveReal(NewAI_Data, 1750151473, 500, 900.0)
SaveReal(NewAI_Data, 1750151473, 501, 600.0)
SaveReal(NewAI_Data, 1750151473, 502, 0.0)
SaveReal(NewAI_Data, 1750151473, 530, 80.5)
SaveReal(NewAI_Data, 1750151473, 531, 80.5)
SaveReal(NewAI_Data, 1750151473, 510, 0.0)
SaveReal(NewAI_Data, 1750151473, 511, 0.0)
SaveReal(NewAI_Data, 1750151473, 512, 900.0)
SaveReal(NewAI_Data, 1750151473, 513, 0.0)
SaveReal(NewAI_Data, 1750151473, 514, 0.0)
SaveReal(NewAI_Data, 1750151473, 515, 0.0)
SaveReal(NewAI_Data, 1750151473, 516, 0.0)
SaveReal(NewAI_Data, 1750151473, 517, 0.0)
SaveReal(NewAI_Data, 1750151473, 520, 86.5374984741211)
SaveReal(NewAI_Data, 1750151473, 521, 259.61248779296875)
SaveReal(NewAI_Data, 1750151473, 522, 173.0749969482422)
SaveReal(NewAI_Data, 1750151473, 523, 86.5374984741211)
SaveReal(NewAI_Data, 1750151473, 524, 43.26874923706055)
SaveReal(NewAI_Data, 1750151473, 525, 86.5374984741211)
SaveReal(NewAI_Data, 1750151473, 526, 86.5374984741211)
SaveReal(NewAI_Data, 1750151473, 527, 43.26874923706055)
SaveReal(NewAI_Data, 1750151473, 550, 80.5)
SaveReal(NewAI_Data, 1750151473, 551, 241.5)
SaveReal(NewAI_Data, 1750151473, 552, 161.0)
SaveReal(NewAI_Data, 1750151473, 553, 80.5)
SaveReal(NewAI_Data, 1750151473, 554, 40.25)
SaveReal(NewAI_Data, 1750151473, 555, 80.5)
SaveReal(NewAI_Data, 1750151473, 556, 80.5)
SaveReal(NewAI_Data, 1750151473, 557, 40.25)
SaveReal(NewAI_Data, 1750151473, 560, 0.0)
SaveReal(NewAI_Data, 1750151473, 561, 0.0)
SaveReal(NewAI_Data, 1750151473, 562, 0.0)
SaveReal(NewAI_Data, 1750151473, 563, 0.0)
end

function Petain63_AIData11()
SaveReal(NewAI_Data, 1750151473, 564, 0.0)
SaveReal(NewAI_Data, 1750151473, 565, 0.0)
SaveReal(NewAI_Data, 1750151473, 566, 0.0)
SaveReal(NewAI_Data, 1750151473, 567, 0.0)
SaveInteger(NewAI_Data, 1750151473, 1, 0)
SaveInteger(NewAI_Data, 1750151473, 2, 500)
SaveInteger(NewAI_Data, 1750151473, 5, 3)
SaveInteger(NewAI_Data, 1750151473, 9, 250)
SaveReal(NewAI_Data, 1750151473, 501, 250.0)
SaveInteger(NewAI_Data, 1750151473, 100, 1750151474)
SaveInteger(NewAI_Data, 1750151473, 101, 1750151731)
SaveInteger(NewAI_Data, 1750151473, 102, 1750151476)
NewAI_CatalogUnit(1750151474, 0, 500, 3, 2, 1, 0, 1, 1, 100, "GER StuG III(1)")
SaveInteger(NewAI_Data, 1750151474, 100, 1750151732)
SaveReal(NewAI_Data, 1750151474, 500, 600.0)
SaveReal(NewAI_Data, 1750151474, 501, 800.0)
SaveReal(NewAI_Data, 1750151474, 502, 0.0)
SaveReal(NewAI_Data, 1750151474, 530, 90.5)
SaveReal(NewAI_Data, 1750151474, 531, 90.5)
SaveReal(NewAI_Data, 1750151474, 510, 0.0)
SaveReal(NewAI_Data, 1750151474, 511, 0.0)
SaveReal(NewAI_Data, 1750151474, 512, 600.0)
SaveReal(NewAI_Data, 1750151474, 513, 0.0)
SaveReal(NewAI_Data, 1750151474, 514, 0.0)
SaveReal(NewAI_Data, 1750151474, 515, 0.0)
SaveReal(NewAI_Data, 1750151474, 516, 0.0)
SaveReal(NewAI_Data, 1750151474, 517, 0.0)
SaveReal(NewAI_Data, 1750151474, 520, 97.2874984741211)
SaveReal(NewAI_Data, 1750151474, 521, 291.86248779296875)
SaveReal(NewAI_Data, 1750151474, 522, 194.5749969482422)
SaveReal(NewAI_Data, 1750151474, 523, 97.2874984741211)
SaveReal(NewAI_Data, 1750151474, 524, 48.64374923706055)
SaveReal(NewAI_Data, 1750151474, 525, 97.2874984741211)
SaveReal(NewAI_Data, 1750151474, 526, 97.2874984741211)
SaveReal(NewAI_Data, 1750151474, 527, 48.64374923706055)
SaveReal(NewAI_Data, 1750151474, 550, 90.5)
SaveReal(NewAI_Data, 1750151474, 551, 271.5)
SaveReal(NewAI_Data, 1750151474, 552, 181.0)
SaveReal(NewAI_Data, 1750151474, 553, 90.5)
SaveReal(NewAI_Data, 1750151474, 554, 45.25)
SaveReal(NewAI_Data, 1750151474, 555, 90.5)
SaveReal(NewAI_Data, 1750151474, 556, 90.5)
SaveReal(NewAI_Data, 1750151474, 557, 45.25)
SaveReal(NewAI_Data, 1750151474, 560, 0.0)
SaveReal(NewAI_Data, 1750151474, 561, 0.0)
SaveReal(NewAI_Data, 1750151474, 562, 0.0)
SaveReal(NewAI_Data, 1750151474, 563, 0.0)
SaveReal(NewAI_Data, 1750151474, 564, 0.0)
SaveReal(NewAI_Data, 1750151474, 565, 0.0)
SaveReal(NewAI_Data, 1750151474, 566, 0.0)
end

function Petain63_AIData12()
SaveReal(NewAI_Data, 1750151474, 567, 0.0)
SaveInteger(NewAI_Data, 1750151474, 1, 0)
SaveInteger(NewAI_Data, 1750151474, 2, 1000)
SaveInteger(NewAI_Data, 1750151474, 5, 1)
SaveInteger(NewAI_Data, 1750151474, 9, 300)
SaveReal(NewAI_Data, 1750151474, 501, 300.0)
SaveInteger(NewAI_Data, 1750151474, 100, 1750151732)
NewAI_CatalogUnit(1750151475, 0, 2500, 3, 2, 1, 0, 1, 1, 125, "GER Tiger Tank(1)")
SaveInteger(NewAI_Data, 1750151475, 100, 1750151731)
SaveReal(NewAI_Data, 1750151475, 500, 3000.0)
SaveReal(NewAI_Data, 1750151475, 501, 600.0)
SaveReal(NewAI_Data, 1750151475, 502, 0.0)
SaveReal(NewAI_Data, 1750151475, 530, 125.5)
SaveReal(NewAI_Data, 1750151475, 531, 125.5)
SaveReal(NewAI_Data, 1750151475, 510, 0.0)
SaveReal(NewAI_Data, 1750151475, 511, 0.0)
SaveReal(NewAI_Data, 1750151475, 512, 3000.0)
SaveReal(NewAI_Data, 1750151475, 513, 0.0)
SaveReal(NewAI_Data, 1750151475, 514, 0.0)
SaveReal(NewAI_Data, 1750151475, 515, 0.0)
SaveReal(NewAI_Data, 1750151475, 516, 0.0)
SaveReal(NewAI_Data, 1750151475, 517, 0.0)
SaveReal(NewAI_Data, 1750151475, 520, 134.91250610351562)
SaveReal(NewAI_Data, 1750151475, 521, 404.73748779296875)
SaveReal(NewAI_Data, 1750151475, 522, 269.82501220703125)
SaveReal(NewAI_Data, 1750151475, 523, 134.91250610351562)
SaveReal(NewAI_Data, 1750151475, 524, 67.45625305175781)
SaveReal(NewAI_Data, 1750151475, 525, 134.91250610351562)
SaveReal(NewAI_Data, 1750151475, 526, 134.91250610351562)
SaveReal(NewAI_Data, 1750151475, 527, 67.45625305175781)
SaveReal(NewAI_Data, 1750151475, 550, 125.5)
SaveReal(NewAI_Data, 1750151475, 551, 376.5)
SaveReal(NewAI_Data, 1750151475, 552, 251.0)
SaveReal(NewAI_Data, 1750151475, 553, 125.5)
SaveReal(NewAI_Data, 1750151475, 554, 62.75)
SaveReal(NewAI_Data, 1750151475, 555, 125.5)
SaveReal(NewAI_Data, 1750151475, 556, 125.5)
SaveReal(NewAI_Data, 1750151475, 557, 62.75)
SaveReal(NewAI_Data, 1750151475, 560, 0.0)
SaveReal(NewAI_Data, 1750151475, 561, 0.0)
SaveReal(NewAI_Data, 1750151475, 562, 0.0)
SaveReal(NewAI_Data, 1750151475, 563, 0.0)
SaveReal(NewAI_Data, 1750151475, 564, 0.0)
SaveReal(NewAI_Data, 1750151475, 565, 0.0)
SaveReal(NewAI_Data, 1750151475, 566, 0.0)
SaveReal(NewAI_Data, 1750151475, 567, 0.0)
SaveInteger(NewAI_Data, 1750151475, 1, 0)
SaveInteger(NewAI_Data, 1750151475, 2, 3000)
SaveInteger(NewAI_Data, 1750151475, 5, 1)
SaveInteger(NewAI_Data, 1750151475, 9, 500)
end

function Petain63_AIData13()
SaveReal(NewAI_Data, 1750151475, 501, 500.0)
SaveInteger(NewAI_Data, 1750151475, 100, 1750151731)
NewAI_CatalogUnit(1750151476, 0, 1000, 3, 2, 1, 0, 1, 1, 100, "GER Panzer V Panther Tank(1)")
SaveInteger(NewAI_Data, 1750151476, 100, 1750151733)
SaveReal(NewAI_Data, 1750151476, 500, 1800.0)
SaveReal(NewAI_Data, 1750151476, 501, 600.0)
SaveReal(NewAI_Data, 1750151476, 502, 0.0)
SaveReal(NewAI_Data, 1750151476, 530, 100.5)
SaveReal(NewAI_Data, 1750151476, 531, 100.5)
SaveReal(NewAI_Data, 1750151476, 510, 0.0)
SaveReal(NewAI_Data, 1750151476, 511, 0.0)
SaveReal(NewAI_Data, 1750151476, 512, 1800.0)
SaveReal(NewAI_Data, 1750151476, 513, 0.0)
SaveReal(NewAI_Data, 1750151476, 514, 0.0)
SaveReal(NewAI_Data, 1750151476, 515, 0.0)
SaveReal(NewAI_Data, 1750151476, 516, 0.0)
SaveReal(NewAI_Data, 1750151476, 517, 0.0)
SaveReal(NewAI_Data, 1750151476, 520, 108.0374984741211)
SaveReal(NewAI_Data, 1750151476, 521, 324.11248779296875)
SaveReal(NewAI_Data, 1750151476, 522, 216.0749969482422)
SaveReal(NewAI_Data, 1750151476, 523, 108.0374984741211)
SaveReal(NewAI_Data, 1750151476, 524, 54.01874923706055)
SaveReal(NewAI_Data, 1750151476, 525, 108.0374984741211)
SaveReal(NewAI_Data, 1750151476, 526, 108.0374984741211)
SaveReal(NewAI_Data, 1750151476, 527, 54.01874923706055)
SaveReal(NewAI_Data, 1750151476, 550, 100.5)
SaveReal(NewAI_Data, 1750151476, 551, 301.5)
SaveReal(NewAI_Data, 1750151476, 552, 201.0)
SaveReal(NewAI_Data, 1750151476, 553, 100.5)
SaveReal(NewAI_Data, 1750151476, 554, 50.25)
SaveReal(NewAI_Data, 1750151476, 555, 100.5)
SaveReal(NewAI_Data, 1750151476, 556, 100.5)
SaveReal(NewAI_Data, 1750151476, 557, 50.25)
SaveReal(NewAI_Data, 1750151476, 560, 0.0)
SaveReal(NewAI_Data, 1750151476, 561, 0.0)
SaveReal(NewAI_Data, 1750151476, 562, 0.0)
SaveReal(NewAI_Data, 1750151476, 563, 0.0)
SaveReal(NewAI_Data, 1750151476, 564, 0.0)
SaveReal(NewAI_Data, 1750151476, 565, 0.0)
SaveReal(NewAI_Data, 1750151476, 566, 0.0)
SaveReal(NewAI_Data, 1750151476, 567, 0.0)
SaveInteger(NewAI_Data, 1750151476, 1, 0)
SaveInteger(NewAI_Data, 1750151476, 2, 1500)
SaveInteger(NewAI_Data, 1750151476, 5, 1)
SaveInteger(NewAI_Data, 1750151476, 9, 350)
SaveReal(NewAI_Data, 1750151476, 501, 350.0)
SaveInteger(NewAI_Data, 1750151476, 100, 1750151733)
NewAI_CatalogUnit(1750151477, 0, 1200, 3, 4, 0, 0, 3, 1, 100, "GER Sd.Kfz 251 AA(3)")
SaveReal(NewAI_Data, 1750151477, 500, 3000.0)
SaveReal(NewAI_Data, 1750151477, 501, 600.0)
end

function Petain63_AIData14()
SaveReal(NewAI_Data, 1750151477, 502, 0.0)
SaveReal(NewAI_Data, 1750151477, 530, 540.0)
SaveReal(NewAI_Data, 1750151477, 531, 162.0)
SaveReal(NewAI_Data, 1750151477, 510, 0.0)
SaveReal(NewAI_Data, 1750151477, 511, 3000.0)
SaveReal(NewAI_Data, 1750151477, 512, 0.0)
SaveReal(NewAI_Data, 1750151477, 513, 0.0)
SaveReal(NewAI_Data, 1750151477, 514, 0.0)
SaveReal(NewAI_Data, 1750151477, 515, 0.0)
SaveReal(NewAI_Data, 1750151477, 516, 0.0)
SaveReal(NewAI_Data, 1750151477, 517, 0.0)
SaveReal(NewAI_Data, 1750151477, 520, 182.25)
SaveReal(NewAI_Data, 1750151477, 521, 364.5)
SaveReal(NewAI_Data, 1750151477, 522, 546.75)
SaveReal(NewAI_Data, 1750151477, 523, 182.25)
SaveReal(NewAI_Data, 1750151477, 524, 364.5)
SaveReal(NewAI_Data, 1750151477, 525, 364.5)
SaveReal(NewAI_Data, 1750151477, 526, 182.25)
SaveReal(NewAI_Data, 1750151477, 527, 91.125)
SaveReal(NewAI_Data, 1750151477, 550, 270.0)
SaveReal(NewAI_Data, 1750151477, 551, 540.0)
SaveReal(NewAI_Data, 1750151477, 552, 810.0)
SaveReal(NewAI_Data, 1750151477, 553, 270.0)
SaveReal(NewAI_Data, 1750151477, 554, 540.0)
SaveReal(NewAI_Data, 1750151477, 555, 540.0)
SaveReal(NewAI_Data, 1750151477, 556, 270.0)
SaveReal(NewAI_Data, 1750151477, 557, 135.0)
SaveReal(NewAI_Data, 1750151477, 560, 0.0)
SaveReal(NewAI_Data, 1750151477, 561, 0.0)
SaveReal(NewAI_Data, 1750151477, 562, 0.0)
SaveReal(NewAI_Data, 1750151477, 563, 0.0)
SaveReal(NewAI_Data, 1750151477, 564, 0.0)
SaveReal(NewAI_Data, 1750151477, 565, 0.0)
SaveReal(NewAI_Data, 1750151477, 566, 0.0)
SaveReal(NewAI_Data, 1750151477, 567, 0.0)
SaveInteger(NewAI_Data, 1750151477, 1, 0)
SaveInteger(NewAI_Data, 1750151477, 2, 1700)
SaveInteger(NewAI_Data, 1750151477, 5, 0)
SaveInteger(NewAI_Data, 1750151477, 9, 520)
SaveReal(NewAI_Data, 1750151477, 501, 520.0)
NewAI_CatalogUnit(1750151478, 0, 750, 3, 2, 0, 0, 3, 1, 100, "GER Sd.Kfz 222(3)")
SaveReal(NewAI_Data, 1750151478, 500, 2700.0)
SaveReal(NewAI_Data, 1750151478, 501, 550.0)
SaveReal(NewAI_Data, 1750151478, 502, 0.0)
SaveReal(NewAI_Data, 1750151478, 530, 210.0)
SaveReal(NewAI_Data, 1750151478, 531, 210.0)
SaveReal(NewAI_Data, 1750151478, 510, 0.0)
SaveReal(NewAI_Data, 1750151478, 511, 2700.0)
SaveReal(NewAI_Data, 1750151478, 512, 0.0)
SaveReal(NewAI_Data, 1750151478, 513, 0.0)
end

function Petain63_AIData15()
SaveReal(NewAI_Data, 1750151478, 514, 0.0)
SaveReal(NewAI_Data, 1750151478, 515, 0.0)
SaveReal(NewAI_Data, 1750151478, 516, 0.0)
SaveReal(NewAI_Data, 1750151478, 517, 0.0)
SaveReal(NewAI_Data, 1750151478, 520, 210.0)
SaveReal(NewAI_Data, 1750151478, 521, 630.0)
SaveReal(NewAI_Data, 1750151478, 522, 420.0)
SaveReal(NewAI_Data, 1750151478, 523, 210.0)
SaveReal(NewAI_Data, 1750151478, 524, 105.0)
SaveReal(NewAI_Data, 1750151478, 525, 210.0)
SaveReal(NewAI_Data, 1750151478, 526, 210.0)
SaveReal(NewAI_Data, 1750151478, 527, 105.0)
SaveReal(NewAI_Data, 1750151478, 550, 210.0)
SaveReal(NewAI_Data, 1750151478, 551, 630.0)
SaveReal(NewAI_Data, 1750151478, 552, 420.0)
SaveReal(NewAI_Data, 1750151478, 553, 210.0)
SaveReal(NewAI_Data, 1750151478, 554, 105.0)
SaveReal(NewAI_Data, 1750151478, 555, 210.0)
SaveReal(NewAI_Data, 1750151478, 556, 210.0)
SaveReal(NewAI_Data, 1750151478, 557, 105.0)
SaveReal(NewAI_Data, 1750151478, 560, 0.0)
SaveReal(NewAI_Data, 1750151478, 561, 0.0)
SaveReal(NewAI_Data, 1750151478, 562, 0.0)
SaveReal(NewAI_Data, 1750151478, 563, 0.0)
SaveReal(NewAI_Data, 1750151478, 564, 0.0)
SaveReal(NewAI_Data, 1750151478, 565, 0.0)
SaveReal(NewAI_Data, 1750151478, 566, 0.0)
SaveReal(NewAI_Data, 1750151478, 567, 0.0)
SaveInteger(NewAI_Data, 1750151478, 1, 0)
SaveInteger(NewAI_Data, 1750151478, 2, 1250)
SaveInteger(NewAI_Data, 1750151478, 5, 0)
SaveInteger(NewAI_Data, 1750151478, 9, 475)
SaveReal(NewAI_Data, 1750151478, 501, 475.0)
NewAI_CatalogUnit(1750151479, 0, 750, 3, 2, 0, 0, 3, 1, 100, "GER Sd.Kfz 251(3)")
SaveReal(NewAI_Data, 1750151479, 500, 2400.0)
SaveReal(NewAI_Data, 1750151479, 501, 550.0)
SaveReal(NewAI_Data, 1750151479, 502, 0.0)
SaveReal(NewAI_Data, 1750151479, 530, 97.5)
SaveReal(NewAI_Data, 1750151479, 531, 195.0)
SaveReal(NewAI_Data, 1750151479, 510, 0.0)
SaveReal(NewAI_Data, 1750151479, 511, 2400.0)
SaveReal(NewAI_Data, 1750151479, 512, 0.0)
SaveReal(NewAI_Data, 1750151479, 513, 0.0)
SaveReal(NewAI_Data, 1750151479, 514, 0.0)
SaveReal(NewAI_Data, 1750151479, 515, 0.0)
SaveReal(NewAI_Data, 1750151479, 516, 0.0)
SaveReal(NewAI_Data, 1750151479, 517, 0.0)
SaveReal(NewAI_Data, 1750151479, 520, 195.0)
SaveReal(NewAI_Data, 1750151479, 521, 97.5)
SaveReal(NewAI_Data, 1750151479, 522, 58.5)
end

function Petain63_AIData16()
SaveReal(NewAI_Data, 1750151479, 523, 195.0)
SaveReal(NewAI_Data, 1750151479, 524, 195.0)
SaveReal(NewAI_Data, 1750151479, 525, 97.5)
SaveReal(NewAI_Data, 1750151479, 526, 195.0)
SaveReal(NewAI_Data, 1750151479, 527, 292.5)
SaveReal(NewAI_Data, 1750151479, 550, 195.0)
SaveReal(NewAI_Data, 1750151479, 551, 97.5)
SaveReal(NewAI_Data, 1750151479, 552, 58.5)
SaveReal(NewAI_Data, 1750151479, 553, 195.0)
SaveReal(NewAI_Data, 1750151479, 554, 195.0)
SaveReal(NewAI_Data, 1750151479, 555, 97.5)
SaveReal(NewAI_Data, 1750151479, 556, 195.0)
SaveReal(NewAI_Data, 1750151479, 557, 292.5)
SaveReal(NewAI_Data, 1750151479, 560, 0.0)
SaveReal(NewAI_Data, 1750151479, 561, 0.0)
SaveReal(NewAI_Data, 1750151479, 562, 0.0)
SaveReal(NewAI_Data, 1750151479, 563, 0.0)
SaveReal(NewAI_Data, 1750151479, 564, 0.0)
SaveReal(NewAI_Data, 1750151479, 565, 0.0)
SaveReal(NewAI_Data, 1750151479, 566, 0.0)
SaveReal(NewAI_Data, 1750151479, 567, 0.0)
SaveInteger(NewAI_Data, 1750151479, 1, 0)
SaveInteger(NewAI_Data, 1750151479, 2, 1250)
SaveInteger(NewAI_Data, 1750151479, 5, 0)
SaveInteger(NewAI_Data, 1750151479, 9, 475)
SaveReal(NewAI_Data, 1750151479, 501, 475.0)
NewAI_CatalogUnit(1750151480, 0, 500, 3, 5, 0, 0, 5, 1, 100, "GER Junkers Stuka(5)")
SaveReal(NewAI_Data, 1750151480, 500, 2000.0)
SaveReal(NewAI_Data, 1750151480, 501, 450.0)
SaveReal(NewAI_Data, 1750151480, 502, 2000.0)
SaveReal(NewAI_Data, 1750151480, 530, 570.0)
SaveReal(NewAI_Data, 1750151480, 531, 285.0)
SaveReal(NewAI_Data, 1750151480, 510, 0.0)
SaveReal(NewAI_Data, 1750151480, 511, 0.0)
SaveReal(NewAI_Data, 1750151480, 512, 0.0)
SaveReal(NewAI_Data, 1750151480, 513, 0.0)
SaveReal(NewAI_Data, 1750151480, 514, 0.0)
SaveReal(NewAI_Data, 1750151480, 515, 2000.0)
SaveReal(NewAI_Data, 1750151480, 516, 0.0)
SaveReal(NewAI_Data, 1750151480, 517, 0.0)
SaveReal(NewAI_Data, 1750151480, 520, 285.0)
SaveReal(NewAI_Data, 1750151480, 521, 570.0)
SaveReal(NewAI_Data, 1750151480, 522, 855.0)
SaveReal(NewAI_Data, 1750151480, 523, 285.0)
SaveReal(NewAI_Data, 1750151480, 524, 570.0)
SaveReal(NewAI_Data, 1750151480, 525, 570.0)
SaveReal(NewAI_Data, 1750151480, 526, 285.0)
SaveReal(NewAI_Data, 1750151480, 527, 142.5)
SaveReal(NewAI_Data, 1750151480, 550, 285.0)
SaveReal(NewAI_Data, 1750151480, 551, 570.0)
end

function Petain63_AIData17()
SaveReal(NewAI_Data, 1750151480, 552, 855.0)
SaveReal(NewAI_Data, 1750151480, 553, 285.0)
SaveReal(NewAI_Data, 1750151480, 554, 570.0)
SaveReal(NewAI_Data, 1750151480, 555, 570.0)
SaveReal(NewAI_Data, 1750151480, 556, 285.0)
SaveReal(NewAI_Data, 1750151480, 557, 142.5)
SaveReal(NewAI_Data, 1750151480, 560, 0.0)
SaveReal(NewAI_Data, 1750151480, 561, 0.0)
SaveReal(NewAI_Data, 1750151480, 562, 0.0)
SaveReal(NewAI_Data, 1750151480, 563, 0.0)
SaveReal(NewAI_Data, 1750151480, 564, 0.0)
SaveReal(NewAI_Data, 1750151480, 565, 2000.0)
SaveReal(NewAI_Data, 1750151480, 566, 0.0)
SaveReal(NewAI_Data, 1750151480, 567, 0.0)
SaveInteger(NewAI_Data, 1750151480, 1, 0)
SaveInteger(NewAI_Data, 1750151480, 2, 1000)
SaveInteger(NewAI_Data, 1750151480, 5, 0)
SaveInteger(NewAI_Data, 1750151480, 9, 250)
SaveReal(NewAI_Data, 1750151480, 501, 250.0)
NewAI_CatalogUnit(1750151481, 0, 500, 3, 5, 0, 0, 1, 1, 100, "GER Ju88 Bomber(1)")
SaveReal(NewAI_Data, 1750151481, 500, 800.0)
SaveReal(NewAI_Data, 1750151481, 501, 150.0)
SaveReal(NewAI_Data, 1750151481, 502, 800.0)
SaveReal(NewAI_Data, 1750151481, 530, 0.0)
SaveReal(NewAI_Data, 1750151481, 531, 114.28572082519531)
SaveReal(NewAI_Data, 1750151481, 510, 0.0)
SaveReal(NewAI_Data, 1750151481, 511, 0.0)
SaveReal(NewAI_Data, 1750151481, 512, 0.0)
SaveReal(NewAI_Data, 1750151481, 513, 0.0)
SaveReal(NewAI_Data, 1750151481, 514, 0.0)
SaveReal(NewAI_Data, 1750151481, 515, 800.0)
SaveReal(NewAI_Data, 1750151481, 516, 0.0)
SaveReal(NewAI_Data, 1750151481, 517, 0.0)
SaveReal(NewAI_Data, 1750151481, 520, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 521, 257.1428527832031)
SaveReal(NewAI_Data, 1750151481, 522, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 523, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 524, 257.1428527832031)
SaveReal(NewAI_Data, 1750151481, 525, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 526, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 527, 128.57142639160156)
SaveReal(NewAI_Data, 1750151481, 550, 0.0)
SaveReal(NewAI_Data, 1750151481, 551, 0.0)
SaveReal(NewAI_Data, 1750151481, 552, 0.0)
SaveReal(NewAI_Data, 1750151481, 553, 0.0)
SaveReal(NewAI_Data, 1750151481, 554, 0.0)
SaveReal(NewAI_Data, 1750151481, 555, 0.0)
SaveReal(NewAI_Data, 1750151481, 556, 0.0)
SaveReal(NewAI_Data, 1750151481, 557, 0.0)
SaveReal(NewAI_Data, 1750151481, 560, 0.0)
end

function Petain63_AIData18()
SaveReal(NewAI_Data, 1750151481, 561, 0.0)
SaveReal(NewAI_Data, 1750151481, 562, 0.0)
SaveReal(NewAI_Data, 1750151481, 563, 0.0)
SaveReal(NewAI_Data, 1750151481, 564, 0.0)
SaveReal(NewAI_Data, 1750151481, 565, 800.0)
SaveReal(NewAI_Data, 1750151481, 566, 0.0)
SaveReal(NewAI_Data, 1750151481, 567, 0.0)
SaveInteger(NewAI_Data, 1750151481, 1, 0)
SaveInteger(NewAI_Data, 1750151481, 2, 1000)
SaveInteger(NewAI_Data, 1750151481, 5, 0)
SaveInteger(NewAI_Data, 1750151481, 9, 250)
SaveReal(NewAI_Data, 1750151481, 501, 250.0)
NewAI_CatalogUnit(1750151728, 0, 500, 3, 5, 0, 0, 4, 1, 100, "GER Messerschmitt ME 109 (4)")
SaveReal(NewAI_Data, 1750151728, 500, 2400.0)
SaveReal(NewAI_Data, 1750151728, 501, 450.0)
SaveReal(NewAI_Data, 1750151728, 502, 2400.0)
SaveReal(NewAI_Data, 1750151728, 530, 196.0)
SaveReal(NewAI_Data, 1750151728, 531, 98.0)
SaveReal(NewAI_Data, 1750151728, 510, 0.0)
SaveReal(NewAI_Data, 1750151728, 511, 0.0)
SaveReal(NewAI_Data, 1750151728, 512, 0.0)
SaveReal(NewAI_Data, 1750151728, 513, 0.0)
SaveReal(NewAI_Data, 1750151728, 514, 0.0)
SaveReal(NewAI_Data, 1750151728, 515, 2400.0)
SaveReal(NewAI_Data, 1750151728, 516, 0.0)
SaveReal(NewAI_Data, 1750151728, 517, 0.0)
SaveReal(NewAI_Data, 1750151728, 520, 98.0)
SaveReal(NewAI_Data, 1750151728, 521, 196.0)
SaveReal(NewAI_Data, 1750151728, 522, 294.0)
SaveReal(NewAI_Data, 1750151728, 523, 98.0)
SaveReal(NewAI_Data, 1750151728, 524, 196.0)
SaveReal(NewAI_Data, 1750151728, 525, 196.0)
SaveReal(NewAI_Data, 1750151728, 526, 98.0)
SaveReal(NewAI_Data, 1750151728, 527, 49.0)
SaveReal(NewAI_Data, 1750151728, 550, 98.0)
SaveReal(NewAI_Data, 1750151728, 551, 196.0)
SaveReal(NewAI_Data, 1750151728, 552, 294.0)
SaveReal(NewAI_Data, 1750151728, 553, 98.0)
SaveReal(NewAI_Data, 1750151728, 554, 196.0)
SaveReal(NewAI_Data, 1750151728, 555, 196.0)
SaveReal(NewAI_Data, 1750151728, 556, 98.0)
SaveReal(NewAI_Data, 1750151728, 557, 49.0)
SaveReal(NewAI_Data, 1750151728, 560, 0.0)
SaveReal(NewAI_Data, 1750151728, 561, 0.0)
SaveReal(NewAI_Data, 1750151728, 562, 0.0)
SaveReal(NewAI_Data, 1750151728, 563, 0.0)
SaveReal(NewAI_Data, 1750151728, 564, 0.0)
SaveReal(NewAI_Data, 1750151728, 565, 2400.0)
SaveReal(NewAI_Data, 1750151728, 566, 0.0)
SaveReal(NewAI_Data, 1750151728, 567, 0.0)
end

function Petain63_AIData19()
SaveInteger(NewAI_Data, 1750151728, 1, 0)
SaveInteger(NewAI_Data, 1750151728, 2, 1000)
SaveInteger(NewAI_Data, 1750151728, 5, 0)
SaveInteger(NewAI_Data, 1750151728, 9, 250)
SaveReal(NewAI_Data, 1750151728, 501, 250.0)
NewAI_CatalogUnit(1750151729, 50, 0, 3, 1, 0, 0, 5, 1, 100, "GER Luftwaffe Panzershreck (5)")
SaveReal(NewAI_Data, 1750151729, 500, 1500.0)
SaveReal(NewAI_Data, 1750151729, 501, 500.0)
SaveReal(NewAI_Data, 1750151729, 502, 0.0)
SaveReal(NewAI_Data, 1750151729, 530, 112.5)
SaveReal(NewAI_Data, 1750151729, 531, 112.5)
SaveReal(NewAI_Data, 1750151729, 510, 1500.0)
SaveReal(NewAI_Data, 1750151729, 511, 0.0)
SaveReal(NewAI_Data, 1750151729, 512, 0.0)
SaveReal(NewAI_Data, 1750151729, 513, 0.0)
SaveReal(NewAI_Data, 1750151729, 514, 0.0)
SaveReal(NewAI_Data, 1750151729, 515, 0.0)
SaveReal(NewAI_Data, 1750151729, 516, 0.0)
SaveReal(NewAI_Data, 1750151729, 517, 0.0)
SaveReal(NewAI_Data, 1750151729, 520, 112.5)
SaveReal(NewAI_Data, 1750151729, 521, 337.5)
SaveReal(NewAI_Data, 1750151729, 522, 225.0)
SaveReal(NewAI_Data, 1750151729, 523, 112.5)
SaveReal(NewAI_Data, 1750151729, 524, 56.25)
SaveReal(NewAI_Data, 1750151729, 525, 112.5)
SaveReal(NewAI_Data, 1750151729, 526, 112.5)
SaveReal(NewAI_Data, 1750151729, 527, 56.25)
SaveReal(NewAI_Data, 1750151729, 550, 112.5)
SaveReal(NewAI_Data, 1750151729, 551, 337.5)
SaveReal(NewAI_Data, 1750151729, 552, 225.0)
SaveReal(NewAI_Data, 1750151729, 553, 112.5)
SaveReal(NewAI_Data, 1750151729, 554, 56.25)
SaveReal(NewAI_Data, 1750151729, 555, 112.5)
SaveReal(NewAI_Data, 1750151729, 556, 112.5)
SaveReal(NewAI_Data, 1750151729, 557, 56.25)
SaveReal(NewAI_Data, 1750151729, 560, 0.0)
SaveReal(NewAI_Data, 1750151729, 561, 0.0)
SaveReal(NewAI_Data, 1750151729, 562, 0.0)
SaveReal(NewAI_Data, 1750151729, 563, 0.0)
SaveReal(NewAI_Data, 1750151729, 564, 0.0)
SaveReal(NewAI_Data, 1750151729, 565, 0.0)
SaveReal(NewAI_Data, 1750151729, 566, 0.0)
SaveReal(NewAI_Data, 1750151729, 567, 0.0)
SaveInteger(NewAI_Data, 1750151729, 1, 50)
SaveInteger(NewAI_Data, 1750151729, 2, 500)
SaveInteger(NewAI_Data, 1750151729, 5, 0)
SaveInteger(NewAI_Data, 1750151729, 9, 250)
SaveReal(NewAI_Data, 1750151729, 501, 250.0)
NewAI_CatalogUnit(1750151730, 0, 1500, 3, 3, 0, 0, 1, 1, 100, "GER 15cm Hummel")
SaveReal(NewAI_Data, 1750151730, 500, 750.0)
end

function Petain63_AIData20()
SaveReal(NewAI_Data, 1750151730, 501, 1200.0)
SaveReal(NewAI_Data, 1750151730, 502, 0.0)
SaveReal(NewAI_Data, 1750151730, 530, 45.0)
SaveReal(NewAI_Data, 1750151730, 531, 45.0)
SaveReal(NewAI_Data, 1750151730, 510, 0.0)
SaveReal(NewAI_Data, 1750151730, 511, 0.0)
SaveReal(NewAI_Data, 1750151730, 512, 750.0)
SaveReal(NewAI_Data, 1750151730, 513, 0.0)
SaveReal(NewAI_Data, 1750151730, 514, 0.0)
SaveReal(NewAI_Data, 1750151730, 515, 0.0)
SaveReal(NewAI_Data, 1750151730, 516, 0.0)
SaveReal(NewAI_Data, 1750151730, 517, 0.0)
SaveReal(NewAI_Data, 1750151730, 520, 50.625)
SaveReal(NewAI_Data, 1750151730, 521, 101.25)
SaveReal(NewAI_Data, 1750151730, 522, 50.625)
SaveReal(NewAI_Data, 1750151730, 523, 50.625)
SaveReal(NewAI_Data, 1750151730, 524, 101.25)
SaveReal(NewAI_Data, 1750151730, 525, 50.625)
SaveReal(NewAI_Data, 1750151730, 526, 50.625)
SaveReal(NewAI_Data, 1750151730, 527, 50.625)
SaveReal(NewAI_Data, 1750151730, 550, 45.0)
SaveReal(NewAI_Data, 1750151730, 551, 90.0)
SaveReal(NewAI_Data, 1750151730, 552, 45.0)
SaveReal(NewAI_Data, 1750151730, 553, 45.0)
SaveReal(NewAI_Data, 1750151730, 554, 90.0)
SaveReal(NewAI_Data, 1750151730, 555, 45.0)
SaveReal(NewAI_Data, 1750151730, 556, 45.0)
SaveReal(NewAI_Data, 1750151730, 557, 45.0)
SaveReal(NewAI_Data, 1750151730, 560, 0.0)
SaveReal(NewAI_Data, 1750151730, 561, 0.0)
SaveReal(NewAI_Data, 1750151730, 562, 0.0)
SaveReal(NewAI_Data, 1750151730, 563, 0.0)
SaveReal(NewAI_Data, 1750151730, 564, 0.0)
SaveReal(NewAI_Data, 1750151730, 565, 0.0)
SaveReal(NewAI_Data, 1750151730, 566, 0.0)
SaveReal(NewAI_Data, 1750151730, 567, 0.0)
SaveInteger(NewAI_Data, 1750151730, 1, 0)
SaveInteger(NewAI_Data, 1750151730, 2, 2000)
SaveInteger(NewAI_Data, 1750151730, 5, 0)
SaveInteger(NewAI_Data, 1750151730, 9, 750)
SaveReal(NewAI_Data, 1750151730, 501, 750.0)
NewAI_CatalogUnit(1750151731, 0, 2500, 3, 2, 1, 1, 1, 1, 100, "GER Afrika Korps Tiger Tank(1)")
SaveInteger(NewAI_Data, 1750151731, 200, 1747993682)
SaveInteger(NewAI_Data, 1750151731, 300, 1)
SaveInteger(NewAI_Data, 1750151731, 100, 1750151734)
SaveReal(NewAI_Data, 1750151731, 500, 3500.0)
SaveReal(NewAI_Data, 1750151731, 501, 600.0)
SaveReal(NewAI_Data, 1750151731, 502, 0.0)
SaveReal(NewAI_Data, 1750151731, 530, 150.5)
SaveReal(NewAI_Data, 1750151731, 531, 150.5)
end

function Petain63_AIData21()
SaveReal(NewAI_Data, 1750151731, 510, 0.0)
SaveReal(NewAI_Data, 1750151731, 511, 0.0)
SaveReal(NewAI_Data, 1750151731, 512, 3500.0)
SaveReal(NewAI_Data, 1750151731, 513, 0.0)
SaveReal(NewAI_Data, 1750151731, 514, 0.0)
SaveReal(NewAI_Data, 1750151731, 515, 0.0)
SaveReal(NewAI_Data, 1750151731, 516, 0.0)
SaveReal(NewAI_Data, 1750151731, 517, 0.0)
SaveReal(NewAI_Data, 1750151731, 520, 161.78750610351562)
SaveReal(NewAI_Data, 1750151731, 521, 485.36248779296875)
SaveReal(NewAI_Data, 1750151731, 522, 323.57501220703125)
SaveReal(NewAI_Data, 1750151731, 523, 161.78750610351562)
SaveReal(NewAI_Data, 1750151731, 524, 80.89375305175781)
SaveReal(NewAI_Data, 1750151731, 525, 161.78750610351562)
SaveReal(NewAI_Data, 1750151731, 526, 161.78750610351562)
SaveReal(NewAI_Data, 1750151731, 527, 80.89375305175781)
SaveReal(NewAI_Data, 1750151731, 550, 150.5)
SaveReal(NewAI_Data, 1750151731, 551, 451.5)
SaveReal(NewAI_Data, 1750151731, 552, 301.0)
SaveReal(NewAI_Data, 1750151731, 553, 150.5)
SaveReal(NewAI_Data, 1750151731, 554, 75.25)
SaveReal(NewAI_Data, 1750151731, 555, 150.5)
SaveReal(NewAI_Data, 1750151731, 556, 150.5)
SaveReal(NewAI_Data, 1750151731, 557, 75.25)
SaveReal(NewAI_Data, 1750151731, 560, 0.0)
SaveReal(NewAI_Data, 1750151731, 561, 0.0)
SaveReal(NewAI_Data, 1750151731, 562, 0.0)
SaveReal(NewAI_Data, 1750151731, 563, 0.0)
SaveReal(NewAI_Data, 1750151731, 564, 0.0)
SaveReal(NewAI_Data, 1750151731, 565, 0.0)
SaveReal(NewAI_Data, 1750151731, 566, 0.0)
SaveReal(NewAI_Data, 1750151731, 567, 0.0)
SaveInteger(NewAI_Data, 1750151731, 1, 0)
SaveInteger(NewAI_Data, 1750151731, 2, 3000)
SaveInteger(NewAI_Data, 1750151731, 5, 1)
SaveInteger(NewAI_Data, 1750151731, 9, 550)
SaveReal(NewAI_Data, 1750151731, 501, 550.0)
SaveInteger(NewAI_Data, 1750151731, 100, 1750151734)
NewAI_CatalogUnit(1750151732, 0, 500, 3, 2, 1, 0, 1, 1, 100, "GER JagPanther(1)")
SaveInteger(NewAI_Data, 1750151732, 100, 1750151735)
SaveReal(NewAI_Data, 1750151732, 500, 1500.0)
SaveReal(NewAI_Data, 1750151732, 501, 800.0)
SaveReal(NewAI_Data, 1750151732, 502, 0.0)
SaveReal(NewAI_Data, 1750151732, 530, 125.5)
SaveReal(NewAI_Data, 1750151732, 531, 125.5)
SaveReal(NewAI_Data, 1750151732, 510, 0.0)
SaveReal(NewAI_Data, 1750151732, 511, 0.0)
SaveReal(NewAI_Data, 1750151732, 512, 1500.0)
SaveReal(NewAI_Data, 1750151732, 513, 0.0)
SaveReal(NewAI_Data, 1750151732, 514, 0.0)
end

function Petain63_AIData22()
SaveReal(NewAI_Data, 1750151732, 515, 0.0)
SaveReal(NewAI_Data, 1750151732, 516, 0.0)
SaveReal(NewAI_Data, 1750151732, 517, 0.0)
SaveReal(NewAI_Data, 1750151732, 520, 134.91250610351562)
SaveReal(NewAI_Data, 1750151732, 521, 404.73748779296875)
SaveReal(NewAI_Data, 1750151732, 522, 269.82501220703125)
SaveReal(NewAI_Data, 1750151732, 523, 134.91250610351562)
SaveReal(NewAI_Data, 1750151732, 524, 67.45625305175781)
SaveReal(NewAI_Data, 1750151732, 525, 134.91250610351562)
SaveReal(NewAI_Data, 1750151732, 526, 134.91250610351562)
SaveReal(NewAI_Data, 1750151732, 527, 67.45625305175781)
SaveReal(NewAI_Data, 1750151732, 550, 125.5)
SaveReal(NewAI_Data, 1750151732, 551, 376.5)
SaveReal(NewAI_Data, 1750151732, 552, 251.0)
SaveReal(NewAI_Data, 1750151732, 553, 125.5)
SaveReal(NewAI_Data, 1750151732, 554, 62.75)
SaveReal(NewAI_Data, 1750151732, 555, 125.5)
SaveReal(NewAI_Data, 1750151732, 556, 125.5)
SaveReal(NewAI_Data, 1750151732, 557, 62.75)
SaveReal(NewAI_Data, 1750151732, 560, 0.0)
SaveReal(NewAI_Data, 1750151732, 561, 0.0)
SaveReal(NewAI_Data, 1750151732, 562, 0.0)
SaveReal(NewAI_Data, 1750151732, 563, 0.0)
SaveReal(NewAI_Data, 1750151732, 564, 0.0)
SaveReal(NewAI_Data, 1750151732, 565, 0.0)
SaveReal(NewAI_Data, 1750151732, 566, 0.0)
SaveReal(NewAI_Data, 1750151732, 567, 0.0)
SaveInteger(NewAI_Data, 1750151732, 1, 0)
SaveInteger(NewAI_Data, 1750151732, 2, 1000)
SaveInteger(NewAI_Data, 1750151732, 5, 1)
SaveInteger(NewAI_Data, 1750151732, 9, 400)
SaveReal(NewAI_Data, 1750151732, 501, 400.0)
SaveInteger(NewAI_Data, 1750151732, 100, 1750151735)
NewAI_CatalogUnit(1750151733, 0, 5500, 3, 2, 0, 0, 1, 1, 275, "GER Panzer VIII Mauss Tank(1)")
SaveReal(NewAI_Data, 1750151733, 500, 8000.0)
SaveReal(NewAI_Data, 1750151733, 501, 600.0)
SaveReal(NewAI_Data, 1750151733, 502, 0.0)
SaveReal(NewAI_Data, 1750151733, 530, 175.5)
SaveReal(NewAI_Data, 1750151733, 531, 175.5)
SaveReal(NewAI_Data, 1750151733, 510, 0.0)
SaveReal(NewAI_Data, 1750151733, 511, 0.0)
SaveReal(NewAI_Data, 1750151733, 512, 8000.0)
SaveReal(NewAI_Data, 1750151733, 513, 0.0)
SaveReal(NewAI_Data, 1750151733, 514, 0.0)
SaveReal(NewAI_Data, 1750151733, 515, 0.0)
SaveReal(NewAI_Data, 1750151733, 516, 0.0)
SaveReal(NewAI_Data, 1750151733, 517, 0.0)
SaveReal(NewAI_Data, 1750151733, 520, 188.66250610351562)
SaveReal(NewAI_Data, 1750151733, 521, 565.9874877929688)
SaveReal(NewAI_Data, 1750151733, 522, 377.32501220703125)
end

function Petain63_AIData23()
SaveReal(NewAI_Data, 1750151733, 523, 188.66250610351562)
SaveReal(NewAI_Data, 1750151733, 524, 94.33125305175781)
SaveReal(NewAI_Data, 1750151733, 525, 188.66250610351562)
SaveReal(NewAI_Data, 1750151733, 526, 188.66250610351562)
SaveReal(NewAI_Data, 1750151733, 527, 94.33125305175781)
SaveReal(NewAI_Data, 1750151733, 550, 175.5)
SaveReal(NewAI_Data, 1750151733, 551, 526.5)
SaveReal(NewAI_Data, 1750151733, 552, 351.0)
SaveReal(NewAI_Data, 1750151733, 553, 175.5)
SaveReal(NewAI_Data, 1750151733, 554, 87.75)
SaveReal(NewAI_Data, 1750151733, 555, 175.5)
SaveReal(NewAI_Data, 1750151733, 556, 175.5)
SaveReal(NewAI_Data, 1750151733, 557, 87.75)
SaveReal(NewAI_Data, 1750151733, 560, 0.0)
SaveReal(NewAI_Data, 1750151733, 561, 0.0)
SaveReal(NewAI_Data, 1750151733, 562, 0.0)
SaveReal(NewAI_Data, 1750151733, 563, 0.0)
SaveReal(NewAI_Data, 1750151733, 564, 0.0)
SaveReal(NewAI_Data, 1750151733, 565, 0.0)
SaveReal(NewAI_Data, 1750151733, 566, 0.0)
SaveReal(NewAI_Data, 1750151733, 567, 0.0)
SaveInteger(NewAI_Data, 1750151733, 1, 0)
SaveInteger(NewAI_Data, 1750151733, 2, 6000)
SaveInteger(NewAI_Data, 1750151733, 5, 0)
SaveInteger(NewAI_Data, 1750151733, 9, 950)
SaveReal(NewAI_Data, 1750151733, 501, 950.0)
NewAI_CatalogUnit(1750151734, 0, 5000, 3, 2, 0, 1, 1, 1, 200, "GER Afrika Korps Tiger II Tank(1)")
SaveInteger(NewAI_Data, 1750151734, 200, 1747993682)
SaveInteger(NewAI_Data, 1750151734, 300, 1)
SaveReal(NewAI_Data, 1750151734, 500, 6000.0)
SaveReal(NewAI_Data, 1750151734, 501, 600.0)
SaveReal(NewAI_Data, 1750151734, 502, 0.0)
SaveReal(NewAI_Data, 1750151734, 530, 316.25)
SaveReal(NewAI_Data, 1750151734, 531, 316.25)
SaveReal(NewAI_Data, 1750151734, 510, 0.0)
SaveReal(NewAI_Data, 1750151734, 511, 0.0)
SaveReal(NewAI_Data, 1750151734, 512, 7000.0)
SaveReal(NewAI_Data, 1750151734, 513, 0.0)
SaveReal(NewAI_Data, 1750151734, 514, 0.0)
SaveReal(NewAI_Data, 1750151734, 515, 0.0)
SaveReal(NewAI_Data, 1750151734, 516, 0.0)
SaveReal(NewAI_Data, 1750151734, 517, 0.0)
SaveReal(NewAI_Data, 1750151734, 520, 339.96875)
SaveReal(NewAI_Data, 1750151734, 521, 1019.9063110351562)
SaveReal(NewAI_Data, 1750151734, 522, 679.9375)
SaveReal(NewAI_Data, 1750151734, 523, 339.96875)
SaveReal(NewAI_Data, 1750151734, 524, 169.984375)
SaveReal(NewAI_Data, 1750151734, 525, 339.96875)
SaveReal(NewAI_Data, 1750151734, 526, 339.96875)
SaveReal(NewAI_Data, 1750151734, 527, 169.984375)
end

function Petain63_AIData24()
SaveReal(NewAI_Data, 1750151734, 550, 316.25)
SaveReal(NewAI_Data, 1750151734, 551, 948.7500610351562)
SaveReal(NewAI_Data, 1750151734, 552, 632.5)
SaveReal(NewAI_Data, 1750151734, 553, 316.25)
SaveReal(NewAI_Data, 1750151734, 554, 158.125)
SaveReal(NewAI_Data, 1750151734, 555, 316.25)
SaveReal(NewAI_Data, 1750151734, 556, 316.25)
SaveReal(NewAI_Data, 1750151734, 557, 158.125)
SaveReal(NewAI_Data, 1750151734, 560, 0.0)
SaveReal(NewAI_Data, 1750151734, 561, 0.0)
SaveReal(NewAI_Data, 1750151734, 562, 0.0)
SaveReal(NewAI_Data, 1750151734, 563, 0.0)
SaveReal(NewAI_Data, 1750151734, 564, 0.0)
SaveReal(NewAI_Data, 1750151734, 565, 0.0)
SaveReal(NewAI_Data, 1750151734, 566, 0.0)
SaveReal(NewAI_Data, 1750151734, 567, 0.0)
SaveInteger(NewAI_Data, 1750151734, 1, 0)
SaveInteger(NewAI_Data, 1750151734, 2, 4500)
SaveInteger(NewAI_Data, 1750151734, 5, 0)
SaveInteger(NewAI_Data, 1750151734, 9, 1000)
SaveReal(NewAI_Data, 1750151734, 501, 1000.0)
NewAI_CatalogUnit(1750151735, 0, 1500, 3, 2, 0, 0, 1, 1, 100, "GER JagTiger (1)")
SaveReal(NewAI_Data, 1750151735, 500, 2000.0)
SaveReal(NewAI_Data, 1750151735, 501, 800.0)
SaveReal(NewAI_Data, 1750151735, 502, 0.0)
SaveReal(NewAI_Data, 1750151735, 530, 175.5)
SaveReal(NewAI_Data, 1750151735, 531, 175.5)
SaveReal(NewAI_Data, 1750151735, 510, 0.0)
SaveReal(NewAI_Data, 1750151735, 511, 0.0)
SaveReal(NewAI_Data, 1750151735, 512, 2000.0)
SaveReal(NewAI_Data, 1750151735, 513, 0.0)
SaveReal(NewAI_Data, 1750151735, 514, 0.0)
SaveReal(NewAI_Data, 1750151735, 515, 0.0)
SaveReal(NewAI_Data, 1750151735, 516, 0.0)
SaveReal(NewAI_Data, 1750151735, 517, 0.0)
SaveReal(NewAI_Data, 1750151735, 520, 188.66250610351562)
SaveReal(NewAI_Data, 1750151735, 521, 565.9874877929688)
SaveReal(NewAI_Data, 1750151735, 522, 377.32501220703125)
SaveReal(NewAI_Data, 1750151735, 523, 188.66250610351562)
SaveReal(NewAI_Data, 1750151735, 524, 94.33125305175781)
SaveReal(NewAI_Data, 1750151735, 525, 188.66250610351562)
SaveReal(NewAI_Data, 1750151735, 526, 188.66250610351562)
SaveReal(NewAI_Data, 1750151735, 527, 94.33125305175781)
SaveReal(NewAI_Data, 1750151735, 550, 175.5)
SaveReal(NewAI_Data, 1750151735, 551, 526.5)
SaveReal(NewAI_Data, 1750151735, 552, 351.0)
SaveReal(NewAI_Data, 1750151735, 553, 175.5)
SaveReal(NewAI_Data, 1750151735, 554, 87.75)
SaveReal(NewAI_Data, 1750151735, 555, 175.5)
SaveReal(NewAI_Data, 1750151735, 556, 175.5)
end

function Petain63_AIData25()
SaveReal(NewAI_Data, 1750151735, 557, 87.75)
SaveReal(NewAI_Data, 1750151735, 560, 0.0)
SaveReal(NewAI_Data, 1750151735, 561, 0.0)
SaveReal(NewAI_Data, 1750151735, 562, 0.0)
SaveReal(NewAI_Data, 1750151735, 563, 0.0)
SaveReal(NewAI_Data, 1750151735, 564, 0.0)
SaveReal(NewAI_Data, 1750151735, 565, 0.0)
SaveReal(NewAI_Data, 1750151735, 566, 0.0)
SaveReal(NewAI_Data, 1750151735, 567, 0.0)
SaveInteger(NewAI_Data, 1750151735, 1, 0)
SaveInteger(NewAI_Data, 1750151735, 2, 2000)
SaveInteger(NewAI_Data, 1750151735, 5, 0)
SaveInteger(NewAI_Data, 1750151735, 9, 600)
SaveReal(NewAI_Data, 1750151735, 501, 600.0)
SaveInteger(NewAI_Data, 1747994959, 100, 1750151216)
SaveInteger(NewAI_Data, 1747994959, 101, 1750151217)
SaveInteger(NewAI_Data, 1747994959, 102, 1750151218)
SaveInteger(NewAI_Data, 1747994959, 103, 1750151219)
SaveInteger(NewAI_Data, 1747994959, 104, 1750151220)
SaveInteger(NewAI_Data, 1747994959, 105, 1750151221)
SaveInteger(NewAI_Data, 1747994959, 106, 1750151222)
SaveInteger(NewAI_Data, 1747994959, 107, 1749437744)
SaveInteger(NewAI_Data, 1747994959, 108, 1749435952)
end

function Italy75_AI0()
SaveReal(NewAI_Data, 1749627184, 540, 500.0)
SaveReal(NewAI_Data, 1749627184, 541, 500.0)
SaveReal(NewAI_Data, 1749627185, 540, 500.0)
SaveReal(NewAI_Data, 1749627185, 541, 500.0)
SaveReal(NewAI_Data, 1749627186, 540, 525.0)
SaveReal(NewAI_Data, 1749627186, 541, 525.0)
SaveReal(NewAI_Data, 1749627187, 540, 600.0)
SaveReal(NewAI_Data, 1749627187, 541, 600.0)
SaveReal(NewAI_Data, 1749627188, 540, 800.0)
SaveReal(NewAI_Data, 1749627188, 541, 800.0)
SaveReal(NewAI_Data, 1749627189, 540, 500.0)
SaveReal(NewAI_Data, 1749627189, 541, 500.0)
SaveReal(NewAI_Data, 1749627190, 540, 1000.0)
SaveReal(NewAI_Data, 1749627190, 541, 1000.0)
SaveReal(NewAI_Data, 1749627191, 540, 1000.0)
SaveReal(NewAI_Data, 1749627191, 541, 1000.0)
SaveReal(NewAI_Data, 1749627192, 540, 400.0)
SaveReal(NewAI_Data, 1749627192, 541, 400.0)
SaveReal(NewAI_Data, 1749627193, 540, 500.0)
SaveReal(NewAI_Data, 1749627193, 541, 500.0)
SaveReal(NewAI_Data, 1749627201, 540, 400.0)
SaveReal(NewAI_Data, 1749627201, 541, 400.0)
NewAI_CatalogUnit(1749626928, 200, 0, 3, 1, 6, 0, 10, 1, 200, "Italian Infantry Squad")
SaveInteger(NewAI_Data, 1749626928, 100, 1749626929)
SaveInteger(NewAI_Data, 1749626928, 101, 1749626930)
SaveInteger(NewAI_Data, 1749626928, 102, 1749626931)
SaveInteger(NewAI_Data, 1749626928, 103, 1749626932)
SaveInteger(NewAI_Data, 1749626928, 104, 1749626933)
SaveInteger(NewAI_Data, 1749626928, 105, 1749626934)
SaveReal(NewAI_Data, 1749626928, 500, 2000.0)
SaveReal(NewAI_Data, 1749626928, 501, 200.0)
SaveReal(NewAI_Data, 1749626928, 502, 2000.0)
SaveReal(NewAI_Data, 1749626928, 530, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 531, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 510, 2000.0)
SaveReal(NewAI_Data, 1749626928, 520, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 550, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 511, 0.0)
SaveReal(NewAI_Data, 1749626928, 521, 41.93181610107422)
SaveReal(NewAI_Data, 1749626928, 551, 41.93181610107422)
SaveReal(NewAI_Data, 1749626928, 512, 0.0)
SaveReal(NewAI_Data, 1749626928, 522, 25.15909194946289)
SaveReal(NewAI_Data, 1749626928, 552, 25.15909194946289)
SaveReal(NewAI_Data, 1749626928, 513, 0.0)
SaveReal(NewAI_Data, 1749626928, 523, 83.86363220214844)
end

function Italy75_AI1()
SaveReal(NewAI_Data, 1749626928, 553, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 514, 0.0)
SaveReal(NewAI_Data, 1749626928, 524, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 554, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 515, 0.0)
SaveReal(NewAI_Data, 1749626928, 525, 41.93181610107422)
SaveReal(NewAI_Data, 1749626928, 555, 41.93181610107422)
SaveReal(NewAI_Data, 1749626928, 516, 0.0)
SaveReal(NewAI_Data, 1749626928, 526, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 556, 83.86363220214844)
SaveReal(NewAI_Data, 1749626928, 517, 0.0)
SaveReal(NewAI_Data, 1749626928, 527, 125.79545593261719)
SaveReal(NewAI_Data, 1749626928, 557, 125.79545593261719)
NewAI_CatalogUnit(1749626929, 0, 800, 3, 1, 0, 0, 4, 1, 280, "Italian Heavy Squad")
SaveReal(NewAI_Data, 1749626929, 500, 1000.0)
SaveReal(NewAI_Data, 1749626929, 501, 280.0)
SaveReal(NewAI_Data, 1749626929, 502, 1000.0)
SaveReal(NewAI_Data, 1749626929, 530, 96.0)
SaveReal(NewAI_Data, 1749626929, 531, 96.0)
SaveReal(NewAI_Data, 1749626929, 510, 1000.0)
SaveReal(NewAI_Data, 1749626929, 520, 96.0)
SaveReal(NewAI_Data, 1749626929, 550, 96.0)
SaveReal(NewAI_Data, 1749626929, 511, 0.0)
SaveReal(NewAI_Data, 1749626929, 521, 93.0)
SaveReal(NewAI_Data, 1749626929, 551, 93.0)
SaveReal(NewAI_Data, 1749626929, 512, 0.0)
SaveReal(NewAI_Data, 1749626929, 522, 49.79999923706055)
SaveReal(NewAI_Data, 1749626929, 552, 49.79999923706055)
SaveReal(NewAI_Data, 1749626929, 513, 0.0)
SaveReal(NewAI_Data, 1749626929, 523, 96.0)
SaveReal(NewAI_Data, 1749626929, 553, 96.0)
SaveReal(NewAI_Data, 1749626929, 514, 0.0)
SaveReal(NewAI_Data, 1749626929, 524, 126.0)
SaveReal(NewAI_Data, 1749626929, 554, 126.0)
SaveReal(NewAI_Data, 1749626929, 515, 0.0)
SaveReal(NewAI_Data, 1749626929, 525, 63.0)
SaveReal(NewAI_Data, 1749626929, 555, 63.0)
SaveReal(NewAI_Data, 1749626929, 516, 0.0)
SaveReal(NewAI_Data, 1749626929, 526, 96.0)
SaveReal(NewAI_Data, 1749626929, 556, 96.0)
SaveReal(NewAI_Data, 1749626929, 517, 0.0)
SaveReal(NewAI_Data, 1749626929, 527, 129.0)
SaveReal(NewAI_Data, 1749626929, 557, 129.0)
NewAI_CatalogUnit(1749626930, 100, 0, 3, 1, 0, 0, 5, 1, 300, "Italian Anti-Tank Squad")
SaveReal(NewAI_Data, 1749626930, 500, 1000.0)
end

function Italy75_AI2()
SaveReal(NewAI_Data, 1749626930, 501, 300.0)
SaveReal(NewAI_Data, 1749626930, 502, 1000.0)
SaveReal(NewAI_Data, 1749626930, 530, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 531, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 510, 1000.0)
SaveReal(NewAI_Data, 1749626930, 520, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 550, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 511, 0.0)
SaveReal(NewAI_Data, 1749626930, 521, 287.5)
SaveReal(NewAI_Data, 1749626930, 551, 287.5)
SaveReal(NewAI_Data, 1749626930, 512, 0.0)
SaveReal(NewAI_Data, 1749626930, 522, 191.6666717529297)
SaveReal(NewAI_Data, 1749626930, 552, 191.6666717529297)
SaveReal(NewAI_Data, 1749626930, 513, 0.0)
SaveReal(NewAI_Data, 1749626930, 523, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 553, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 514, 0.0)
SaveReal(NewAI_Data, 1749626930, 524, 47.91666793823242)
SaveReal(NewAI_Data, 1749626930, 554, 47.91666793823242)
SaveReal(NewAI_Data, 1749626930, 515, 0.0)
SaveReal(NewAI_Data, 1749626930, 525, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 555, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 516, 0.0)
SaveReal(NewAI_Data, 1749626930, 526, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 556, 95.83333587646484)
SaveReal(NewAI_Data, 1749626930, 517, 0.0)
SaveReal(NewAI_Data, 1749626930, 527, 47.91666793823242)
SaveReal(NewAI_Data, 1749626930, 557, 47.91666793823242)
NewAI_CatalogUnit(1749626931, 100, 0, 3, 1, 0, 0, 5, 1, 300, "Italian AP Sniper Squad")
SaveReal(NewAI_Data, 1749626931, 500, 1000.0)
SaveReal(NewAI_Data, 1749626931, 501, 300.0)
SaveReal(NewAI_Data, 1749626931, 502, 1000.0)
SaveReal(NewAI_Data, 1749626931, 530, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 531, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 510, 1000.0)
SaveReal(NewAI_Data, 1749626931, 520, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 550, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 511, 0.0)
SaveReal(NewAI_Data, 1749626931, 521, 200.0)
SaveReal(NewAI_Data, 1749626931, 551, 200.0)
SaveReal(NewAI_Data, 1749626931, 512, 0.0)
SaveReal(NewAI_Data, 1749626931, 522, 133.3333282470703)
SaveReal(NewAI_Data, 1749626931, 552, 133.3333282470703)
SaveReal(NewAI_Data, 1749626931, 513, 0.0)
SaveReal(NewAI_Data, 1749626931, 523, 66.66666412353516)
end

function Italy75_AI3()
SaveReal(NewAI_Data, 1749626931, 553, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 514, 0.0)
SaveReal(NewAI_Data, 1749626931, 524, 33.33333206176758)
SaveReal(NewAI_Data, 1749626931, 554, 33.33333206176758)
SaveReal(NewAI_Data, 1749626931, 515, 0.0)
SaveReal(NewAI_Data, 1749626931, 525, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 555, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 516, 0.0)
SaveReal(NewAI_Data, 1749626931, 526, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 556, 66.66666412353516)
SaveReal(NewAI_Data, 1749626931, 517, 0.0)
SaveReal(NewAI_Data, 1749626931, 527, 33.33333206176758)
SaveReal(NewAI_Data, 1749626931, 557, 33.33333206176758)
NewAI_CatalogUnit(1749626932, 50, 0, 3, 1, 0, 0, 5, 1, 250, "Italian Sniper Squad")
SaveReal(NewAI_Data, 1749626932, 500, 1000.0)
SaveReal(NewAI_Data, 1749626932, 501, 250.0)
SaveReal(NewAI_Data, 1749626932, 502, 1000.0)
SaveReal(NewAI_Data, 1749626932, 530, 100.0)
SaveReal(NewAI_Data, 1749626932, 531, 100.0)
SaveReal(NewAI_Data, 1749626932, 510, 1000.0)
SaveReal(NewAI_Data, 1749626932, 520, 100.0)
SaveReal(NewAI_Data, 1749626932, 550, 100.0)
SaveReal(NewAI_Data, 1749626932, 511, 0.0)
SaveReal(NewAI_Data, 1749626932, 521, 50.0)
SaveReal(NewAI_Data, 1749626932, 551, 50.0)
SaveReal(NewAI_Data, 1749626932, 512, 0.0)
SaveReal(NewAI_Data, 1749626932, 522, 30.0)
SaveReal(NewAI_Data, 1749626932, 552, 30.0)
SaveReal(NewAI_Data, 1749626932, 513, 0.0)
SaveReal(NewAI_Data, 1749626932, 523, 100.0)
SaveReal(NewAI_Data, 1749626932, 553, 100.0)
SaveReal(NewAI_Data, 1749626932, 514, 0.0)
SaveReal(NewAI_Data, 1749626932, 524, 100.0)
SaveReal(NewAI_Data, 1749626932, 554, 100.0)
SaveReal(NewAI_Data, 1749626932, 515, 0.0)
SaveReal(NewAI_Data, 1749626932, 525, 50.0)
SaveReal(NewAI_Data, 1749626932, 555, 50.0)
SaveReal(NewAI_Data, 1749626932, 516, 0.0)
SaveReal(NewAI_Data, 1749626932, 526, 100.0)
SaveReal(NewAI_Data, 1749626932, 556, 100.0)
SaveReal(NewAI_Data, 1749626932, 517, 0.0)
SaveReal(NewAI_Data, 1749626932, 527, 150.0)
SaveReal(NewAI_Data, 1749626932, 557, 150.0)
NewAI_CatalogUnit(1749626933, 100, 0, 3, 1, 0, 0, 11, 1, 300, "Italian Infantry with Flamethrower")
SaveReal(NewAI_Data, 1749626933, 500, 2200.0)
end

function Italy75_AI4()
SaveReal(NewAI_Data, 1749626933, 501, 300.0)
SaveReal(NewAI_Data, 1749626933, 502, 2200.0)
SaveReal(NewAI_Data, 1749626933, 530, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 531, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 510, 2200.0)
SaveReal(NewAI_Data, 1749626933, 520, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 550, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 511, 0.0)
SaveReal(NewAI_Data, 1749626933, 521, 47.18181610107422)
SaveReal(NewAI_Data, 1749626933, 551, 47.18181610107422)
SaveReal(NewAI_Data, 1749626933, 512, 0.0)
SaveReal(NewAI_Data, 1749626933, 522, 28.309091567993164)
SaveReal(NewAI_Data, 1749626933, 552, 28.309091567993164)
SaveReal(NewAI_Data, 1749626933, 513, 0.0)
SaveReal(NewAI_Data, 1749626933, 523, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 553, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 514, 0.0)
SaveReal(NewAI_Data, 1749626933, 524, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 554, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 515, 0.0)
SaveReal(NewAI_Data, 1749626933, 525, 47.18181610107422)
SaveReal(NewAI_Data, 1749626933, 555, 47.18181610107422)
SaveReal(NewAI_Data, 1749626933, 516, 0.0)
SaveReal(NewAI_Data, 1749626933, 526, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 556, 94.36363220214844)
SaveReal(NewAI_Data, 1749626933, 517, 0.0)
SaveReal(NewAI_Data, 1749626933, 527, 141.5454559326172)
SaveReal(NewAI_Data, 1749626933, 557, 141.5454559326172)
NewAI_CatalogUnit(1749626934, 0, 300, 3, 1, 1, 0, 11, 1, 230, "Italian Tankette Support")
SaveInteger(NewAI_Data, 1749626934, 100, 1749626935)
SaveReal(NewAI_Data, 1749626934, 500, 2150.0)
SaveReal(NewAI_Data, 1749626934, 501, 230.0)
SaveReal(NewAI_Data, 1749626934, 502, 2150.0)
SaveReal(NewAI_Data, 1749626934, 530, 83.86363220214844)
SaveReal(NewAI_Data, 1749626934, 531, 120.53030395507812)
SaveReal(NewAI_Data, 1749626934, 510, 2000.0)
SaveReal(NewAI_Data, 1749626934, 520, 120.53030395507812)
SaveReal(NewAI_Data, 1749626934, 550, 83.86363220214844)
SaveReal(NewAI_Data, 1749626934, 511, 150.0)
SaveReal(NewAI_Data, 1749626934, 521, 60.26515197753906)
SaveReal(NewAI_Data, 1749626934, 551, 41.93181610107422)
SaveReal(NewAI_Data, 1749626934, 512, 0.0)
SaveReal(NewAI_Data, 1749626934, 522, 36.15909194946289)
SaveReal(NewAI_Data, 1749626934, 552, 25.15909194946289)
SaveReal(NewAI_Data, 1749626934, 513, 0.0)
end

function Italy75_AI5()
SaveReal(NewAI_Data, 1749626934, 523, 120.53030395507812)
SaveReal(NewAI_Data, 1749626934, 553, 83.86363220214844)
SaveReal(NewAI_Data, 1749626934, 514, 0.0)
SaveReal(NewAI_Data, 1749626934, 524, 120.53030395507812)
SaveReal(NewAI_Data, 1749626934, 554, 83.86363220214844)
SaveReal(NewAI_Data, 1749626934, 515, 0.0)
SaveReal(NewAI_Data, 1749626934, 525, 60.26515197753906)
SaveReal(NewAI_Data, 1749626934, 555, 41.93181610107422)
SaveReal(NewAI_Data, 1749626934, 516, 0.0)
SaveReal(NewAI_Data, 1749626934, 526, 120.53030395507812)
SaveReal(NewAI_Data, 1749626934, 556, 83.86363220214844)
SaveReal(NewAI_Data, 1749626934, 517, 0.0)
SaveReal(NewAI_Data, 1749626934, 527, 180.7954559326172)
SaveReal(NewAI_Data, 1749626934, 557, 125.79545593261719)
NewAI_CatalogUnit(1749626935, 0, 500, 3, 1, 0, 0, 13, 1, 280, "Italian Assault Support")
SaveReal(NewAI_Data, 1749626935, 500, 2450.0)
SaveReal(NewAI_Data, 1749626935, 501, 280.0)
SaveReal(NewAI_Data, 1749626935, 502, 2450.0)
SaveReal(NewAI_Data, 1749626935, 530, 83.86363220214844)
SaveReal(NewAI_Data, 1749626935, 531, 186.03030395507812)
SaveReal(NewAI_Data, 1749626935, 510, 2000.0)
SaveReal(NewAI_Data, 1749626935, 520, 186.03030395507812)
SaveReal(NewAI_Data, 1749626935, 550, 83.86363220214844)
SaveReal(NewAI_Data, 1749626935, 511, 450.0)
SaveReal(NewAI_Data, 1749626935, 521, 93.01515197753906)
SaveReal(NewAI_Data, 1749626935, 551, 41.93181610107422)
SaveReal(NewAI_Data, 1749626935, 512, 0.0)
SaveReal(NewAI_Data, 1749626935, 522, 55.80908966064453)
SaveReal(NewAI_Data, 1749626935, 552, 25.15909194946289)
SaveReal(NewAI_Data, 1749626935, 513, 0.0)
SaveReal(NewAI_Data, 1749626935, 523, 186.03030395507812)
SaveReal(NewAI_Data, 1749626935, 553, 83.86363220214844)
SaveReal(NewAI_Data, 1749626935, 514, 0.0)
SaveReal(NewAI_Data, 1749626935, 524, 186.03030395507812)
SaveReal(NewAI_Data, 1749626935, 554, 83.86363220214844)
SaveReal(NewAI_Data, 1749626935, 515, 0.0)
SaveReal(NewAI_Data, 1749626935, 525, 93.01515197753906)
SaveReal(NewAI_Data, 1749626935, 555, 41.93181610107422)
SaveReal(NewAI_Data, 1749626935, 516, 0.0)
SaveReal(NewAI_Data, 1749626935, 526, 186.03030395507812)
SaveReal(NewAI_Data, 1749626935, 556, 83.86363220214844)
SaveReal(NewAI_Data, 1749626935, 517, 0.0)
SaveReal(NewAI_Data, 1749626935, 527, 279.0454406738281)
SaveReal(NewAI_Data, 1749626935, 557, 125.79545593261719)
NewAI_CatalogUnit(1749628725, 0, 0, 2, 0, 1, 0, 0, 1, 1, "Italian Bloodmaster")
end

function Italy75_AI6()
SaveInteger(NewAI_Data, 1749628725, 100, 1749626928)
SaveInteger(NewAI_Data, 1747992898, 6, 0)
SaveInteger(NewAI_Data, 1747992898, 5, 0)
end

function Vehicles78_AI0()
NewAI_CatalogUnit(1749627696, 300, 0, 3, 2, 3, 0, 6, 1, 300, "GER Werhmacht Motorbike(6)")
SaveInteger(NewAI_Data, 1749627696, 100, 1749627698)
SaveInteger(NewAI_Data, 1749627696, 101, 1749627697)
SaveInteger(NewAI_Data, 1749627696, 102, 1747989582)
NewAI_CatalogUnit(1749627698, 0, 1200, 3, 4, 0, 0, 3, 1, 100, "GER Sd.Kfz 251 AA(3)")
NewAI_CatalogUnit(1749627697, 0, 750, 3, 2, 0, 0, 3, 1, 100, "GER Sd.Kfz 222(3)")
SaveReal(NewAI_Data, 1749627696, 500, 1320.0)
SaveReal(NewAI_Data, 1749627696, 501, 550.0)
SaveReal(NewAI_Data, 1749627696, 502, 0.0)
SaveReal(NewAI_Data, 1749627696, 530, 66.42857360839844)
SaveReal(NewAI_Data, 1749627696, 531, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 510, 0.0)
SaveReal(NewAI_Data, 1749627696, 511, 1320.0)
SaveReal(NewAI_Data, 1749627696, 512, 0.0)
SaveReal(NewAI_Data, 1749627696, 513, 0.0)
SaveReal(NewAI_Data, 1749627696, 514, 0.0)
SaveReal(NewAI_Data, 1749627696, 515, 0.0)
SaveReal(NewAI_Data, 1749627696, 516, 0.0)
SaveReal(NewAI_Data, 1749627696, 517, 0.0)
SaveReal(NewAI_Data, 1749627696, 520, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 521, 66.42857360839844)
SaveReal(NewAI_Data, 1749627696, 522, 39.857139587402344)
SaveReal(NewAI_Data, 1749627696, 523, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 524, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 525, 66.42857360839844)
SaveReal(NewAI_Data, 1749627696, 526, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 527, 199.2857208251953)
SaveReal(NewAI_Data, 1749627696, 550, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 551, 66.42857360839844)
SaveReal(NewAI_Data, 1749627696, 552, 39.857139587402344)
SaveReal(NewAI_Data, 1749627696, 553, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 554, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 555, 66.42857360839844)
SaveReal(NewAI_Data, 1749627696, 556, 132.85714721679688)
SaveReal(NewAI_Data, 1749627696, 557, 199.2857208251953)
SaveReal(NewAI_Data, 1749627696, 560, 0.0)
SaveReal(NewAI_Data, 1749627696, 561, 0.0)
SaveReal(NewAI_Data, 1749627696, 562, 0.0)
SaveReal(NewAI_Data, 1749627696, 563, 0.0)
SaveReal(NewAI_Data, 1749627696, 564, 0.0)
end

function Vehicles78_AI1()
SaveReal(NewAI_Data, 1749627696, 565, 0.0)
SaveReal(NewAI_Data, 1749627696, 566, 0.0)
SaveReal(NewAI_Data, 1749627696, 567, 0.0)
SaveReal(NewAI_Data, 1749627698, 500, 3000.0)
SaveReal(NewAI_Data, 1749627698, 501, 600.0)
SaveReal(NewAI_Data, 1749627698, 502, 0.0)
SaveReal(NewAI_Data, 1749627698, 530, 540.0)
SaveReal(NewAI_Data, 1749627698, 531, 162.0)
SaveReal(NewAI_Data, 1749627698, 510, 0.0)
SaveReal(NewAI_Data, 1749627698, 511, 3000.0)
SaveReal(NewAI_Data, 1749627698, 512, 0.0)
SaveReal(NewAI_Data, 1749627698, 513, 0.0)
SaveReal(NewAI_Data, 1749627698, 514, 0.0)
SaveReal(NewAI_Data, 1749627698, 515, 0.0)
SaveReal(NewAI_Data, 1749627698, 516, 0.0)
SaveReal(NewAI_Data, 1749627698, 517, 0.0)
SaveReal(NewAI_Data, 1749627698, 520, 182.25)
SaveReal(NewAI_Data, 1749627698, 521, 364.5)
SaveReal(NewAI_Data, 1749627698, 522, 546.75)
SaveReal(NewAI_Data, 1749627698, 523, 182.25)
SaveReal(NewAI_Data, 1749627698, 524, 364.5)
SaveReal(NewAI_Data, 1749627698, 525, 364.5)
SaveReal(NewAI_Data, 1749627698, 526, 182.25)
SaveReal(NewAI_Data, 1749627698, 527, 91.125)
SaveReal(NewAI_Data, 1749627698, 550, 270.0)
SaveReal(NewAI_Data, 1749627698, 551, 540.0)
SaveReal(NewAI_Data, 1749627698, 552, 810.0)
SaveReal(NewAI_Data, 1749627698, 553, 270.0)
SaveReal(NewAI_Data, 1749627698, 554, 540.0)
SaveReal(NewAI_Data, 1749627698, 555, 540.0)
SaveReal(NewAI_Data, 1749627698, 556, 270.0)
SaveReal(NewAI_Data, 1749627698, 557, 135.0)
SaveReal(NewAI_Data, 1749627698, 560, 0.0)
SaveReal(NewAI_Data, 1749627698, 561, 0.0)
SaveReal(NewAI_Data, 1749627698, 562, 0.0)
SaveReal(NewAI_Data, 1749627698, 563, 0.0)
SaveReal(NewAI_Data, 1749627698, 564, 0.0)
SaveReal(NewAI_Data, 1749627698, 565, 0.0)
SaveReal(NewAI_Data, 1749627698, 566, 0.0)
SaveReal(NewAI_Data, 1749627698, 567, 0.0)
end

function Vehicles78_AI2()
SaveReal(NewAI_Data, 1749627697, 500, 2700.0)
SaveReal(NewAI_Data, 1749627697, 501, 550.0)
SaveReal(NewAI_Data, 1749627697, 502, 0.0)
SaveReal(NewAI_Data, 1749627697, 530, 210.0)
SaveReal(NewAI_Data, 1749627697, 531, 210.0)
SaveReal(NewAI_Data, 1749627697, 510, 0.0)
SaveReal(NewAI_Data, 1749627697, 511, 2700.0)
SaveReal(NewAI_Data, 1749627697, 512, 0.0)
SaveReal(NewAI_Data, 1749627697, 513, 0.0)
SaveReal(NewAI_Data, 1749627697, 514, 0.0)
SaveReal(NewAI_Data, 1749627697, 515, 0.0)
SaveReal(NewAI_Data, 1749627697, 516, 0.0)
SaveReal(NewAI_Data, 1749627697, 517, 0.0)
SaveReal(NewAI_Data, 1749627697, 520, 210.0)
SaveReal(NewAI_Data, 1749627697, 521, 630.0)
SaveReal(NewAI_Data, 1749627697, 522, 420.0)
SaveReal(NewAI_Data, 1749627697, 523, 210.0)
SaveReal(NewAI_Data, 1749627697, 524, 105.0)
SaveReal(NewAI_Data, 1749627697, 525, 210.0)
SaveReal(NewAI_Data, 1749627697, 526, 210.0)
SaveReal(NewAI_Data, 1749627697, 527, 105.0)
SaveReal(NewAI_Data, 1749627697, 550, 210.0)
SaveReal(NewAI_Data, 1749627697, 551, 630.0)
SaveReal(NewAI_Data, 1749627697, 552, 420.0)
SaveReal(NewAI_Data, 1749627697, 553, 210.0)
SaveReal(NewAI_Data, 1749627697, 554, 105.0)
SaveReal(NewAI_Data, 1749627697, 555, 210.0)
SaveReal(NewAI_Data, 1749627697, 556, 210.0)
SaveReal(NewAI_Data, 1749627697, 557, 105.0)
SaveReal(NewAI_Data, 1749627697, 560, 0.0)
SaveReal(NewAI_Data, 1749627697, 561, 0.0)
SaveReal(NewAI_Data, 1749627697, 562, 0.0)
SaveReal(NewAI_Data, 1749627697, 563, 0.0)
SaveReal(NewAI_Data, 1749627697, 564, 0.0)
SaveReal(NewAI_Data, 1749627697, 565, 0.0)
SaveReal(NewAI_Data, 1749627697, 566, 0.0)
SaveReal(NewAI_Data, 1749627697, 567, 0.0)
SaveReal(NewAI_Data, 1749627440, 540, 550.0)
SaveReal(NewAI_Data, 1749627440, 541, 550.0)
SaveReal(NewAI_Data, 1749627442, 540, 600.0)
end

function Vehicles78_AI3()
SaveReal(NewAI_Data, 1749627442, 541, 800.0)
SaveReal(NewAI_Data, 1749627441, 540, 550.0)
SaveReal(NewAI_Data, 1749627441, 541, 550.0)
SaveInteger(NewAI_Data, 1749627696, 5, 2)
SaveInteger(NewAI_Data, 1749627696, 100, 1749627697)
SaveInteger(NewAI_Data, 1749627696, 101, 1749627698)
SaveInteger(NewAI_Data, 1749628725, 5, 2)
SaveInteger(NewAI_Data, 1749628725, 101, 1749627696)
end

function Tanks79_AI0()
NewAI_CatalogUnit(1749634096, 0, 1000, 3, 2, 1, 0, 3, 1, 100, "M13/40")
SaveReal(NewAI_Data, 1749634096, 500, 900.0)
SaveReal(NewAI_Data, 1749634096, 501, 100.0)
SaveReal(NewAI_Data, 1749634096, 502, 0.0)
SaveReal(NewAI_Data, 1749634096, 530, 97.5)
SaveReal(NewAI_Data, 1749634096, 531, 97.5)
SaveReal(NewAI_Data, 1749634096, 510, 0.0)
SaveReal(NewAI_Data, 1749634096, 511, 900.0)
SaveReal(NewAI_Data, 1749634096, 512, 0.0)
SaveReal(NewAI_Data, 1749634096, 513, 0.0)
SaveReal(NewAI_Data, 1749634096, 514, 0.0)
SaveReal(NewAI_Data, 1749634096, 515, 0.0)
SaveReal(NewAI_Data, 1749634096, 516, 0.0)
SaveReal(NewAI_Data, 1749634096, 517, 0.0)
SaveReal(NewAI_Data, 1749634096, 520, 97.5)
SaveReal(NewAI_Data, 1749634096, 521, 292.5)
SaveReal(NewAI_Data, 1749634096, 522, 195.0)
SaveReal(NewAI_Data, 1749634096, 523, 97.5)
SaveReal(NewAI_Data, 1749634096, 524, 48.75)
SaveReal(NewAI_Data, 1749634096, 525, 97.5)
SaveReal(NewAI_Data, 1749634096, 526, 97.5)
SaveReal(NewAI_Data, 1749634096, 527, 48.75)
SaveReal(NewAI_Data, 1749634096, 550, 97.5)
SaveReal(NewAI_Data, 1749634096, 551, 292.5)
SaveReal(NewAI_Data, 1749634096, 552, 195.0)
SaveReal(NewAI_Data, 1749634096, 553, 97.5)
SaveReal(NewAI_Data, 1749634096, 554, 48.75)
SaveReal(NewAI_Data, 1749634096, 555, 97.5)
SaveReal(NewAI_Data, 1749634096, 556, 97.5)
SaveReal(NewAI_Data, 1749634096, 557, 48.75)
SaveReal(NewAI_Data, 1749634096, 560, 0.0)
SaveReal(NewAI_Data, 1749634096, 561, 0.0)
SaveReal(NewAI_Data, 1749634096, 562, 0.0)
SaveReal(NewAI_Data, 1749634096, 563, 0.0)
SaveReal(NewAI_Data, 1749634096, 564, 0.0)
SaveReal(NewAI_Data, 1749634096, 565, 0.0)
SaveReal(NewAI_Data, 1749634096, 566, 0.0)
SaveReal(NewAI_Data, 1749634096, 567, 0.0)
SaveInteger(NewAI_Data, 1749634096, 100, 1749634098)
NewAI_CatalogUnit(1749634098, 0, 500, 3, 2, 1, 0, 3, 1, 150, "M14/41")
end

function Tanks79_AI1()
SaveReal(NewAI_Data, 1749634098, 500, 1200.0)
SaveReal(NewAI_Data, 1749634098, 501, 150.0)
SaveReal(NewAI_Data, 1749634098, 502, 0.0)
SaveReal(NewAI_Data, 1749634098, 530, 127.5)
SaveReal(NewAI_Data, 1749634098, 531, 127.5)
SaveReal(NewAI_Data, 1749634098, 510, 0.0)
SaveReal(NewAI_Data, 1749634098, 511, 1200.0)
SaveReal(NewAI_Data, 1749634098, 512, 0.0)
SaveReal(NewAI_Data, 1749634098, 513, 0.0)
SaveReal(NewAI_Data, 1749634098, 514, 0.0)
SaveReal(NewAI_Data, 1749634098, 515, 0.0)
SaveReal(NewAI_Data, 1749634098, 516, 0.0)
SaveReal(NewAI_Data, 1749634098, 517, 0.0)
SaveReal(NewAI_Data, 1749634098, 520, 127.5)
SaveReal(NewAI_Data, 1749634098, 521, 382.5)
SaveReal(NewAI_Data, 1749634098, 522, 255.0)
SaveReal(NewAI_Data, 1749634098, 523, 127.5)
SaveReal(NewAI_Data, 1749634098, 524, 63.75)
SaveReal(NewAI_Data, 1749634098, 525, 127.5)
SaveReal(NewAI_Data, 1749634098, 526, 127.5)
SaveReal(NewAI_Data, 1749634098, 527, 63.75)
SaveReal(NewAI_Data, 1749634098, 550, 127.5)
SaveReal(NewAI_Data, 1749634098, 551, 382.5)
SaveReal(NewAI_Data, 1749634098, 552, 255.0)
SaveReal(NewAI_Data, 1749634098, 553, 127.5)
SaveReal(NewAI_Data, 1749634098, 554, 63.75)
SaveReal(NewAI_Data, 1749634098, 555, 127.5)
SaveReal(NewAI_Data, 1749634098, 556, 127.5)
SaveReal(NewAI_Data, 1749634098, 557, 63.75)
SaveReal(NewAI_Data, 1749634098, 560, 0.0)
SaveReal(NewAI_Data, 1749634098, 561, 0.0)
SaveReal(NewAI_Data, 1749634098, 562, 0.0)
SaveReal(NewAI_Data, 1749634098, 563, 0.0)
SaveReal(NewAI_Data, 1749634098, 564, 0.0)
SaveReal(NewAI_Data, 1749634098, 565, 0.0)
SaveReal(NewAI_Data, 1749634098, 566, 0.0)
SaveReal(NewAI_Data, 1749634098, 567, 0.0)
SaveInteger(NewAI_Data, 1749634098, 100, 1749634100)
NewAI_CatalogUnit(1749634100, 0, 700, 3, 2, 0, 0, 3, 1, 220, "M15/42")
SaveReal(NewAI_Data, 1749634100, 500, 1500.0)
end

function Tanks79_AI2()
SaveReal(NewAI_Data, 1749634100, 501, 220.0)
SaveReal(NewAI_Data, 1749634100, 502, 0.0)
SaveReal(NewAI_Data, 1749634100, 530, 172.5)
SaveReal(NewAI_Data, 1749634100, 531, 172.5)
SaveReal(NewAI_Data, 1749634100, 510, 0.0)
SaveReal(NewAI_Data, 1749634100, 511, 1500.0)
SaveReal(NewAI_Data, 1749634100, 512, 0.0)
SaveReal(NewAI_Data, 1749634100, 513, 0.0)
SaveReal(NewAI_Data, 1749634100, 514, 0.0)
SaveReal(NewAI_Data, 1749634100, 515, 0.0)
SaveReal(NewAI_Data, 1749634100, 516, 0.0)
SaveReal(NewAI_Data, 1749634100, 517, 0.0)
SaveReal(NewAI_Data, 1749634100, 520, 172.5)
SaveReal(NewAI_Data, 1749634100, 521, 517.5)
SaveReal(NewAI_Data, 1749634100, 522, 345.0)
SaveReal(NewAI_Data, 1749634100, 523, 172.5)
SaveReal(NewAI_Data, 1749634100, 524, 86.25)
SaveReal(NewAI_Data, 1749634100, 525, 172.5)
SaveReal(NewAI_Data, 1749634100, 526, 172.5)
SaveReal(NewAI_Data, 1749634100, 527, 86.25)
SaveReal(NewAI_Data, 1749634100, 550, 172.5)
SaveReal(NewAI_Data, 1749634100, 551, 517.5)
SaveReal(NewAI_Data, 1749634100, 552, 345.0)
SaveReal(NewAI_Data, 1749634100, 553, 172.5)
SaveReal(NewAI_Data, 1749634100, 554, 86.25)
SaveReal(NewAI_Data, 1749634100, 555, 172.5)
SaveReal(NewAI_Data, 1749634100, 556, 172.5)
SaveReal(NewAI_Data, 1749634100, 557, 86.25)
SaveReal(NewAI_Data, 1749634100, 560, 0.0)
SaveReal(NewAI_Data, 1749634100, 561, 0.0)
SaveReal(NewAI_Data, 1749634100, 562, 0.0)
SaveReal(NewAI_Data, 1749634100, 563, 0.0)
SaveReal(NewAI_Data, 1749634100, 564, 0.0)
SaveReal(NewAI_Data, 1749634100, 565, 0.0)
SaveReal(NewAI_Data, 1749634100, 566, 0.0)
SaveReal(NewAI_Data, 1749634100, 567, 0.0)
NewAI_CatalogUnit(1749633072, 0, 1500, 3, 2, 1, 0, 1, 1, 150, "P26/40")
SaveReal(NewAI_Data, 1749633072, 500, 800.0)
SaveReal(NewAI_Data, 1749633072, 501, 150.0)
SaveReal(NewAI_Data, 1749633072, 502, 0.0)
end

function Tanks79_AI3()
SaveReal(NewAI_Data, 1749633072, 530, 50.0)
SaveReal(NewAI_Data, 1749633072, 531, 50.0)
SaveReal(NewAI_Data, 1749633072, 510, 0.0)
SaveReal(NewAI_Data, 1749633072, 511, 0.0)
SaveReal(NewAI_Data, 1749633072, 512, 800.0)
SaveReal(NewAI_Data, 1749633072, 513, 0.0)
SaveReal(NewAI_Data, 1749633072, 514, 0.0)
SaveReal(NewAI_Data, 1749633072, 515, 0.0)
SaveReal(NewAI_Data, 1749633072, 516, 0.0)
SaveReal(NewAI_Data, 1749633072, 517, 0.0)
SaveReal(NewAI_Data, 1749633072, 520, 53.75)
SaveReal(NewAI_Data, 1749633072, 521, 161.25)
SaveReal(NewAI_Data, 1749633072, 522, 107.5)
SaveReal(NewAI_Data, 1749633072, 523, 53.75)
SaveReal(NewAI_Data, 1749633072, 524, 26.875)
SaveReal(NewAI_Data, 1749633072, 525, 53.75)
SaveReal(NewAI_Data, 1749633072, 526, 53.75)
SaveReal(NewAI_Data, 1749633072, 527, 26.875)
SaveReal(NewAI_Data, 1749633072, 550, 50.0)
SaveReal(NewAI_Data, 1749633072, 551, 150.0)
SaveReal(NewAI_Data, 1749633072, 552, 100.0)
SaveReal(NewAI_Data, 1749633072, 553, 50.0)
SaveReal(NewAI_Data, 1749633072, 554, 25.0)
SaveReal(NewAI_Data, 1749633072, 555, 50.0)
SaveReal(NewAI_Data, 1749633072, 556, 50.0)
SaveReal(NewAI_Data, 1749633072, 557, 25.0)
SaveReal(NewAI_Data, 1749633072, 560, 0.0)
SaveReal(NewAI_Data, 1749633072, 561, 0.0)
SaveReal(NewAI_Data, 1749633072, 562, 0.0)
SaveReal(NewAI_Data, 1749633072, 563, 0.0)
SaveReal(NewAI_Data, 1749633072, 564, 0.0)
SaveReal(NewAI_Data, 1749633072, 565, 0.0)
SaveReal(NewAI_Data, 1749633072, 566, 0.0)
SaveReal(NewAI_Data, 1749633072, 567, 0.0)
SaveInteger(NewAI_Data, 1749633072, 100, 1749633074)
NewAI_CatalogUnit(1749633074, 0, 1000, 3, 2, 1, 0, 1, 1, 250, "P43")
SaveReal(NewAI_Data, 1749633074, 500, 1500.0)
SaveReal(NewAI_Data, 1749633074, 501, 250.0)
SaveReal(NewAI_Data, 1749633074, 502, 0.0)
SaveReal(NewAI_Data, 1749633074, 530, 75.0)
end

function Tanks79_AI4()
SaveReal(NewAI_Data, 1749633074, 531, 75.0)
SaveReal(NewAI_Data, 1749633074, 510, 0.0)
SaveReal(NewAI_Data, 1749633074, 511, 0.0)
SaveReal(NewAI_Data, 1749633074, 512, 1500.0)
SaveReal(NewAI_Data, 1749633074, 513, 0.0)
SaveReal(NewAI_Data, 1749633074, 514, 0.0)
SaveReal(NewAI_Data, 1749633074, 515, 0.0)
SaveReal(NewAI_Data, 1749633074, 516, 0.0)
SaveReal(NewAI_Data, 1749633074, 517, 0.0)
SaveReal(NewAI_Data, 1749633074, 520, 80.625)
SaveReal(NewAI_Data, 1749633074, 521, 241.875)
SaveReal(NewAI_Data, 1749633074, 522, 161.25)
SaveReal(NewAI_Data, 1749633074, 523, 80.625)
SaveReal(NewAI_Data, 1749633074, 524, 40.3125)
SaveReal(NewAI_Data, 1749633074, 525, 80.625)
SaveReal(NewAI_Data, 1749633074, 526, 80.625)
SaveReal(NewAI_Data, 1749633074, 527, 40.3125)
SaveReal(NewAI_Data, 1749633074, 550, 75.0)
SaveReal(NewAI_Data, 1749633074, 551, 225.0)
SaveReal(NewAI_Data, 1749633074, 552, 150.0)
SaveReal(NewAI_Data, 1749633074, 553, 75.0)
SaveReal(NewAI_Data, 1749633074, 554, 37.5)
SaveReal(NewAI_Data, 1749633074, 555, 75.0)
SaveReal(NewAI_Data, 1749633074, 556, 75.0)
SaveReal(NewAI_Data, 1749633074, 557, 37.5)
SaveReal(NewAI_Data, 1749633074, 560, 0.0)
SaveReal(NewAI_Data, 1749633074, 561, 0.0)
SaveReal(NewAI_Data, 1749633074, 562, 0.0)
SaveReal(NewAI_Data, 1749633074, 563, 0.0)
SaveReal(NewAI_Data, 1749633074, 564, 0.0)
SaveReal(NewAI_Data, 1749633074, 565, 0.0)
SaveReal(NewAI_Data, 1749633074, 566, 0.0)
SaveReal(NewAI_Data, 1749633074, 567, 0.0)
SaveInteger(NewAI_Data, 1749633074, 100, 1749633076)
NewAI_CatalogUnit(1749633076, 0, 1500, 3, 2, 0, 0, 1, 1, 400, "P43bis")
SaveReal(NewAI_Data, 1749633076, 500, 2400.0)
SaveReal(NewAI_Data, 1749633076, 501, 400.0)
SaveReal(NewAI_Data, 1749633076, 502, 0.0)
SaveReal(NewAI_Data, 1749633076, 530, 105.0)
SaveReal(NewAI_Data, 1749633076, 531, 105.0)
end

function Tanks79_AI5()
SaveReal(NewAI_Data, 1749633076, 510, 0.0)
SaveReal(NewAI_Data, 1749633076, 511, 0.0)
SaveReal(NewAI_Data, 1749633076, 512, 2400.0)
SaveReal(NewAI_Data, 1749633076, 513, 0.0)
SaveReal(NewAI_Data, 1749633076, 514, 0.0)
SaveReal(NewAI_Data, 1749633076, 515, 0.0)
SaveReal(NewAI_Data, 1749633076, 516, 0.0)
SaveReal(NewAI_Data, 1749633076, 517, 0.0)
SaveReal(NewAI_Data, 1749633076, 520, 112.875)
SaveReal(NewAI_Data, 1749633076, 521, 338.625)
SaveReal(NewAI_Data, 1749633076, 522, 225.75)
SaveReal(NewAI_Data, 1749633076, 523, 112.875)
SaveReal(NewAI_Data, 1749633076, 524, 56.4375)
SaveReal(NewAI_Data, 1749633076, 525, 112.875)
SaveReal(NewAI_Data, 1749633076, 526, 112.875)
SaveReal(NewAI_Data, 1749633076, 527, 56.4375)
SaveReal(NewAI_Data, 1749633076, 550, 105.0)
SaveReal(NewAI_Data, 1749633076, 551, 315.0)
SaveReal(NewAI_Data, 1749633076, 552, 210.0)
SaveReal(NewAI_Data, 1749633076, 553, 105.0)
SaveReal(NewAI_Data, 1749633076, 554, 52.5)
SaveReal(NewAI_Data, 1749633076, 555, 105.0)
SaveReal(NewAI_Data, 1749633076, 556, 105.0)
SaveReal(NewAI_Data, 1749633076, 557, 52.5)
SaveReal(NewAI_Data, 1749633076, 560, 0.0)
SaveReal(NewAI_Data, 1749633076, 561, 0.0)
SaveReal(NewAI_Data, 1749633076, 562, 0.0)
SaveReal(NewAI_Data, 1749633076, 563, 0.0)
SaveReal(NewAI_Data, 1749633076, 564, 0.0)
SaveReal(NewAI_Data, 1749633076, 565, 0.0)
SaveReal(NewAI_Data, 1749633076, 566, 0.0)
SaveReal(NewAI_Data, 1749633076, 567, 0.0)
SaveInteger(NewAI_Data, 1749628725, 5, 4)
SaveInteger(NewAI_Data, 1749628725, 102, 1749634096)
SaveInteger(NewAI_Data, 1749628725, 103, 1749633072)
end

function Artillery81_AI0()
NewAI_CatalogUnit(1749631280, 200, 0, 3, 3, 2, 0, 1, 1, 200, "Italian Anti-Tank Gun")
SaveReal(NewAI_Data, 1749631280, 500, 200.0)
SaveReal(NewAI_Data, 1749631280, 501, 1000.0)
SaveReal(NewAI_Data, 1749631280, 502, 0.0)
SaveReal(NewAI_Data, 1749631280, 530, 37.5)
SaveReal(NewAI_Data, 1749631280, 531, 37.5)
SaveReal(NewAI_Data, 1749631280, 510, 0.0)
SaveReal(NewAI_Data, 1749631280, 511, 200.0)
SaveReal(NewAI_Data, 1749631280, 512, 0.0)
SaveReal(NewAI_Data, 1749631280, 513, 0.0)
SaveReal(NewAI_Data, 1749631280, 514, 0.0)
SaveReal(NewAI_Data, 1749631280, 515, 0.0)
SaveReal(NewAI_Data, 1749631280, 516, 0.0)
SaveReal(NewAI_Data, 1749631280, 517, 0.0)
SaveReal(NewAI_Data, 1749631280, 520, 42.1875)
SaveReal(NewAI_Data, 1749631280, 521, 126.5625)
SaveReal(NewAI_Data, 1749631280, 522, 84.375)
SaveReal(NewAI_Data, 1749631280, 523, 42.1875)
SaveReal(NewAI_Data, 1749631280, 524, 21.09375)
SaveReal(NewAI_Data, 1749631280, 525, 42.1875)
SaveReal(NewAI_Data, 1749631280, 526, 42.1875)
SaveReal(NewAI_Data, 1749631280, 527, 21.09375)
SaveReal(NewAI_Data, 1749631280, 550, 37.5)
SaveReal(NewAI_Data, 1749631280, 551, 112.5)
SaveReal(NewAI_Data, 1749631280, 552, 75.0)
SaveReal(NewAI_Data, 1749631280, 553, 37.5)
SaveReal(NewAI_Data, 1749631280, 554, 18.75)
SaveReal(NewAI_Data, 1749631280, 555, 37.5)
SaveReal(NewAI_Data, 1749631280, 556, 37.5)
SaveReal(NewAI_Data, 1749631280, 557, 18.75)
SaveReal(NewAI_Data, 1749631280, 560, 0.0)
SaveReal(NewAI_Data, 1749631280, 561, 0.0)
SaveReal(NewAI_Data, 1749631280, 562, 0.0)
SaveReal(NewAI_Data, 1749631280, 563, 0.0)
SaveReal(NewAI_Data, 1749631280, 564, 0.0)
SaveReal(NewAI_Data, 1749631280, 565, 0.0)
SaveReal(NewAI_Data, 1749631280, 566, 0.0)
SaveReal(NewAI_Data, 1749631280, 567, 0.0)
SaveInteger(NewAI_Data, 1749631280, 100, 1749631282)
SaveInteger(NewAI_Data, 1749631280, 101, 1749631284)
end

function Artillery81_AI1()
NewAI_CatalogUnit(1749631282, 0, 1500, 3, 3, 0, 0, 1, 1, 350, "M43 da 105/25")
SaveReal(NewAI_Data, 1749631282, 500, 600.0)
SaveReal(NewAI_Data, 1749631282, 501, 1200.0)
SaveReal(NewAI_Data, 1749631282, 502, 0.0)
SaveReal(NewAI_Data, 1749631282, 530, 41.66667175292969)
SaveReal(NewAI_Data, 1749631282, 531, 41.66667175292969)
SaveReal(NewAI_Data, 1749631282, 510, 0.0)
SaveReal(NewAI_Data, 1749631282, 511, 0.0)
SaveReal(NewAI_Data, 1749631282, 512, 600.0)
SaveReal(NewAI_Data, 1749631282, 513, 0.0)
SaveReal(NewAI_Data, 1749631282, 514, 0.0)
SaveReal(NewAI_Data, 1749631282, 515, 0.0)
SaveReal(NewAI_Data, 1749631282, 516, 0.0)
SaveReal(NewAI_Data, 1749631282, 517, 0.0)
SaveReal(NewAI_Data, 1749631282, 520, 46.875)
SaveReal(NewAI_Data, 1749631282, 521, 93.75)
SaveReal(NewAI_Data, 1749631282, 522, 46.875)
SaveReal(NewAI_Data, 1749631282, 523, 46.875)
SaveReal(NewAI_Data, 1749631282, 524, 93.75)
SaveReal(NewAI_Data, 1749631282, 525, 46.875)
SaveReal(NewAI_Data, 1749631282, 526, 46.875)
SaveReal(NewAI_Data, 1749631282, 527, 46.875)
SaveReal(NewAI_Data, 1749631282, 550, 0.0)
SaveReal(NewAI_Data, 1749631282, 551, 0.0)
SaveReal(NewAI_Data, 1749631282, 552, 0.0)
SaveReal(NewAI_Data, 1749631282, 553, 0.0)
SaveReal(NewAI_Data, 1749631282, 554, 0.0)
SaveReal(NewAI_Data, 1749631282, 555, 0.0)
SaveReal(NewAI_Data, 1749631282, 556, 0.0)
SaveReal(NewAI_Data, 1749631282, 557, 0.0)
SaveReal(NewAI_Data, 1749631282, 560, 0.0)
SaveReal(NewAI_Data, 1749631282, 561, 0.0)
SaveReal(NewAI_Data, 1749631282, 562, 0.0)
SaveReal(NewAI_Data, 1749631282, 563, 0.0)
SaveReal(NewAI_Data, 1749631282, 564, 0.0)
SaveReal(NewAI_Data, 1749631282, 565, 0.0)
SaveReal(NewAI_Data, 1749631282, 566, 0.0)
SaveReal(NewAI_Data, 1749631282, 567, 0.0)
NewAI_CatalogUnit(1749631284, 0, 1800, 3, 3, 0, 0, 1, 1, 380, "M41M da 90/53")
SaveReal(NewAI_Data, 1749631284, 500, 350.0)
end

function Artillery81_AI2()
SaveReal(NewAI_Data, 1749631284, 501, 1400.0)
SaveReal(NewAI_Data, 1749631284, 502, 0.0)
SaveReal(NewAI_Data, 1749631284, 530, 62.857139587402344)
SaveReal(NewAI_Data, 1749631284, 531, 62.857139587402344)
SaveReal(NewAI_Data, 1749631284, 510, 0.0)
SaveReal(NewAI_Data, 1749631284, 511, 350.0)
SaveReal(NewAI_Data, 1749631284, 512, 0.0)
SaveReal(NewAI_Data, 1749631284, 513, 0.0)
SaveReal(NewAI_Data, 1749631284, 514, 0.0)
SaveReal(NewAI_Data, 1749631284, 515, 0.0)
SaveReal(NewAI_Data, 1749631284, 516, 0.0)
SaveReal(NewAI_Data, 1749631284, 517, 0.0)
SaveReal(NewAI_Data, 1749631284, 520, 70.71428680419922)
SaveReal(NewAI_Data, 1749631284, 521, 212.14285278320312)
SaveReal(NewAI_Data, 1749631284, 522, 141.42857360839844)
SaveReal(NewAI_Data, 1749631284, 523, 70.71428680419922)
SaveReal(NewAI_Data, 1749631284, 524, 35.357139587402344)
SaveReal(NewAI_Data, 1749631284, 525, 70.71428680419922)
SaveReal(NewAI_Data, 1749631284, 526, 70.71428680419922)
SaveReal(NewAI_Data, 1749631284, 527, 35.357139587402344)
SaveReal(NewAI_Data, 1749631284, 550, 0.0)
SaveReal(NewAI_Data, 1749631284, 551, 0.0)
SaveReal(NewAI_Data, 1749631284, 552, 0.0)
SaveReal(NewAI_Data, 1749631284, 553, 0.0)
SaveReal(NewAI_Data, 1749631284, 554, 0.0)
SaveReal(NewAI_Data, 1749631284, 555, 0.0)
SaveReal(NewAI_Data, 1749631284, 556, 0.0)
SaveReal(NewAI_Data, 1749631284, 557, 0.0)
SaveReal(NewAI_Data, 1749631284, 560, 0.0)
SaveReal(NewAI_Data, 1749631284, 561, 0.0)
SaveReal(NewAI_Data, 1749631284, 562, 0.0)
SaveReal(NewAI_Data, 1749631284, 563, 0.0)
SaveReal(NewAI_Data, 1749631284, 564, 0.0)
SaveReal(NewAI_Data, 1749631284, 565, 0.0)
SaveReal(NewAI_Data, 1749631284, 566, 0.0)
SaveReal(NewAI_Data, 1749631284, 567, 0.0)
SaveInteger(NewAI_Data, 1749628725, 5, 5)
SaveInteger(NewAI_Data, 1749628725, 104, 1749631280)
end

function Forces82_AI0()
NewAI_CatalogUnit(1749112368, 0, 1500, 3, 5, 1, 0, 3, 1, 150, "Macchi C.202 Folgore")
SaveReal(NewAI_Data, 1749112368, 500, 2100.0)
SaveReal(NewAI_Data, 1749112368, 501, 450.0)
SaveReal(NewAI_Data, 1749112368, 502, 2400.0)
SaveReal(NewAI_Data, 1749112368, 530, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 531, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 510, 0.0)
SaveReal(NewAI_Data, 1749112368, 511, 0.0)
SaveReal(NewAI_Data, 1749112368, 512, 0.0)
SaveReal(NewAI_Data, 1749112368, 513, 0.0)
SaveReal(NewAI_Data, 1749112368, 514, 0.0)
SaveReal(NewAI_Data, 1749112368, 515, 2100.0)
SaveReal(NewAI_Data, 1749112368, 516, 0.0)
SaveReal(NewAI_Data, 1749112368, 517, 0.0)
SaveReal(NewAI_Data, 1749112368, 520, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 521, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 522, 340.0)
SaveReal(NewAI_Data, 1749112368, 523, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 524, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 525, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 526, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 527, 56.66666793823242)
SaveReal(NewAI_Data, 1749112368, 550, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 551, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 552, 340.0)
SaveReal(NewAI_Data, 1749112368, 553, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 554, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 555, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 556, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 557, 56.66666793823242)
SaveReal(NewAI_Data, 1749112368, 560, 0.0)
SaveReal(NewAI_Data, 1749112368, 561, 0.0)
SaveReal(NewAI_Data, 1749112368, 562, 0.0)
SaveReal(NewAI_Data, 1749112368, 563, 0.0)
SaveReal(NewAI_Data, 1749112368, 564, 0.0)
end

function Forces82_AI1()
SaveReal(NewAI_Data, 1749112368, 565, 2400.0)
SaveReal(NewAI_Data, 1749112368, 566, 0.0)
SaveReal(NewAI_Data, 1749112368, 567, 0.0)
SaveInteger(NewAI_Data, 1749112368, 100, 1749112370)
NewAI_CatalogUnit(1749112370, 0, 1300, 3, 5, 0, 0, 3, 1, 280, "Fiat G.55 Centauro")
SaveReal(NewAI_Data, 1749112370, 500, 3300.0)
SaveReal(NewAI_Data, 1749112370, 501, 500.0)
SaveReal(NewAI_Data, 1749112370, 502, 2400.0)
SaveReal(NewAI_Data, 1749112370, 530, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 531, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 510, 0.0)
SaveReal(NewAI_Data, 1749112370, 511, 0.0)
SaveReal(NewAI_Data, 1749112370, 512, 0.0)
SaveReal(NewAI_Data, 1749112370, 513, 0.0)
SaveReal(NewAI_Data, 1749112370, 514, 0.0)
SaveReal(NewAI_Data, 1749112370, 515, 3300.0)
SaveReal(NewAI_Data, 1749112370, 516, 0.0)
SaveReal(NewAI_Data, 1749112370, 517, 0.0)
SaveReal(NewAI_Data, 1749112370, 520, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 521, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 522, 571.7647094726562)
SaveReal(NewAI_Data, 1749112370, 523, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 524, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 525, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 526, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 527, 95.29412078857422)
SaveReal(NewAI_Data, 1749112370, 550, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 551, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 552, 571.7647094726562)
SaveReal(NewAI_Data, 1749112370, 553, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 554, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 555, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 556, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 557, 95.29412078857422)
SaveReal(NewAI_Data, 1749112370, 560, 0.0)
end

function Forces82_AI2()
SaveReal(NewAI_Data, 1749112370, 561, 0.0)
SaveReal(NewAI_Data, 1749112370, 562, 0.0)
SaveReal(NewAI_Data, 1749112370, 563, 0.0)
SaveReal(NewAI_Data, 1749112370, 564, 0.0)
SaveReal(NewAI_Data, 1749112370, 565, 2400.0)
SaveReal(NewAI_Data, 1749112370, 566, 0.0)
SaveReal(NewAI_Data, 1749112370, 567, 0.0)
NewAI_CatalogUnit(1749112372, 0, 1800, 3, 5, 0, 0, 3, 1, 180, "Reggiane Re.2002 Ariete")
SaveReal(NewAI_Data, 1749112372, 500, 2250.0)
SaveReal(NewAI_Data, 1749112372, 501, 200.0)
SaveReal(NewAI_Data, 1749112372, 502, 1000.0)
SaveReal(NewAI_Data, 1749112372, 530, 0.0)
SaveReal(NewAI_Data, 1749112372, 531, 210.0)
SaveReal(NewAI_Data, 1749112372, 510, 0.0)
SaveReal(NewAI_Data, 1749112372, 511, 0.0)
SaveReal(NewAI_Data, 1749112372, 512, 0.0)
SaveReal(NewAI_Data, 1749112372, 513, 0.0)
SaveReal(NewAI_Data, 1749112372, 514, 0.0)
SaveReal(NewAI_Data, 1749112372, 515, 2250.0)
SaveReal(NewAI_Data, 1749112372, 516, 0.0)
SaveReal(NewAI_Data, 1749112372, 517, 0.0)
SaveReal(NewAI_Data, 1749112372, 520, 236.25)
SaveReal(NewAI_Data, 1749112372, 521, 472.5)
SaveReal(NewAI_Data, 1749112372, 522, 236.25)
SaveReal(NewAI_Data, 1749112372, 523, 236.25)
SaveReal(NewAI_Data, 1749112372, 524, 472.5)
SaveReal(NewAI_Data, 1749112372, 525, 236.25)
SaveReal(NewAI_Data, 1749112372, 526, 236.25)
SaveReal(NewAI_Data, 1749112372, 527, 236.25)
SaveReal(NewAI_Data, 1749112372, 550, 0.0)
SaveReal(NewAI_Data, 1749112372, 551, 0.0)
SaveReal(NewAI_Data, 1749112372, 552, 0.0)
SaveReal(NewAI_Data, 1749112372, 553, 0.0)
SaveReal(NewAI_Data, 1749112372, 554, 0.0)
SaveReal(NewAI_Data, 1749112372, 555, 0.0)
end

function Forces82_AI3()
SaveReal(NewAI_Data, 1749112372, 556, 0.0)
SaveReal(NewAI_Data, 1749112372, 557, 0.0)
SaveReal(NewAI_Data, 1749112372, 560, 0.0)
SaveReal(NewAI_Data, 1749112372, 561, 0.0)
SaveReal(NewAI_Data, 1749112372, 562, 0.0)
SaveReal(NewAI_Data, 1749112372, 563, 0.0)
SaveReal(NewAI_Data, 1749112372, 564, 0.0)
SaveReal(NewAI_Data, 1749112372, 565, 1000.0)
SaveReal(NewAI_Data, 1749112372, 566, 0.0)
SaveReal(NewAI_Data, 1749112372, 567, 0.0)
NewAI_CatalogUnit(1749112374, 0, 1800, 3, 5, 1, 0, 1, 1, 180, "Savoia-Marchetti SM.79 Sparviero")
SaveReal(NewAI_Data, 1749112374, 500, 1400.0)
SaveReal(NewAI_Data, 1749112374, 501, 180.0)
SaveReal(NewAI_Data, 1749112374, 502, 1000.0)
SaveReal(NewAI_Data, 1749112374, 530, 0.0)
SaveReal(NewAI_Data, 1749112374, 531, 168.75)
SaveReal(NewAI_Data, 1749112374, 510, 0.0)
SaveReal(NewAI_Data, 1749112374, 511, 0.0)
SaveReal(NewAI_Data, 1749112374, 512, 0.0)
SaveReal(NewAI_Data, 1749112374, 513, 0.0)
SaveReal(NewAI_Data, 1749112374, 514, 0.0)
SaveReal(NewAI_Data, 1749112374, 515, 1400.0)
SaveReal(NewAI_Data, 1749112374, 516, 0.0)
SaveReal(NewAI_Data, 1749112374, 517, 0.0)
SaveReal(NewAI_Data, 1749112374, 520, 189.84375)
SaveReal(NewAI_Data, 1749112374, 521, 379.6875)
SaveReal(NewAI_Data, 1749112374, 522, 189.84375)
SaveReal(NewAI_Data, 1749112374, 523, 189.84375)
SaveReal(NewAI_Data, 1749112374, 524, 379.6875)
SaveReal(NewAI_Data, 1749112374, 525, 189.84375)
SaveReal(NewAI_Data, 1749112374, 526, 189.84375)
SaveReal(NewAI_Data, 1749112374, 527, 189.84375)
SaveReal(NewAI_Data, 1749112374, 550, 0.0)
SaveReal(NewAI_Data, 1749112374, 551, 0.0)
SaveReal(NewAI_Data, 1749112374, 552, 0.0)
end

function Forces82_AI4()
SaveReal(NewAI_Data, 1749112374, 553, 0.0)
SaveReal(NewAI_Data, 1749112374, 554, 0.0)
SaveReal(NewAI_Data, 1749112374, 555, 0.0)
SaveReal(NewAI_Data, 1749112374, 556, 0.0)
SaveReal(NewAI_Data, 1749112374, 557, 0.0)
SaveReal(NewAI_Data, 1749112374, 560, 0.0)
SaveReal(NewAI_Data, 1749112374, 561, 0.0)
SaveReal(NewAI_Data, 1749112374, 562, 0.0)
SaveReal(NewAI_Data, 1749112374, 563, 0.0)
SaveReal(NewAI_Data, 1749112374, 564, 0.0)
SaveReal(NewAI_Data, 1749112374, 565, 1000.0)
SaveReal(NewAI_Data, 1749112374, 566, 0.0)
SaveReal(NewAI_Data, 1749112374, 567, 0.0)
SaveInteger(NewAI_Data, 1749112374, 100, 1749112376)
NewAI_CatalogUnit(1749112376, 0, 4700, 3, 5, 0, 1, 1, 1, 650, "Piaggio P.108B")
NewAI_CatalogUnit(1749112624, 0, 6500, 3, 5, 0, 1, 1, 1, 650, "Piaggio P.108B")
SaveReal(NewAI_Data, 1749112376, 500, 4200.0)
SaveReal(NewAI_Data, 1749112624, 500, 4200.0)
SaveReal(NewAI_Data, 1749112376, 501, 220.0)
SaveReal(NewAI_Data, 1749112624, 501, 220.0)
SaveReal(NewAI_Data, 1749112376, 502, 1000.0)
SaveReal(NewAI_Data, 1749112624, 502, 1000.0)
SaveReal(NewAI_Data, 1749112376, 530, 0.0)
SaveReal(NewAI_Data, 1749112624, 530, 0.0)
SaveReal(NewAI_Data, 1749112376, 531, 316.6666564941406)
SaveReal(NewAI_Data, 1749112624, 531, 316.6666564941406)
SaveReal(NewAI_Data, 1749112376, 510, 0.0)
SaveReal(NewAI_Data, 1749112624, 510, 0.0)
SaveReal(NewAI_Data, 1749112376, 511, 0.0)
SaveReal(NewAI_Data, 1749112624, 511, 0.0)
SaveReal(NewAI_Data, 1749112376, 512, 0.0)
SaveReal(NewAI_Data, 1749112624, 512, 0.0)
SaveReal(NewAI_Data, 1749112376, 513, 0.0)
SaveReal(NewAI_Data, 1749112624, 513, 0.0)
SaveReal(NewAI_Data, 1749112376, 514, 0.0)
SaveReal(NewAI_Data, 1749112624, 514, 0.0)
SaveReal(NewAI_Data, 1749112376, 515, 4200.0)
SaveReal(NewAI_Data, 1749112624, 515, 4200.0)
SaveReal(NewAI_Data, 1749112376, 516, 0.0)
SaveReal(NewAI_Data, 1749112624, 516, 0.0)
SaveReal(NewAI_Data, 1749112376, 517, 0.0)
SaveReal(NewAI_Data, 1749112624, 517, 0.0)
SaveReal(NewAI_Data, 1749112376, 520, 450.0)
SaveReal(NewAI_Data, 1749112624, 520, 450.0)
SaveReal(NewAI_Data, 1749112376, 521, 900.0)
SaveReal(NewAI_Data, 1749112624, 521, 900.0)
SaveReal(NewAI_Data, 1749112376, 522, 450.0)
SaveReal(NewAI_Data, 1749112624, 522, 450.0)
SaveReal(NewAI_Data, 1749112376, 523, 450.0)
SaveReal(NewAI_Data, 1749112624, 523, 450.0)
SaveReal(NewAI_Data, 1749112376, 524, 900.0)
SaveReal(NewAI_Data, 1749112624, 524, 900.0)
SaveReal(NewAI_Data, 1749112376, 525, 450.0)
SaveReal(NewAI_Data, 1749112624, 525, 450.0)
SaveReal(NewAI_Data, 1749112376, 526, 450.0)
SaveReal(NewAI_Data, 1749112624, 526, 450.0)
end

function Forces82_AI5()
SaveReal(NewAI_Data, 1749112376, 527, 450.0)
SaveReal(NewAI_Data, 1749112624, 527, 450.0)
SaveReal(NewAI_Data, 1749112376, 550, 0.0)
SaveReal(NewAI_Data, 1749112624, 550, 0.0)
SaveReal(NewAI_Data, 1749112376, 551, 0.0)
SaveReal(NewAI_Data, 1749112624, 551, 0.0)
SaveReal(NewAI_Data, 1749112376, 552, 0.0)
SaveReal(NewAI_Data, 1749112624, 552, 0.0)
SaveReal(NewAI_Data, 1749112376, 553, 0.0)
SaveReal(NewAI_Data, 1749112624, 553, 0.0)
SaveReal(NewAI_Data, 1749112376, 554, 0.0)
SaveReal(NewAI_Data, 1749112624, 554, 0.0)
SaveReal(NewAI_Data, 1749112376, 555, 0.0)
SaveReal(NewAI_Data, 1749112624, 555, 0.0)
SaveReal(NewAI_Data, 1749112376, 556, 0.0)
SaveReal(NewAI_Data, 1749112624, 556, 0.0)
SaveReal(NewAI_Data, 1749112376, 557, 0.0)
SaveReal(NewAI_Data, 1749112624, 557, 0.0)
SaveReal(NewAI_Data, 1749112376, 560, 0.0)
SaveReal(NewAI_Data, 1749112624, 560, 0.0)
SaveReal(NewAI_Data, 1749112376, 561, 0.0)
SaveReal(NewAI_Data, 1749112624, 561, 0.0)
SaveReal(NewAI_Data, 1749112376, 562, 0.0)
SaveReal(NewAI_Data, 1749112624, 562, 0.0)
SaveReal(NewAI_Data, 1749112376, 563, 0.0)
SaveReal(NewAI_Data, 1749112624, 563, 0.0)
SaveReal(NewAI_Data, 1749112376, 564, 0.0)
SaveReal(NewAI_Data, 1749112624, 564, 0.0)
SaveReal(NewAI_Data, 1749112376, 565, 1000.0)
SaveReal(NewAI_Data, 1749112624, 565, 1000.0)
SaveReal(NewAI_Data, 1749112376, 566, 0.0)
SaveReal(NewAI_Data, 1749112624, 566, 0.0)
SaveReal(NewAI_Data, 1749112376, 567, 0.0)
SaveReal(NewAI_Data, 1749112624, 567, 0.0)
SaveInteger(NewAI_Data, 1749112376, 200, 1378889776)
SaveInteger(NewAI_Data, 1749112624, 200, 1378889776)
SaveInteger(NewAI_Data, 1749112376, 300, 1)
SaveInteger(NewAI_Data, 1749112624, 300, 1)
NewAI_CatalogUnit(1749632304, 500, 0, 3, 1, 0, 0, 5, 1, 500, "Italian Elite Squad")
SaveReal(NewAI_Data, 1749632304, 500, 3000.0)
SaveReal(NewAI_Data, 1749632304, 501, 600.0)
SaveReal(NewAI_Data, 1749632304, 502, 2000.0)
SaveReal(NewAI_Data, 1749632304, 530, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 531, 201.06060791015625)
SaveReal(NewAI_Data, 1749632304, 510, 3000.0)
SaveReal(NewAI_Data, 1749632304, 520, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 550, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 511, 0.0)
SaveReal(NewAI_Data, 1749632304, 521, 128.05555725097656)
SaveReal(NewAI_Data, 1749632304, 551, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 512, 0.0)
SaveReal(NewAI_Data, 1749632304, 522, 82.16666412353516)
SaveReal(NewAI_Data, 1749632304, 552, 28.83333396911621)
SaveReal(NewAI_Data, 1749632304, 513, 0.0)
end

function Forces82_AI6()
SaveReal(NewAI_Data, 1749632304, 523, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 553, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 514, 0.0)
SaveReal(NewAI_Data, 1749632304, 524, 109.44444274902344)
SaveReal(NewAI_Data, 1749632304, 554, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 515, 0.0)
SaveReal(NewAI_Data, 1749632304, 525, 74.72222137451172)
SaveReal(NewAI_Data, 1749632304, 555, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 516, 0.0)
SaveReal(NewAI_Data, 1749632304, 526, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 556, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 517, 0.0)
SaveReal(NewAI_Data, 1749632304, 527, 157.5)
SaveReal(NewAI_Data, 1749632304, 557, 144.1666717529297)
SaveReal(NewAI_Data, 1749112368, 500, 2100.0)
SaveReal(NewAI_Data, 1749112368, 502, 2100.0)
SaveReal(NewAI_Data, 1749112368, 530, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 531, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 510, 0.0)
SaveReal(NewAI_Data, 1749112368, 511, 0.0)
SaveReal(NewAI_Data, 1749112368, 512, 0.0)
SaveReal(NewAI_Data, 1749112368, 513, 0.0)
SaveReal(NewAI_Data, 1749112368, 514, 0.0)
SaveReal(NewAI_Data, 1749112368, 515, 2100.0)
SaveReal(NewAI_Data, 1749112368, 516, 0.0)
SaveReal(NewAI_Data, 1749112368, 517, 0.0)
SaveReal(NewAI_Data, 1749112368, 560, 0.0)
SaveReal(NewAI_Data, 1749112368, 561, 0.0)
SaveReal(NewAI_Data, 1749112368, 562, 0.0)
SaveReal(NewAI_Data, 1749112368, 563, 0.0)
SaveReal(NewAI_Data, 1749112368, 564, 0.0)
SaveReal(NewAI_Data, 1749112368, 565, 2100.0)
SaveReal(NewAI_Data, 1749112368, 566, 0.0)
SaveReal(NewAI_Data, 1749112368, 567, 0.0)
SaveReal(NewAI_Data, 1749112368, 520, 63.33333206176758)
end

function Forces82_AI7()
SaveReal(NewAI_Data, 1749112368, 521, 31.666667938232422)
SaveReal(NewAI_Data, 1749112368, 522, 19.0)
SaveReal(NewAI_Data, 1749112368, 523, 63.33333206176758)
SaveReal(NewAI_Data, 1749112368, 524, 63.33333206176758)
SaveReal(NewAI_Data, 1749112368, 525, 31.666667938232422)
SaveReal(NewAI_Data, 1749112368, 526, 63.33333206176758)
SaveReal(NewAI_Data, 1749112368, 527, 95.0)
SaveReal(NewAI_Data, 1749112368, 550, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 551, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 552, 340.0)
SaveReal(NewAI_Data, 1749112368, 553, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 554, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 555, 226.6666717529297)
SaveReal(NewAI_Data, 1749112368, 556, 113.33333587646484)
SaveReal(NewAI_Data, 1749112368, 557, 56.66666793823242)
SaveReal(NewAI_Data, 1749112370, 500, 3300.0)
SaveReal(NewAI_Data, 1749112370, 502, 3300.0)
SaveReal(NewAI_Data, 1749112370, 530, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 531, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 510, 0.0)
SaveReal(NewAI_Data, 1749112370, 511, 0.0)
SaveReal(NewAI_Data, 1749112370, 512, 0.0)
SaveReal(NewAI_Data, 1749112370, 513, 0.0)
SaveReal(NewAI_Data, 1749112370, 514, 0.0)
SaveReal(NewAI_Data, 1749112370, 515, 3300.0)
SaveReal(NewAI_Data, 1749112370, 516, 0.0)
SaveReal(NewAI_Data, 1749112370, 517, 0.0)
SaveReal(NewAI_Data, 1749112370, 560, 0.0)
SaveReal(NewAI_Data, 1749112370, 561, 0.0)
SaveReal(NewAI_Data, 1749112370, 562, 0.0)
SaveReal(NewAI_Data, 1749112370, 563, 0.0)
SaveReal(NewAI_Data, 1749112370, 564, 0.0)
SaveReal(NewAI_Data, 1749112370, 565, 3300.0)
SaveReal(NewAI_Data, 1749112370, 566, 0.0)
SaveReal(NewAI_Data, 1749112370, 567, 0.0)
end

function Forces82_AI8()
SaveReal(NewAI_Data, 1749112370, 520, 98.82353210449219)
SaveReal(NewAI_Data, 1749112370, 521, 49.411766052246094)
SaveReal(NewAI_Data, 1749112370, 522, 29.647058486938477)
SaveReal(NewAI_Data, 1749112370, 523, 98.82353210449219)
SaveReal(NewAI_Data, 1749112370, 524, 98.82353210449219)
SaveReal(NewAI_Data, 1749112370, 525, 49.411766052246094)
SaveReal(NewAI_Data, 1749112370, 526, 98.82353210449219)
SaveReal(NewAI_Data, 1749112370, 527, 148.23529052734375)
SaveReal(NewAI_Data, 1749112370, 550, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 551, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 552, 571.7647094726562)
SaveReal(NewAI_Data, 1749112370, 553, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 554, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 555, 381.1764831542969)
SaveReal(NewAI_Data, 1749112370, 556, 190.58824157714844)
SaveReal(NewAI_Data, 1749112370, 557, 95.29412078857422)
SaveReal(NewAI_Data, 1749112372, 500, 2250.0)
SaveReal(NewAI_Data, 1749112372, 502, 2250.0)
SaveReal(NewAI_Data, 1749112372, 530, 126.0)
SaveReal(NewAI_Data, 1749112372, 531, 210.0)
SaveReal(NewAI_Data, 1749112372, 510, 0.0)
SaveReal(NewAI_Data, 1749112372, 511, 0.0)
SaveReal(NewAI_Data, 1749112372, 512, 0.0)
SaveReal(NewAI_Data, 1749112372, 513, 0.0)
SaveReal(NewAI_Data, 1749112372, 514, 0.0)
SaveReal(NewAI_Data, 1749112372, 515, 2250.0)
SaveReal(NewAI_Data, 1749112372, 516, 0.0)
SaveReal(NewAI_Data, 1749112372, 517, 0.0)
SaveReal(NewAI_Data, 1749112372, 560, 0.0)
SaveReal(NewAI_Data, 1749112372, 561, 0.0)
SaveReal(NewAI_Data, 1749112372, 562, 0.0)
SaveReal(NewAI_Data, 1749112372, 563, 0.0)
SaveReal(NewAI_Data, 1749112372, 564, 0.0)
SaveReal(NewAI_Data, 1749112372, 565, 2250.0)
SaveReal(NewAI_Data, 1749112372, 566, 0.0)
end

function Forces82_AI9()
SaveReal(NewAI_Data, 1749112372, 567, 0.0)
SaveReal(NewAI_Data, 1749112372, 520, 210.0)
SaveReal(NewAI_Data, 1749112372, 521, 420.0)
SaveReal(NewAI_Data, 1749112372, 522, 210.0)
SaveReal(NewAI_Data, 1749112372, 523, 210.0)
SaveReal(NewAI_Data, 1749112372, 524, 420.0)
SaveReal(NewAI_Data, 1749112372, 525, 210.0)
SaveReal(NewAI_Data, 1749112372, 526, 210.0)
SaveReal(NewAI_Data, 1749112372, 527, 210.0)
SaveReal(NewAI_Data, 1749112372, 550, 63.0)
SaveReal(NewAI_Data, 1749112372, 551, 126.0)
SaveReal(NewAI_Data, 1749112372, 552, 189.0)
SaveReal(NewAI_Data, 1749112372, 553, 63.0)
SaveReal(NewAI_Data, 1749112372, 554, 126.0)
SaveReal(NewAI_Data, 1749112372, 555, 126.0)
SaveReal(NewAI_Data, 1749112372, 556, 63.0)
SaveReal(NewAI_Data, 1749112372, 557, 31.5)
SaveReal(NewAI_Data, 1749112374, 500, 1400.0)
SaveReal(NewAI_Data, 1749112374, 502, 1400.0)
SaveReal(NewAI_Data, 1749112374, 530, 0.0)
SaveReal(NewAI_Data, 1749112374, 531, 168.75)
SaveReal(NewAI_Data, 1749112374, 510, 0.0)
SaveReal(NewAI_Data, 1749112374, 511, 0.0)
SaveReal(NewAI_Data, 1749112374, 512, 0.0)
SaveReal(NewAI_Data, 1749112374, 513, 0.0)
SaveReal(NewAI_Data, 1749112374, 514, 0.0)
SaveReal(NewAI_Data, 1749112374, 515, 1400.0)
SaveReal(NewAI_Data, 1749112374, 516, 0.0)
SaveReal(NewAI_Data, 1749112374, 517, 0.0)
SaveReal(NewAI_Data, 1749112374, 560, 0.0)
SaveReal(NewAI_Data, 1749112374, 561, 0.0)
SaveReal(NewAI_Data, 1749112374, 562, 0.0)
SaveReal(NewAI_Data, 1749112374, 563, 0.0)
SaveReal(NewAI_Data, 1749112374, 564, 0.0)
SaveReal(NewAI_Data, 1749112374, 565, 1400.0)
end

function Forces82_AI10()
SaveReal(NewAI_Data, 1749112374, 566, 0.0)
SaveReal(NewAI_Data, 1749112374, 567, 0.0)
SaveReal(NewAI_Data, 1749112374, 520, 168.75)
SaveReal(NewAI_Data, 1749112374, 521, 337.5)
SaveReal(NewAI_Data, 1749112374, 522, 168.75)
SaveReal(NewAI_Data, 1749112374, 523, 168.75)
SaveReal(NewAI_Data, 1749112374, 524, 337.5)
SaveReal(NewAI_Data, 1749112374, 525, 168.75)
SaveReal(NewAI_Data, 1749112374, 526, 168.75)
SaveReal(NewAI_Data, 1749112374, 527, 168.75)
SaveReal(NewAI_Data, 1749112374, 550, 0.0)
SaveReal(NewAI_Data, 1749112374, 551, 0.0)
SaveReal(NewAI_Data, 1749112374, 552, 0.0)
SaveReal(NewAI_Data, 1749112374, 553, 0.0)
SaveReal(NewAI_Data, 1749112374, 554, 0.0)
SaveReal(NewAI_Data, 1749112374, 555, 0.0)
SaveReal(NewAI_Data, 1749112374, 556, 0.0)
SaveReal(NewAI_Data, 1749112374, 557, 0.0)
SaveReal(NewAI_Data, 1749112376, 500, 4200.0)
SaveReal(NewAI_Data, 1749112624, 500, 4200.0)
SaveReal(NewAI_Data, 1749112376, 502, 4200.0)
SaveReal(NewAI_Data, 1749112624, 502, 4200.0)
SaveReal(NewAI_Data, 1749112376, 530, 0.0)
SaveReal(NewAI_Data, 1749112624, 530, 0.0)
SaveReal(NewAI_Data, 1749112376, 531, 316.6666564941406)
SaveReal(NewAI_Data, 1749112624, 531, 316.6666564941406)
SaveReal(NewAI_Data, 1749112376, 510, 0.0)
SaveReal(NewAI_Data, 1749112624, 510, 0.0)
SaveReal(NewAI_Data, 1749112376, 511, 0.0)
SaveReal(NewAI_Data, 1749112624, 511, 0.0)
SaveReal(NewAI_Data, 1749112376, 512, 0.0)
SaveReal(NewAI_Data, 1749112624, 512, 0.0)
SaveReal(NewAI_Data, 1749112376, 513, 0.0)
SaveReal(NewAI_Data, 1749112624, 513, 0.0)
SaveReal(NewAI_Data, 1749112376, 514, 0.0)
SaveReal(NewAI_Data, 1749112624, 514, 0.0)
SaveReal(NewAI_Data, 1749112376, 515, 4200.0)
SaveReal(NewAI_Data, 1749112624, 515, 4200.0)
SaveReal(NewAI_Data, 1749112376, 516, 0.0)
SaveReal(NewAI_Data, 1749112624, 516, 0.0)
SaveReal(NewAI_Data, 1749112376, 517, 0.0)
SaveReal(NewAI_Data, 1749112624, 517, 0.0)
SaveReal(NewAI_Data, 1749112376, 560, 0.0)
SaveReal(NewAI_Data, 1749112624, 560, 0.0)
SaveReal(NewAI_Data, 1749112376, 561, 0.0)
SaveReal(NewAI_Data, 1749112624, 561, 0.0)
SaveReal(NewAI_Data, 1749112376, 562, 0.0)
SaveReal(NewAI_Data, 1749112624, 562, 0.0)
SaveReal(NewAI_Data, 1749112376, 563, 0.0)
SaveReal(NewAI_Data, 1749112624, 563, 0.0)
SaveReal(NewAI_Data, 1749112376, 564, 0.0)
SaveReal(NewAI_Data, 1749112624, 564, 0.0)
end

function Forces82_AI11()
SaveReal(NewAI_Data, 1749112376, 565, 4200.0)
SaveReal(NewAI_Data, 1749112624, 565, 4200.0)
SaveReal(NewAI_Data, 1749112376, 566, 0.0)
SaveReal(NewAI_Data, 1749112624, 566, 0.0)
SaveReal(NewAI_Data, 1749112376, 567, 0.0)
SaveReal(NewAI_Data, 1749112624, 567, 0.0)
SaveReal(NewAI_Data, 1749112376, 520, 400.0)
SaveReal(NewAI_Data, 1749112624, 520, 400.0)
SaveReal(NewAI_Data, 1749112376, 521, 800.0)
SaveReal(NewAI_Data, 1749112624, 521, 800.0)
SaveReal(NewAI_Data, 1749112376, 522, 400.0)
SaveReal(NewAI_Data, 1749112624, 522, 400.0)
SaveReal(NewAI_Data, 1749112376, 523, 400.0)
SaveReal(NewAI_Data, 1749112624, 523, 400.0)
SaveReal(NewAI_Data, 1749112376, 524, 800.0)
SaveReal(NewAI_Data, 1749112624, 524, 800.0)
SaveReal(NewAI_Data, 1749112376, 525, 400.0)
SaveReal(NewAI_Data, 1749112624, 525, 400.0)
SaveReal(NewAI_Data, 1749112376, 526, 400.0)
SaveReal(NewAI_Data, 1749112624, 526, 400.0)
SaveReal(NewAI_Data, 1749112376, 527, 400.0)
SaveReal(NewAI_Data, 1749112624, 527, 400.0)
SaveReal(NewAI_Data, 1749112376, 550, 0.0)
SaveReal(NewAI_Data, 1749112624, 550, 0.0)
SaveReal(NewAI_Data, 1749112376, 551, 0.0)
SaveReal(NewAI_Data, 1749112624, 551, 0.0)
SaveReal(NewAI_Data, 1749112376, 552, 0.0)
SaveReal(NewAI_Data, 1749112624, 552, 0.0)
SaveReal(NewAI_Data, 1749112376, 553, 0.0)
SaveReal(NewAI_Data, 1749112624, 553, 0.0)
SaveReal(NewAI_Data, 1749112376, 554, 0.0)
SaveReal(NewAI_Data, 1749112624, 554, 0.0)
SaveReal(NewAI_Data, 1749112376, 555, 0.0)
SaveReal(NewAI_Data, 1749112624, 555, 0.0)
SaveReal(NewAI_Data, 1749112376, 556, 0.0)
SaveReal(NewAI_Data, 1749112624, 556, 0.0)
SaveReal(NewAI_Data, 1749112376, 557, 0.0)
SaveReal(NewAI_Data, 1749112624, 557, 0.0)
SaveReal(NewAI_Data, 1749632304, 500, 3000.0)
SaveReal(NewAI_Data, 1749632304, 502, 0.0)
SaveReal(NewAI_Data, 1749632304, 530, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 531, 201.06060791015625)
SaveReal(NewAI_Data, 1749632304, 510, 3000.0)
SaveReal(NewAI_Data, 1749632304, 511, 0.0)
SaveReal(NewAI_Data, 1749632304, 512, 0.0)
SaveReal(NewAI_Data, 1749632304, 513, 0.0)
SaveReal(NewAI_Data, 1749632304, 514, 0.0)
SaveReal(NewAI_Data, 1749632304, 515, 0.0)
SaveReal(NewAI_Data, 1749632304, 516, 0.0)
SaveReal(NewAI_Data, 1749632304, 517, 0.0)
SaveReal(NewAI_Data, 1749632304, 560, 0.0)
SaveReal(NewAI_Data, 1749632304, 561, 0.0)
SaveReal(NewAI_Data, 1749632304, 562, 0.0)
SaveReal(NewAI_Data, 1749632304, 563, 0.0)
end

function Forces82_AI12()
SaveReal(NewAI_Data, 1749632304, 564, 0.0)
SaveReal(NewAI_Data, 1749632304, 565, 0.0)
SaveReal(NewAI_Data, 1749632304, 566, 0.0)
SaveReal(NewAI_Data, 1749632304, 567, 0.0)
SaveReal(NewAI_Data, 1749632304, 520, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 521, 128.05555725097656)
SaveReal(NewAI_Data, 1749632304, 522, 82.16666412353516)
SaveReal(NewAI_Data, 1749632304, 523, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 524, 109.44444274902344)
SaveReal(NewAI_Data, 1749632304, 525, 74.72222137451172)
SaveReal(NewAI_Data, 1749632304, 526, 122.77777862548828)
SaveReal(NewAI_Data, 1749632304, 527, 157.5)
SaveReal(NewAI_Data, 1749632304, 550, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 551, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 552, 28.83333396911621)
SaveReal(NewAI_Data, 1749632304, 553, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 554, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 555, 48.05555725097656)
SaveReal(NewAI_Data, 1749632304, 556, 96.11111450195312)
SaveReal(NewAI_Data, 1749632304, 557, 144.1666717529297)
SaveInteger(NewAI_Data, 1749628725, 100, 1749626928)
SaveInteger(NewAI_Data, 1749628725, 101, 1749627696)
SaveInteger(NewAI_Data, 1749628725, 102, 1749634096)
SaveInteger(NewAI_Data, 1749628725, 103, 1749633072)
SaveInteger(NewAI_Data, 1749628725, 104, 1749631280)
SaveInteger(NewAI_Data, 1749628725, 105, 1749112368)
SaveInteger(NewAI_Data, 1749628725, 106, 1749112372)
SaveInteger(NewAI_Data, 1749628725, 107, 1749112374)
SaveInteger(NewAI_Data, 1749628725, 108, 1749632304)
SaveInteger(NewAI_Data, 1749628725, 109, 1749112624)
SaveInteger(NewAI_Data, 1749628725, 5, 10)
end

function PerfUI_SetText(key, value)
    if (PerfUI_Text[key] ~= value) then
        PerfUI_Text[key] = value
        BlzFrameSetText(UI5_Frame(key), value)
    end
end

function PerfUI_SetTexture(key, value)
    if (PerfUI_Texture[key] ~= value) then
        PerfUI_Texture[key] = value
        BlzFrameSetTexture(UI5_Frame(key), value, 0, true)
    end
end

function PerfUI_SetVisible(key, value)
    if ((not PerfUI_VisibleKnown[key]) or (PerfUI_Visible[key] ~= value)) then
        PerfUI_VisibleKnown[key] = true
        PerfUI_Visible[key] = value
        BlzFrameSetVisible(UI5_Frame(key), value)
    end
end

function Italy75_Overview0()
AO_Register(1749627184, "Italian Rifleman", "ReplaceableTextures\\CommandButtons\\BTNItalianRifleman.blp", "", 0, 7.5, 7.5, 7.5)
SaveInteger(AO_Data, 1749627184, 7, 2)
SaveInteger(AO_Data, 1749627184, 8, 0)
SaveReal(AO_Data, 1749627184, 9, 2.0)
SaveReal(AO_Data, 1749627184, 10, 500.0)
SaveReal(AO_Data, 1749627184, 11, 0.0)
SaveReal(AO_Data, 1749627184, 12, 175.0)
SaveInteger(AO_Data, 1749627184, 13, 10)
SaveInteger(AO_Data, 1749627184, 14, 20)
AO_Register(1749627185, "Italian SMG", "ReplaceableTextures\\CommandButtons\\BTNItalianSMG.blp", "", 0, 10.454545021057129, 10.454545021057129, 10.454545021057129)
SaveInteger(AO_Data, 1749627185, 7, 2)
SaveInteger(AO_Data, 1749627185, 8, 0)
SaveReal(AO_Data, 1749627185, 9, 1.100000023841858)
SaveReal(AO_Data, 1749627185, 10, 500.0)
SaveReal(AO_Data, 1749627185, 11, 0.0)
SaveReal(AO_Data, 1749627185, 12, 175.0)
SaveInteger(AO_Data, 1749627185, 13, 9)
SaveInteger(AO_Data, 1749627185, 14, 14)
AO_Register(1749627186, "Italian Officer", "ReplaceableTextures\\CommandButtons\\BTNItalianOfficer.blp", "", 0, 7.5, 7.5, 7.5)
SaveInteger(AO_Data, 1749627186, 7, 2)
SaveInteger(AO_Data, 1749627186, 8, 0)
SaveReal(AO_Data, 1749627186, 9, 2.0)
SaveReal(AO_Data, 1749627186, 10, 525.0)
SaveReal(AO_Data, 1749627186, 11, 0.0)
SaveReal(AO_Data, 1749627186, 12, 175.0)
SaveInteger(AO_Data, 1749627186, 13, 10)
SaveInteger(AO_Data, 1749627186, 14, 20)
AO_Register(1749627187, "Italian Heavy Machinegun", "ReplaceableTextures\\CommandButtons\\BTNItalianHMG.blp", "", 0, 33.0, 33.0, 33.0)
SaveInteger(AO_Data, 1749627187, 7, 2)
SaveInteger(AO_Data, 1749627187, 8, 0)
SaveReal(AO_Data, 1749627187, 9, 0.5)
SaveReal(AO_Data, 1749627187, 10, 600.0)
SaveReal(AO_Data, 1749627187, 11, 0.0)
SaveReal(AO_Data, 1749627187, 12, 160.0)
SaveInteger(AO_Data, 1749627187, 13, 13)
SaveInteger(AO_Data, 1749627187, 14, 20)
AO_Register(1749627188, "Italian Mortar", "ReplaceableTextures\\CommandButtons\\BTNItalianMortar.blp", "", 0, 15.0, 15.0, 15.0)
SaveInteger(AO_Data, 1749627188, 7, 3)
SaveInteger(AO_Data, 1749627188, 8, 0)
SaveReal(AO_Data, 1749627188, 9, 3.0)
SaveReal(AO_Data, 1749627188, 10, 800.0)
SaveReal(AO_Data, 1749627188, 11, 0.0)
SaveReal(AO_Data, 1749627188, 12, 160.0)
SaveInteger(AO_Data, 1749627188, 13, 30)
SaveInteger(AO_Data, 1749627188, 14, 60)
end

function Italy75_Overview1()
AO_Register(1749627189, "Italian Anti-Tank Rifleman", "ReplaceableTextures\\CommandButtons\\BTNItalianAT.blp", "", 0, 19.166667938232422, 19.166667938232422, 19.166667938232422)
SaveInteger(AO_Data, 1749627189, 7, 5)
SaveInteger(AO_Data, 1749627189, 8, 0)
SaveReal(AO_Data, 1749627189, 9, 3.0)
SaveReal(AO_Data, 1749627189, 10, 500.0)
SaveReal(AO_Data, 1749627189, 11, 0.0)
SaveReal(AO_Data, 1749627189, 12, 175.0)
SaveInteger(AO_Data, 1749627189, 13, 35)
SaveInteger(AO_Data, 1749627189, 14, 80)
AO_Register(1749627190, "Italian AP Sniper", "ReplaceableTextures\\CommandButtons\\BTNItalianAT.blp", "", 0, 13.333333015441895, 13.333333015441895, 13.333333015441895)
SaveInteger(AO_Data, 1749627190, 7, 5)
SaveInteger(AO_Data, 1749627190, 8, 0)
SaveReal(AO_Data, 1749627190, 9, 3.0)
SaveReal(AO_Data, 1749627190, 10, 1000.0)
SaveReal(AO_Data, 1749627190, 11, 0.0)
SaveReal(AO_Data, 1749627190, 12, 175.0)
SaveInteger(AO_Data, 1749627190, 13, 25)
SaveInteger(AO_Data, 1749627190, 14, 55)
AO_Register(1749627191, "Italian Sniper", "ReplaceableTextures\\CommandButtons\\BTNItalianSniper.blp", "", 0, 20.0, 20.0, 20.0)
SaveInteger(AO_Data, 1749627191, 7, 2)
SaveInteger(AO_Data, 1749627191, 8, 0)
SaveReal(AO_Data, 1749627191, 9, 2.0)
SaveReal(AO_Data, 1749627191, 10, 1000.0)
SaveReal(AO_Data, 1749627191, 11, 0.0)
SaveReal(AO_Data, 1749627191, 12, 175.0)
SaveInteger(AO_Data, 1749627191, 13, 25)
SaveInteger(AO_Data, 1749627191, 14, 55)
AO_Register(1749627192, "Italian Flamethrower", "ReplaceableTextures\\CommandButtons\\BTNItalianFlamethrower.blp", "", 0, 10.5, 10.5, 10.5)
SaveInteger(AO_Data, 1749627192, 7, 2)
SaveInteger(AO_Data, 1749627192, 8, 0)
SaveReal(AO_Data, 1749627192, 9, 1.0)
SaveReal(AO_Data, 1749627192, 10, 400.0)
SaveReal(AO_Data, 1749627192, 11, 0.0)
SaveReal(AO_Data, 1749627192, 12, 175.0)
SaveInteger(AO_Data, 1749627192, 13, 8)
SaveInteger(AO_Data, 1749627192, 14, 13)
AO_Register(1749627193, "L3/35", "ReplaceableTextures\\CommandButtons\\BTNItaly75L335.blp", "", 1, 36.66666793823242, 36.66666793823242, 0.0)
SaveInteger(AO_Data, 1749627193, 7, 2)
SaveInteger(AO_Data, 1749627193, 8, 1)
SaveReal(AO_Data, 1749627193, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749627193, 10, 500.0)
SaveReal(AO_Data, 1749627193, 11, 0.0)
SaveReal(AO_Data, 1749627193, 12, 220.0)
SaveInteger(AO_Data, 1749627193, 13, 26)
SaveInteger(AO_Data, 1749627193, 14, 40)
end

function Italy75_Overview2()
AO_Register(1749627201, "L3/35 LF", "ReplaceableTextures\\CommandButtons\\BTNItaly75L335LF.blp", "", 1, 28.833332061767578, 28.833332061767578, 0.0)
SaveInteger(AO_Data, 1749627201, 7, 2)
SaveInteger(AO_Data, 1749627201, 8, 1)
SaveReal(AO_Data, 1749627201, 9, 1.0)
SaveReal(AO_Data, 1749627201, 10, 400.0)
SaveReal(AO_Data, 1749627201, 11, 0.0)
SaveReal(AO_Data, 1749627201, 12, 220.0)
SaveInteger(AO_Data, 1749627201, 13, 8)
SaveInteger(AO_Data, 1749627201, 14, 13)
SaveInteger(AO_Data, 1749626928, 20, 3)
SaveInteger(AO_Data, 1749626928, 100, 1749627184)
SaveInteger(AO_Data, 1749626928, 200, 6)
SaveInteger(AO_Data, 1749626928, 101, 1749627185)
SaveInteger(AO_Data, 1749626928, 201, 3)
SaveInteger(AO_Data, 1749626928, 102, 1749627186)
SaveInteger(AO_Data, 1749626928, 202, 1)
SaveInteger(AO_Data, 1749626929, 20, 2)
SaveInteger(AO_Data, 1749626929, 100, 1749627187)
SaveInteger(AO_Data, 1749626929, 200, 2)
SaveInteger(AO_Data, 1749626929, 101, 1749627188)
SaveInteger(AO_Data, 1749626929, 201, 2)
SaveInteger(AO_Data, 1749626930, 20, 1)
SaveInteger(AO_Data, 1749626930, 100, 1749627189)
SaveInteger(AO_Data, 1749626930, 200, 5)
SaveInteger(AO_Data, 1749626931, 20, 1)
SaveInteger(AO_Data, 1749626931, 100, 1749627190)
SaveInteger(AO_Data, 1749626931, 200, 5)
SaveInteger(AO_Data, 1749626932, 20, 1)
SaveInteger(AO_Data, 1749626932, 100, 1749627191)
SaveInteger(AO_Data, 1749626932, 200, 5)
SaveInteger(AO_Data, 1749626933, 20, 4)
SaveInteger(AO_Data, 1749626933, 100, 1749627184)
SaveInteger(AO_Data, 1749626933, 200, 6)
SaveInteger(AO_Data, 1749626933, 101, 1749627185)
SaveInteger(AO_Data, 1749626933, 201, 3)
SaveInteger(AO_Data, 1749626933, 102, 1749627186)
SaveInteger(AO_Data, 1749626933, 202, 1)
SaveInteger(AO_Data, 1749626933, 103, 1749627192)
SaveInteger(AO_Data, 1749626933, 203, 1)
SaveInteger(AO_Data, 1749626934, 20, 4)
SaveInteger(AO_Data, 1749626934, 100, 1749627184)
SaveInteger(AO_Data, 1749626934, 200, 6)
SaveInteger(AO_Data, 1749626934, 101, 1749627185)
SaveInteger(AO_Data, 1749626934, 201, 3)
SaveInteger(AO_Data, 1749626934, 102, 1749627186)
end

function Italy75_Overview3()
SaveInteger(AO_Data, 1749626934, 202, 1)
SaveInteger(AO_Data, 1749626934, 103, 1749627193)
SaveInteger(AO_Data, 1749626934, 203, 1)
SaveInteger(AO_Data, 1749626935, 20, 5)
SaveInteger(AO_Data, 1749626935, 100, 1749627184)
SaveInteger(AO_Data, 1749626935, 200, 6)
SaveInteger(AO_Data, 1749626935, 101, 1749627185)
SaveInteger(AO_Data, 1749626935, 201, 3)
SaveInteger(AO_Data, 1749626935, 102, 1749627186)
SaveInteger(AO_Data, 1749626935, 202, 1)
SaveInteger(AO_Data, 1749626935, 103, 1749627193)
SaveInteger(AO_Data, 1749626935, 203, 2)
SaveInteger(AO_Data, 1749626935, 104, 1749627201)
SaveInteger(AO_Data, 1749626935, 204, 1)
end

function Vehicles78_AO0()
AO_Register(1749627440, "Italian Motorcycle", "ReplaceableTextures\\CommandButtons\\BTNItalianBersaglieriMotorcycle.blp", "", 1, 22.142858505249023, 22.142858505249023, 22.142858505249023)
SaveInteger(AO_Data, 1749627440, 7, 2)
SaveInteger(AO_Data, 1749627440, 8, 1)
SaveReal(AO_Data, 1749627440, 9, 0.699999988079071)
SaveReal(AO_Data, 1749627440, 10, 550.0)
SaveReal(AO_Data, 1749627440, 11, 0.0)
SaveReal(AO_Data, 1749627440, 12, 250.0)
SaveInteger(AO_Data, 1749627440, 13, 13)
SaveInteger(AO_Data, 1749627440, 14, 18)
AO_Register(1749627441, "AB41 Armoured Car", "war3mapImported\\IconSdfkz.blp", "", 1, 70.0, 70.0, 70.0)
SaveInteger(AO_Data, 1749627441, 7, 5)
SaveInteger(AO_Data, 1749627441, 8, 1)
SaveReal(AO_Data, 1749627441, 9, 0.5)
SaveReal(AO_Data, 1749627441, 10, 550.0)
SaveReal(AO_Data, 1749627441, 11, 0.0)
SaveReal(AO_Data, 1749627441, 12, 200.0)
SaveInteger(AO_Data, 1749627441, 13, 30)
SaveInteger(AO_Data, 1749627441, 14, 40)
AO_Register(1749627442, "Dovunque 35/20", "war3mapImported\\IconSdfkz.blp", "", 1, 90.0, 54.0, 90.0)
SaveInteger(AO_Data, 1749627442, 7, 6)
SaveInteger(AO_Data, 1749627442, 8, 1)
SaveReal(AO_Data, 1749627442, 9, 0.5)
SaveReal(AO_Data, 1749627442, 10, 800.0)
SaveReal(AO_Data, 1749627442, 11, 0.0)
SaveReal(AO_Data, 1749627442, 12, 200.0)
SaveInteger(AO_Data, 1749627442, 13, 25)
SaveInteger(AO_Data, 1749627442, 14, 65)
SaveInteger(AO_Data, 1749627696, 20, 1)
SaveInteger(AO_Data, 1749627696, 100, 1749627440)
SaveInteger(AO_Data, 1749627696, 200, 6)
SaveInteger(AO_Data, 1749627698, 20, 1)
SaveInteger(AO_Data, 1749627698, 100, 1749627442)
SaveInteger(AO_Data, 1749627698, 200, 3)
SaveInteger(AO_Data, 1749627697, 20, 1)
SaveInteger(AO_Data, 1749627697, 100, 1749627441)
SaveInteger(AO_Data, 1749627697, 200, 3)
end

function Tanks79_AO0()
AO_Register(1749634097, "M13/40", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1340.blp", "", 2, 32.5, 32.5, 32.5)
SaveInteger(AO_Data, 1749634097, 7, 5)
SaveInteger(AO_Data, 1749634097, 8, 1)
SaveInteger(AO_Data, 1749634097, 13, 45)
SaveInteger(AO_Data, 1749634097, 14, 85)
SaveReal(AO_Data, 1749634097, 9, 2.0)
SaveReal(AO_Data, 1749634097, 10, 550.0)
SaveReal(AO_Data, 1749634097, 11, 0.0)
SaveReal(AO_Data, 1749634097, 12, 150.0)
AO_Register(1749634096, "M13/40", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1340.blp", "", 2, 32.5, 32.5, 32.5)
SaveInteger(AO_Data, 1749634096, 7, 5)
SaveInteger(AO_Data, 1749634096, 8, 1)
SaveInteger(AO_Data, 1749634096, 13, 45)
SaveInteger(AO_Data, 1749634096, 14, 85)
SaveReal(AO_Data, 1749634096, 9, 2.0)
SaveReal(AO_Data, 1749634096, 10, 550.0)
SaveReal(AO_Data, 1749634096, 11, 0.0)
SaveReal(AO_Data, 1749634096, 12, 150.0)
SaveInteger(AO_Data, 1749634096, 20, 1)
SaveInteger(AO_Data, 1749634096, 100, 1749634097)
SaveInteger(AO_Data, 1749634096, 200, 3)
AO_Register(1749634099, "M14/41", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1441.blp", "", 2, 42.5, 42.5, 42.5)
SaveInteger(AO_Data, 1749634099, 7, 5)
SaveInteger(AO_Data, 1749634099, 8, 1)
SaveInteger(AO_Data, 1749634099, 13, 65)
SaveInteger(AO_Data, 1749634099, 14, 105)
SaveReal(AO_Data, 1749634099, 9, 2.0)
SaveReal(AO_Data, 1749634099, 10, 550.0)
SaveReal(AO_Data, 1749634099, 11, 0.0)
SaveReal(AO_Data, 1749634099, 12, 150.0)
AO_Register(1749634098, "M14/41", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1441.blp", "", 2, 42.5, 42.5, 42.5)
SaveInteger(AO_Data, 1749634098, 7, 5)
SaveInteger(AO_Data, 1749634098, 8, 1)
SaveInteger(AO_Data, 1749634098, 13, 65)
SaveInteger(AO_Data, 1749634098, 14, 105)
SaveReal(AO_Data, 1749634098, 9, 2.0)
SaveReal(AO_Data, 1749634098, 10, 550.0)
SaveReal(AO_Data, 1749634098, 11, 0.0)
SaveReal(AO_Data, 1749634098, 12, 150.0)
SaveInteger(AO_Data, 1749634098, 20, 1)
end

function Tanks79_AO1()
SaveInteger(AO_Data, 1749634098, 100, 1749634099)
SaveInteger(AO_Data, 1749634098, 200, 3)
AO_Register(1749634101, "M15/42", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1542.blp", "", 2, 57.5, 57.5, 57.5)
SaveInteger(AO_Data, 1749634101, 7, 5)
SaveInteger(AO_Data, 1749634101, 8, 1)
SaveInteger(AO_Data, 1749634101, 13, 90)
SaveInteger(AO_Data, 1749634101, 14, 140)
SaveReal(AO_Data, 1749634101, 9, 2.0)
SaveReal(AO_Data, 1749634101, 10, 550.0)
SaveReal(AO_Data, 1749634101, 11, 0.0)
SaveReal(AO_Data, 1749634101, 12, 150.0)
AO_Register(1749634100, "M15/42", "ReplaceableTextures\\CommandButtons\\BTNItaly79M1542.blp", "", 2, 57.5, 57.5, 57.5)
SaveInteger(AO_Data, 1749634100, 7, 5)
SaveInteger(AO_Data, 1749634100, 8, 1)
SaveInteger(AO_Data, 1749634100, 13, 90)
SaveInteger(AO_Data, 1749634100, 14, 140)
SaveReal(AO_Data, 1749634100, 9, 2.0)
SaveReal(AO_Data, 1749634100, 10, 550.0)
SaveReal(AO_Data, 1749634100, 11, 0.0)
SaveReal(AO_Data, 1749634100, 12, 150.0)
SaveInteger(AO_Data, 1749634100, 20, 1)
SaveInteger(AO_Data, 1749634100, 100, 1749634101)
SaveInteger(AO_Data, 1749634100, 200, 3)
AO_Register(1749633073, "P26/40", "ReplaceableTextures\\CommandButtons\\BTNItaly79P2640.blp", "", 2, 50.0, 50.0, 50.0)
SaveInteger(AO_Data, 1749633073, 7, 5)
SaveInteger(AO_Data, 1749633073, 8, 2)
SaveInteger(AO_Data, 1749633073, 13, 75)
SaveInteger(AO_Data, 1749633073, 14, 125)
SaveReal(AO_Data, 1749633073, 9, 2.0)
SaveReal(AO_Data, 1749633073, 10, 600.0)
SaveReal(AO_Data, 1749633073, 11, 0.0)
SaveReal(AO_Data, 1749633073, 12, 150.0)
AO_Register(1749633072, "P26/40", "ReplaceableTextures\\CommandButtons\\BTNItaly79P2640.blp", "", 2, 50.0, 50.0, 50.0)
SaveInteger(AO_Data, 1749633072, 7, 5)
SaveInteger(AO_Data, 1749633072, 8, 2)
SaveInteger(AO_Data, 1749633072, 13, 75)
SaveInteger(AO_Data, 1749633072, 14, 125)
SaveReal(AO_Data, 1749633072, 9, 2.0)
SaveReal(AO_Data, 1749633072, 10, 600.0)
SaveReal(AO_Data, 1749633072, 11, 0.0)
end

function Tanks79_AO2()
SaveReal(AO_Data, 1749633072, 12, 150.0)
SaveInteger(AO_Data, 1749633072, 20, 1)
SaveInteger(AO_Data, 1749633072, 100, 1749633073)
SaveInteger(AO_Data, 1749633072, 200, 1)
AO_Register(1749633075, "P43", "ReplaceableTextures\\CommandButtons\\BTNItaly79P43.blp", "", 2, 75.0, 75.0, 75.0)
SaveInteger(AO_Data, 1749633075, 7, 5)
SaveInteger(AO_Data, 1749633075, 8, 2)
SaveInteger(AO_Data, 1749633075, 13, 115)
SaveInteger(AO_Data, 1749633075, 14, 185)
SaveReal(AO_Data, 1749633075, 9, 2.0)
SaveReal(AO_Data, 1749633075, 10, 600.0)
SaveReal(AO_Data, 1749633075, 11, 0.0)
SaveReal(AO_Data, 1749633075, 12, 150.0)
AO_Register(1749633074, "P43", "ReplaceableTextures\\CommandButtons\\BTNItaly79P43.blp", "", 2, 75.0, 75.0, 75.0)
SaveInteger(AO_Data, 1749633074, 7, 5)
SaveInteger(AO_Data, 1749633074, 8, 2)
SaveInteger(AO_Data, 1749633074, 13, 115)
SaveInteger(AO_Data, 1749633074, 14, 185)
SaveReal(AO_Data, 1749633074, 9, 2.0)
SaveReal(AO_Data, 1749633074, 10, 600.0)
SaveReal(AO_Data, 1749633074, 11, 0.0)
SaveReal(AO_Data, 1749633074, 12, 150.0)
SaveInteger(AO_Data, 1749633074, 20, 1)
SaveInteger(AO_Data, 1749633074, 100, 1749633075)
SaveInteger(AO_Data, 1749633074, 200, 1)
AO_Register(1749633077, "P43bis", "ReplaceableTextures\\CommandButtons\\BTNItaly79P43bis.blp", "", 2, 105.0, 105.0, 105.0)
SaveInteger(AO_Data, 1749633077, 7, 5)
SaveInteger(AO_Data, 1749633077, 8, 2)
SaveInteger(AO_Data, 1749633077, 13, 170)
SaveInteger(AO_Data, 1749633077, 14, 250)
SaveReal(AO_Data, 1749633077, 9, 2.0)
SaveReal(AO_Data, 1749633077, 10, 600.0)
SaveReal(AO_Data, 1749633077, 11, 0.0)
SaveReal(AO_Data, 1749633077, 12, 150.0)
AO_Register(1749633076, "P43bis", "ReplaceableTextures\\CommandButtons\\BTNItaly79P43bis.blp", "", 2, 105.0, 105.0, 105.0)
SaveInteger(AO_Data, 1749633076, 7, 5)
SaveInteger(AO_Data, 1749633076, 8, 2)
SaveInteger(AO_Data, 1749633076, 13, 170)
SaveInteger(AO_Data, 1749633076, 14, 250)
SaveReal(AO_Data, 1749633076, 9, 2.0)
end

function Tanks79_AO3()
SaveReal(AO_Data, 1749633076, 10, 600.0)
SaveReal(AO_Data, 1749633076, 11, 0.0)
SaveReal(AO_Data, 1749633076, 12, 150.0)
SaveInteger(AO_Data, 1749633076, 20, 1)
SaveInteger(AO_Data, 1749633076, 100, 1749633077)
SaveInteger(AO_Data, 1749633076, 200, 1)
end

function Artillery81_AO0()
AO_Register(1749631281, "Italian Anti-Tank Gun", "ReplaceableTextures\\CommandButtons\\BTNItaly81ItalianATGun.blp", "", 1, 37.5, 37.5, 37.5)
SaveInteger(AO_Data, 1749631281, 7, 5)
SaveInteger(AO_Data, 1749631281, 8, 1)
SaveInteger(AO_Data, 1749631281, 13, 50)
SaveInteger(AO_Data, 1749631281, 14, 100)
SaveReal(AO_Data, 1749631281, 9, 2.0)
SaveReal(AO_Data, 1749631281, 10, 1000.0)
SaveReal(AO_Data, 1749631281, 11, 0.0)
SaveReal(AO_Data, 1749631281, 12, 100.0)
AO_Register(1749631280, "Italian Anti-Tank Gun", "ReplaceableTextures\\CommandButtons\\BTNItaly81ItalianATGun.blp", "", 1, 37.5, 37.5, 37.5)
SaveInteger(AO_Data, 1749631280, 7, 5)
SaveInteger(AO_Data, 1749631280, 8, 1)
SaveInteger(AO_Data, 1749631280, 13, 50)
SaveInteger(AO_Data, 1749631280, 14, 100)
SaveReal(AO_Data, 1749631280, 9, 2.0)
SaveReal(AO_Data, 1749631280, 10, 1000.0)
SaveReal(AO_Data, 1749631280, 11, 0.0)
SaveReal(AO_Data, 1749631280, 12, 100.0)
SaveInteger(AO_Data, 1749631280, 20, 1)
SaveInteger(AO_Data, 1749631280, 100, 1749631281)
SaveInteger(AO_Data, 1749631280, 200, 1)
AO_Register(1749631283, "M43 da 105/25", "ReplaceableTextures\\CommandButtons\\BTNItaly81M4310525.blp", "", 1, 41.66667175292969, 41.66667175292969, 0.0)
SaveInteger(AO_Data, 1749631283, 7, 3)
SaveInteger(AO_Data, 1749631283, 8, 2)
SaveInteger(AO_Data, 1749631283, 13, 100)
SaveInteger(AO_Data, 1749631283, 14, 150)
SaveReal(AO_Data, 1749631283, 9, 3.0)
SaveReal(AO_Data, 1749631283, 10, 1200.0)
SaveReal(AO_Data, 1749631283, 11, 0.0)
SaveReal(AO_Data, 1749631283, 12, 150.0)
AO_Register(1749631282, "M43 da 105/25", "ReplaceableTextures\\CommandButtons\\BTNItaly81M4310525.blp", "", 1, 41.66667175292969, 41.66667175292969, 0.0)
SaveInteger(AO_Data, 1749631282, 7, 3)
SaveInteger(AO_Data, 1749631282, 8, 2)
SaveInteger(AO_Data, 1749631282, 13, 100)
SaveInteger(AO_Data, 1749631282, 14, 150)
SaveReal(AO_Data, 1749631282, 9, 3.0)
SaveReal(AO_Data, 1749631282, 10, 1200.0)
SaveReal(AO_Data, 1749631282, 11, 0.0)
SaveReal(AO_Data, 1749631282, 12, 150.0)
SaveInteger(AO_Data, 1749631282, 20, 1)
end

function Artillery81_AO1()
SaveInteger(AO_Data, 1749631282, 100, 1749631283)
SaveInteger(AO_Data, 1749631282, 200, 1)
AO_Register(1749631285, "M41M da 90/53", "ReplaceableTextures\\CommandButtons\\BTNItaly81M41M9053.blp", "", 1, 62.857139587402344, 62.857139587402344, 0.0)
SaveInteger(AO_Data, 1749631285, 7, 5)
SaveInteger(AO_Data, 1749631285, 8, 1)
SaveInteger(AO_Data, 1749631285, 13, 180)
SaveInteger(AO_Data, 1749631285, 14, 260)
SaveReal(AO_Data, 1749631285, 9, 3.5)
SaveReal(AO_Data, 1749631285, 10, 1400.0)
SaveReal(AO_Data, 1749631285, 11, 0.0)
SaveReal(AO_Data, 1749631285, 12, 140.0)
AO_Register(1749631284, "M41M da 90/53", "ReplaceableTextures\\CommandButtons\\BTNItaly81M41M9053.blp", "", 1, 62.857139587402344, 62.857139587402344, 0.0)
SaveInteger(AO_Data, 1749631284, 7, 5)
SaveInteger(AO_Data, 1749631284, 8, 1)
SaveInteger(AO_Data, 1749631284, 13, 180)
SaveInteger(AO_Data, 1749631284, 14, 260)
SaveReal(AO_Data, 1749631284, 9, 3.5)
SaveReal(AO_Data, 1749631284, 10, 1400.0)
SaveReal(AO_Data, 1749631284, 11, 0.0)
SaveReal(AO_Data, 1749631284, 12, 140.0)
SaveInteger(AO_Data, 1749631284, 20, 1)
SaveInteger(AO_Data, 1749631284, 100, 1749631285)
SaveInteger(AO_Data, 1749631284, 200, 1)
end

function Forces82_AO0()
AO_Register(1749112369, "Macchi C.202 Folgore", "ReplaceableTextures\\CommandButtons\\BTNItaly82C202.blp", "", 3, 37.77777862548828, 21.11111068725586, 37.77777862548828)
SaveInteger(AO_Data, 1749112369, 7, 6)
SaveInteger(AO_Data, 1749112369, 8, 5)
SaveInteger(AO_Data, 1749112369, 13, 30)
SaveInteger(AO_Data, 1749112369, 14, 38)
SaveReal(AO_Data, 1749112369, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749112369, 10, 450.0)
SaveReal(AO_Data, 1749112369, 11, 0.0)
SaveReal(AO_Data, 1749112369, 12, 200.0)
AO_Register(1749112368, "Macchi C.202 Folgore", "ReplaceableTextures\\CommandButtons\\BTNItaly82C202.blp", "", 3, 37.77777862548828, 21.11111068725586, 37.77777862548828)
SaveInteger(AO_Data, 1749112368, 7, 6)
SaveInteger(AO_Data, 1749112368, 8, 5)
SaveInteger(AO_Data, 1749112368, 13, 30)
SaveInteger(AO_Data, 1749112368, 14, 38)
SaveReal(AO_Data, 1749112368, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749112368, 10, 450.0)
SaveReal(AO_Data, 1749112368, 11, 0.0)
SaveReal(AO_Data, 1749112368, 12, 200.0)
SaveInteger(AO_Data, 1749112368, 20, 1)
SaveInteger(AO_Data, 1749112368, 100, 1749112369)
SaveInteger(AO_Data, 1749112368, 200, 3)
AO_Register(1749112371, "Fiat G.55 Centauro", "ReplaceableTextures\\CommandButtons\\BTNItaly82G55.blp", "", 3, 63.52941131591797, 32.94117736816406, 63.52941131591797)
SaveInteger(AO_Data, 1749112371, 7, 6)
SaveInteger(AO_Data, 1749112371, 8, 5)
SaveInteger(AO_Data, 1749112371, 13, 48)
SaveInteger(AO_Data, 1749112371, 14, 60)
SaveReal(AO_Data, 1749112371, 9, 0.8500000238418579)
SaveReal(AO_Data, 1749112371, 10, 500.0)
SaveReal(AO_Data, 1749112371, 11, 0.0)
SaveReal(AO_Data, 1749112371, 12, 210.0)
AO_Register(1749112370, "Fiat G.55 Centauro", "ReplaceableTextures\\CommandButtons\\BTNItaly82G55.blp", "", 3, 63.52941131591797, 32.94117736816406, 63.52941131591797)
SaveInteger(AO_Data, 1749112370, 7, 6)
SaveInteger(AO_Data, 1749112370, 8, 5)
SaveInteger(AO_Data, 1749112370, 13, 48)
SaveInteger(AO_Data, 1749112370, 14, 60)
end

function Forces82_AO1()
SaveReal(AO_Data, 1749112370, 9, 0.8500000238418579)
SaveReal(AO_Data, 1749112370, 10, 500.0)
SaveReal(AO_Data, 1749112370, 11, 0.0)
SaveReal(AO_Data, 1749112370, 12, 210.0)
SaveInteger(AO_Data, 1749112370, 20, 1)
SaveInteger(AO_Data, 1749112370, 100, 1749112371)
SaveInteger(AO_Data, 1749112370, 200, 3)
AO_Register(1749112373, "Reggiane Re.2002 Ariete", "ReplaceableTextures\\CommandButtons\\BTNItaly82Re2002.blp", "", 3, 70.0, 70.0, 21.0)
SaveInteger(AO_Data, 1749112373, 7, 3)
SaveInteger(AO_Data, 1749112373, 8, 5)
SaveInteger(AO_Data, 1749112373, 13, 125)
SaveInteger(AO_Data, 1749112373, 14, 155)
SaveReal(AO_Data, 1749112373, 9, 2.0)
SaveReal(AO_Data, 1749112373, 10, 200.0)
SaveReal(AO_Data, 1749112373, 11, 0.0)
SaveReal(AO_Data, 1749112373, 12, 190.0)
AO_Register(1749112372, "Reggiane Re.2002 Ariete", "ReplaceableTextures\\CommandButtons\\BTNItaly82Re2002.blp", "", 3, 70.0, 70.0, 21.0)
SaveInteger(AO_Data, 1749112372, 7, 3)
SaveInteger(AO_Data, 1749112372, 8, 5)
SaveInteger(AO_Data, 1749112372, 13, 125)
SaveInteger(AO_Data, 1749112372, 14, 155)
SaveReal(AO_Data, 1749112372, 9, 2.0)
SaveReal(AO_Data, 1749112372, 10, 200.0)
SaveReal(AO_Data, 1749112372, 11, 0.0)
SaveReal(AO_Data, 1749112372, 12, 190.0)
SaveInteger(AO_Data, 1749112372, 20, 1)
SaveInteger(AO_Data, 1749112372, 100, 1749112373)
SaveInteger(AO_Data, 1749112372, 200, 3)
AO_Register(1749112375, "Savoia-Marchetti SM.79 Sparviero", "ReplaceableTextures\\CommandButtons\\BTNItaly82SM79.blp", "", 3, 168.75, 168.75, 0.0)
SaveInteger(AO_Data, 1749112375, 7, 3)
SaveInteger(AO_Data, 1749112375, 8, 5)
SaveInteger(AO_Data, 1749112375, 13, 120)
SaveInteger(AO_Data, 1749112375, 14, 150)
SaveReal(AO_Data, 1749112375, 9, 0.800000011920929)
SaveReal(AO_Data, 1749112375, 10, 180.0)
end

function Forces82_AO2()
SaveReal(AO_Data, 1749112375, 11, 0.0)
SaveReal(AO_Data, 1749112375, 12, 185.0)
AO_Register(1749112374, "Savoia-Marchetti SM.79 Sparviero", "ReplaceableTextures\\CommandButtons\\BTNItaly82SM79.blp", "", 3, 168.75, 168.75, 0.0)
SaveInteger(AO_Data, 1749112374, 7, 3)
SaveInteger(AO_Data, 1749112374, 8, 5)
SaveInteger(AO_Data, 1749112374, 13, 120)
SaveInteger(AO_Data, 1749112374, 14, 150)
SaveReal(AO_Data, 1749112374, 9, 0.800000011920929)
SaveReal(AO_Data, 1749112374, 10, 180.0)
SaveReal(AO_Data, 1749112374, 11, 0.0)
SaveReal(AO_Data, 1749112374, 12, 185.0)
SaveInteger(AO_Data, 1749112374, 20, 1)
SaveInteger(AO_Data, 1749112374, 100, 1749112375)
SaveInteger(AO_Data, 1749112374, 200, 1)
AO_Register(1749112377, "Piaggio P.108B", "ReplaceableTextures\\CommandButtons\\BTNItaly82P108B.blp", "", 3, 316.6666564941406, 316.6666564941406, 0.0)
SaveInteger(AO_Data, 1749112377, 7, 3)
SaveInteger(AO_Data, 1749112377, 8, 5)
SaveInteger(AO_Data, 1749112377, 13, 340)
SaveInteger(AO_Data, 1749112377, 14, 420)
SaveReal(AO_Data, 1749112377, 9, 1.2000000476837158)
SaveReal(AO_Data, 1749112377, 10, 220.0)
SaveReal(AO_Data, 1749112377, 11, 0.0)
SaveReal(AO_Data, 1749112377, 12, 165.0)
AO_Register(1749112376, "Piaggio P.108B", "ReplaceableTextures\\CommandButtons\\BTNItaly82P108B.blp", "", 3, 316.6666564941406, 316.6666564941406, 0.0)
AO_Register(1749112624, "Piaggio P.108B", "ReplaceableTextures\\CommandButtons\\BTNItaly82P108B.blp", "", 3, 316.6666564941406, 316.6666564941406, 0.0)
SaveInteger(AO_Data, 1749112376, 7, 3)
SaveInteger(AO_Data, 1749112624, 7, 3)
SaveInteger(AO_Data, 1749112376, 8, 5)
SaveInteger(AO_Data, 1749112624, 8, 5)
SaveInteger(AO_Data, 1749112376, 13, 340)
SaveInteger(AO_Data, 1749112624, 13, 340)
SaveInteger(AO_Data, 1749112376, 14, 420)
SaveInteger(AO_Data, 1749112624, 14, 420)
SaveReal(AO_Data, 1749112376, 9, 1.2000000476837158)
SaveReal(AO_Data, 1749112624, 9, 1.2000000476837158)
SaveReal(AO_Data, 1749112376, 10, 220.0)
SaveReal(AO_Data, 1749112624, 10, 220.0)
SaveReal(AO_Data, 1749112376, 11, 0.0)
SaveReal(AO_Data, 1749112624, 11, 0.0)
SaveReal(AO_Data, 1749112376, 12, 165.0)
SaveReal(AO_Data, 1749112624, 12, 165.0)
SaveInteger(AO_Data, 1749112376, 20, 1)
SaveInteger(AO_Data, 1749112624, 20, 1)
SaveInteger(AO_Data, 1749112376, 100, 1749112377)
SaveInteger(AO_Data, 1749112624, 100, 1749112377)
SaveInteger(AO_Data, 1749112376, 200, 1)
SaveInteger(AO_Data, 1749112624, 200, 1)
end

function Forces82_AO3()
AO_Register(1749632305, "Italian Elite Beretta", "ReplaceableTextures\\CommandButtons\\BTNItaly82Beretta.blp", "", 0, 18.333332061767578, 18.333332061767578, 18.333332061767578)
SaveInteger(AO_Data, 1749632305, 7, 2)
SaveInteger(AO_Data, 1749632305, 8, 0)
SaveInteger(AO_Data, 1749632305, 13, 12)
SaveInteger(AO_Data, 1749632305, 14, 21)
SaveReal(AO_Data, 1749632305, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749632305, 10, 500.0)
SaveReal(AO_Data, 1749632305, 11, 0.0)
SaveReal(AO_Data, 1749632305, 12, 175.0)
AO_Register(1749632306, "Italian Elite Breda PG", "ReplaceableTextures\\CommandButtons\\BTNItaly82PG.blp", "", 0, 112.72727272727273, 112.72727272727273, 112.72727272727273)
SaveInteger(AO_Data, 1749632306, 7, 2)
SaveInteger(AO_Data, 1749632306, 8, 0)
SaveInteger(AO_Data, 1749632306, 13, 25)
SaveInteger(AO_Data, 1749632306, 14, 37)
SaveReal(AO_Data, 1749632306, 9, 1.100000023841858)
SaveReal(AO_Data, 1749632306, 10, 600.0)
SaveReal(AO_Data, 1749632306, 11, 0.0)
SaveReal(AO_Data, 1749632306, 12, 175.0)
AO_Register(1749632307, "Italian Elite Breda 30", "ReplaceableTextures\\CommandButtons\\BTNItaly82LMG.blp", "", 0, 25.0, 25.0, 25.0)
SaveInteger(AO_Data, 1749632307, 7, 2)
SaveInteger(AO_Data, 1749632307, 8, 0)
SaveInteger(AO_Data, 1749632307, 13, 18)
SaveInteger(AO_Data, 1749632307, 14, 27)
SaveReal(AO_Data, 1749632307, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749632307, 10, 525.0)
SaveReal(AO_Data, 1749632307, 11, 0.0)
SaveReal(AO_Data, 1749632307, 12, 175.0)
AO_Register(1749632308, "Italian Elite Anti-Tank", "ReplaceableTextures\\CommandButtons\\BTNItaly82AT.blp", "", 0, 26.666667938232422, 26.666667938232422, 0.0)
SaveInteger(AO_Data, 1749632308, 7, 5)
SaveInteger(AO_Data, 1749632308, 8, 0)
SaveInteger(AO_Data, 1749632308, 13, 60)
SaveInteger(AO_Data, 1749632308, 14, 100)
SaveReal(AO_Data, 1749632308, 9, 3.0)
SaveReal(AO_Data, 1749632308, 10, 600.0)
SaveReal(AO_Data, 1749632308, 11, 0.0)
end

function Forces82_AO4()
SaveReal(AO_Data, 1749632308, 12, 175.0)
AO_Register(1749632304, "Italian Elite Squad", "ReplaceableTextures\\CommandButtons\\BTNItaly82Beretta.blp", "", 0, 122.77777862548828, 122.77777862548828, 96.11111450195312)
SaveInteger(AO_Data, 1749632304, 7, 2)
SaveInteger(AO_Data, 1749632304, 8, 0)
SaveInteger(AO_Data, 1749632304, 13, 12)
SaveInteger(AO_Data, 1749632304, 14, 100)
SaveReal(AO_Data, 1749632304, 9, 0.8999999761581421)
SaveReal(AO_Data, 1749632304, 10, 600.0)
SaveReal(AO_Data, 1749632304, 11, 0.0)
SaveReal(AO_Data, 1749632304, 12, 175.0)
SaveInteger(AO_Data, 1749632304, 20, 4)
SaveInteger(AO_Data, 1749632304, 100, 1749632305)
SaveInteger(AO_Data, 1749632304, 200, 2)
SaveInteger(AO_Data, 1749632304, 101, 1749632306)
SaveInteger(AO_Data, 1749632304, 201, 1)
SaveInteger(AO_Data, 1749632304, 102, 1749632307)
SaveInteger(AO_Data, 1749632304, 202, 1)
SaveInteger(AO_Data, 1749632304, 103, 1749632308)
SaveInteger(AO_Data, 1749632304, 203, 1)
end

function main()
SetCameraBounds(J88_real(J88_real(-5376.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), J88_real(J88_real(-5632.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), J88_real(5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), J88_real(5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), J88_real(J88_real(-5376.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), J88_real(5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), J88_real(5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), J88_real(J88_real(-5632.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
SetTerrainFogEx(0, 3000.0, 5000.0, 0.5, 1.0, 0.0, 0.0)
SetWaterBaseColor(128, 0, 0, 255)
NewSoundEnvironment("Default")
SetAmbientDaySound("DalaranDay")
SetAmbientNightSound("DalaranNight")
SetMapMusic("Music", true, 0)
InitSounds()
CreateRegions()
CreateAllUnits()
InitBlizzard()
InitGlobals()
ExecuteFunc("Air82_Init")
ExecuteFunc("Elite82_Init")
ExecuteFunc("SellAll94_Init")
ExecuteFunc("Mac70_Init")
ExecuteFunc("Yamato81_Init")
ExecuteFunc("Zhukov_Init")
ExecuteFunc("PL104_Init")
ExecuteFunc("PF73_Init")
InitCustomTriggers()
RunInitializationTriggers()
--  BEGIN WW2_UI5_STARTUP
ExecuteFunc("NewAI_Init")
DifficultyChoice_Init()
UI5_Start()
--  END WW2_UI5_STARTUP
end

function config()
SetMapName("TRIGSTR_001")
SetMapDescription("TRIGSTR_003")
SetPlayers(9)
SetTeams(9)
SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
DefineStartLocation(0, 2816.0, 3904.0)
DefineStartLocation(1, 4288.0, 3200.0)
DefineStartLocation(2, 4224.0, J88_real(-3200.0))
DefineStartLocation(3, 2944.0, J88_real(-3968.0))
DefineStartLocation(4, J88_real(-2880.0), J88_real(-3968.0))
DefineStartLocation(5, J88_real(-4224.0), J88_real(-3200.0))
DefineStartLocation(6, J88_real(-4224.0), 3200.0)
DefineStartLocation(7, J88_real(-2944.0), 3968.0)
DefineStartLocation(8, 0.0, 0.0)
InitCustomPlayerSlots()
InitCustomTeams()
InitAllyPriorities()
end
