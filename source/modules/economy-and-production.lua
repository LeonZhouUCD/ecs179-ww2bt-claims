function SpawnGetNextTokenEnum()
if (GetUnitX(GetEnumUnit()) > SPAWN_UNITS_SORT_REAL_X) then
do return end
elseif (GetUnitX(GetEnumUnit()) == SPAWN_UNITS_SORT_REAL_X) then
if (GetUnitY(GetEnumUnit()) > SPAWN_UNITS_SORT_REAL_Y) then
do return end
end
end
SPAWN_UNITS_SORT_UNIT = GetEnumUnit()
SPAWN_UNITS_SORT_REAL_X = GetUnitX(GetEnumUnit())
SPAWN_UNITS_SORT_REAL_Y = GetUnitX(GetEnumUnit())
end

function SpawnGetNextToken(t)
SPAWN_UNITS_SORT_REAL_X = 99999.8984375
SPAWN_UNITS_SORT_REAL_Y = 99999.8984375
SPAWN_UNITS_SORT_UNIT = nil
ForGroup(t, SpawnGetNextTokenEnum)
if (SPAWN_UNITS_SORT_UNIT ~= nil) then
GroupRemoveUnit(t, SPAWN_UNITS_SORT_UNIT)
end
do return SPAWN_UNITS_SORT_UNIT end
end

