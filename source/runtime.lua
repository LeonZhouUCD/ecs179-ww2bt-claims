-- WW2 BT 1.0.6: explicit compatibility with typed JASS arithmetic.
-- Uses Lua 5.3 standard operations; game handles remain owned by Warcraft.
-- No native RNG, callback scheduling, or synchronized iteration is replaced.
--
-- Multiplayer sync layer. Lua gives up its reference to a game object only when the
-- garbage collector frees the object's Lua wrapper, and the collector runs at different
-- moments on different clients. A wrapper freed on one client but not yet on another
-- leaves the clients' script states different, and the game drops players. Every agent
-- (unit, timer, group, location, effect, frame, player, ...) returned to Lua is therefore
-- referenced for the whole game: the wrappers of the natives below record each result.
-- Agents that already exist while the scripts load (blizzard.lua globals such as
-- bj_lastStartedTimer) and every player handle are recorded here as well.
SYNC80_Pins = {}
SYNC80_AGENT_NATIVES = {"AddSpecialEffect", "AddSpecialEffectLoc", "AddSpecialEffectTarget",
    "AddSpellEffect", "AddSpellEffectById", "AddSpellEffectByIdLoc", "AddSpellEffectLoc",
    "AddSpellEffectTarget", "AddSpellEffectTargetById", "And",
    "BlzCreateDeadDestructablePitchRoll", "BlzCreateDeadDestructablePitchRollWithColor",
    "BlzCreateDeadDestructableWithColor", "BlzCreateDeadDestructableWithSkin",
    "BlzCreateDeadDestructableWithSkinColor", "BlzCreateDeadDestructableWithSkinPitchRoll",
    "BlzCreateDeadDestructableWithSkinPitchRollColor", "BlzCreateDeadDestructableZPitchRoll",
    "BlzCreateDeadDestructableZPitchRollWithColor", "BlzCreateDeadDestructableZWithColor",
    "BlzCreateDeadDestructableZWithSkin", "BlzCreateDeadDestructableZWithSkinColor",
    "BlzCreateDeadDestructableZWithSkinPitchRoll",
    "BlzCreateDeadDestructableZWithSkinPitchRollColor", "BlzCreateDestructablePitchRoll",
    "BlzCreateDestructablePitchRollWithColor", "BlzCreateDestructableWithColor",
    "BlzCreateDestructableWithSkin", "BlzCreateDestructableWithSkinColor",
    "BlzCreateDestructableWithSkinPitchRoll", "BlzCreateDestructableWithSkinPitchRollColor",
    "BlzCreateDestructableZPitchRoll", "BlzCreateDestructableZPitchRollWithColor",
    "BlzCreateDestructableZWithColor", "BlzCreateDestructableZWithSkin",
    "BlzCreateDestructableZWithSkinColor", "BlzCreateDestructableZWithSkinPitchRoll",
    "BlzCreateDestructableZWithSkinPitchRollColor", "BlzCreateFrame", "BlzCreateFrameByType",
    "BlzCreateItemWithSkin", "BlzCreateSimpleFrame", "BlzCreateUnitWithSkin",
    "BlzFrameGetChild", "BlzFrameGetParent", "BlzGetAbsorbingItem", "BlzGetEventDamageTarget",
    "BlzGetFrameByName", "BlzGetItemAbility", "BlzGetItemAbilityByIndex",
    "BlzGetMouseFocusUnit", "BlzGetOriginFrame", "BlzGetStackingItemSource",
    "BlzGetStackingItemTarget", "BlzGetTriggerFrame", "BlzGetTriggerPlayerMousePosition",
    "BlzGetUnitAbility", "BlzGetUnitAbilityByIndex", "BlzGroupUnitAt",
    "BlzTriggerRegisterFrameEvent", "BlzTriggerRegisterPlayerKeyEvent",
    "BlzTriggerRegisterPlayerSyncEvent", "CameraSetupGetDestPositionLoc", "Condition",
    "CreateBlightedGoldmine", "CreateCorpse", "CreateDeadDestructable",
    "CreateDeadDestructableZ", "CreateDefeatCondition", "CreateDestructable",
    "CreateDestructableZ", "CreateFogModifierRadius", "CreateFogModifierRadiusLoc",
    "CreateFogModifierRect", "CreateForce", "CreateGroup", "CreateItem", "CreateLeaderboard",
    "CreateMIDISound", "CreateMultiboard", "CreateQuest", "CreateRegion", "CreateSound",
    "CreateSoundFilenameWithLabel", "CreateSoundFromLabel", "CreateTimer", "CreateTimerDialog",
    "CreateTrackable", "CreateTrigger", "CreateUnit", "CreateUnitAtLoc",
    "CreateUnitAtLocByName", "CreateUnitByName", "DialogAddButton", "DialogAddQuitButton",
    "DialogCreate", "Filter", "FirstOfGroup", "GetAttacker", "GetBuyingUnit",
    "GetCameraEyePositionLoc", "GetCameraTargetPositionLoc", "GetCancelledStructure",
    "GetChangingUnit", "GetChangingUnitPrevOwner", "GetClickedButton", "GetClickedDialog",
    "GetConstructedStructure", "GetConstructingStructure", "GetDecayingUnit", "GetDetectedUnit",
    "GetDyingUnit", "GetEnteringUnit", "GetEnumDestructable", "GetEnumItem", "GetEnumPlayer",
    "GetEnumUnit", "GetEquippedItem", "GetEventDamageSource", "GetEventDetectingPlayer",
    "GetEventTargetUnit", "GetExpiredTimer", "GetFilterDestructable", "GetFilterItem",
    "GetFilterPlayer", "GetFilterUnit", "GetItemPlayer", "GetKillingUnit", "GetLearningUnit",
    "GetLeavingUnit", "GetLevelingUnit", "GetLoadedUnit", "GetLocalPlayer",
    "GetManipulatedItem", "GetManipulatingUnit", "GetOrderPointLoc", "GetOrderTarget",
    "GetOrderTargetDestructable", "GetOrderTargetItem", "GetOrderTargetUnit", "GetOrderedUnit",
    "GetOwningPlayer", "GetRescuer", "GetResearchingUnit", "GetRevivableUnit",
    "GetRevivingUnit", "GetSellingUnit", "GetSoldItem", "GetSoldUnit", "GetSpellAbility",
    "GetSpellAbilityUnit", "GetSpellTargetDestructable", "GetSpellTargetItem",
    "GetSpellTargetLoc", "GetSpellTargetUnit", "GetStartLocationLoc", "GetSummonedUnit",
    "GetSummoningUnit", "GetTournamentFinishNowPlayer", "GetTrainedUnit", "GetTransportUnit",
    "GetTriggerDestructable", "GetTriggerPlayer", "GetTriggerUnit", "GetTriggerWidget",
    "GetTriggeringRegion", "GetTriggeringTrackable", "GetTriggeringTrigger",
    "GetUnequippedItem", "GetUnitLoc", "GetUnitRallyDestructable", "GetUnitRallyPoint",
    "GetUnitRallyUnit", "GetWinningPlayer", "GetWorldBounds", "InitGameCache", "InitHashtable",
    "LoadAbilityHandle", "LoadBooleanExprHandle", "LoadButtonHandle",
    "LoadDefeatConditionHandle", "LoadDestructableHandle", "LoadDialogHandle",
    "LoadEffectHandle", "LoadFogModifierHandle", "LoadForceHandle", "LoadFrameHandle",
    "LoadGroupHandle", "LoadHashtableHandle", "LoadItemHandle", "LoadLeaderboardHandle",
    "LoadLocationHandle", "LoadMultiboardHandle", "LoadMultiboardItemHandle",
    "LoadPlayerHandle", "LoadQuestHandle", "LoadQuestItemHandle", "LoadRectHandle",
    "LoadRegionHandle", "LoadSoundHandle", "LoadTimerDialogHandle", "LoadTimerHandle",
    "LoadTrackableHandle", "LoadTriggerConditionHandle", "LoadTriggerEventHandle",
    "LoadTriggerHandle", "LoadUnitHandle", "LoadWidgetHandle", "Location", "MultiboardGetItem",
    "Not", "Or", "PlaceRandomItem", "PlaceRandomUnit", "Player", "PlayerGetLeaderboard",
    "QuestCreateItem", "Rect", "RectFromLoc", "RestoreUnit", "TriggerAddCondition",
    "TriggerRegisterCommandEvent", "TriggerRegisterDeathEvent",
    "TriggerRegisterDialogButtonEvent", "TriggerRegisterDialogEvent",
    "TriggerRegisterEnterRegion", "TriggerRegisterFilterUnitEvent", "TriggerRegisterGameEvent",
    "TriggerRegisterGameStateEvent", "TriggerRegisterLeaveRegion",
    "TriggerRegisterPlayerAllianceChange", "TriggerRegisterPlayerChatEvent",
    "TriggerRegisterPlayerEvent", "TriggerRegisterPlayerStateEvent",
    "TriggerRegisterPlayerUnitEvent", "TriggerRegisterTimerEvent",
    "TriggerRegisterTimerExpireEvent", "TriggerRegisterTrackableHitEvent",
    "TriggerRegisterTrackableTrackEvent", "TriggerRegisterUnitEvent",
    "TriggerRegisterUnitInRange", "TriggerRegisterUnitStateEvent",
    "TriggerRegisterUpgradeCommandEvent", "TriggerRegisterVariableEvent", "UnitAddItemById",
    "UnitItemInBagSlot", "UnitItemInEquipmentSlot", "UnitItemInSlot", "UnitRemoveItemFromSlot",
    "UnitUnequipItemFromSlot"}
do
    local pins = SYNC80_Pins
    local function pin(name)
        local native = _G[name]
        if (type(native) == "function") then
            _G[name] = function(...)
                local result = native(...)
                if (result ~= nil) then
                    pins[result] = true
                end
                return result
            end
        end
    end
    for i = 1, #SYNC80_AGENT_NATIVES do
        pin(SYNC80_AGENT_NATIVES[i])
    end
    for name, value in pairs(_G) do
        if (type(value) == "userdata") then
            pins[value] = true
        end
    end
    for i = 0, (bj_MAX_PLAYER_SLOTS or 28) - 1 do
        Player(i)
    end
end
function J88_int(value)
    -- Keep every intermediate an integer, including on LUA_32BITS builds.
    -- Hex literals retain their bit pattern instead of becoming large floats.
    return ((value & 0xffffffff) ~ 0x80000000) - 0x80000000
end

function J88_div(a, b)
    if b == 0 then error("JASS integer division by zero", 2) end
    local quotient = a // b
    -- Lua floors; JASS truncates toward zero. Integer-only remainder test
    -- avoids losing low bits when the Lua number type is binary32.
    if (a < 0) ~= (b < 0) and quotient * b ~= a then
        quotient = quotient + 1
    end
    return J88_int(quotient)
end

J90_NativeFloat32 = string.packsize("n") == 4
function J88_real(value)
    if J90_NativeFloat32 then return value * 1.0 end
    -- Preserve binary32 rounding on both 32-bit and default Lua builds.
    return (string.unpack("<f", string.pack("<f", value)))