function CreateSpawnArray(p, facing)
local tokens = CreateGroup()
local g = CreateGroup()
local t = nil
local tid = 0
GroupEnumUnitsOfPlayer(tokens, p, nil)
SPAWN_UNITS_COUNT[GetPlayerId(p)] = 0
while true do
t = SpawnGetNextToken(tokens)
if (t == nil) then break end
Bounty_Building = t
Bounty_Pid = GetPlayerId(p)
Bounty_Start = SPAWN_UNITS_COUNT[Bounty_Pid]
tid = Mao_CanonicalType(GetUnitTypeId(t))
US95_Spawn(p, g, tid, facing)
Zhukov_Spawn(p, g, tid, facing)
CT102_Spawn(p, g, tid, facing)
UK103_Spawn(p, g, tid, facing)
PL104_Spawn(p, g, tid, facing)
KMT106_Spawn(p, g, tid, facing)
if ((tid == 1750675762) and RoundSchedule_IsFinalRound(udg_int_CurRound)) then
DoSpawn2(p, g, 1750675761, 1, facing)
end
if (tid == 1747990860) then
DoSpawn2(p, g, 1747990852, 15, facing)
end
if (tid == 1747989836) then
DoSpawn2(p, g, 1747990607, 4, facing)
DoSpawn2(p, g, 1747990608, 2, facing)
DoSpawn2(p, g, 1747990609, 1, facing)
DoSpawn2(p, g, 1747990610, 2, facing)
DoSpawn2(p, g, 1747990614, 1, facing)
end
if (tid == 1747990869) then
DoSpawn2(p, g, 1747990610, 5, facing)
end
if (tid == 1747990864) then
DoSpawn2(p, g, 1747990862, 5, facing)
end
if (tid == 1747990865) then
DoSpawn2(p, g, 1747990611, 5, facing)
end
if (tid == 1747990867) then
DoSpawn2(p, g, 1747990612, 3, facing)
end
if (tid == 1747992889) then
DoSpawn2(p, g, 1747990840, 5, facing)
DoSpawn2(p, g, 1747990849, 2, facing)
DoSpawn2(p, g, 1747992905, 2, facing)
DoSpawn2(p, g, 1747990841, 1, facing)
end
if (tid == 1747992901) then
DoSpawn2(p, g, 1747990850, 5, facing)
end
if (tid == 1747992897) then
DoSpawn2(p, g, 1747992888, 5, facing)
end
if (tid == 1747992900) then
DoSpawn2(p, g, 1747992886, 5, facing)
end
if (tid == 1747992899) then
DoSpawn2(p, g, 1747990851, 2, facing)
DoSpawn2(p, g, 1747992885, 2, facing)
end
if (tid == 1747989581) then
DoSpawn2(p, g, 1747990615, 6, facing)
DoSpawn2(p, g, 1747990617, 3, facing)
DoSpawn2(p, g, 1747990832, 1, facing)
end
if (tid == 1747992903) then
DoSpawn2(p, g, 1747990615, 6, facing)
DoSpawn2(p, g, 1747990617, 3, facing)
DoSpawn2(p, g, 1747990832, 1, facing)
DoSpawn2(p, g, 1747992884, 1, facing)
end
if (tid == 1747992904) then
DoSpawn2(p, g, 1747990616, 5, facing)
end
if (tid == 1747992882) then
DoSpawn2(p, g, 1747990618, 2, facing)
DoSpawn2(p, g, 1747990859, 2, facing)
end
if (tid == 1747992883) then
DoSpawn2(p, g, 1747990839, 5, facing)
DoSpawn2(p, g, 1747990838, 3, facing)
end
if (tid == 1747990858) then
DoSpawn2(p, g, 1747990834, 1, facing)
DoSpawn2(p, g, 1747990833, 1, facing)
DoSpawn2(p, g, 1747990835, 1, facing)
DoSpawn2(p, g, 1747990836, 1, facing)
end
if (tid == 1747994420) then
DoSpawn2(p, g, 1747993688, 1, facing)
end
if (tid == 1747994424) then
DoSpawn2(p, g, 1747994422, 1, facing)
end
if (tid == 1747994425) then
DoSpawn2(p, g, 1747994423, 1, facing)
end
if (tid == 1747994457) then
DoSpawn2(p, g, 1747994455, 1, facing)
end
if (tid == 1747990868) then
DoSpawn2(p, g, 1747990856, 1, facing)
end
if (tid == 1747993414) then
DoSpawn2(p, g, 1747993665, 1, facing)
end
if (tid == 1747992880) then
DoSpawn2(p, g, 1747990874, 3, facing)
end
if (tid == 1747992881) then
DoSpawn2(p, g, 1747990872, 3, facing)
end
if (tid == 1747992907) then
DoSpawn2(p, g, 1747992908, 3, facing)
end
if (tid == 1747993410) then
DoSpawn2(p, g, 1747993415, 3, facing)
end
if (tid == 1747993411) then
DoSpawn2(p, g, 1747993416, 3, facing)
end
if (tid == 1747993412) then
DoSpawn2(p, g, 1747993418, 3, facing)
end
if (tid == 1747993413) then
DoSpawn2(p, g, 1747993417, 3, facing)
end
if (tid == 1747992906) then
DoSpawn2(p, g, 1747992902, 1, facing)
end
if (tid == 1747993169) then
DoSpawn2(p, g, 1747993168, 1, facing)
end
if (tid == 1747993172) then
DoSpawn2(p, g, 1747993397, 1, facing)
end
if (tid == 1747993174) then
DoSpawn2(p, g, 1747993398, 1, facing)
end
if (tid == 1747993399) then
DoSpawn2(p, g, 1747993395, 1, facing)
end
if (tid == 1747993400) then
DoSpawn2(p, g, 1747993394, 1, facing)
end
if (tid == 1747993171) then
DoSpawn2(p, g, 1747993393, 1, facing)
end
if (tid == 1747993678) then
DoSpawn2(p, g, 1747993677, 1, facing)
end
if (tid == 1747993173) then
DoSpawn2(p, g, 1747993396, 1, facing)
end
if (tid == 1747992909) then
DoSpawn2(p, g, 1747992911, 3, facing)
end
if (tid == 1747992910) then
DoSpawn2(p, g, 1747992912, 3, facing)
end
if (tid == 1747992916) then
DoSpawn2(p, g, 1747992913, 6, facing)
end
if (tid == 1747992914) then
DoSpawn2(p, g, 1747993176, 3, facing)
end
if (tid == 1747994690) then
DoSpawn2(p, g, 1747994681, 1, facing)
DoSpawn2(p, g, 1747993416, 6, facing)
DoSpawn2(p, g, 1747990834, 3, facing)
DoSpawn2(p, g, 1747990833, 3, facing)
DoSpawn2(p, g, 1747990835, 3, facing)
DoSpawn2(p, g, 1747990836, 3, facing)
end
if (tid == 1747994967) then
DoSpawn2(p, g, 1747994704, 15, facing)
end
if (tid == 1747994968) then
DoSpawn2(p, g, 1747994705, 10, facing)
end
if (tid == 1747994969) then
DoSpawn2(p, g, 1747994444, 10, facing)
end
if (tid == 1747994446) then
DoSpawn2(p, g, 1747994434, 4, facing)
DoSpawn2(p, g, 1747994440, 1, facing)
DoSpawn2(p, g, 1747994437, 2, facing)
DoSpawn2(p, g, 1747994441, 1, facing)
end
if (tid == 1747994447) then
DoSpawn2(p, g, 1747994434, 4, facing)
DoSpawn2(p, g, 1747994440, 1, facing)
DoSpawn2(p, g, 1747994437, 2, facing)
DoSpawn2(p, g, 1747994441, 1, facing)
DoSpawn2(p, g, 1747994435, 1, facing)
end
if (tid == 1747994707) then
DoSpawn2(p, g, 1747994434, 4, facing)
DoSpawn2(p, g, 1747994440, 1, facing)
DoSpawn2(p, g, 1747994437, 2, facing)
DoSpawn2(p, g, 1747994441, 1, facing)
DoSpawn2(p, g, 1747994443, 1, facing)
end
if (tid == 1747994709) then
DoSpawn2(p, g, 1747994439, 5, facing)
end
if (tid == 1747994710) then
DoSpawn2(p, g, 1747994436, 5, facing)
end
if (tid == 1747994711) then
DoSpawn2(p, g, 1747994442, 2, facing)
DoSpawn2(p, g, 1747994438, 2, facing)
end
if (tid == 1747994706) then
DoSpawn2(p, g, 1747994434, 4, facing)
DoSpawn2(p, g, 1747994440, 1, facing)
DoSpawn2(p, g, 1747994437, 2, facing)
DoSpawn2(p, g, 1747994441, 1, facing)
DoSpawn2(p, g, 1747993940, 1, facing)
end
if (tid == 1747994708) then
DoSpawn2(p, g, 1747994434, 4, facing)
DoSpawn2(p, g, 1747994440, 1, facing)
DoSpawn2(p, g, 1747994437, 2, facing)
DoSpawn2(p, g, 1747994441, 1, facing)
DoSpawn2(p, g, 1747993940, 3, facing)
end
if (tid == 1747994712) then
DoSpawn2(p, g, 1747994713, 3, facing)
end
if (tid == 1747994928) then
DoSpawn2(p, g, 1747994714, 3, facing)
end
if (tid == 1747994937) then
DoSpawn2(p, g, 1747994929, 1, facing)
end
if (tid == 1747994947) then
DoSpawn2(p, g, 1747994929, 3, facing)
end
if (tid == 1747994945) then
DoSpawn2(p, g, 1747994930, 1, facing)
end
if (tid == 1747994946) then
DoSpawn2(p, g, 1747994930, 3, facing)
end
if (tid == 1747994935) then
DoSpawn2(p, g, 1747994931, 1, facing)
end
if (tid == 1747994948) then
DoSpawn2(p, g, 1747994932, 1, facing)
end
if (tid == 1747994950) then
DoSpawn2(p, g, 1747994933, 1, facing)
end
if (tid == 1747994949) then
DoSpawn2(p, g, 1747994934, 1, facing)
end
if (tid == 1747994453) then
DoSpawn2(p, g, 1747993167, 3, facing)
end
if (tid == 1747994964) then
DoSpawn2(p, g, 1747994953, 6, facing)
end
if (tid == 1747994962) then
DoSpawn2(p, g, 1747994957, 3, facing)
end
if (tid == 1747994958) then
DoSpawn2(p, g, 1747994952, 3, facing)
end
if (tid == 1747994963) then
DoSpawn2(p, g, 1747994954, 5, facing)
end
if (tid == 1747994961) then
DoSpawn2(p, g, 1747994951, 1, facing)
end
if (tid == 1747994965) then
DoSpawn2(p, g, 1747994955, 1, facing)
end
if (tid == 1747994966) then
DoSpawn2(p, g, 1747994956, 1, facing)
end
if (tid == 1747989044) then
DoSpawn2(p, g, 1747989045, 5, facing)
DoSpawn2(p, g, 1747988529, 1, facing)
DoSpawn2(p, g, 1747988531, 1, facing)
DoSpawn2(p, g, 1747988530, 2, facing)
DoSpawn2(p, g, 1747988532, 1, facing)
end
if (tid == 1747988535) then
DoSpawn2(p, g, 1747988536, 4, facing)
DoSpawn2(p, g, 1747994703, 2, facing)
DoSpawn2(p, g, 1747994702, 1, facing)
DoSpawn2(p, g, 1747988549, 1, facing)
end
if (tid == 1747988553) then
DoSpawn2(p, g, 1747988546, 5, facing)
DoSpawn2(p, g, 1747988537, 1, facing)
DoSpawn2(p, g, 1747988548, 1, facing)
DoSpawn2(p, g, 1747988547, 2, facing)
end
if (tid == 1747988550) then
DoSpawn2(p, g, 1747989045, 5, facing)
DoSpawn2(p, g, 1747988529, 1, facing)
DoSpawn2(p, g, 1747988531, 1, facing)
DoSpawn2(p, g, 1747988530, 2, facing)
DoSpawn2(p, g, 1747988532, 1, facing)
DoSpawn2(p, g, 1747988551, 2, facing)
end
if (tid == 1747990871) then
DoSpawn2(p, g, 1747990870, 5, facing)
end
if (tid == 1747994691) then
DoSpawn2(p, g, 1747994692, 5, facing)
end
if (tid == 1747988554) then
DoSpawn2(p, g, 1747988552, 3, facing)
DoSpawn2(p, g, 1747989068, 1, facing)
end
if (tid == 1747994698) then
DoSpawn2(p, g, 1747989045, 5, facing)
DoSpawn2(p, g, 1747994177, 1, facing)
DoSpawn2(p, g, 1747988529, 1, facing)
DoSpawn2(p, g, 1747988531, 1, facing)
DoSpawn2(p, g, 1747988530, 2, facing)
DoSpawn2(p, g, 1747988532, 1, facing)
end
if (tid == 1747994182) then
DoSpawn2(p, g, 1747994178, 5, facing)
DoSpawn2(p, g, 1747994180, 5, facing)
end
if (tid == 1747994694) then
DoSpawn2(p, g, 1747994178, 10, facing)
end
if (tid == 1747994693) then
DoSpawn2(p, g, 1747994180, 10, facing)
end
if (tid == 1747994181) then
DoSpawn2(p, g, 1747994179, 10, facing)
end
if (tid == 1747994696) then
DoSpawn2(p, g, 1747994695, 10, facing)
end
if (tid == 1747988556) then
DoSpawn2(p, g, 1747988555, 3, facing)
end
if (tid == 1747989072) then
DoSpawn2(p, g, 1747989073, 3, facing)
end
if (tid == 1747989809) then
DoSpawn2(p, g, 1747989833, 3, facing)
end
if (tid == 1747988557) then
DoSpawn2(p, g, 1747988564, 5, facing)
end
if (tid == 1747988558) then
DoSpawn2(p, g, 1747988565, 5, facing)
end
if (tid == 1747989843) then
DoSpawn2(p, g, 1747988545, 5, facing)
end
if (tid == 1747989834) then
DoSpawn2(p, g, 1747989846, 1, facing)
end
if (tid == 1747989835) then
DoSpawn2(p, g, 1747989847, 1, facing)
end
if (tid == 1747989849) then
DoSpawn2(p, g, 1747990348, 1, facing)
end
if (tid == 1747990345) then
DoSpawn2(p, g, 1747990349, 1, facing)
end
if (tid == 1747989300) then
DoSpawn2(p, g, 1747989301, 1, facing)
end
if (tid == 1747989808) then
DoSpawn2(p, g, 1747989839, 1, facing)
end
if (tid == 1747989299) then
DoSpawn2(p, g, 1747989302, 1, facing)
end
if (tid == 1747989816) then
DoSpawn2(p, g, 1747989837, 1, facing)
end
if (tid == 1747989815) then
DoSpawn2(p, g, 1747989838, 1, facing)
end
if (tid == 1747989817) then
DoSpawn2(p, g, 1747989840, 1, facing)
end
if (tid == 1747989825) then
DoSpawn2(p, g, 1747989842, 1, facing)
end
if (tid == 1747989319) then
DoSpawn2(p, g, 1747989313, 3, facing)
end
if (tid == 1747989826) then
DoSpawn2(p, g, 1747989828, 3, facing)
end
if (tid == 1747989594) then
DoSpawn2(p, g, 1747989827, 6, facing)
end
if (tid == 1747989318) then
DoSpawn2(p, g, 1747989315, 1, facing)
end
if (tid == 1747989593) then
DoSpawn2(p, g, 1747989829, 1, facing)
end
if (tid == 1747994196) then
DoSpawn2(p, g, 1747989827, 12, facing)
end
if (tid == 1747994456) then
DoSpawn2(p, g, 1747994458, 1, facing)
DoSpawn2(p, g, 1747994672, 6, facing)
end
if (tid == 1747993419) then
DoSpawn2(p, g, 1747993420, 1, facing)
end
if (tid == 1747993422) then
DoSpawn2(p, g, 1747993421, 1, facing)
end
if (tid == 1747994183) then
DoSpawn2(p, g, 1747994184, 10, facing)
end
if (tid == 1747989334) then
DoSpawn2(p, g, 1747989325, 3, facing)
DoSpawn2(p, g, 1747989326, 2, facing)
DoSpawn2(p, g, 1747989327, 1, facing)
DoSpawn2(p, g, 1747989328, 1, facing)
DoSpawn2(p, g, 1747989329, 1, facing)
end
if (tid == 1747989337) then
DoSpawn2(p, g, 1747989325, 3, facing)
DoSpawn2(p, g, 1747989326, 2, facing)
DoSpawn2(p, g, 1747989327, 1, facing)
DoSpawn2(p, g, 1747989328, 1, facing)
DoSpawn2(p, g, 1747989329, 1, facing)
DoSpawn2(p, g, 1747989331, 1, facing)
end
if (tid == 1747994419) then
DoSpawn2(p, g, 1747989331, 5, facing)
end
if (tid == 1747989335) then
DoSpawn2(p, g, 1747989332, 5, facing)
end
if (tid == 1747993944) then
DoSpawn2(p, g, 1747993943, 5, facing)
end
if (tid == 1747989552) then
DoSpawn2(p, g, 1747989553, 5, facing)
end
if (tid == 1747989336) then
DoSpawn2(p, g, 1747989330, 2, facing)
DoSpawn2(p, g, 1747989333, 2, facing)
end
if (tid == 1747989554) then
DoSpawn2(p, g, 1747989574, 3, facing)
DoSpawn2(p, g, 1747989575, 2, facing)
DoSpawn2(p, g, 1747989577, 2, facing)
DoSpawn2(p, g, 1747989578, 1, facing)
end
if (tid == 1747989555) then
DoSpawn2(p, g, 1747989576, 5, facing)
end
if (tid == 1747989556) then
DoSpawn2(p, g, 1747989557, 5, facing)
DoSpawn2(p, g, 1747989558, 1, facing)
end
if (tid == 1747993685) then
DoSpawn2(p, g, 1747989557, 5, facing)
DoSpawn2(p, g, 1747989558, 1, facing)
end
if (tid == 1747993686) then
DoSpawn2(p, g, 1747993689, 8, facing)
end
if (tid == 1747993906) then
DoSpawn2(p, g, 1747993690, 5, facing)
end
if (tid == 1747993907) then
DoSpawn2(p, g, 1747993905, 5, facing)
end
if (tid == 1747993908) then
DoSpawn2(p, g, 1747993904, 5, facing)
end
if (tid == 1747993910) then
DoSpawn2(p, g, 1747993909, 5, facing)
end
if (tid == 1747994190) then
DoSpawn2(p, g, 1747994189, 1, facing)
end
if (tid == 1747994194) then
DoSpawn2(p, g, 1747994193, 1, facing)
end
if (tid == 1747989338) then
DoSpawn2(p, g, 1747989573, 6, facing)
end
if (tid == 1747989582) then
DoSpawn2(p, g, 1747989592, 3, facing)
end
if (tid == 1747990091) then
DoSpawn2(p, g, 1747990093, 3, facing)
end
if (tid == 1747990092) then
DoSpawn2(p, g, 1747990094, 3, facing)
end
if (tid == 1747989571) then
DoSpawn2(p, g, 1747989579, 1, facing)
end
if (tid == 1747993679) then
DoSpawn2(p, g, 1747993672, 1, facing)
end
if (tid == 1747989572) then
DoSpawn2(p, g, 1747989580, 1, facing)
end
if (tid == 1747993680) then
DoSpawn2(p, g, 1747993673, 1, facing)
end
if (tid == 1747990105) then
DoSpawn2(p, g, 1747990096, 1, facing)
end
if (tid == 1747990323) then
DoSpawn2(p, g, 1747990097, 1, facing)
end
if (tid == 1747993681) then
DoSpawn2(p, g, 1747993671, 1, facing)
end
if (tid == 1750217012) then
DoSpawn2(p, g, 1747989580, 1, facing)
end
if (tid == 1750348354) then
DoSpawn2(p, g, 1750348355, 1, facing)
end
if (tid == 1747990320) then
DoSpawn2(p, g, 1747990098, 1, facing)
end
if (tid == 1747990100) then
DoSpawn2(p, g, 1747990099, 1, facing)
end
if (tid == 1747993923) then
DoSpawn2(p, g, 1747990099, 1, facing)
end
if (tid == 1747990351) then
DoSpawn2(p, g, 1747990350, 1, facing)
end
if (tid == 1747993924) then
DoSpawn2(p, g, 1747990350, 1, facing)
end
if (tid == 1747990321) then
DoSpawn2(p, g, 1747990327, 1, facing)
end
if (tid == 1747990322) then
DoSpawn2(p, g, 1747990326, 1, facing)
end
if (tid == 1747990324) then
DoSpawn2(p, g, 1747990328, 1, facing)
end
if (tid == 1747990325) then
DoSpawn2(p, g, 1747990095, 1, facing)
end
if (tid == 1747990329) then
DoSpawn2(p, g, 1747990339, 1, facing)
end
if (tid == 1747990337) then
DoSpawn2(p, g, 1747990340, 1, facing)
end
if (tid == 1747990338) then
DoSpawn2(p, g, 1747990341, 1, facing)
end
if (tid == 1747989569) then
DoSpawn2(p, g, 1747989559, 4, facing)
end
if (tid == 1747993670) then
DoSpawn2(p, g, 1747989560, 5, facing)
end
if (tid == 1747989570) then
DoSpawn2(p, g, 1747989561, 1, facing)
end
if (tid == 1747993922) then
DoSpawn2(p, g, 1747993921, 1, facing)
end
if (tid == 1747990342) then
DoSpawn2(p, g, 1747990343, 1, facing)
end
if (tid == 1747988784) then
DoSpawn2(p, g, 1747988566, 8, facing)
DoSpawn2(p, g, 1747988785, 1, facing)
DoSpawn2(p, g, 1747988786, 1, facing)
end
if (tid == 1747988805) then
DoSpawn2(p, g, 1747988792, 3, facing)
DoSpawn2(p, g, 1747988793, 3, facing)
DoSpawn2(p, g, 1747988802, 3, facing)
DoSpawn2(p, g, 1747988803, 3, facing)
DoSpawn2(p, g, 1747988804, 3, facing)
end
if (tid == 1747994163) then
DoSpawn2(p, g, 1747994164, 5, facing)
end
if (tid == 1747994169) then
DoSpawn2(p, g, 1747994167, 10, facing)
end
if (tid == 1747994165) then
DoSpawn2(p, g, 1747994166, 5, facing)
end
if (tid == 1747988787) then
DoSpawn2(p, g, 1747988788, 5, facing)
DoSpawn2(p, g, 1747988789, 2, facing)
DoSpawn2(p, g, 1747988790, 1, facing)
DoSpawn2(p, g, 1747988791, 1, facing)
DoSpawn2(p, g, 1747988785, 1, facing)
end
if (tid == 1747993666) then
DoSpawn2(p, g, 1747993667, 7, facing)
DoSpawn2(p, g, 1747993668, 1, facing)
end
if (tid == 1747989321) then
DoSpawn2(p, g, 1747989323, 5, facing)
end
if (tid == 1747993178) then
DoSpawn2(p, g, 1747993392, 5, facing)
end
if (tid == 1747988807) then
DoSpawn2(p, g, 1747988808, 15, facing)
end
if (tid == 1747989324) then
DoSpawn2(p, g, 1747988809, 2, facing)
DoSpawn2(p, g, 1747988810, 3, facing)
end
if (tid == 1747988806) then
DoSpawn2(p, g, 1747988812, 1, facing)
DoSpawn2(p, g, 1747988811, 3, facing)
end
if (tid == 1747993941) then
DoSpawn2(p, g, 1747993911, 1, facing)
end
if (tid == 1747994187) then
DoSpawn2(p, g, 1747994186, 1, facing)
end
if (tid == 1747994188) then
DoSpawn2(p, g, 1747994185, 1, facing)
end
if (tid == 1747988813) then
DoSpawn2(p, g, 1747988814, 6, facing)
end
if (tid == 1747989079) then
DoSpawn2(p, g, 1747989080, 3, facing)
end
if (tid == 1747993426) then
DoSpawn2(p, g, 1747993425, 5, facing)
end
if (tid == 1747989811) then
DoSpawn2(p, g, 1747992915, 3, facing)
end
if (tid == 1747990354) then
DoSpawn2(p, g, 1747990353, 1, facing)
end
if (tid == 1747990582) then
DoSpawn2(p, g, 1747990352, 1, facing)
end
if (tid == 1747990601) then
DoSpawn2(p, g, 1747990600, 1, facing)
end
if (tid == 1747988820) then
DoSpawn2(p, g, 1747988788, 5, facing)
DoSpawn2(p, g, 1747988789, 2, facing)
DoSpawn2(p, g, 1747988790, 1, facing)
DoSpawn2(p, g, 1747988791, 1, facing)
DoSpawn2(p, g, 1747988785, 1, facing)
DoSpawn2(p, g, 1747988822, 1, facing)
end
if (tid == 1747988821) then
DoSpawn2(p, g, 1747988788, 5, facing)
DoSpawn2(p, g, 1747988789, 2, facing)
DoSpawn2(p, g, 1747988790, 1, facing)
DoSpawn2(p, g, 1747988791, 1, facing)
DoSpawn2(p, g, 1747988785, 1, facing)
DoSpawn2(p, g, 1747988823, 2, facing)
end
if (tid == 1747988819) then
DoSpawn2(p, g, 1747988818, 10, facing)
end
if (tid == 1747989074) then
DoSpawn2(p, g, 1747989076, 1, facing)
end
if (tid == 1747990357) then
DoSpawn2(p, g, 1747990579, 1, facing)
end
if (tid == 1747990358) then
DoSpawn2(p, g, 1747990580, 3, facing)
end
if (tid == 1747990360) then
DoSpawn2(p, g, 1747990581, 1, facing)
end
if (tid == 1747990602) then
DoSpawn2(p, g, 1747990599, 1, facing)
end
if (tid == 1749242932) then
DoSpawn2(p, g, 1749242933, 1, facing)
end
if (tid == 1749236021) then
DoSpawn2(p, g, 1749236022, 3, facing)
end
if ((tid == 1749498164) or (tid == 1749503024)) then
DoSpawn2(p, g, 1749498165, 1, facing)
end
if (tid == 1749824560) then
DoSpawn2(p, g, 1749824561, 1, facing)
end
if (tid == 1749108528) then
DoSpawn2(p, g, 1749108529, 3, facing)
end
if (tid == 1749828400) then
DoSpawn2(p, g, 1749828401, 10, facing)
end
if (tid == 1749241136) then
DoSpawn2(p, g, 1749241137, 6, facing)
end
if (tid == 1750478896) then
DoSpawn2(p, g, 1750487885, 3, facing)
DoSpawn2(p, g, 1750487886, 1, facing)
DoSpawn2(p, g, 1750483284, 1, facing)
DoSpawn2(p, g, 1750486351, 1, facing)
end
if (tid == 1749242962) then
DoSpawn2(p, g, 1749242963, 5, facing)
end
if (tid == 1749238081) then
DoSpawn2(p, g, 1749238082, 3, facing)
end
if (tid == 1747989077) then
DoSpawn2(p, g, 1747989078, 1, facing)
end
if (tid == 1747990088) then
DoSpawn2(p, g, 1747990595, 1, facing)
end
if (tid == 1747990583) then
DoSpawn2(p, g, 1747990596, 1, facing)
end
if (tid == 1747990090) then
DoSpawn2(p, g, 1747990593, 1, facing)
end
if (tid == 1747990356) then
DoSpawn2(p, g, 1747990594, 1, facing)
end
if (tid == 1747990089) then
DoSpawn2(p, g, 1747990355, 1, facing)
end
if (tid == 1747990361) then
DoSpawn2(p, g, 1747990597, 1, facing)
end
if (tid == 1747990576) then
DoSpawn2(p, g, 1747990584, 1, facing)
end
if (tid == 1747990577) then
DoSpawn2(p, g, 1747990585, 1, facing)
end
if (tid == 1747989303) then
DoSpawn2(p, g, 1747989071, 4, facing)
end
if (tid == 1747993401) then
DoSpawn2(p, g, 1747989832, 5, facing)
end
if (tid == 1747989304) then
DoSpawn2(p, g, 1747989305, 1, facing)
end
if (tid == 1747993409) then
DoSpawn2(p, g, 1747989831, 1, facing)
end
if (tid == 1747988816) then
DoSpawn2(p, g, 1747988817, 1, facing)
end
if (tid == 1747993165) then
DoSpawn2(p, g, 1747993166, 1, facing)
end
if (tid == 1747993157) then
DoSpawn2(p, g, 1747993137, 9, facing)
DoSpawn2(p, g, 1747993138, 1, facing)
end
if (tid == 1747993424) then
DoSpawn2(p, g, 1747993427, 10, facing)
end
if (tid == 1747993154) then
DoSpawn2(p, g, 1747990606, 4, facing)
DoSpawn2(p, g, 1747992917, 2, facing)
DoSpawn2(p, g, 1747990605, 1, facing)
DoSpawn2(p, g, 1747992918, 1, facing)
DoSpawn2(p, g, 1747992919, 1, facing)
DoSpawn2(p, g, 1747993136, 1, facing)
end
if (tid == 1747994699) then
DoSpawn2(p, g, 1747990606, 4, facing)
DoSpawn2(p, g, 1747992917, 2, facing)
DoSpawn2(p, g, 1747990605, 1, facing)
DoSpawn2(p, g, 1747992918, 1, facing)
DoSpawn2(p, g, 1747992919, 1, facing)
DoSpawn2(p, g, 1747993136, 1, facing)
DoSpawn2(p, g, 1747994701, 1, facing)
end
if (tid == 1747993159) then
DoSpawn2(p, g, 1747993139, 5, facing)
end
if (tid == 1747993161) then
DoSpawn2(p, g, 1747993142, 5, facing)
end
if (tid == 1747993160) then
DoSpawn2(p, g, 1747992920, 2, facing)
DoSpawn2(p, g, 1747992922, 2, facing)
end
if (tid == 1747993158) then
DoSpawn2(p, g, 1747993141, 5, facing)
end
if (tid == 1747994680) then
DoSpawn2(p, g, 1747994452, 6, facing)
end
if (tid == 1747994679) then
DoSpawn2(p, g, 1747994678, 3, facing)
end
if (tid == 1747993676) then
DoSpawn2(p, g, 1747993675, 3, facing)
end
if (tid == 1747993163) then
DoSpawn2(p, g, 1747993144, 3, facing)
end
if (tid == 1747993164) then
DoSpawn2(p, g, 1747993145, 3, facing)
end
if (tid == 1747994676) then
DoSpawn2(p, g, 1747994454, 3, facing)
end
if (tid == 1747994677) then
DoSpawn2(p, g, 1747994673, 3, facing)
end
if (tid == 1747994675) then
DoSpawn2(p, g, 1747994674, 1, facing)
end
if (tid == 1747994161) then
DoSpawn2(p, g, 1747993431, 8, facing)
DoSpawn2(p, g, 1747993652, 1, facing)
DoSpawn2(p, g, 1747993655, 1, facing)
end
if (tid == 1747993946) then
DoSpawn2(p, g, 1747993430, 5, facing)
DoSpawn2(p, g, 1747993434, 2, facing)
DoSpawn2(p, g, 1747993651, 1, facing)
DoSpawn2(p, g, 1747993650, 1, facing)
DoSpawn2(p, g, 1747993433, 1, facing)
end
if (tid == 1747994200) then
DoSpawn2(p, g, 1747993430, 5, facing)
DoSpawn2(p, g, 1747993434, 2, facing)
DoSpawn2(p, g, 1747993651, 1, facing)
DoSpawn2(p, g, 1747993650, 1, facing)
DoSpawn2(p, g, 1747993433, 1, facing)
DoSpawn2(p, g, 1747993654, 1, facing)
end
if (tid == 1747994198) then
DoSpawn2(p, g, 1747993649, 2, facing)
DoSpawn2(p, g, 1747993648, 2, facing)
end
if (tid == 1747994199) then
DoSpawn2(p, g, 1747993653, 5, facing)
end
if (tid == 1747994162) then
DoSpawn2(p, g, 1747993432, 5, facing)
end
if (tid == 1747994202) then
DoSpawn2(p, g, 1747993143, 6, facing)
end
if (tid == 1747993428) then
DoSpawn2(p, g, 1747993429, 4, facing)
end
if (tid == 1747994416) then
DoSpawn2(p, g, 1747994201, 3, facing)
end
if (tid == 1747994449) then
DoSpawn2(p, g, 1747994448, 1, facing)
end
if (tid == 1747994450) then
DoSpawn2(p, g, 1747994451, 1, facing)
end
if (tid == 1747993177) then
DoSpawn2(p, g, 1747989588, 40, facing)
end
if (tid == 1747989583) then
DoSpawn2(p, g, 1747989584, 15, facing)
end
if (tid == 1747995186) then
DoSpawn2(p, g, 1747989589, 5, facing)
DoSpawn2(p, g, 1747993930, 3, facing)
DoSpawn2(p, g, 1747993935, 1, facing)
DoSpawn2(p, g, 1747989586, 1, facing)
end
if (tid == 1747995207) then
DoSpawn2(p, g, 1747989589, 5, facing)
DoSpawn2(p, g, 1747993930, 3, facing)
DoSpawn2(p, g, 1747993935, 1, facing)
DoSpawn2(p, g, 1747989586, 1, facing)
DoSpawn2(p, g, 1747995205, 1, facing)
end
if (tid == 1747988815) then
DoSpawn2(p, g, 1747993936, 2, facing)
DoSpawn2(p, g, 1747993927, 2, facing)
end
if (tid == 1747995201) then
DoSpawn2(p, g, 1747995206, 20, facing)
end
if (tid == 1747995216) then
DoSpawn2(p, g, 1747993423, 10, facing)
end
if (tid == 1747995187) then
DoSpawn2(p, g, 1747993938, 5, facing)
end
if (tid == 1747995218) then
DoSpawn2(p, g, 1747993933, 5, facing)
end
if (tid == 1747995217) then
DoSpawn2(p, g, 1747993934, 4, facing)
end
if (tid == 1747995203) then
DoSpawn2(p, g, 1747989589, 5, facing)
DoSpawn2(p, g, 1747993930, 3, facing)
DoSpawn2(p, g, 1747993935, 1, facing)
DoSpawn2(p, g, 1747989586, 1, facing)
DoSpawn2(p, g, 1747995202, 1, facing)
end
if (tid == 1747995204) then
DoSpawn2(p, g, 1747989589, 5, facing)
DoSpawn2(p, g, 1747993930, 3, facing)
DoSpawn2(p, g, 1747993935, 1, facing)
DoSpawn2(p, g, 1747989586, 1, facing)
DoSpawn2(p, g, 1747995202, 3, facing)
end
if (tid == 1747995447) then
DoSpawn2(p, g, 1747995446, 3, facing)
end
if (tid == 1747995449) then
DoSpawn2(p, g, 1747995448, 3, facing)
end
if (tid == 1747995188) then
DoSpawn2(p, g, 1747995193, 1, facing)
end
if (tid == 1747995189) then
DoSpawn2(p, g, 1747995193, 3, facing)
end
if (tid == 1747995190) then
DoSpawn2(p, g, 1747995192, 1, facing)
end
if (tid == 1747995191) then
DoSpawn2(p, g, 1747995192, 3, facing)
end
if (tid == 1747995212) then
DoSpawn2(p, g, 1747995208, 1, facing)
end
if (tid == 1747995213) then
DoSpawn2(p, g, 1747995209, 1, facing)
end
if (tid == 1747995214) then
DoSpawn2(p, g, 1747995210, 1, facing)
end
if (tid == 1747995444) then
DoSpawn2(p, g, 1747995441, 1, facing)
end
if (tid == 1747995445) then
DoSpawn2(p, g, 1747995442, 1, facing)
end
if (tid == 1747995457) then
DoSpawn2(p, g, 1747989585, 15, facing)
end
if (tid == 1747995459) then
DoSpawn2(p, g, 1747989590, 5, facing)
DoSpawn2(p, g, 1747993931, 3, facing)
DoSpawn2(p, g, 1747993929, 1, facing)
DoSpawn2(p, g, 1747989587, 1, facing)
end
if (tid == 1747995458) then
DoSpawn2(p, g, 1747989590, 5, facing)
DoSpawn2(p, g, 1747993931, 3, facing)
DoSpawn2(p, g, 1747993929, 1, facing)
DoSpawn2(p, g, 1747989587, 1, facing)
DoSpawn2(p, g, 1747993926, 1, facing)
end
if (tid == 1747995462) then
DoSpawn2(p, g, 1747993937, 2, facing)
DoSpawn2(p, g, 1747993928, 2, facing)
end
if (tid == 1747995463) then
DoSpawn2(p, g, 1747995225, 10, facing)
end
if (tid == 1747995464) then
DoSpawn2(p, g, 1747993687, 10, facing)
end
if (tid == 1747995465) then
DoSpawn2(p, g, 1747993939, 5, facing)
end
if (tid == 1747995460) then
DoSpawn2(p, g, 1747993932, 5, facing)
end
if (tid == 1747995461) then
DoSpawn2(p, g, 1747995466, 4, facing)
end
if (tid == 1747995467) then
DoSpawn2(p, g, 1747989590, 5, facing)
DoSpawn2(p, g, 1747993931, 3, facing)
DoSpawn2(p, g, 1747993929, 1, facing)
DoSpawn2(p, g, 1747989587, 1, facing)
DoSpawn2(p, g, 1747995185, 1, facing)
end
if (tid == 1747995468) then
DoSpawn2(p, g, 1747989590, 5, facing)
DoSpawn2(p, g, 1747993931, 3, facing)
DoSpawn2(p, g, 1747993929, 1, facing)
DoSpawn2(p, g, 1747989587, 1, facing)
DoSpawn2(p, g, 1747995185, 3, facing)
end
if (tid == 1747988825) then
DoSpawn2(p, g, 1747988826, 6, facing)
DoSpawn2(p, g, 1747989041, 2, facing)
DoSpawn2(p, g, 1747989040, 1, facing)
DoSpawn2(p, g, 1747989042, 1, facing)
end
if (tid == 1747990102) then
DoSpawn2(p, g, 1747988826, 6, facing)
DoSpawn2(p, g, 1747989041, 2, facing)
DoSpawn2(p, g, 1747989040, 1, facing)
DoSpawn2(p, g, 1747989042, 1, facing)
DoSpawn2(p, g, 1747990104, 1, facing)
end
if (tid == 1747989059) then
DoSpawn2(p, g, 1747989048, 13, facing)
DoSpawn2(p, g, 1747989049, 1, facing)
DoSpawn2(p, g, 1747994417, 1, facing)
end
if (tid == 1747989060) then
DoSpawn2(p, g, 1747989057, 10, facing)
end
if (tid == 1747989063) then
DoSpawn2(p, g, 1747989064, 3, facing)
DoSpawn2(p, g, 1747989065, 1, facing)
end
if (tid == 1747989062) then
DoSpawn2(p, g, 1747989069, 4, facing)
end
if (tid == 1747989070) then
DoSpawn2(p, g, 1747989043, 5, facing)
end
if (tid == 1747990103) then
DoSpawn2(p, g, 1747990101, 5, facing)
end
if (tid == 1747989298) then
DoSpawn2(p, g, 1747988555, 3, facing)
end
if (tid == 1747989850) then
DoSpawn2(p, g, 1747990071, 3, facing)
end
if (tid == 1747990066) then
DoSpawn2(p, g, 1747990072, 3, facing)
end
if (tid == 1747990085) then
DoSpawn2(p, g, 1747990084, 1, facing)
end
if (tid == 1747990086) then
DoSpawn2(p, g, 1747990083, 1, facing)
end
if (tid == 1747990087) then
DoSpawn2(p, g, 1747990082, 1, facing)
end
if (tid == 1747989081) then
DoSpawn2(p, g, 1747989082, 3, facing)
end
if (tid == 1747990067) then
DoSpawn2(p, g, 1747990068, 3, facing)
end
if (tid == 1747988824) then
DoSpawn2(p, g, 1747989297, 1, facing)
end
if (tid == 1747989813) then
DoSpawn2(p, g, 1747990081, 1, facing)
end
if (tid == 1747989814) then
DoSpawn2(p, g, 1747990073, 1, facing)
end
if (tid == 1747994195) then
DoSpawn2(p, g, 1747989314, 12, facing)
end
if (tid == 1747989320) then
DoSpawn2(p, g, 1747989314, 3, facing)
end
if (tid == 1747989812) then
DoSpawn2(p, g, 1747989830, 3, facing)
end
if (tid == 1747990070) then
DoSpawn2(p, g, 1747990069, 3, facing)
end
if (tid == 1747989317) then
DoSpawn2(p, g, 1747989316, 1, facing)
end
if (tid == 1750085681) then
DoSpawn2(p, g, 1747989833, 3, facing)
end
if (tid == 1750085682) then
DoSpawn2(p, g, 1747990600, 1, facing)
end
if (tid == 1750085683) then
DoSpawn2(p, g, 1747989305, 1, facing)
end
if (tid == 1750085684) then
DoSpawn2(p, g, 1747989831, 1, facing)
end
if (tid == 1750085685) then
DoSpawn2(p, g, 1747989071, 3, facing)
end
if (tid == 1750085686) then
DoSpawn2(p, g, 1747989832, 3, facing)
end
if (tid == 1750085687) then
DoSpawn2(p, g, 1747989076, 1, facing)
end
if (tid == 1750085688) then
DoSpawn2(p, g, 1747990599, 1, facing)
end
if (tid == 1750085689) then
DoSpawn2(p, g, 1747990579, 1, facing)
end
if (tid == 1750085936) then
DoSpawn2(p, g, 1747990580, 3, facing)
end
if (tid == 1750085937) then
DoSpawn2(p, g, 1747990581, 1, facing)
end
if (tid == 1750085938) then
DoSpawn2(p, g, 1747990597, 1, facing)
end
if (tid == 1750085939) then
DoSpawn2(p, g, 1747990595, 1, facing)
end
if (tid == 1750085940) then
DoSpawn2(p, g, 1747990596, 1, facing)
end
if (tid == 1750085941) then
DoSpawn2(p, g, 1747990355, 1, facing)
end
if (tid == 1750085942) then
DoSpawn2(p, g, 1747990593, 1, facing)
end
if (tid == 1750085943) then
DoSpawn2(p, g, 1747990594, 1, facing)
end
if (tid == 1750085944) then
DoSpawn2(p, g, 1747990353, 1, facing)
end
if (tid == 1750085945) then
DoSpawn2(p, g, 1747992915, 3, facing)
end
if (tid == 1747990866) then
DoSpawn2(p, g, 1747990613, 5, facing)
end
if (tid == 1747995211) then
DoSpawn2(p, g, 1747995215, 1, facing)
end
if (tid == 1749438512) then
DoSpawn2(p, g, 1749438513, 3, facing)
end
if (tid == 1749437488) then
DoSpawn2(p, g, 1749437489, 1, facing)
end
if (tid == 1749434672) then
DoSpawn2(p, g, 1749434673, 1, facing)
end
if (tid == 1749439280) then
DoSpawn2(p, g, 1749439281, 1, facing)
end
if ((tid == 1749435952) and RoundSchedule_IsFinalRound(udg_int_CurRound)) then
DoSpawn2(p, g, 1749435953, 1, facing)
end
if ((tid == 1749437744) and RoundSchedule_IsFinalRound(udg_int_CurRound)) then
DoSpawn2(p, g, 1749437762, 1, facing)
end
if (tid == 1749626928) then
DoSpawn2(p, g, 1749627184, 6, facing)
DoSpawn2(p, g, 1749627185, 3, facing)
DoSpawn2(p, g, 1749627186, 1, facing)
end
if (tid == 1749626929) then
DoSpawn2(p, g, 1749627187, 2, facing)
DoSpawn2(p, g, 1749627188, 2, facing)
end
if (tid == 1749626930) then
DoSpawn2(p, g, 1749627189, 5, facing)
end
if (tid == 1749626931) then
DoSpawn2(p, g, 1749627190, 5, facing)
end
if (tid == 1749626932) then
DoSpawn2(p, g, 1749627191, 5, facing)
end
if (tid == 1749626933) then
DoSpawn2(p, g, 1749627184, 6, facing)
DoSpawn2(p, g, 1749627185, 3, facing)
DoSpawn2(p, g, 1749627186, 1, facing)
DoSpawn2(p, g, 1749627192, 1, facing)
end
if (tid == 1749626934) then
DoSpawn2(p, g, 1749627184, 6, facing)
DoSpawn2(p, g, 1749627185, 3, facing)
DoSpawn2(p, g, 1749627186, 1, facing)
DoSpawn2(p, g, 1749627193, 1, facing)
end
if (tid == 1749626935) then
DoSpawn2(p, g, 1749627184, 6, facing)
DoSpawn2(p, g, 1749627185, 3, facing)
DoSpawn2(p, g, 1749627186, 1, facing)
DoSpawn2(p, g, 1749627193, 2, facing)
DoSpawn2(p, g, 1749627201, 1, facing)
end
if (tid == 1749627696) then
DoSpawn2(p, g, 1749627440, 6, facing)
end
if (tid == 1749627697) then
DoSpawn2(p, g, 1749627441, 3, facing)
end
if (tid == 1749627698) then
DoSpawn2(p, g, 1749627442, 3, facing)
end
if (tid == 1749634096) then
DoSpawn2(p, g, 1749634097, 3, facing)
end
if (tid == 1749634098) then
DoSpawn2(p, g, 1749634099, 3, facing)
end
if (tid == 1749634100) then
DoSpawn2(p, g, 1749634101, 3, facing)
end
if (tid == 1749633072) then
DoSpawn2(p, g, 1749633073, 1, facing)
end
if (tid == 1749633074) then
DoSpawn2(p, g, 1749633075, 1, facing)
end
if (tid == 1749633076) then
DoSpawn2(p, g, 1749633077, 1, facing)
end
if (tid == 1749631280) then
DoSpawn2(p, g, 1749631281, 1, facing)
end
if (tid == 1749631282) then
DoSpawn2(p, g, 1749631283, 1, facing)
end
if (tid == 1749631284) then
DoSpawn2(p, g, 1749631285, 1, facing)
end
if (tid == 1749112368) then
DoSpawn2(p, g, 1749112369, 3, facing)
end
if (tid == 1749112370) then
DoSpawn2(p, g, 1749112371, 3, facing)
end
if (tid == 1749112372) then
DoSpawn2(p, g, 1749112373, 3, facing)
end
if (tid == 1749112374) then
DoSpawn2(p, g, 1749112375, 1, facing)
end
if (((tid == 1749112376) or (tid == 1749112624)) and RoundSchedule_IsFinalRound(udg_int_CurRound)) then
DoSpawn2(p, g, 1749112377, 1, facing)
end
if (tid == 1749632304) then
DoSpawn2(p, g, 1749632305, 2, facing)
DoSpawn2(p, g, 1749632306, 1, facing)
DoSpawn2(p, g, 1749632307, 1, facing)
DoSpawn2(p, g, 1749632308, 1, facing)
end
ExecuteFunc("Bounty_AssignBatch")
end
Bounty_Building = nil
if (SPAWN_UNITS_COUNT[GetPlayerId(p)] == 0) then
if (udg_bool_InFinalRound == false) then
DoSpawn2(p, g, 1747988534, 1, facing)
else
end
end
DestroyGroup(tokens)
tokens = nil
t = nil
do return g end
end