end

function J88_concat(a, b)
    -- JASS accepts null strings in concatenation; Lua's .. operator does not.
    return (a or "") .. (b or "")
end

function J88_array(defaultValue)
    return setmetatable({}, {__index = function() return defaultValue end})
end

-- Lua-only bombing run ownership; no World Editor variable handles required.
-- Air93_Runs is the ordered owner list; Air93_RunByKey indexes it by bomber.
Air93_Runs = {}
Air93_RunByKey = {}

-- Sell All confirmation: game time of each player's first click; the trigger is kept referenced.
SellAll94_Pending = {}
SellAll94_Trigger = nil

-- Post-victory advance: whether the state table holds data; search group for aircraft.
WomanAdvance_Dirty = false
Advance_AirSearch = nil

-- MacArthur carrier progression: commander level per seat (1-5), the round in which a seat's
-- troops reached the central battlefield, active SB2C strikes and the local upgrade wait.
Mac70_Level = {}
Mac70_ArrivedRound = {}
Mac70_Strikes = {}
Mac70_StrikeTimer = nil
Mac70_Ground = nil
Mac70_LocalWait = 0
Mac70_CARRIER = 1749889330
Mac70_F4F_TYPE = (string.unpack(">I4", "hMF4"))
Mac70_F6F_TYPE = (string.unpack(">I4", "hMF6"))
Mac70_SB2C_TYPE = (string.unpack(">I4", "hMSB"))
Mac70_B17_TYPE = (string.unpack(">I4", "hUB7"))
Mac70_ABIL_F4F = (string.unpack(">I4", "AM70"))
Mac70_ABIL_F6F = (string.unpack(">I4", "AM71"))
Mac70_ABIL_SB2C = (string.unpack(">I4", "AM72"))
Mac70_ABIL_AIR = (string.unpack(">I4", "AM73"))
Mac70_ABILITIES = {Mac70_ABIL_F4F, Mac70_ABIL_F6F, Mac70_ABIL_SB2C, Mac70_ABIL_AIR}
Mac70_LOCUST = 1097625443
-- Blood Point price of reaching each level (index = new level).
Mac70_LEVEL_COST = {0, 2000, 2000, 3000, 4000}
Mac70_STRIKE_WAVES = 4
Mac70_STRIKE_WAVE_TARGETS = 3
Mac70_STRIKE_RADIUS = 500.0
Mac70_Barrages = {}
-- True only while an SB2C bomb is being applied (fixed final damage).
Mac70_StrikeHit = false
-- Commander quick-select button (frames exist on every client; state is local).
Mac73_CmdButton = nil
Mac73_CmdIcon = nil
Mac73_CmdClock = nil
Mac73_LastClick = -10.0
-- Breda PG four-round burst: pending follow-up shots and bullets in flight.
Ita73_PG_TYPE = (string.unpack(">I4", "hIE2"))
Ita73_BURST = 4
Ita73_SHOT_GAP = 0.12
Ita73_BULLET_SPEED = 1600.0
Ita73_Shots = {}
Ita73_Timer = nil
Ita73_ShotDamage = 0.0
Mac70_BarrageTimer = nil
Mac70_STRIKE_DAMAGE = 4000.0
Mac70_STRIKE_SPEED = 1000.0
Mac70_STRIKE_STEP = 0.03125
Mac70_BOMB_TICKS = 13
Mac70_EXIT_TICKS = 40
-- Unit lists read by local interface code. Filled only by synchronized code for every
-- player, so local code never touches a unit that other clients have not touched too.
UI76_Selected = {}
UI76_Owned = {}
-- Interface frames stay referenced by Lua for the whole game. Frames are stored in
-- hashtables and mostly read by local interface code; without a permanent Lua reference a
-- frame read on one client only would get a new script reference on that client alone.
UI77_Frames = {}
UI77_NativeSaveFrame = SaveFrameHandle
UI77_NativeLoadFrame = LoadFrameHandle
function SaveFrameHandle(table, parentKey, childKey, frame)
    local byTable = UI77_Frames[table]
    local byParent = nil
    if (byTable == nil) then
        byTable = {}
        UI77_Frames[table] = byTable
    end
    byParent = byTable[parentKey]
    if (byParent == nil) then
        byParent = {}
        byTable[parentKey] = byParent
    end
    byParent[childKey] = frame
    return UI77_NativeSaveFrame(table, parentKey, childKey, frame)
end
function LoadFrameHandle(table, parentKey, childKey)
    local byTable = UI77_Frames[table]
    local byParent = (byTable ~= nil) and byTable[parentKey] or nil
    if ((byParent ~= nil) and (byParent[childKey] ~= nil)) then
        return byParent[childKey]
    end
    return UI77_NativeLoadFrame(table, parentKey, childKey)
end

-- IJN Yamato main battery (0.8.1): every 15 s, three salvos on each of up to 3 separate circles.
Yamato81_RANGE = 2000.0
Yamato81_RADIUS = 200.0
Yamato81_SEPARATION = 400.0
Yamato81_DAMAGE = 500.0
Yamato81_COOLDOWN = 180
Yamato81_FIRST_IMPACT = 10
Yamato81_SALVO_GAP = 8
Yamato81_Volleys = {}
Yamato81_Next = {}
Yamato81_Exact = false
Yamato_Clock = 0
-- Shared visible projectiles (Yamato anti-air, T-28 machine guns).
Missile81_List = {}
Missile81_Timer = nil
-- Zhukov commander route (0.8.1).
ZK_HQ = (string.unpack(">I4", "hZK0"))
ZK_BUILDER = (string.unpack(">I4", "hZB0"))
ZK_CONSCRIPT = (string.unpack(">I4", "hZ10"))
ZK_INFANTRY = (string.unpack(">I4", "hZ13"))
ZK_SUPPORT1 = (string.unpack(">I4", "hZ61"))
ZK_SUPPORT3 = (string.unpack(">I4", "hZ63"))
ZK_T3485 = (string.unpack(">I4", "hZ34"))
ZK_T28 = (string.unpack(">I4", "hZ28"))
ZK_IS3 = (string.unpack(">I4", "hZI3"))
ZK_IS7 = (string.unpack(">I4", "hZI7"))
ZK_T26 = (string.unpack(">I4", "hZ26"))
ZK_SU100 = (string.unpack(">I4", "hZS1"))
ZK_ISU152 = (string.unpack(">I4", "hZSU"))
ZK_YAK9 = (string.unpack(">I4", "hZA1"))
ZK_TU2 = (string.unpack(">I4", "hZA2"))
ZK_IL2 = (string.unpack(">I4", "hZA3"))
ZK_IL4 = (string.unpack(">I4", "hZA4"))
ZK_C_T3485 = (string.unpack(">I4", "hZC1"))
ZK_C_T60 = (string.unpack(">I4", "hZC2"))
ZK_C_IS7 = (string.unpack(">I4", "hZC3"))
ZK_C_SU100 = (string.unpack(">I4", "hZC4"))
ZK_C_ISU152 = (string.unpack(">I4", "hZC5"))
ZK_C_T28 = (string.unpack(">I4", "hZC6"))
-- Communist tank progression (1.0.2).
CT_GONGCHEN = (string.unpack(">I4", "hCT4"))
CT_T3485 = (string.unpack(">I4", "hC34"))
CT_IS2 = (string.unpack(">I4", "hCI2"))
CT_T59 = (string.unpack(">I4", "hC59"))
CT_C_T3485 = (string.unpack(">I4", "hCC1"))
CT_C_IS2 = (string.unpack(">I4", "hCC2"))
CT_C_T59 = (string.unpack(">I4", "hCC3"))
-- Losing-streak compensation (1.0.3): side-battle result, streak and troop presence per player.
-- British additions (1.0.3).
UK_CRUSADER = (string.unpack(">I4", "h0AJ"))
UK_CROMWELL = (string.unpack(">I4", "h0BS"))
UK_CENTURION = (string.unpack(">I4", "h0BU"))
UK_VALENTINE = (string.unpack(">I4", "h0CB"))
UK_CANADIAN_HEAVY = (string.unpack(">I4", "h0AC"))
UK_HURRICANE = (string.unpack(">I4", "h0AM"))
UK_FIREFLY = (string.unpack(">I4", "hBF0"))
UK_C_FIREFLY = (string.unpack(">I4", "hBF1"))
UK_COMET = (string.unpack(">I4", "hBC0"))
UK_C_COMET = (string.unpack(">I4", "hBC1"))
UK_ARCHER = (string.unpack(">I4", "hBA0"))
UK_C_ARCHER = (string.unpack(">I4", "hBA1"))
UK_SEXTON = (string.unpack(">I4", "hBS0"))
UK_C_SEXTON = (string.unpack(">I4", "hBS1"))
UK_TYPHOON = (string.unpack(">I4", "hBT0"))
UK_C_TYPHOON = (string.unpack(">I4", "hBT1"))
LS103_Side = {}
LS103_Streak = {}
LS103_Fielded = {}
-- Polish elite rework (1.0.4): rawcodes.
PL_WOJTEK = (string.unpack(">I4", "h01P"))
PL_C_WOJTEK = (string.unpack(">I4", "h01Q"))
PL_SNIPER = (string.unpack(">I4", "h0BI"))
PL_GHOST = (string.unpack(">I4", "hPG0"))
PL_C_GHOST = (string.unpack(">I4", "hPG1"))
PL_GHOST_AT = (string.unpack(">I4", "hPG2"))
PL_C_GHOST_AT = (string.unpack(">I4", "hPG3"))
PL_P11 = (string.unpack(">I4", "h0H4"))
PL_SPITFIRE = (string.unpack(">I4", "hPS0"))
PL_C_SPITFIRE = (string.unpack(">I4", "hPS1"))
PL_SKALSKI = (string.unpack(">I4", "hPS2"))
PL_C_SKALSKI = (string.unpack(">I4", "hPS3"))
PL_LOS = (string.unpack(">I4", "h0H3"))
PL_WELLINGTON = (string.unpack(">I4", "hPW0"))
PL_C_WELLINGTON = (string.unpack(">I4", "hPW1"))
PL_SKARZYNSKI = (string.unpack(">I4", "hPW2"))
PL_C_SKARZYNSKI = (string.unpack(">I4", "hPW3"))
PL_TKS = (string.unpack(">I4", "h0DL"))
PL_C_TKS = (string.unpack(">I4", "h0DK"))
PL_ORLIK = (string.unpack(">I4", "h0BM"))
PL_C_ORLIK = (string.unpack(">I4", "h0BN"))
PL_FLAG = (string.unpack(">I4", "h08L"))
PL_MACZEK = (string.unpack(">I4", "hPM0"))
PL_C_MACZEK = (string.unpack(">I4", "hPM1"))
PL_C_SHERMAN = (string.unpack(">I4", "hPM2"))
PL_C_FIREFLY = (string.unpack(">I4", "hPM3"))
PL_ABIL_ARTILLERY = (string.unpack(">I4", "APW1"))
PL_ABIL_FURY = (string.unpack(">I4", "APS2"))
PL_ABIL_MARK = (string.unpack(">I4", "APM3"))
PL_ABIL_INVISIBLE = (string.unpack(">I4", "Apiv"))
-- Polish ranged artillery for Wojtek: mortars, the SU-76 self-propelled gun and the Katyusha.
PL_ARTILLERY = {[(string.unpack(">I4", "h0AX"))] = true, [(string.unpack(">I4", "h0D0"))] = true,
    [(string.unpack(">I4", "h08H"))] = true, [(string.unpack(">I4", "h07Q"))] = true}