function SpawnUnits2(p, site)
local g = nil
local g2 = CreateGroup()
local pid = GetPlayerId(p)
local facing = I2R(J88_int(J88_int(ModuloInteger(site, 2) * 180) + J88_int(J88_div(site, 2) * 90)))
PanCameraToTimedForPlayer(p, GetRectCenterX(udg_region_Spawns[site]), GetRectCenterY(udg_region_Spawns[site]), 0.0)
g = CreateSpawnArray(p, facing)
GroupAddGroup(g, g2)
SPAWN_G = g
SPAWN_SITE = site
SPAWN_PID = pid
ExecuteFunc("SpreadInSite")
SPAWN_G = nil
DestroyGroup(g)
g = nil
do return g2 end
end

function ArmyEconomy_IsTracked(t)
    do return ((ArmyEconomy_Types ~= nil) and LoadBoolean(ArmyEconomy_Types, t, 2)) end
end

function ArmyEconomy_IsUpgrade(source, target)
    local i = 0
    while true do
        if (i >= LoadInteger(ArmyEconomy_Types, source, 6)) then break end
        if (LoadInteger(ArmyEconomy_Types, source, J88_int(100 + i)) == target) then
            do return true end
        end
        i = J88_int(i + 1)
    end
    do return false end
end

function ArmyEconomy_Set(u, gold, wood)
    local key = GetHandleId(u)
    --  A newly constructed/transferred unit may reuse a released handle ID.
    --  Reset any old refund tombstone and pending-upgrade fields first.
    FlushChildHashtable(ArmyEconomy_Ledger, key)
    SaveInteger(ArmyEconomy_Ledger, key, 0, gold)
    SaveInteger(ArmyEconomy_Ledger, key, 1, wood)
    SaveBoolean(ArmyEconomy_Ledger, key, 6, true)
    SaveInteger(ArmyEconomy_Ledger, key, 7, GetUnitTypeId(u))