-- Hero identities: one per player across purchase and upgrade (both Warsaw Ghost forms share one).
PL_IDENTITY = {[PL_GHOST] = 1, [PL_GHOST_AT] = 1, [PL_SKALSKI] = 2, [PL_SKARZYNSKI] = 3, [PL_WOJTEK] = 4,
    [PL_ORLIK] = 5}
-- Nationalist Chinese additions (1.0.6).
KMT_SHERMAN = (string.unpack(">I4", "h0JL"))
KMT_PEUGEOT = (string.unpack(">I4", "h0K7"))
KMT_FIREFLY = (string.unpack(">I4", "hNF0"))
KMT_C_FIREFLY = (string.unpack(">I4", "hNF1"))
KMT_LVT4 = (string.unpack(">I4", "hNL0"))
KMT_C_LVT4 = (string.unpack(">I4", "hNL1"))
PL104_BEAR_DAMAGE = 200.0
PL104_BEAR_COOLDOWN = 6.0
PL104_STEP = 0.05
PL104_SWEEP_COOLDOWN = 8.0
PL104_SWEEP_GAP = 0.25
PL104_SWEEP_SPEED = 1200.0
PL104_SWEEP_RANGE = 600.0
PL104_SWEEP_DAMAGE = 70.0
PL104_SWEEP_WIDTH = 40.0
PL104_MARK_DURATION = 6.0
-- Polish elite rework (1.0.4): battle state. Lists hold registered combat units; tables are
-- keyed by handle id. All of it is synchronized game state, cleared when a battle stops.
PL104_Active = false
PL104_Clock = nil
PL104_Timer = nil
PL104_LimitTimer = nil
PL104_Ticks = 0
PL104_Known = {}
PL104_Bears = {}
PL104_BearReady = {}
PL104_Ghosts = {}
PL104_GhostShot = {}
PL104_FlashUsed = {}
PL104_Aces = {}
PL104_Orliks = {}
PL104_OrlikReady = {}
PL104_Bursts = {}
PL104_Bullets = {}
PL104_Stuns = {}
PL104_Marks = {}
PL104_Boosted = nil
PL104_Search = nil
PL104_Scan = nil
PL104_Busy = false
PL104_UpgradeQueue = {}
PL104_UpgradeTimer = nil
-- Existing producer -> route producer (free conversion, same receipt).
ZK_ROUTE = {[1747988784] = ZK_CONSCRIPT, [1747988787] = ZK_INFANTRY, [1747989077] = ZK_T3485,
    [1747989074] = ZK_T26, [1747990602] = ZK_SU100, [1747990356] = ZK_IS3, [1747989303] = ZK_YAK9,
    [1747989304] = ZK_TU2}