end

function ArmyEconomy_Ensure(u)
    local t = GetUnitTypeId(u)
    local key = GetHandleId(u)
    if (ArmyEconomy_IsTracked(t) and (not LoadBoolean(ArmyEconomy_Ledger, key, 6))) then
        ArmyEconomy_Set(u, LoadInteger(ArmyEconomy_Types, t, 3), LoadInteger(ArmyEconomy_Types, t, 4))
    end
end

function ArmyEconomy_Gold(u)
    ArmyEconomy_Ensure(u)
    do return LoadInteger(ArmyEconomy_Ledger, GetHandleId(u), 0) end
end

function ArmyEconomy_Wood(u)
    ArmyEconomy_Ensure(u)
    do return LoadInteger(ArmyEconomy_Ledger, GetHandleId(u), 1) end
end

function ArmyEconomy_Transfer(old, replacement, refundedGold, refundedWood)
    local gold = ArmyEconomy_Gold(old)
    local wood = ArmyEconomy_Wood(old)
    --  ReplaceUnitBJ removes old before returning; its ledger/handle remain
    --  available, while GetUnitTypeId(old) may already be zero.
    if (LoadBoolean(ArmyEconomy_Ledger, GetHandleId(old), 6) and ArmyEconomy_IsTracked(GetUnitTypeId(replacement))) then
        ArmyEconomy_Set(replacement, IMaxBJ(0, J88_int(gold - refundedGold)), IMaxBJ(0, J88_int(wood - refundedWood)))
        FlushChildHashtable(ArmyEconomy_Ledger, GetHandleId(old))
    end
end

function ArmyEconomy_RefundAndRemove(u)
    local key = GetHandleId(u)
    local owner = GetOwningPlayer(u)
    local gold = 0
    local wood = 0
    if ((((u ~= nil) and (GetUnitAbilityLevel(u, 1093677106) > 0)) and (GetWidgetLife(u) > 0.4050000011920929)) and (not LoadBoolean(ArmyEconomy_Ledger, key, 99))) then
        gold = ArmyEconomy_Gold(u)
        wood = ArmyEconomy_Wood(u)
        SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
        --  Channel and RemoveUnit invoke no native refund or cancel path.
        RemoveUnit(u)
        SetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD) + gold))
        SetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER, J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER) + wood))
        FlushChildHashtable(ArmyEconomy_Ledger, key)
        --  Keep the one-refund guard after removing the receipt. A queued
        --  second spell must not depend on how native queries treat removal.
        SaveBoolean(ArmyEconomy_Ledger, key, 99, true)
        if (GermanRoutes_Pending ~= nil) then
            FlushChildHashtable(GermanRoutes_Pending, key)
        end
    end
    owner = nil
end