-- Route clones that spawn and display exactly like their original producer.
ZK_CANONICAL = {[ZK_CONSCRIPT] = 1747988784, [ZK_INFANTRY] = 1747988787, [ZK_T26] = 1747989074,
    [ZK_IS3] = 1747990356, [ZK_YAK9] = 1747989303, [ZK_TU2] = 1747989304, [ZK_IL2] = 1747993401,
    [ZK_IL4] = 1747993409}
-- Living combat copies: T-34 -> T-34-85, SU-85 -> SU-100.
ZK_COMBAT = {[1747989078] = ZK_C_T3485, [1747990599] = ZK_C_SU100}
-- Partisan and horse-cavalry producers that a Zhukov player cannot keep or build.
ZK_FORBIDDEN = {[1747988805] = true, [1747994163] = true, [1747994165] = true, [1747994169] = true,
    [1747988819] = true}
ZK_FORBIDDEN_LIST = {1747988805, 1747994163, 1747994165, 1747994169, 1747988819}
-- Builder-built originals replaced by route versions for a Zhukov player.
ZK_REPLACED_LIST = {1747993674, 1747988784, 1747989077, 1747989074, 1747989303, 1747989304}
Zhukov_Chosen = {}
Zhukov_Queue = {}
Zhukov_Timer = nil
Zhukov_Lineage = {}
Zhukov_T28 = {}
Zhukov_T28Timer = nil
Zhukov_Search = nil
Zhukov_MG_RANGE = 600.0
Zhukov_MG_TARGETS = 3
Zhukov_MG_DAMAGE = 35.0