function SellAll94_OnCast()
    local caster = GetTriggerUnit()
    local owner = GetOwningPlayer(caster)
    local pid = GetPlayerId(owner)
    local now = TimerGetElapsed(Air88_Clock)
    local armed = SellAll94_Pending[pid]
    local units = CreateGroup()
    local targets = {}
    local u = nil
    local gold = 0
    local wood = 0
    if (GetSpellAbilityId() ~= 1095984492) then
        DestroyGroup(units)
        do return end
    end
    --  First click arms the command; a second click within 5 seconds sells.
    if ((armed == nil) or (now > J88_real(armed + 5.0))) then
        SellAll94_Pending[pid] = now
        DisplayTimedTextToPlayer(owner, 0.0, 0.0, 5.0, "|cffffcc00Sell All:|r click again within 5 seconds to sell every building in your build area.")
        DestroyGroup(units)
        do return end
    end
    SellAll94_Pending[pid] = nil
    gold = GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD)
    wood = GetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER)
    --  Collect first: each sale removes a unit from the native group.
    GroupEnumUnitsOfPlayer(units, owner, nil)
    while true do
        u = FirstOfGroup(units)
        if (u == nil) then break end
        GroupRemoveUnit(units, u)
        if (((GetUnitAbilityLevel(u, 1093677106) > 0) and (GetWidgetLife(u) > 0.4050000011920929)) and RectContainsCoords(udg_PlayerLocationArray[pid], GetUnitX(u), GetUnitY(u))) then
            targets[#targets + 1] = u
        end
    end
    DestroyGroup(units)
    for i=1,#targets do
        --  The same ledger-based refund as Sell / Refund on each building.
        ArmyEconomy_RefundAndRemove(targets[i])
    end
    gold = J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_GOLD) - gold)
    wood = J88_int(GetPlayerState(owner, PLAYER_STATE_RESOURCE_LUMBER) - wood)
    DisplayTimedTextToPlayer(owner, 0.0, 0.0, 8.0, J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat("|cffffcc00Sell All:|r sold ", I2S(#targets)), " buildings and refunded "), I2S(gold)), " gold and "), I2S(wood)), " wood."))
    units = nil
    caster = nil
    owner = nil
end

function SellAll94_Init()
    local t = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddAction(t, SellAll94_OnCast)
    SellAll94_Trigger = t
end

function ArmyEconomy_OnEvent()
    local kind = GetTriggerEventId()
    local u = GetTriggerUnit()
    local key = 0
    local source = 0
    local target = 0
    if (kind == EVENT_PLAYER_UNIT_TRAIN_FINISH) then
        u = GetTrainedUnit()
    end
    if ((u == nil) or (GetPlayerId(GetOwningPlayer(u)) >= 8)) then
        u = nil
        kind = nil
        do return end
    end
    source = GetUnitTypeId(u)
    if (not ArmyEconomy_IsTracked(source)) then
        u = nil
        kind = nil
        do return end
    end
    key = GetHandleId(u)
    if (kind == EVENT_PLAYER_UNIT_ISSUED_ORDER) then
        target = GetIssuedOrderId()
        if ArmyEconomy_IsUpgrade(source, target) then
            ArmyEconomy_Ensure(u)
            SaveInteger(ArmyEconomy_Ledger, key, 10, target)
            SaveInteger(ArmyEconomy_Ledger, key, 11, source)
        elseif (not LoadBoolean(ArmyEconomy_Ledger, key, 5)) then
            RemoveSavedInteger(ArmyEconomy_Ledger, key, 10)
            RemoveSavedInteger(ArmyEconomy_Ledger, key, 11)
        end
    elseif ((kind == EVENT_PLAYER_UNIT_CONSTRUCT_START) or (kind == EVENT_PLAYER_UNIT_TRAIN_FINISH)) then
        ArmyEconomy_Set(u, LoadInteger(ArmyEconomy_Types, source, 0), LoadInteger(ArmyEconomy_Types, source, 1))
    elseif (kind == EVENT_PLAYER_UNIT_UPGRADE_START) then
        target = LoadInteger(ArmyEconomy_Ledger, key, 10)
        if ArmyEconomy_IsUpgrade(LoadInteger(ArmyEconomy_Ledger, key, 11), target) then
            source = LoadInteger(ArmyEconomy_Ledger, key, 11)
        else
            target = GetUnitCurrentOrder(u)
        end
        if (ArmyEconomy_IsUpgrade(source, target) and (not LoadBoolean(ArmyEconomy_Ledger, key, 5))) then
            ArmyEconomy_Ensure(u)
            SaveInteger(ArmyEconomy_Ledger, key, 2, LoadInteger(ArmyEconomy_Ledger, key, 0))
            SaveInteger(ArmyEconomy_Ledger, key, 3, LoadInteger(ArmyEconomy_Ledger, key, 1))
            SaveInteger(ArmyEconomy_Ledger, key, 0, J88_int(LoadInteger(ArmyEconomy_Ledger, key, 0) + LoadInteger(ArmyEconomy_Types, target, 0)))
            SaveInteger(ArmyEconomy_Ledger, key, 1, J88_int(LoadInteger(ArmyEconomy_Ledger, key, 1) + LoadInteger(ArmyEconomy_Types, target, 1)))
            SaveInteger(ArmyEconomy_Ledger, key, 4, target)
            SaveBoolean(ArmyEconomy_Ledger, key, 5, true)
        end
    elseif (kind == EVENT_PLAYER_UNIT_UPGRADE_CANCEL) then
        if LoadBoolean(ArmyEconomy_Ledger, key, 5) then
            SaveInteger(ArmyEconomy_Ledger, key, 0, LoadInteger(ArmyEconomy_Ledger, key, 2))
            SaveInteger(ArmyEconomy_Ledger, key, 1, LoadInteger(ArmyEconomy_Ledger, key, 3))
        end
        SaveBoolean(ArmyEconomy_Ledger, key, 5, false)
        RemoveSavedInteger(ArmyEconomy_Ledger, key, 10)
        RemoveSavedInteger(ArmyEconomy_Ledger, key, 11)
    elseif (kind == EVENT_PLAYER_UNIT_UPGRADE_FINISH) then
        if (((not LoadBoolean(ArmyEconomy_Ledger, key, 5)) and LoadBoolean(ArmyEconomy_Ledger, key, 6)) and (LoadInteger(ArmyEconomy_Ledger, key, 7) ~= source)) then
            --  Fallback for a map-driven upgrade that bypasses an issued order.
            SaveInteger(ArmyEconomy_Ledger, key, 0, J88_int(LoadInteger(ArmyEconomy_Ledger, key, 0) + LoadInteger(ArmyEconomy_Types, source, 0)))
            SaveInteger(ArmyEconomy_Ledger, key, 1, J88_int(LoadInteger(ArmyEconomy_Ledger, key, 1) + LoadInteger(ArmyEconomy_Types, source, 1)))
        end
        ArmyEconomy_Ensure(u)
        SaveInteger(ArmyEconomy_Ledger, key, 7, source)
        SaveBoolean(ArmyEconomy_Ledger, key, 5, false)
        RemoveSavedInteger(ArmyEconomy_Ledger, key, 10)
        RemoveSavedInteger(ArmyEconomy_Ledger, key, 11)
    elseif ((kind == EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL) or (kind == EVENT_PLAYER_UNIT_DEATH)) then
        FlushChildHashtable(ArmyEconomy_Ledger, key)
    end
    u = nil
    kind = nil
end

function ArmyEconomy_Register(t, gold, wood, totalGold, totalWood, kind, childCount)
    SaveInteger(ArmyEconomy_Types, t, 0, gold)
    SaveInteger(ArmyEconomy_Types, t, 1, wood)
    SaveBoolean(ArmyEconomy_Types, t, 2, true)
    SaveInteger(ArmyEconomy_Types, t, 3, totalGold)
    SaveInteger(ArmyEconomy_Types, t, 4, totalWood)
    SaveInteger(ArmyEconomy_Types, t, 5, kind)
    SaveInteger(ArmyEconomy_Types, t, 6, childCount)
end

function ArmyEconomy_LoadTypes00()
    ArmyEconomy_Register(1747988528, 1, 0, 1, 0, 3, 0)
    ArmyEconomy_Register(1747988535, 0, 800, 0, 800, 3, 0)
    ArmyEconomy_Register(1747988550, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747988553, 100, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747988553, 100, 1747989843)
    SaveInteger(ArmyEconomy_Types, 1747988553, 101, 1747988558)
    ArmyEconomy_Register(1747988554, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747988556, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747988556, 100, 1747989809)
    SaveInteger(ArmyEconomy_Types, 1747988556, 101, 1747989072)
    ArmyEconomy_Register(1747988557, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747988558, 50, 0, 350, 0, 3, 0)
    ArmyEconomy_Register(1747988567, 0, 0, 0, 0, 1, 3)
    SaveInteger(ArmyEconomy_Types, 1747988567, 100, 1747994690)
    SaveInteger(ArmyEconomy_Types, 1747988567, 101, 1747994445)
    SaveInteger(ArmyEconomy_Types, 1747988567, 102, 1747994192)
    ArmyEconomy_Register(1747988568, 1, 0, 0, 0, 1, 10)
    SaveInteger(ArmyEconomy_Types, 1747988568, 100, 1747993925)
    SaveInteger(ArmyEconomy_Types, 1747988568, 101, 1747988567)
    SaveInteger(ArmyEconomy_Types, 1747988568, 102, 1747989848)
    SaveInteger(ArmyEconomy_Types, 1747988568, 103, 1747992898)
    SaveInteger(ArmyEconomy_Types, 1747988568, 104, 1747989296)
    SaveInteger(ArmyEconomy_Types, 1747988568, 105, 1747990604)
    SaveInteger(ArmyEconomy_Types, 1747988568, 106, 1747990344)
    SaveInteger(ArmyEconomy_Types, 1747988568, 107, 1747990598)
    SaveInteger(ArmyEconomy_Types, 1747988568, 108, 1747988569)
    SaveInteger(ArmyEconomy_Types, 1747988568, 109, 1747993156)
    ArmyEconomy_Register(1747988569, 0, 0, 0, 0, 1, 2)
    SaveInteger(ArmyEconomy_Types, 1747988569, 100, 1747988570)
    SaveInteger(ArmyEconomy_Types, 1747988569, 101, 1747990359)
    ArmyEconomy_Register(1747988570, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747988784, 150, 0, 150, 0, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747988784, 100, 1747993666)
    SaveInteger(ArmyEconomy_Types, 1747988784, 101, 1747988787)
    SaveInteger(ArmyEconomy_Types, 1747988784, 102, 1747988807)
    ArmyEconomy_Register(1747988787, 50, 0, 200, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747988787, 100, 1747993178)
    SaveInteger(ArmyEconomy_Types, 1747988787, 101, 1747989321)
    SaveInteger(ArmyEconomy_Types, 1747988787, 102, 1747988806)
    SaveInteger(ArmyEconomy_Types, 1747988787, 103, 1747988820)
    SaveInteger(ArmyEconomy_Types, 1747988787, 104, 1747988821)
    ArmyEconomy_Register(1747988805, 75, 0, 75, 0, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747988805, 100, 1747994169)
    SaveInteger(ArmyEconomy_Types, 1747988805, 101, 1747994165)
    SaveInteger(ArmyEconomy_Types, 1747988805, 102, 1747994163)
    ArmyEconomy_Register(1747988806, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747988807, 50, 0, 200, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747988807, 100, 1747988806)
    SaveInteger(ArmyEconomy_Types, 1747988807, 101, 1747989324)
    ArmyEconomy_Register(1747988813, 250, 0, 250, 0, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747988813, 100, 1747993426)
    SaveInteger(ArmyEconomy_Types, 1747988813, 101, 1747990354)
    SaveInteger(ArmyEconomy_Types, 1747988813, 102, 1747989811)
    SaveInteger(ArmyEconomy_Types, 1747988813, 103, 1747989079)
    ArmyEconomy_Register(1747988815, 0, 600, 200, 600, 3, 0)
    ArmyEconomy_Register(1747988816, 0, 2000, 200, 2000, 3, 0)
    ArmyEconomy_Register(1747988819, 200, 0, 200, 0, 3, 0)
    ArmyEconomy_Register(1747988820, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747988821, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747988824, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747988824, 100, 1747989813)
    ArmyEconomy_Register(1747988825, 200, 0, 200, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747988825, 100, 1747990102)
    SaveInteger(ArmyEconomy_Types, 1747988825, 101, 1747989063)
    SaveInteger(ArmyEconomy_Types, 1747988825, 102, 1747989062)
    SaveInteger(ArmyEconomy_Types, 1747988825, 103, 1747989070)
    SaveInteger(ArmyEconomy_Types, 1747988825, 104, 1747989059)
    ArmyEconomy_Register(1747989044, 200, 0, 200, 0, 3, 8)
    SaveInteger(ArmyEconomy_Types, 1747989044, 100, 1747994182)
    SaveInteger(ArmyEconomy_Types, 1747989044, 101, 1747994181)
    SaveInteger(ArmyEconomy_Types, 1747989044, 102, 1747990871)
    SaveInteger(ArmyEconomy_Types, 1747989044, 103, 1747994691)
    SaveInteger(ArmyEconomy_Types, 1747989044, 104, 1747988557)
    SaveInteger(ArmyEconomy_Types, 1747989044, 105, 1747988554)
    SaveInteger(ArmyEconomy_Types, 1747989044, 106, 1747988550)
    SaveInteger(ArmyEconomy_Types, 1747989044, 107, 1747988553)
    ArmyEconomy_Register(1747989058, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747989059, 150, 0, 350, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989059, 100, 1747989060)
    ArmyEconomy_Register(1747989060, 0, 800, 350, 800, 3, 0)
    ArmyEconomy_Register(1747989062, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747989063, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747989070, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747989072, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1747989074, 0, 1000, 0, 1000, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747989074, 100, 1747990602)
    SaveInteger(ArmyEconomy_Types, 1747989074, 101, 1747990357)
    SaveInteger(ArmyEconomy_Types, 1747989074, 102, 1747990358)
    ArmyEconomy_Register(1747989077, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747989077, 100, 1747990361)
    SaveInteger(ArmyEconomy_Types, 1747989077, 101, 1747990088)
    SaveInteger(ArmyEconomy_Types, 1747989077, 102, 1747990089)
    SaveInteger(ArmyEconomy_Types, 1747989077, 103, 1747990356)
    ArmyEconomy_Register(1747989079, 0, 1200, 250, 1200, 3, 0)
    ArmyEconomy_Register(1747989081, 0, 1000, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989081, 100, 1747990067)
    ArmyEconomy_Register(1747989296, 0, 0, 0, 0, 1, 4)
    SaveInteger(ArmyEconomy_Types, 1747989296, 100, 1747993912)
    SaveInteger(ArmyEconomy_Types, 1747989296, 101, 1747993684)
    SaveInteger(ArmyEconomy_Types, 1747989296, 102, 1747993683)
    SaveInteger(ArmyEconomy_Types, 1747989296, 103, 1747993682)
    ArmyEconomy_Register(1747989298, 250, 0, 250, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989298, 100, 1747989850)
    SaveInteger(ArmyEconomy_Types, 1747989298, 101, 1747990066)
    ArmyEconomy_Register(1747989299, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747989299, 100, 1747989825)
    SaveInteger(ArmyEconomy_Types, 1747989299, 101, 1747989816)
    SaveInteger(ArmyEconomy_Types, 1747989299, 102, 1747989817)
    SaveInteger(ArmyEconomy_Types, 1747989299, 103, 1747989815)
end

function ArmyEconomy_LoadTypes01()
    ArmyEconomy_Register(1747989300, 0, 1000, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989300, 100, 1747989808)
    ArmyEconomy_Register(1747989303, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989303, 100, 1747993401)
    ArmyEconomy_Register(1747989304, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989304, 100, 1747993409)
    ArmyEconomy_Register(1747989317, 0, 1500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1747989318, 0, 1200, 0, 1200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989318, 100, 1747989594)
    ArmyEconomy_Register(1747989319, 0, 1200, 0, 1200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989319, 100, 1747989826)
    ArmyEconomy_Register(1747989320, 0, 1500, 0, 1500, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989320, 100, 1747990070)
    SaveInteger(ArmyEconomy_Types, 1747989320, 101, 1747989812)
    ArmyEconomy_Register(1747989321, 100, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989321, 100, 1747994187)
    SaveInteger(ArmyEconomy_Types, 1747989321, 101, 1747994188)
    ArmyEconomy_Register(1747989322, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747989324, 100, 0, 300, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989324, 100, 1747993941)
    ArmyEconomy_Register(1747989334, 200, 0, 200, 0, 3, 6)
    SaveInteger(ArmyEconomy_Types, 1747989334, 100, 1747994419)
    SaveInteger(ArmyEconomy_Types, 1747989334, 101, 1747994194)
    SaveInteger(ArmyEconomy_Types, 1747989334, 102, 1747989335)
    SaveInteger(ArmyEconomy_Types, 1747989334, 103, 1747989336)
    SaveInteger(ArmyEconomy_Types, 1747989334, 104, 1747989337)
    SaveInteger(ArmyEconomy_Types, 1747989334, 105, 1747989552)
    ArmyEconomy_Register(1747989335, 50, 0, 250, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989335, 100, 1747994190)
    ArmyEconomy_Register(1747989336, 300, 0, 500, 0, 3, 0)
    ArmyEconomy_Register(1747989337, 50, 0, 50, 0, 3, 0)
    ArmyEconomy_Register(1747989338, 300, 0, 300, 0, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747989338, 100, 1747990091)
    SaveInteger(ArmyEconomy_Types, 1747989338, 101, 1747990092)
    SaveInteger(ArmyEconomy_Types, 1747989338, 102, 1747989582)
    ArmyEconomy_Register(1747989552, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747989554, 0, 1000, 0, 1000, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747989554, 100, 1747993670)
    SaveInteger(ArmyEconomy_Types, 1747989554, 101, 1747989570)
    SaveInteger(ArmyEconomy_Types, 1747989554, 102, 1747989569)
    SaveInteger(ArmyEconomy_Types, 1747989554, 103, 1747989555)
    ArmyEconomy_Register(1747989555, 50, 0, 50, 1000, 3, 0)
    ArmyEconomy_Register(1747989556, 600, 0, 600, 0, 3, 0)
    ArmyEconomy_Register(1747989569, 0, 500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1747989570, 0, 500, 0, 500, 3, 0)
    ArmyEconomy_Register(1747989571, 0, 1000, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989571, 100, 1747993679)
    ArmyEconomy_Register(1747989572, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747989572, 100, 1747993680)
    SaveInteger(ArmyEconomy_Types, 1747989572, 101, 1747990321)
    SaveInteger(ArmyEconomy_Types, 1747989572, 102, 1747990323)
    SaveInteger(ArmyEconomy_Types, 1747989572, 103, 1747990105)
    ArmyEconomy_Register(1747989581, 200, 0, 200, 0, 3, 6)
    SaveInteger(ArmyEconomy_Types, 1747989581, 100, 1747994457)
    SaveInteger(ArmyEconomy_Types, 1747989581, 101, 1747994424)
    SaveInteger(ArmyEconomy_Types, 1747989581, 102, 1747992882)
    SaveInteger(ArmyEconomy_Types, 1747989581, 103, 1747992883)
    SaveInteger(ArmyEconomy_Types, 1747989581, 104, 1747992903)
    SaveInteger(ArmyEconomy_Types, 1747989581, 105, 1747992904)
    ArmyEconomy_Register(1747989582, 0, 750, 300, 750, 3, 0)
    ArmyEconomy_Register(1747989583, 150, 0, 150, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989583, 100, 1747995201)
    SaveInteger(ArmyEconomy_Types, 1747989583, 101, 1747995186)
    ArmyEconomy_Register(1747989593, 0, 6000, 0, 6000, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989593, 100, 1747993422)
    SaveInteger(ArmyEconomy_Types, 1747989593, 101, 1747993419)
    ArmyEconomy_Register(1747989594, 0, 1000, 0, 2200, 3, 0)
    ArmyEconomy_Register(1747989808, 0, 500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1747989809, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1747989811, 0, 1200, 250, 1200, 3, 0)
    ArmyEconomy_Register(1747989812, 0, 500, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747989813, 0, 2000, 0, 3500, 3, 0)
    ArmyEconomy_Register(1747989814, 0, 6000, 0, 6000, 3, 0)
    ArmyEconomy_Register(1747989815, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747989816, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747989817, 0, 2500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747989825, 0, 4500, 0, 6000, 3, 0)
    ArmyEconomy_Register(1747989826, 0, 1000, 0, 2200, 3, 0)
    ArmyEconomy_Register(1747989834, 200, 0, 200, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747989834, 100, 1747989849)
    SaveInteger(ArmyEconomy_Types, 1747989834, 101, 1747989835)
end

function ArmyEconomy_LoadTypes02()
    ArmyEconomy_Register(1747989835, 0, 1000, 200, 1000, 3, 0)
    ArmyEconomy_Register(1747989836, 100, 0, 250, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747989836, 100, 1747990869)
    SaveInteger(ArmyEconomy_Types, 1747989836, 101, 1747990864)
    SaveInteger(ArmyEconomy_Types, 1747989836, 102, 1747990865)
    SaveInteger(ArmyEconomy_Types, 1747989836, 103, 1747990866)
    SaveInteger(ArmyEconomy_Types, 1747989836, 104, 1747990867)
    ArmyEconomy_Register(1747989843, 50, 0, 350, 0, 3, 0)
    ArmyEconomy_Register(1747989845, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747989848, 0, 0, 0, 0, 1, 1)
    SaveInteger(ArmyEconomy_Types, 1747989848, 100, 1747994960)
    ArmyEconomy_Register(1747989849, 0, 1000, 200, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747989849, 100, 1747990345)
    ArmyEconomy_Register(1747989850, 200, 0, 450, 0, 3, 0)
    ArmyEconomy_Register(1747990066, 0, 1200, 250, 1200, 3, 0)
    ArmyEconomy_Register(1747990067, 0, 500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1747990070, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747990085, 300, 0, 300, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990085, 100, 1747990086)
    ArmyEconomy_Register(1747990086, 0, 1000, 300, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990086, 100, 1747990087)
    ArmyEconomy_Register(1747990087, 0, 1500, 300, 2500, 3, 0)
    ArmyEconomy_Register(1747990088, 0, 2000, 0, 3500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990088, 100, 1747990583)
    ArmyEconomy_Register(1747990089, 0, 1000, 0, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990089, 100, 1747990090)
    ArmyEconomy_Register(1747990090, 0, 1500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747990091, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1747990092, 0, 750, 300, 750, 3, 0)
    ArmyEconomy_Register(1747990100, 0, 15000, 0, 15000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990100, 100, 1747990351)
    ArmyEconomy_Register(1747990102, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747990103, 0, 1200, 0, 1200, 3, 0)
    ArmyEconomy_Register(1747990105, 0, 1000, 0, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990105, 100, 1747990320)
    ArmyEconomy_Register(1747990320, 0, 5500, 0, 8000, 3, 0)
    ArmyEconomy_Register(1747990321, 0, 500, 0, 2000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990321, 100, 1747990322)
    ArmyEconomy_Register(1747990322, 0, 500, 0, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990322, 100, 1747990324)
    ArmyEconomy_Register(1747990323, 0, 2500, 0, 4000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990323, 100, 1747993681)
    ArmyEconomy_Register(1747990324, 0, 1500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747990325, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747990325, 100, 1747990329)
    SaveInteger(ArmyEconomy_Types, 1747990325, 101, 1747990337)
    ArmyEconomy_Register(1747990329, 200, 0, 500, 0, 3, 0)
    ArmyEconomy_Register(1747990337, 0, 1500, 300, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990337, 100, 1747990338)
    ArmyEconomy_Register(1747990338, 0, 1500, 300, 3000, 3, 0)
    ArmyEconomy_Register(1747990342, 0, 6000, 0, 6000, 3, 0)
    ArmyEconomy_Register(1747990344, 0, 0, 0, 0, 1, 4)
    SaveInteger(ArmyEconomy_Types, 1747990344, 100, 1747994456)
    SaveInteger(ArmyEconomy_Types, 1747990344, 101, 1747994196)
    SaveInteger(ArmyEconomy_Types, 1747990344, 102, 1747994191)
    SaveInteger(ArmyEconomy_Types, 1747990344, 103, 1749889330)
    ArmyEconomy_Register(1747990345, 0, 2000, 200, 3000, 3, 0)
    ArmyEconomy_Register(1747990346, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747990347, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747990351, 0, 5000, 0, 20000, 3, 0)
    ArmyEconomy_Register(1747990354, 0, 1000, 250, 1000, 3, 0)
    ArmyEconomy_Register(1747990356, 0, 6500, 0, 8000, 3, 0)
    ArmyEconomy_Register(1747990357, 0, 500, 0, 1500, 3, 0)
end

function ArmyEconomy_LoadTypes03()
    ArmyEconomy_Register(1747990358, 0, 1000, 0, 2000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990358, 100, 1747990360)
    ArmyEconomy_Register(1747990359, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747990360, 0, 1000, 0, 3000, 3, 0)
    ArmyEconomy_Register(1747990361, 0, 2500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747990576, 0, 12000, 0, 12000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990576, 100, 1747990577)
    ArmyEconomy_Register(1747990577, 0, 4000, 0, 16000, 3, 0)
    ArmyEconomy_Register(1747990582, 200, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990582, 100, 1747990601)
    ArmyEconomy_Register(1747990583, 0, 1500, 0, 5000, 3, 0)
    ArmyEconomy_Register(1747990598, 0, 0, 0, 0, 1, 2)
    SaveInteger(ArmyEconomy_Types, 1747990598, 100, 1747994195)
    SaveInteger(ArmyEconomy_Types, 1747990598, 101, 1749954866)
    ArmyEconomy_Register(1747990601, 0, 1000, 200, 1000, 3, 0)
    ArmyEconomy_Register(1747990602, 0, 500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1747990603, 0, 0, 0, 0, 3, 0)
    ArmyEconomy_Register(1747990604, 0, 0, 0, 0, 1, 2)
    SaveInteger(ArmyEconomy_Types, 1747990604, 100, 1747993162)
    SaveInteger(ArmyEconomy_Types, 1747990604, 101, 1747993657)
    ArmyEconomy_Register(1747990858, 600, 0, 600, 0, 3, 0)
    ArmyEconomy_Register(1747990860, 150, 0, 150, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747990860, 100, 1747992889)
    SaveInteger(ArmyEconomy_Types, 1747990860, 101, 1747989836)
    ArmyEconomy_Register(1747990864, 100, 0, 350, 0, 3, 0)
    ArmyEconomy_Register(1747990865, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747990866, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747990867, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747990868, 200, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747990868, 100, 1747993414)
    ArmyEconomy_Register(1747990869, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747990871, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747992880, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747992880, 100, 1747989809)
    SaveInteger(ArmyEconomy_Types, 1747992880, 101, 1747992881)
    ArmyEconomy_Register(1747992881, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1747992882, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747992883, 600, 0, 800, 0, 3, 0)
    ArmyEconomy_Register(1747992889, 100, 0, 250, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747992889, 100, 1747994420)
    SaveInteger(ArmyEconomy_Types, 1747992889, 101, 1747992901)
    SaveInteger(ArmyEconomy_Types, 1747992889, 102, 1747992897)
    SaveInteger(ArmyEconomy_Types, 1747992889, 103, 1747992900)
    SaveInteger(ArmyEconomy_Types, 1747992889, 104, 1747992899)
    ArmyEconomy_Register(1747992897, 100, 0, 350, 0, 3, 0)
    ArmyEconomy_Register(1747992898, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747992899, 0, 800, 250, 800, 3, 0)
    ArmyEconomy_Register(1747992900, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747992901, 50, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747992903, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747992904, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747992906, 0, 1500, 0, 1500, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747992906, 100, 1747993172)
    SaveInteger(ArmyEconomy_Types, 1747992906, 101, 1747993169)
    SaveInteger(ArmyEconomy_Types, 1747992906, 102, 1747993171)
    ArmyEconomy_Register(1747992907, 0, 1000, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747992907, 100, 1747993410)
    ArmyEconomy_Register(1747992909, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747992909, 100, 1747992910)
    ArmyEconomy_Register(1747992910, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747992914, 0, 3000, 0, 4500, 3, 0)
    ArmyEconomy_Register(1747992916, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747992916, 100, 1747992914)
end

function ArmyEconomy_LoadTypes04()
    ArmyEconomy_Register(1747993153, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993154, 200, 0, 200, 0, 3, 6)
    SaveInteger(ArmyEconomy_Types, 1747993154, 100, 1747994699)
    SaveInteger(ArmyEconomy_Types, 1747993154, 101, 1747988816)
    SaveInteger(ArmyEconomy_Types, 1747993154, 102, 1747993160)
    SaveInteger(ArmyEconomy_Types, 1747993154, 103, 1747993158)
    SaveInteger(ArmyEconomy_Types, 1747993154, 104, 1747993159)
    SaveInteger(ArmyEconomy_Types, 1747993154, 105, 1747993161)
    ArmyEconomy_Register(1747993155, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993156, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747993157, 200, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747993157, 100, 1747993424)
    ArmyEconomy_Register(1747993158, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747993159, 0, 300, 200, 300, 3, 0)
    ArmyEconomy_Register(1747993160, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747993161, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747993162, 0, 10000, 0, 10000, 1, 0)
    ArmyEconomy_Register(1747993163, 0, 400, 0, 900, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747993163, 100, 1747993164)
    ArmyEconomy_Register(1747993164, 0, 900, 0, 1800, 3, 0)
    ArmyEconomy_Register(1747993165, 0, 2000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747993169, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747993170, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993171, 0, 1000, 0, 2500, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747993171, 100, 1747993678)
    SaveInteger(ArmyEconomy_Types, 1747993171, 101, 1747993173)
    ArmyEconomy_Register(1747993172, 0, 2500, 0, 4000, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747993172, 100, 1747993399)
    SaveInteger(ArmyEconomy_Types, 1747993172, 101, 1747993400)
    SaveInteger(ArmyEconomy_Types, 1747993172, 102, 1747993174)
    ArmyEconomy_Register(1747993173, 0, 5000, 0, 7500, 3, 0)
    ArmyEconomy_Register(1747993174, 0, 500, 0, 4500, 3, 0)
    ArmyEconomy_Register(1747993175, 0, 2000, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747993177, 200, 0, 200, 0, 3, 0)
    ArmyEconomy_Register(1747993178, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747993399, 0, 4000, 0, 8000, 3, 0)
    ArmyEconomy_Register(1747993400, 0, 1000, 0, 5000, 3, 0)
    ArmyEconomy_Register(1747993401, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747993409, 0, 1500, 0, 3000, 3, 0)
    ArmyEconomy_Register(1747993410, 0, 1000, 0, 2000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747993410, 100, 1747993411)
    ArmyEconomy_Register(1747993411, 0, 1000, 0, 3000, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747993411, 100, 1747993412)
    SaveInteger(ArmyEconomy_Types, 1747993411, 101, 1747993413)
    ArmyEconomy_Register(1747993412, 0, 500, 0, 3500, 3, 0)
    ArmyEconomy_Register(1747993413, 0, 500, 0, 3500, 3, 0)
    ArmyEconomy_Register(1747993414, 0, 1000, 200, 1000, 3, 0)
    ArmyEconomy_Register(1747993419, 0, 17000, 0, 23000, 3, 0)
    ArmyEconomy_Register(1747993422, 0, 17000, 0, 23000, 3, 0)
    ArmyEconomy_Register(1747993424, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747993426, 0, 500, 250, 500, 3, 0)
    ArmyEconomy_Register(1747993428, 300, 0, 600, 0, 3, 0)
    ArmyEconomy_Register(1747993656, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993657, 0, 4000, 0, 4000, 1, 0)
    ArmyEconomy_Register(1747993666, 450, 0, 600, 0, 3, 0)
    ArmyEconomy_Register(1747993670, 0, 500, 0, 1500, 3, 0)
end

function ArmyEconomy_LoadTypes05()
    ArmyEconomy_Register(1747993674, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993676, 0, 500, 0, 500, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747993676, 100, 1747993165)
    SaveInteger(ArmyEconomy_Types, 1747993676, 101, 1747993163)
    ArmyEconomy_Register(1747993678, 0, 1000, 0, 3500, 3, 0)
    ArmyEconomy_Register(1747993679, 0, 1000, 0, 1000, 3, 0)
    ArmyEconomy_Register(1747993680, 0, 0, 0, 1500, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747993680, 100, 1747990321)
    SaveInteger(ArmyEconomy_Types, 1747993680, 101, 1747993681)
    SaveInteger(ArmyEconomy_Types, 1747993680, 102, 1747990105)
    ArmyEconomy_Register(1747993681, 0, 2500, 0, 4000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747993681, 100, 1750348354)
    ArmyEconomy_Register(1747993682, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747993683, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747993684, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747993685, 400, 0, 400, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747993685, 100, 1747993910)
    SaveInteger(ArmyEconomy_Types, 1747993685, 101, 1747993908)
    SaveInteger(ArmyEconomy_Types, 1747993685, 102, 1747993686)
    SaveInteger(ArmyEconomy_Types, 1747993685, 103, 1747993906)
    SaveInteger(ArmyEconomy_Types, 1747993685, 104, 1747993907)
    ArmyEconomy_Register(1747993686, 150, 0, 550, 0, 3, 0)
    ArmyEconomy_Register(1747993906, 150, 0, 550, 0, 3, 0)
    ArmyEconomy_Register(1747993907, 150, 0, 550, 0, 3, 0)
    ArmyEconomy_Register(1747993908, 150, 0, 550, 0, 3, 0)
    ArmyEconomy_Register(1747993910, 350, 0, 750, 0, 3, 0)
    ArmyEconomy_Register(1747993912, 0, 6000, 0, 6000, 1, 0)
    ArmyEconomy_Register(1747993913, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747993922, 0, 10000, 0, 10000, 3, 0)
    ArmyEconomy_Register(1747993923, 0, 15000, 0, 15000, 3, 0)
    ArmyEconomy_Register(1747993924, 0, 20000, 0, 20000, 3, 0)
    ArmyEconomy_Register(1747993925, 0, 0, 0, 0, 1, 4)
    SaveInteger(ArmyEconomy_Types, 1747993925, 100, 1747993684)
    SaveInteger(ArmyEconomy_Types, 1747993925, 101, 1747993912)
    SaveInteger(ArmyEconomy_Types, 1747993925, 102, 1747993683)
    SaveInteger(ArmyEconomy_Types, 1747993925, 103, 1747993682)
    ArmyEconomy_Register(1747993941, 0, 1500, 300, 1500, 3, 0)
    ArmyEconomy_Register(1747993944, 100, 0, 100, 0, 3, 0)
    ArmyEconomy_Register(1747993946, 200, 0, 200, 0, 3, 5)
    SaveInteger(ArmyEconomy_Types, 1747993946, 100, 1747988816)
    SaveInteger(ArmyEconomy_Types, 1747993946, 101, 1747994198)
    SaveInteger(ArmyEconomy_Types, 1747993946, 102, 1747994199)
    SaveInteger(ArmyEconomy_Types, 1747993946, 103, 1747994200)
    SaveInteger(ArmyEconomy_Types, 1747993946, 104, 1747994162)
    ArmyEconomy_Register(1747994161, 180, 0, 180, 0, 3, 0)
    ArmyEconomy_Register(1747994162, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747994163, 50, 0, 125, 0, 3, 0)
    ArmyEconomy_Register(1747994165, 50, 0, 125, 0, 3, 0)
    ArmyEconomy_Register(1747994169, 25, 0, 100, 0, 3, 0)
    ArmyEconomy_Register(1747994178, 205, 30, 405, 30, 3, 0)
    ArmyEconomy_Register(1747994181, 0, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994181, 100, 1747994696)
    ArmyEconomy_Register(1747994182, 50, 0, 250, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994182, 100, 1747994694)
    SaveInteger(ArmyEconomy_Types, 1747994182, 101, 1747994693)
    ArmyEconomy_Register(1747994183, 100, 0, 100, 0, 3, 0)
    ArmyEconomy_Register(1747994187, 0, 2500, 300, 2500, 3, 0)
    ArmyEconomy_Register(1747994188, 0, 2000, 300, 2000, 3, 0)
    ArmyEconomy_Register(1747994190, 0, 2500, 250, 2500, 3, 0)
    ArmyEconomy_Register(1747994191, 0, 6000, 0, 6000, 1, 0)
    ArmyEconomy_Register(1747994192, 0, 6000, 0, 6000, 1, 0)
    ArmyEconomy_Register(1747994194, 0, 2500, 200, 2500, 3, 0)
    ArmyEconomy_Register(1747994195, 0, 12000, 0, 12000, 1, 0)
end

function ArmyEconomy_LoadTypes06()
    ArmyEconomy_Register(1747994196, 0, 12000, 0, 12000, 1, 0)
    ArmyEconomy_Register(1747994198, 0, 600, 200, 600, 3, 0)
    ArmyEconomy_Register(1747994199, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747994200, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994202, 300, 0, 300, 0, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747994202, 100, 1747993428)
    SaveInteger(ArmyEconomy_Types, 1747994202, 101, 1750085944)
    SaveInteger(ArmyEconomy_Types, 1747994202, 102, 1750085945)
    SaveInteger(ArmyEconomy_Types, 1747994202, 103, 1747994416)
    ArmyEconomy_Register(1747994416, 0, 1440, 300, 1440, 3, 0)
    ArmyEconomy_Register(1747994419, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747994420, 0, 2500, 250, 2500, 3, 0)
    ArmyEconomy_Register(1747994424, 0, 2500, 200, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994424, 100, 1747994425)
    ArmyEconomy_Register(1747994425, 0, 1000, 200, 3500, 3, 0)
    ArmyEconomy_Register(1747994433, 200, 0, 200, 0, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747994433, 100, 1747992882)
    SaveInteger(ArmyEconomy_Types, 1747994433, 101, 1747992883)
    SaveInteger(ArmyEconomy_Types, 1747994433, 102, 1747992903)
    SaveInteger(ArmyEconomy_Types, 1747994433, 103, 1747992904)
    ArmyEconomy_Register(1747994445, 0, 6000, 0, 6000, 1, 0)
    ArmyEconomy_Register(1747994446, 200, 0, 200, 0, 3, 6)
    SaveInteger(ArmyEconomy_Types, 1747994446, 100, 1747994447)
    SaveInteger(ArmyEconomy_Types, 1747994446, 101, 1747994706)
    SaveInteger(ArmyEconomy_Types, 1747994446, 102, 1747994710)
    SaveInteger(ArmyEconomy_Types, 1747994446, 103, 1747994711)
    SaveInteger(ArmyEconomy_Types, 1747994446, 104, 1747994707)
    SaveInteger(ArmyEconomy_Types, 1747994446, 105, 1747994709)
    ArmyEconomy_Register(1747994447, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994449, 0, 1800, 0, 1800, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747994449, 100, 1750085938)
    SaveInteger(ArmyEconomy_Types, 1747994449, 101, 1750085939)
    SaveInteger(ArmyEconomy_Types, 1747994449, 102, 1750085941)
    SaveInteger(ArmyEconomy_Types, 1747994449, 103, 1750085943)
    ArmyEconomy_Register(1747994450, 240, 0, 240, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994450, 100, 1750085682)
    ArmyEconomy_Register(1747994453, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747994453, 100, 1747994963)
    SaveInteger(ArmyEconomy_Types, 1747994453, 101, 1747994964)
    SaveInteger(ArmyEconomy_Types, 1747994453, 102, 1747994958)
    SaveInteger(ArmyEconomy_Types, 1747994453, 103, 1747994962)
    ArmyEconomy_Register(1747994456, 0, 10000, 0, 10000, 1, 0)
    ArmyEconomy_Register(1747994457, 0, 2000, 200, 2000, 3, 0)
    ArmyEconomy_Register(1747994675, 0, 1000, 0, 1000, 3, 0)
    ArmyEconomy_Register(1747994676, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994676, 100, 1747994677)
    ArmyEconomy_Register(1747994677, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747994679, 0, 1440, 300, 1440, 3, 0)
    ArmyEconomy_Register(1747994680, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994680, 100, 1750085681)
    SaveInteger(ArmyEconomy_Types, 1747994680, 101, 1747994679)
    ArmyEconomy_Register(1747994690, 0, 12000, 0, 12000, 1, 0)
    ArmyEconomy_Register(1747994691, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994693, 0, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994694, 0, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994696, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994698, 25, 0, 25, 0, 3, 0)
    ArmyEconomy_Register(1747994699, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994706, 0, 200, 200, 200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994706, 100, 1747994708)
    ArmyEconomy_Register(1747994707, 25, 0, 225, 0, 3, 0)
    ArmyEconomy_Register(1747994708, 0, 300, 200, 500, 3, 0)
    ArmyEconomy_Register(1747994709, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747994710, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994711, 300, 0, 500, 0, 3, 0)
    ArmyEconomy_Register(1747994712, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994712, 100, 1747989809)
    SaveInteger(ArmyEconomy_Types, 1747994712, 101, 1747994928)
    ArmyEconomy_Register(1747994928, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1747994935, 0, 1500, 0, 1500, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747994935, 100, 1747994950)
    SaveInteger(ArmyEconomy_Types, 1747994935, 101, 1747994949)
    SaveInteger(ArmyEconomy_Types, 1747994935, 102, 1747994948)
end

function ArmyEconomy_LoadTypes07()
    ArmyEconomy_Register(1747994937, 0, 300, 0, 300, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994937, 100, 1747994945)
    SaveInteger(ArmyEconomy_Types, 1747994937, 101, 1747994947)
    ArmyEconomy_Register(1747994945, 0, 700, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747994945, 100, 1747994946)
    ArmyEconomy_Register(1747994946, 0, 1000, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747994947, 0, 500, 0, 800, 3, 0)
    ArmyEconomy_Register(1747994948, 0, 4000, 0, 5500, 3, 0)
    ArmyEconomy_Register(1747994949, 0, 6000, 0, 7500, 3, 0)
    ArmyEconomy_Register(1747994950, 0, 8500, 0, 10000, 3, 0)
    ArmyEconomy_Register(1747994958, 0, 900, 0, 2400, 3, 0)
    ArmyEconomy_Register(1747994959, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1747994960, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1747994961, 0, 1000, 0, 1000, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994961, 100, 1747994965)
    SaveInteger(ArmyEconomy_Types, 1747994961, 101, 1747994966)
    ArmyEconomy_Register(1747994962, 0, 500, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747994963, 0, 500, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747994964, 0, 300, 0, 1800, 3, 0)
    ArmyEconomy_Register(1747994965, 0, 1000, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747994966, 0, 2000, 0, 3000, 3, 0)
    ArmyEconomy_Register(1747994967, 150, 0, 150, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747994967, 100, 1747994968)
    SaveInteger(ArmyEconomy_Types, 1747994967, 101, 1747994969)
    ArmyEconomy_Register(1747994968, 100, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747994969, 50, 0, 200, 0, 3, 0)
    ArmyEconomy_Register(1747995186, 50, 0, 200, 0, 3, 6)
    SaveInteger(ArmyEconomy_Types, 1747995186, 100, 1747995218)
    SaveInteger(ArmyEconomy_Types, 1747995186, 101, 1747995187)
    SaveInteger(ArmyEconomy_Types, 1747995186, 102, 1747988815)
    SaveInteger(ArmyEconomy_Types, 1747995186, 103, 1747995207)
    SaveInteger(ArmyEconomy_Types, 1747995186, 104, 1747995217)
    SaveInteger(ArmyEconomy_Types, 1747995186, 105, 1747995203)
    ArmyEconomy_Register(1747995187, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747995188, 0, 300, 0, 300, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1747995188, 100, 1747995211)
    SaveInteger(ArmyEconomy_Types, 1747995188, 101, 1747995190)
    SaveInteger(ArmyEconomy_Types, 1747995188, 102, 1747995189)
    ArmyEconomy_Register(1747995189, 0, 500, 0, 800, 3, 0)
    ArmyEconomy_Register(1747995190, 0, 700, 0, 1000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747995190, 100, 1747995191)
    ArmyEconomy_Register(1747995191, 0, 1000, 0, 2000, 3, 0)
    ArmyEconomy_Register(1747995201, 50, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747995201, 100, 1747995216)
    ArmyEconomy_Register(1747995203, 0, 200, 200, 200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747995203, 100, 1747995204)
    ArmyEconomy_Register(1747995204, 0, 300, 200, 500, 3, 0)
    ArmyEconomy_Register(1747995207, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747995211, 0, 700, 0, 1000, 3, 0)
    ArmyEconomy_Register(1747995212, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1747995212, 100, 1747995445)
    SaveInteger(ArmyEconomy_Types, 1747995212, 101, 1747995444)
    SaveInteger(ArmyEconomy_Types, 1747995212, 102, 1747995213)
    SaveInteger(ArmyEconomy_Types, 1747995212, 103, 1747995214)
    ArmyEconomy_Register(1747995213, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747995214, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1747995216, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747995217, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747995218, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747995444, 0, 2500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747995445, 0, 2500, 0, 4000, 3, 0)
    ArmyEconomy_Register(1747995447, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747995447, 100, 1747989809)
    SaveInteger(ArmyEconomy_Types, 1747995447, 101, 1747995449)
    ArmyEconomy_Register(1747995449, 0, 750, 300, 750, 3, 0)
end

function ArmyEconomy_LoadTypes08()
    ArmyEconomy_Register(1747995457, 150, 0, 150, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1747995457, 100, 1747995463)
    SaveInteger(ArmyEconomy_Types, 1747995457, 101, 1747995459)
    ArmyEconomy_Register(1747995458, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747995459, 50, 0, 200, 0, 3, 7)
    SaveInteger(ArmyEconomy_Types, 1747995459, 100, 1747995460)
    SaveInteger(ArmyEconomy_Types, 1747995459, 101, 1747995465)
    SaveInteger(ArmyEconomy_Types, 1747995459, 102, 1747995462)
    SaveInteger(ArmyEconomy_Types, 1747995459, 103, 1747995458)
    SaveInteger(ArmyEconomy_Types, 1747995459, 104, 1747995461)
    SaveInteger(ArmyEconomy_Types, 1747995459, 105, 1747995467)
    SaveInteger(ArmyEconomy_Types, 1747995459, 106, 1747995464)
    ArmyEconomy_Register(1747995460, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1747995461, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1747995462, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747995463, 100, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747995464, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1747995465, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1747995467, 0, 200, 200, 200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1747995467, 100, 1747995468)
    ArmyEconomy_Register(1747995468, 0, 300, 200, 500, 3, 0)
    ArmyEconomy_Register(1749242932, 0, 2000, 0, 2000, 3, 0)
    ArmyEconomy_Register(1749236021, 0, 1500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1749498164, 200, 0, 200, 0, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1749498164, 100, 1749824560)
    ArmyEconomy_Register(1749503024, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1749503024, 100, 1749824560)
    ArmyEconomy_Register(1749824560, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1749108528, 0, 1500, 0, 1500, 3, 0)
    ArmyEconomy_Register(1749828400, 200, 0, 200, 0, 3, 0)
    ArmyEconomy_Register(1749828174, 0, 3000, 0, 3000, 1, 0)
    ArmyEconomy_Register(1749238081, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1749242962, 0, 800, 300, 800, 3, 0)
    ArmyEconomy_Register(1750478896, 0, 1800, 0, 1800, 3, 0)
    ArmyEconomy_Register(1749241136, 300, 0, 300, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1749241136, 100, 1749242962)
    SaveInteger(ArmyEconomy_Types, 1749241136, 101, 1749238081)
    ArmyEconomy_Register(1749889330, 0, 0, 0, 0, 1, 0)
    ArmyEconomy_Register(1749954866, 0, 10000, 0, 10000, 1, 0)
    ArmyEconomy_Register(1750085681, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1750085682, 0, 1200, 240, 1200, 3, 0)
    ArmyEconomy_Register(1750085683, 0, 1800, 0, 1800, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750085683, 100, 1750085684)
    ArmyEconomy_Register(1750085684, 0, 1800, 0, 3600, 3, 0)
    ArmyEconomy_Register(1750085685, 0, 1800, 0, 1800, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750085685, 100, 1750085686)
    ArmyEconomy_Register(1750085686, 0, 1200, 0, 3000, 3, 0)
    ArmyEconomy_Register(1750085687, 0, 1200, 0, 1200, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1750085687, 100, 1750085688)
    SaveInteger(ArmyEconomy_Types, 1750085687, 101, 1750085689)
    SaveInteger(ArmyEconomy_Types, 1750085687, 102, 1750085936)
    ArmyEconomy_Register(1750085688, 0, 600, 0, 1800, 3, 0)
    ArmyEconomy_Register(1750085689, 0, 600, 0, 1800, 3, 0)
    ArmyEconomy_Register(1750085936, 0, 1200, 0, 2400, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750085936, 100, 1750085937)
    ArmyEconomy_Register(1750085937, 0, 1200, 0, 3600, 3, 0)
    ArmyEconomy_Register(1750085938, 0, 3000, 0, 4800, 3, 0)
    ArmyEconomy_Register(1750085939, 0, 2400, 0, 4200, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750085939, 100, 1750085940)
    ArmyEconomy_Register(1750085940, 0, 1800, 0, 6000, 3, 0)
    ArmyEconomy_Register(1750085941, 0, 1200, 0, 3000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750085941, 100, 1750085942)
    ArmyEconomy_Register(1750085942, 0, 1800, 0, 4800, 3, 0)
    ArmyEconomy_Register(1750085943, 0, 7800, 0, 9600, 3, 0)
    ArmyEconomy_Register(1750085944, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1750085945, 0, 1200, 300, 1200, 3, 0)
    ArmyEconomy_Register(1750217010, 0, 0, 0, 0, 2, 0)
    ArmyEconomy_Register(1750217012, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1750217012, 100, 1747993680)
    SaveInteger(ArmyEconomy_Types, 1750217012, 101, 1747990321)
    SaveInteger(ArmyEconomy_Types, 1750217012, 102, 1747993681)
    SaveInteger(ArmyEconomy_Types, 1750217012, 103, 1747990105)
    ArmyEconomy_Register(1750348354, 0, 5000, 0, 9000, 3, 0)
    ArmyEconomy_Register(1750675762, 0, 20000, 0, 20000, 3, 0)
end

function ArmyEconomy_LoadTypesP63_0()
    ArmyEconomy_Register(1750151216, 300, 500, 300, 500, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1750151216, 100, 1750151223)
    SaveInteger(ArmyEconomy_Types, 1750151216, 101, 1750151224)
    ArmyEconomy_Register(1750151217, 0, 6500, 0, 6500, 3, 0)
    ArmyEconomy_Register(1750151218, 0, 15500, 0, 15500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151218, 100, 1750151225)
    ArmyEconomy_Register(1750151219, 0, 1500, 0, 1500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151219, 100, 1750151472)
    ArmyEconomy_Register(1750151220, 0, 2000, 0, 2000, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1750151220, 100, 1750151473)
    SaveInteger(ArmyEconomy_Types, 1750151220, 101, 1750151474)
    SaveInteger(ArmyEconomy_Types, 1750151220, 102, 1750151475)
    SaveInteger(ArmyEconomy_Types, 1750151220, 103, 1750151476)
    ArmyEconomy_Register(1750151221, 300, 500, 300, 500, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1750151221, 100, 1750151477)
    SaveInteger(ArmyEconomy_Types, 1750151221, 101, 1750151478)
    SaveInteger(ArmyEconomy_Types, 1750151221, 102, 1750151479)
    ArmyEconomy_Register(1750151222, 0, 1500, 0, 1500, 3, 4)
    SaveInteger(ArmyEconomy_Types, 1750151222, 100, 1750151480)
    SaveInteger(ArmyEconomy_Types, 1750151222, 101, 1750151481)
    SaveInteger(ArmyEconomy_Types, 1750151222, 102, 1750151728)
    SaveInteger(ArmyEconomy_Types, 1750151222, 103, 1750151729)
    ArmyEconomy_Register(1750151223, 200, 500, 500, 1000, 3, 0)
    ArmyEconomy_Register(1750151224, 0, 2000, 300, 2500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151224, 100, 1750151730)
    ArmyEconomy_Register(1750151225, 0, 5500, 0, 21000, 3, 0)
    ArmyEconomy_Register(1750151472, 0, 1500, 0, 3000, 3, 0)
    ArmyEconomy_Register(1750151473, 0, 500, 0, 2500, 3, 3)
    SaveInteger(ArmyEconomy_Types, 1750151473, 100, 1750151474)
    SaveInteger(ArmyEconomy_Types, 1750151473, 101, 1750151731)
    SaveInteger(ArmyEconomy_Types, 1750151473, 102, 1750151476)
    ArmyEconomy_Register(1750151474, 0, 1000, 0, 3000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151474, 100, 1750151732)
    ArmyEconomy_Register(1750151475, 0, 3000, 0, 5000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151475, 100, 1750151731)
    ArmyEconomy_Register(1750151476, 0, 1500, 0, 3500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151476, 100, 1750151733)
    ArmyEconomy_Register(1750151477, 0, 1700, 300, 2200, 3, 0)
    ArmyEconomy_Register(1750151478, 0, 1250, 300, 1750, 3, 0)
    ArmyEconomy_Register(1750151479, 0, 1250, 300, 1750, 3, 0)
    ArmyEconomy_Register(1750151480, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1750151481, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1750151728, 0, 1000, 0, 2500, 3, 0)
    ArmyEconomy_Register(1750151729, 50, 500, 50, 2000, 3, 0)
    ArmyEconomy_Register(1750151730, 0, 2000, 300, 4500, 3, 0)
    ArmyEconomy_Register(1750151731, 0, 3000, 0, 5500, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151731, 100, 1750151734)
    ArmyEconomy_Register(1750151732, 0, 1000, 0, 4000, 3, 1)
    SaveInteger(ArmyEconomy_Types, 1750151732, 100, 1750151735)
    ArmyEconomy_Register(1750151733, 0, 6000, 0, 9500, 3, 0)
end

function ArmyEconomy_LoadTypesP63_1()
    ArmyEconomy_Register(1750151734, 0, 4500, 0, 10000, 3, 0)
    ArmyEconomy_Register(1750151735, 0, 2000, 0, 6000, 3, 0)
end

function ArmyEconomy_LoadTypes()
    ExecuteFunc("ArmyEconomy_LoadTypes00")
    ExecuteFunc("ArmyEconomy_LoadTypes01")
    ExecuteFunc("ArmyEconomy_LoadTypes02")
    ExecuteFunc("ArmyEconomy_LoadTypes03")
    ExecuteFunc("ArmyEconomy_LoadTypes04")
    ExecuteFunc("ArmyEconomy_LoadTypes05")
    ExecuteFunc("ArmyEconomy_LoadTypes06")
    ExecuteFunc("ArmyEconomy_LoadTypes07")
    ExecuteFunc("ArmyEconomy_LoadTypes08")
    ArmyEconomy_Register(1749893424, 150, 0, 150, 0, 3, 2)
    SaveInteger(ArmyEconomy_Types, 1749893424, 100, 1749893430)
    SaveInteger(ArmyEconomy_Types, 1749893424, 101, 1749893426)
    ArmyEconomy_Register(1749893425, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1749893426, 50, 0, 200, 0, 3, 7)
    SaveInteger(ArmyEconomy_Types, 1749893426, 100, 1749893427)
    SaveInteger(ArmyEconomy_Types, 1749893426, 101, 1749893432)
    SaveInteger(ArmyEconomy_Types, 1749893426, 102, 1749893429)
    SaveInteger(ArmyEconomy_Types, 1749893426, 103, 1749893425)
    SaveInteger(ArmyEconomy_Types, 1749893426, 104, 1749893428)
    SaveInteger(ArmyEconomy_Types, 1749893426, 105, 1747995467)
    SaveInteger(ArmyEconomy_Types, 1749893426, 106, 1749893431)
    ArmyEconomy_Register(1749893427, 200, 0, 400, 0, 3, 0)
    ArmyEconomy_Register(1749893428, 100, 0, 300, 0, 3, 0)
    ArmyEconomy_Register(1749893429, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1749893430, 100, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1749893431, 0, 800, 200, 800, 3, 0)
    ArmyEconomy_Register(1749893432, 50, 0, 250, 0, 3, 0)
    ArmyEconomy_Register(1749233714, 0, 3000, 0, 3000, 1, 0)
    SaveInteger(ArmyEconomy_Types, 1747990359, 6, 2)
    SaveInteger(ArmyEconomy_Types, 1747990359, 101, 1749828174)
    SaveInteger(ArmyEconomy_Types, 1747990359, 100, 1749233714)
ArmyEconomy_Register(1749435463, 0, 0, 0, 0, 1, 0)
SaveInteger(ArmyEconomy_Types, 1747989848, 6, 2)
SaveInteger(ArmyEconomy_Types, 1747989848, 101, 1749435463)
ArmyEconomy_Register(1749438512, 0, 900, 300, 900, 3, 0)
ArmyEconomy_Register(1749437488, 0, 500, 0, 1500, 3, 0)
ArmyEconomy_Register(1749434672, 0, 4500, 0, 6000, 3, 1)
ArmyEconomy_Register(1749439280, 0, 4000, 0, 10000, 3, 0)
ArmyEconomy_Register(1749435952, 0, 12000, 0, 12000, 3, 0)
ArmyEconomy_Register(1749437744, 0, 6000, 0, 6000, 3, 0)
SaveInteger(ArmyEconomy_Types, 1749434672, 100, 1749439280)
SaveInteger(ArmyEconomy_Types, 1747994712, 6, 3)
SaveInteger(ArmyEconomy_Types, 1747994712, 102, 1749438512)
SaveInteger(ArmyEconomy_Types, 1747994945, 6, 2)
SaveInteger(ArmyEconomy_Types, 1747994945, 101, 1749437488)
SaveInteger(ArmyEconomy_Types, 1747994935, 6, 4)
SaveInteger(ArmyEconomy_Types, 1747994935, 103, 1749434672)
    ExecuteFunc("ArmyEconomy_LoadTypesP63_0")
    ExecuteFunc("ArmyEconomy_LoadTypesP63_1")
ExecuteFunc("Italy75_Economy0")
ExecuteFunc("Vehicles78_Economy0")
ExecuteFunc("Tanks79_Economy0")
ExecuteFunc("Artillery81_Economy0")
ExecuteFunc("Forces82_Economy0")
ExecuteFunc("Zhukov_Economy")
ExecuteFunc("CT102_Economy")
ExecuteFunc("UK103_Economy")
ExecuteFunc("PL104_Economy")
ExecuteFunc("KMT106_Economy")
end

function ArmyEconomy_Init()
    local g = CreateGroup()
    local u = nil
    local pid = 0
    local t = 0
    if (ArmyEconomy_Types ~= nil) then
        DestroyGroup(g)
        g = nil
        do return end
    end
    ArmyEconomy_Types = InitHashtable()
    ArmyEconomy_Ledger = InitHashtable()
    ArmyEconomy_LoadTypes()
    US95_RegisterEconomy()
    --  Preplaced headquarters/builders were free; they do not contain a paid
    --  editor-default cost. Newly purchased instances are recorded by events.
    while true do
        if (pid >= 8) then break end
        GroupEnumUnitsOfPlayer(g, Player(pid), nil)
        while true do
            u = FirstOfGroup(g)
            if (u == nil) then break end
            GroupRemoveUnit(g, u)
            t = GetUnitTypeId(u)
            if ArmyEconomy_IsTracked(t) then
                ArmyEconomy_Set(u, 0, 0)
            end
        end
        pid = J88_int(pid + 1)
    end
    DestroyGroup(g)
    ArmyEconomy_Events = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_CONSTRUCT_START)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_UPGRADE_START)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_ISSUED_ORDER)
    TriggerRegisterAnyUnitEventBJ(ArmyEconomy_Events, EVENT_PLAYER_UNIT_DEATH)
    TriggerAddAction(ArmyEconomy_Events, ArmyEconomy_OnEvent)
    g = nil
    u = nil
end

function ArmyPoints_CommanderValue(tid)
    if (ArmyEconomy_IsTracked(tid) and (LoadInteger(ArmyEconomy_Types, tid, 5) == 1)) then
        do return J88_int(LoadInteger(ArmyEconomy_Types, tid, 3) + J88_div(LoadInteger(ArmyEconomy_Types, tid, 4), 10)) end
    end
    do return 0 end
end

function ArmyPoints_UnitValue(u)
    if ((((u == nil) or (GetWidgetLife(u) <= 0.4050000011920929)) or (GetPlayerId(GetOwningPlayer(u)) >= 8)) or (not ArmyEconomy_IsTracked(GetUnitTypeId(u)))) then
        do return 0 end
    end
    if (GetUnitTypeId(u) == 1749242932) then
        do return 150 end
    end
    if (GetUnitTypeId(u) == Mac70_CARRIER) then
        --  MacArthur is free; each paid level adds a tenth of its Blood Point price.
        do return J88_div(Mac70_Spent(GetPlayerId(GetOwningPlayer(u))), 10) end
    end
    do return J88_int(ArmyEconomy_Gold(u) + J88_div(ArmyEconomy_Wood(u), 10)) end
end
