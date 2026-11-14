function PF73_Config()
    PF73_RankName[0] = "Private"
    PF73_RankThreshold[0] = 0
    PF73_RankName[1] = "Private First Class"
    PF73_RankThreshold[1] = 50
    PF73_RankName[2] = "Corporal"
    PF73_RankThreshold[2] = 150
    PF73_RankName[3] = "Sergeant"
    PF73_RankThreshold[3] = 300
    PF73_RankName[4] = "Staff Sergeant"
    PF73_RankThreshold[4] = 500
    PF73_RankName[5] = "Sergeant First Class"
    PF73_RankThreshold[5] = 800
    PF73_RankName[6] = "Master Sergeant"
    PF73_RankThreshold[6] = 1200
    PF73_RankName[7] = "Sergeant Major"
    PF73_RankThreshold[7] = 1800
    PF73_RankName[8] = "Second Lieutenant"
    PF73_RankThreshold[8] = 2500
    PF73_RankName[9] = "First Lieutenant"
    PF73_RankThreshold[9] = 3400
    PF73_RankName[10] = "Captain"
    PF73_RankThreshold[10] = 4500
    PF73_RankName[11] = "Major"
    PF73_RankThreshold[11] = 6000
    PF73_RankName[12] = "Lieutenant Colonel"
    PF73_RankThreshold[12] = 8000
    PF73_RankName[13] = "Colonel"
    PF73_RankThreshold[13] = 10500
    PF73_RankName[14] = "Brigadier General"
    PF73_RankThreshold[14] = 13500
    PF73_RankName[15] = "Major General"
    PF73_RankThreshold[15] = 17000
    PF73_RankName[16] = "Lieutenant General"
    PF73_RankThreshold[16] = 21000
    PF73_RankName[17] = "General"
    PF73_RankThreshold[17] = 26000
    PF73_FactionName[0] = "All Nations"
    PF73_FactionName[1] = "United Kingdom"
    PF73_FactionName[2] = "Free France"
    PF73_FactionName[3] = "Vichy France"
    PF73_FactionName[4] = "Germany"
    PF73_FactionName[5] = "Soviet Union"
    PF73_FactionName[6] = "United States"
    PF73_FactionName[7] = "Japan"
    PF73_FactionName[8] = "Poland"
    PF73_FactionName[9] = "Nationalist China"
    PF73_FactionName[10] = "Communist China"
    PF73_FactionName[11] = "Italy"
    PF73_Ability[0] = 1095774256
    PF73_Ability[1] = 1095774257
    PF73_Ability[2] = 1095774258
    PF73_Ability[3] = 1095774259
    PF73_Ability[4] = 1095774260
    PF73_Ability[5] = 1095774261
    PF73_Ability[6] = 1095774262
    PF73_Ability[7] = 1095774263
    PF73_Ability[8] = 1095774264
    PF73_Ability[9] = 1095774265
    PF73_Ability[10] = 1095774273
    PF73_Ability[11] = 1095774274
    PF73_Ability[12] = 1095774275
    PF73_Ability[13] = 1095774276
    PF73_Ability[14] = 1095774277
    PF73_Ability[15] = 1095774278
    PF73_Ability[16] = 1095774512
    PF73_Ability[17] = 1095774513
    PF73_Ability[18] = 1095774514
    PF73_Ability[19] = 1095774515
    PF73_Ability[20] = 1095774516
    PF73_Ability[21] = 1095774517
    PF73_Ability[22] = 1095774518
    PF73_Ability[23] = 1095774519
end

function DG73_Log(module, errorCode, detail)
    local line = J88_concat(J88_concat(J88_concat(J88_concat(module, "/"), errorCode), ": "), detail)
    if (line == DG73_Last) then
        do return end
    end
    DG73_Last = line
    DG73_LogLines[ModuloInteger(DG73_Count, 48)] = J88_concat(J88_concat(J88_concat("t=", I2S(PF73_Time)), " "), SubString(line, 0, 160))
    DG73_Count = J88_int(DG73_Count + 1)
    DG73_Dirty = true
end

function PF73_Fault(errorCode, detail)
    DG73_Log("Profile", errorCode, detail)
end

function PF73_Token()
    local start = PF73_ParsePos
    while true do
        if ((PF73_ParsePos >= StringLength(PF73_ParseText)) or (SubString(PF73_ParseText, PF73_ParsePos, J88_int(PF73_ParsePos + 1)) == "|")) then break end
        PF73_ParsePos = J88_int(PF73_ParsePos + 1)
    end
    if (PF73_ParsePos >= StringLength(PF73_ParseText)) then
        PF73_ParseBad = true
    end
    PF73_ParsePos = J88_int(PF73_ParsePos + 1)
    do return SubString(PF73_ParseText, start, J88_int(PF73_ParsePos - 1)) end
end

function PF73_Number(maximum)
    local token = PF73_Token()
    local value = S2I(token)
    if ((((StringLength(token) > 7) or (token ~= I2S(value))) or (value < 0)) or (value > maximum)) then
        PF73_ParseBad = true
    end
    do return value end
end

function PF73_Parse(data, identity)
    local n = 0
    local sequence = 0
    local i = 0
    local j = 0
    local sum = 0
    local check = nil
    if ((StringLength(data) < 30) or (StringLength(data) > 1536)) then
        do return J88_int(-1) end
    end
    PF73_ParseText = data
    PF73_ParsePos = 0
    PF73_ParseBad = false
    if (PF73_Token() ~= "WW2P") then
        do return J88_int(-1) end
    end
    if (PF73_Token() ~= "1") then
        do return J88_int(-2) end
    end
    if (PF73_Token() ~= "1") then
        do return J88_int(-2) end
    end
    n = PF73_Number(128)
    if ((PF73_ParseBad or (n == 0)) or (SubString(data, PF73_ParsePos, J88_int(PF73_ParsePos + n)) ~= identity)) then
        do return J88_int(-1) end
    end
    PF73_ParsePos = J88_int(PF73_ParsePos + n)
    if (SubString(data, PF73_ParsePos, J88_int(PF73_ParsePos + 1)) ~= "|") then
        do return J88_int(-1) end
    end
    PF73_ParsePos = J88_int(PF73_ParsePos + 1)
    sequence = PF73_Number(1000001)
    while true do
        if (i == 60) then break end
        PF73_Temp[i] = PF73_Number(1000000)
        i = J88_int(i + 1)
    end
    if PF73_ParseBad then
        do return J88_int(-1) end
    end
    check = SubString(data, PF73_ParsePos, StringLength(data))
    if (check ~= I2S(StringHash(SubString(data, 0, PF73_ParsePos)))) then
        do return J88_int(-1) end
    end
    i = 0
    while true do
        if (i == 12) then break end
        if (PF73_Temp[J88_int(i * 5)] ~= J88_int(J88_int(J88_int(PF73_Temp[J88_int(J88_int(i * 5) + 1)] + PF73_Temp[J88_int(J88_int(i * 5) + 2)]) + PF73_Temp[J88_int(J88_int(i * 5) + 3)]) + PF73_Temp[J88_int(J88_int(i * 5) + 4)])) then
            do return J88_int(-1) end
        end
        i = J88_int(i + 1)
    end
    i = 0
    while true do
        if (i == 5) then break end
        sum = 0
        j = 1
        while true do
            if (j == 12) then break end
            sum = J88_int(sum + PF73_Temp[J88_int(J88_int(j * 5) + i)])
            j = J88_int(j + 1)
        end
        if (sum ~= PF73_Temp[i]) then
            do return J88_int(-1) end
        end
        i = J88_int(i + 1)
    end
    if (sequence ~= J88_int(PF73_Temp[0] + 1)) then
        do return J88_int(-1) end
    end
    do return sequence end
end

function PF73_Encode(pid)
    local i = 0
    local data = J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat("WW2P|1|1|", I2S(StringLength(PF73_Identity[pid]))), "|"), PF73_Identity[pid]), "|"), I2S(PF73_Sequence[pid])), "|")
    while true do
        if (i == 60) then break end
        data = J88_concat(J88_concat(data, I2S(PF73_Stats[J88_int(J88_int(pid * 60) + i)])), "|")
        i = J88_int(i + 1)
    end
    do return J88_concat(data, I2S(StringHash(data))) end
end

function PF73_Honor(pid)
    do return J88_int(J88_int(J88_int(J88_int(PF73_Stats[J88_int(J88_int(pid * 60) + 1)] * 100) + J88_int(PF73_Stats[J88_int(J88_int(pid * 60) + 2)] * 50)) + J88_int(PF73_Stats[J88_int(J88_int(pid * 60) + 3)] * 25)) + J88_int(PF73_Stats[J88_int(J88_int(pid * 60) + 4)] * 10)) end
end

function PF73_Rank(pid)
    local rank = 0
    local honor = 0
    if (((((pid < 0) or (pid >= 8)) or (not PF73_Human[pid])) or PF73_Left[pid]) or (PF73_State[pid] ~= 1)) then
        do return 0 end
    end
    honor = PF73_Honor(pid)
    while true do
        if ((rank == 17) or (honor < PF73_RankThreshold[J88_int(rank + 1)])) then break end
        rank = J88_int(rank + 1)
    end
    do return rank end
end

function PF73_Icon(rank)
    do return J88_concat(J88_concat("UI\\WW2Ranks\\Rank", I2S(rank)), ".blp") end
end

function PF73_Escape(input)
    local i = 0
    local out = ""
    local c = nil
    while true do
        if (i == StringLength(input)) then break end
        c = SubString(input, i, J88_int(i + 1))
        if (c == "\\") then
            out = J88_concat(out, "\\\\")
        elseif (c == "\"") then
            out = J88_concat(out, "\\\"")
        elseif (c == "\n") then
            out = J88_concat(out, "\\n")
        elseif (c == "\r") then
            out = J88_concat(out, "\\r")
        else
            out = J88_concat(out, c)
        end
        i = J88_int(i + 1)
    end
    do return out end
end

function PF73_Write(path, data)
    local i = 0
    local chunk = nil
    if (((PF73_LocalReplay or PF73_LocalDisabled) or (not PF73_LocalWritable)) or (StringLength(data) > 1536)) then
        do return end
    end
    PreloadGenClear()
    PreloadGenStart()
    while true do
        if (i == 24) then break end
        chunk = PF73_Escape(SubString(data, J88_int(i * 64), J88_int(J88_int(i + 1) * 64)))
        Preload(J88_concat(J88_concat(J88_concat(J88_concat("\" )\ncall BlzSetAbilityTooltip(", I2S(PF73_Ability[i])), ",\"-"), chunk), "\",0)\n//"))
        i = J88_int(i + 1)
    end
    Preload("\" )\nendfunction\nfunction a takes nothing returns nothing\n//")
    PreloadGenEnd(path)
end

function DG73_Export()
    local i = IMaxBJ(0, J88_int(DG73_Count - 48))
    local pid = GetPlayerId(GetLocalPlayer())
    if ((((PF73_LocalReplay or PF73_LocalDisabled) or (not PF73_LocalWritable)) or (pid < 0)) or (pid >= 8)) then
        do return end
    end
    PreloadGenClear()
    PreloadGenStart()
    Preload("WW2 BT 1.0.3 - diagnostic report; no authentication secrets")
    Preload(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat("Player slot: ", I2S(pid)), "; profile state: "), I2S(PF73_State[pid])), "; sequence: "), I2S(PF73_Sequence[pid])), "; faction: "), I2S(PF73_Faction[pid])))
    Preload(J88_concat(J88_concat(J88_concat("Elapsed seconds: ", I2S(PF73_Time)), "; tournament stage: "), I2S(PF73_Stage)))
    if PF73_Multiplayer then
        Preload("Mode probe: multiplayer")
    else
        Preload("Mode probe: single-player")
    end
    while true do
        if (i == DG73_Count) then break end
        Preload(PF73_Escape(DG73_LogLines[ModuloInteger(i, 48)]))
        i = J88_int(i + 1)
    end
    PreloadGenEnd(J88_concat(J88_concat(J88_concat(PF73_LocalPath, "Diagnostics_"), PF73_ProbeToken), ".txt"))
    DG73_Dirty = false
    DG73_LastExport = PF73_Time
end

function DG73_OnChat()
    if (GetTriggerPlayer() == GetLocalPlayer()) then
        if (GetEventPlayerChatString() == "-profileoff") then
            DG73_Log("Manual", "PROFILE_OFF", "Local storage disabled for this match")
            PF73_LocalDisabled = true
            PF73_LocalMessage = "Service record storage is disabled for this match."
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 8.0, "Service record storage disabled. The match continues normally.")
            do return end
        end
        DG73_Log("Manual", "REPORT", "Report requested by player")
        if (PF73_LocalDisabled or (not PF73_LocalWritable)) then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 8.0, "Diagnostic state retained in memory. Local file access is unavailable.")
        else
            DG73_LastExport = J88_int(-30)
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 8.0, "Diagnostic report queued for export to your local Warcraft III folder.")
        end
    end
end

function PF73_Read(path)
    local i = 0
    local out = ""
    local part = nil
    local valid = true
    DG73_Log("Storage", "READ_BEGIN", path)
    DG73_Export()
    while true do
        if (i == 24) then break end
        PF73_Original[i] = BlzGetAbilityTooltip(PF73_Ability[i], 0)
        BlzSetAbilityTooltip(PF73_Ability[i], "PF73_UNREAD", 0)
        i = J88_int(i + 1)
    end
    Preloader(path)
    i = 0
    while true do
        if (i == 24) then break end
        part = BlzGetAbilityTooltip(PF73_Ability[i], 0)
        BlzSetAbilityTooltip(PF73_Ability[i], PF73_Original[i], 0)
        if ((SubString(part, 0, 1) ~= "-") or (StringLength(part) > 65)) then
            valid = false
        else
            out = J88_concat(out, SubString(part, 1, StringLength(part)))
        end
        i = J88_int(i + 1)
    end
    DG73_Log("Storage", "READ_END", path)
    if (not valid) then
        --  Distinguish a partial readable file from a completely absent/unreadable one.
        if (out ~= "") then
            do return "CORRUPT" end
        end
        do return "" end
    end
    do return out end
end

function PF73_ChooseBackup(a, b, identity)
    local sa = PF73_Parse(a, identity)
    local sb = PF73_Parse(b, identity)
    if ((sa == J88_int(-2)) or (sb == J88_int(-2))) then
        do return J88_int(-2) end
    end
    if ((((sa >= 0) and (sb >= 0)) and (sa == sb)) and (a ~= b)) then
        do return J88_int(-1) end
    end
    if ((sa >= 0) and (sa >= sb)) then
        do return 0 end
    end
    if (sb >= 0) then
        do return 1 end
    end
    if ((a == "") and (b == "")) then
        do return 2 end
    end
    do return J88_int(-1) end
end

function PF73_LocalLoad(pid)
    local guard = PF73_Read(J88_concat(PF73_LocalPath, "Format.pld"))
    local a = nil
    local b = nil
    local legacyPath = nil
    local slot = 0
    local legacy = false
    if ((guard ~= "") and (guard ~= "WW2P_FORMAT_1")) then
        PF73_Transport = "B"
        PF73_LocalMessage = "This record requires a newer map. Your existing files have been kept."
        PF73_Fault("FORMAT_GUARD", "Record format is unsupported; data files were not opened")
        do return end
    end
    a = PF73_Read(J88_concat(PF73_LocalPath, "Profile_v1_A.pld"))
    b = PF73_Read(J88_concat(PF73_LocalPath, "Profile_v1_B.pld"))
    slot = PF73_ChooseBackup(a, b, PF73_Identity[pid])
    if ((StringLength(PF73_Identity[pid]) == 0) or (StringLength(PF73_Identity[pid]) > 128)) then
        slot = J88_int(-1)
    end
    --  First import only: never replace an existing trial record with older data.
    --  PF73_Read cannot distinguish a missing file from a completely unreadable file.
    if ((slot == 2) and (guard == "")) then
        legacyPath = J88_concat(J88_concat(J88_concat(J88_concat("WW2BloodTournament\\", I2S(StringHash(PF73_Identity[pid]))), "_"), I2S(StringLength(PF73_Identity[pid]))), "\\")
        guard = PF73_Read(J88_concat(legacyPath, "Format.pld"))
        if ((guard ~= "") and (guard ~= "WW2P_FORMAT_1")) then
            PF73_Transport = "B"
            PF73_LocalMessage = "Your earlier service record could not be read. Existing files have been kept."
            PF73_Fault("LEGACY_FORMAT_GUARD", "Earlier record format is unsupported; data files were not opened")
            do return end
        end
        a = PF73_Read(J88_concat(legacyPath, "Profile_v1_A.pld"))
        b = PF73_Read(J88_concat(legacyPath, "Profile_v1_B.pld"))
        slot = PF73_ChooseBackup(a, b, PF73_Identity[pid])
        legacy = true
    end
    if ((slot == 0) or (slot == 1)) then
        PF73_LocalSlot = slot
        if (slot == 0) then
            PF73_Transport = J88_concat("L", a)
        else
            PF73_Transport = J88_concat("L", b)
        end
        if legacy then
            PF73_LocalMessage = "Earlier service record loaded. Trial results will be saved separately."
            DG73_Log("Storage", "LEGACY_IMPORTED", "Validated earlier record loaded; earlier files remain read-only")
        else
            PF73_LocalMessage = "Service record loaded."
        end
    elseif ((slot == 2) and (guard == "")) then
        PF73_Transport = "M"
        PF73_LocalMessage = "Preparing your service record..."
    else
        PF73_Transport = "B"
        PF73_LocalMessage = "Service record could not be loaded. Your existing files have been kept."
        PF73_Fault("LOAD_REJECTED", "No compatible validated backup; files preserved")
    end
    PF73_TransportIndex = 0
    PF73_TransportTries = 0
end

function PF73_Apply(pid, data)
    local i = 0
    local seq = PF73_Parse(data, PF73_Identity[pid])
    if (seq < 0) then
        PF73_State[pid] = 3
        PF73_Fault("SYNC_INVALID", J88_concat("Rejected profile for slot ", I2S(pid)))
        do return end
    end
    while true do
        if (i == 60) then break end
        PF73_Stats[J88_int(J88_int(pid * 60) + i)] = PF73_Temp[i]
        i = J88_int(i + 1)
    end
    PF73_Sequence[pid] = seq
    PF73_State[pid] = 1
end

function PF73_OnSync()
    local pid = GetPlayerId(GetTriggerPlayer())
    local data = BlzGetTriggerSyncData()
    local index = 0
    local count = 0
    local i = 0
    local joined = ""
    local part = nil
    if (((((pid < 0) or (pid >= 8)) or (not PF73_Human[pid])) or PF73_Left[pid]) or PF73_Settled[pid]) then
        do return end
    end
    --  The create acknowledgement is accepted only after the missing-record state.
    if (BlzGetTriggerSyncPrefix() == "WW2P73Create") then
        if ((data == "1") and (PF73_State[pid] == 2)) then
            PF73_Sequence[pid] = 1
            PF73_State[pid] = 1
        end
        do return end
    end
    if ((((PF73_State[pid] ~= 0) or (PF73_Time > 60)) or (StringLength(data) < 5)) or (StringLength(data) > 204)) then
        do return end
    end
    --  Header is two single ASCII digits. Maximum eight 196-byte chunks.
    index = S2I(SubString(data, 0, 1))
    count = S2I(SubString(data, 2, 3))
    if (((((((SubString(data, 0, 1) ~= I2S(index)) or (SubString(data, 1, 2) ~= "|")) or (SubString(data, 2, 3) ~= I2S(count))) or (SubString(data, 3, 4) ~= "|")) or (count < 1)) or (count > 8)) or (index >= count)) then
        do return end
    end
    if ((PF73_Parts[pid] ~= 0) and (PF73_Parts[pid] ~= count)) then
        PF73_State[pid] = 3
        do return end
    end
    PF73_Parts[pid] = count
    part = SubString(data, 4, StringLength(data))
    if (((PF73_Chunks[J88_int(J88_int(pid * 8) + index)] ~= nil) and (PF73_Chunks[J88_int(J88_int(pid * 8) + index)] ~= "")) and (PF73_Chunks[J88_int(J88_int(pid * 8) + index)] ~= part)) then
        PF73_State[pid] = 3
        do return end
    end
    PF73_Chunks[J88_int(J88_int(pid * 8) + index)] = part
    while true do
        if (i == count) then break end
        part = PF73_Chunks[J88_int(J88_int(pid * 8) + i)]
        if ((part == nil) or (part == "")) then
            do return end
        end
        joined = J88_concat(joined, part)
        i = J88_int(i + 1)
    end
    if (joined == "M") then
        PF73_State[pid] = 2
    elseif (joined == "B") then
        PF73_State[pid] = 3
    elseif (SubString(joined, 0, 1) == "L") then
        PF73_Apply(pid, SubString(joined, 1, StringLength(joined)))
    else
        PF73_State[pid] = 3
    end
end

function PF73_SaveLocal(pid)
    if (((GetLocalPlayer() ~= Player(pid)) or PF73_LocalReplay) or PF73_LocalDisabled) then
        do return end
    end
    PF73_LocalPending = PF73_Encode(pid)
    --  Replace only the other slot. The last loaded valid slot remains untouched.
    PF73_LocalSlot = J88_int(1 - PF73_LocalSlot)
    if (PF73_LocalSlot == 0) then
        PF73_LocalTarget = J88_concat(PF73_LocalPath, "Profile_v1_A.pld")
    else
        PF73_LocalTarget = J88_concat(PF73_LocalPath, "Profile_v1_B.pld")
    end
    PF73_LocalAttempts = 0
    PF73_LocalVerify = 3
    PF73_LocalMessage = "Saving service record..."
end

function PF73_Record(pid, placement)
    local base = J88_int(pid * 60)
    local faction = 0
    if ((((pid < 0) or (pid >= 8)) or (placement < 1)) or (placement > 4)) then
        do return end
    end
    if ((((not PF73_Multiplayer) or (not PF73_Human[pid])) or (PF73_Left[pid] and (not PF73_Qualified[pid]))) or PF73_Settled[pid]) then
        do return end
    end
    PF73_Settled[pid] = true
    if ((PF73_State[pid] ~= 1) or (PF73_Stats[base] >= 1000000)) then
        PF73_Fault("RESULT_SKIPPED", J88_concat("No ready profile or counter limit for slot ", I2S(pid)))
        do return end
    end
    faction = PF73_Faction[pid]
    if ((faction < 1) or (faction > 11)) then
        PF73_Fault("FACTION_MISSING", J88_concat("No deployed faction for slot ", I2S(pid)))
        do return end
    end
    PF73_Stats[base] = J88_int(PF73_Stats[base] + 1)
    PF73_Stats[J88_int(base + placement)] = J88_int(PF73_Stats[J88_int(base + placement)] + 1)
    PF73_Stats[J88_int(base + J88_int(faction * 5))] = J88_int(PF73_Stats[J88_int(base + J88_int(faction * 5))] + 1)
    PF73_Stats[J88_int(J88_int(base + J88_int(faction * 5)) + placement)] = J88_int(PF73_Stats[J88_int(J88_int(base + J88_int(faction * 5)) + placement)] + 1)
    PF73_Sequence[pid] = J88_int(PF73_Sequence[pid] + 1)
    PF73_SaveLocal(pid)
end

function PF73_Drain()
    local pid = 0
    while true do
        if (pid == 8) then break end
        if (PF73_Queued[pid] ~= 0) then
            PF73_Record(pid, PF73_Queued[pid])
            PF73_Queued[pid] = 0
        end
        pid = J88_int(pid + 1)
    end
    --  Dispatch local I/O only after the game's result callback has yielded.
    ExecuteFunc("PF73_LocalPulse")
end

function PF73_Enqueue(pid, placement)
    if ((PF73_Human[pid] and (not PF73_Left[pid])) and (not PF73_Settled[pid])) then
        PF73_Qualified[pid] = true
        PF73_Queued[pid] = placement
    end
end

function PF73_Result(winner, loser)
    --  Game errorCode only enqueues integer results. No filesystem or parser calls here.
    if (((((winner < 0) or (winner >= 8)) or (loser < 0)) or (loser >= 8)) or (winner == loser)) then
        do return end
    end
    if (PF73_Stage == 1) then
        PF73_Enqueue(loser, 4)
    elseif (PF73_Stage == 2) then
        PF73_Enqueue(loser, 3)
    elseif (PF73_Stage == 3) then
        PF73_Enqueue(loser, 2)
        PF73_Enqueue(winner, 1)
    end
    TimerStart(PF73_ResultTimer, 0.0, false, PF73_Drain)
end

function PF73_OnLeave()
    PF73_Left[GetPlayerId(GetTriggerPlayer())] = true
end

function PF73_Snapshot(pid)
    local country = ScoreFaction_Country[pid]
    if ((PF73_Faction[pid] ~= 0) or (not Nation58_Done[pid])) then
        do return end
    end
    if (country == 1) then
        PF73_Faction[pid] = 1
    elseif (country == 2) then
        if (France_Route[pid] == 1) then
            PF73_Faction[pid] = 3
        elseif (France_Route[pid] == 2) then
            PF73_Faction[pid] = 2
        end
    elseif (country == 3) then
        PF73_Faction[pid] = 11
    elseif (country == 4) then
        PF73_Faction[pid] = 4
    elseif (country == 5) then
        PF73_Faction[pid] = 8
    elseif (country == 6) then
        PF73_Faction[pid] = 6
    elseif (country == 7) then
        PF73_Faction[pid] = 7
    elseif (country == 8) then
        if (China_Route[pid] == 1) then
            PF73_Faction[pid] = 9
        elseif (China_Route[pid] == 2) then
            PF73_Faction[pid] = 10
        end
    elseif (country == 9) then
        PF73_Faction[pid] = 5
    end
end

function PF73_Tick()
    local pid = 0
    PF73_Time = J88_int(PF73_Time + 1)
    while true do
        if (pid == 8) then break end
        PF73_Snapshot(pid)
        if (PF73_Queued[pid] ~= 0) then
            PF73_Record(pid, PF73_Queued[pid])
            PF73_Queued[pid] = 0
        end
        if ((PF73_Time == 61) and (PF73_State[pid] == 0)) then
            PF73_State[pid] = 3
            if PF73_Human[pid] then
                PF73_Fault("SYNC_TIMEOUT", J88_concat("Profile sync timed out for slot ", I2S(pid)))
            end
        end
        pid = J88_int(pid + 1)
    end
end

function PF73_Empty(pid)
    local i = 0
    local data = J88_concat(J88_concat(J88_concat(J88_concat("WW2P|1|1|", I2S(StringLength(PF73_Identity[pid]))), "|"), PF73_Identity[pid]), "|1|")
    while true do
        if (i == 60) then break end
        data = J88_concat(data, "0|")
        i = J88_int(i + 1)
    end
    do return J88_concat(data, I2S(StringHash(data))) end
end

function PF73_LocalWork()
    local localId = GetPlayerId(GetLocalPlayer())
    local count = 0
    local packet = nil
    if (PF73_Time == 1) then
        PF73_LocalWritable = true
        PF73_Write(J88_concat(PF73_LocalPath, "IOCheck.pld"), PF73_ProbeToken)
    elseif (PF73_Time == 3) then
        PF73_LocalWritable = (PF73_Read(J88_concat(PF73_LocalPath, "IOCheck.pld")) == PF73_ProbeToken)
        PF73_LocalLoad(localId)
        if (not PF73_LocalWritable) then
            PF73_LocalMessage = "Service record is read-only. Local storage is unavailable."
            PF73_Fault("IO_PROBE_FAILED", "Write/read probe did not return this session token")
        end
    end
    if (((PF73_State[localId] == 0) and (PF73_Transport ~= "")) and (PF73_Time <= 60)) then
        count = J88_div(J88_int(StringLength(PF73_Transport) + 195), 196)
        packet = J88_concat(J88_concat(J88_concat(J88_concat(I2S(PF73_TransportIndex), "|"), I2S(count)), "|"), SubString(PF73_Transport, J88_int(PF73_TransportIndex * 196), J88_int(J88_int(PF73_TransportIndex + 1) * 196)))
        if BlzSendSyncData("WW2P73Load", packet) then
            PF73_TransportIndex = ModuloInteger(J88_int(PF73_TransportIndex + 1), count)
        end
    end
    if (PF73_LocalCreating and (PF73_State[localId] == 1)) then
        PF73_LocalCreating = false
    end
    if (((((PF73_State[localId] == 2) and (not PF73_LocalCreating)) and PF73_LocalWritable) and PF73_Multiplayer) and (not PF73_Settled[localId])) then
        PF73_LocalCreating = true
        PF73_LocalPending = PF73_Empty(localId)
        PF73_LocalTarget = J88_concat(PF73_LocalPath, "Profile_v1_A.pld")
        PF73_LocalSlot = 0
        PF73_LocalAttempts = 0
        PF73_LocalVerify = 3
    end
    if (PF73_LocalVerify > 0) then
        if (PF73_LocalVerify == 3) then
            --  Preloader caches each path. Validate a never-read candidate, not a loaded A/B slot.
            PF73_LocalCandidate = J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(J88_concat(PF73_LocalPath, "Recovery_"), PF73_ProbeToken), "_"), I2S(PF73_Sequence[localId])), "_"), I2S(PF73_LocalAttempts)), ".pld")
            PF73_Write(PF73_LocalCandidate, PF73_LocalPending)
        end
        PF73_LocalVerify = J88_int(PF73_LocalVerify - 1)
        if (PF73_LocalVerify == 0) then
            if (PF73_Read(PF73_LocalCandidate) == PF73_LocalPending) then
                --  Retain the verified recovery snapshot; the native commit itself has no success return.
                PF73_Write(PF73_LocalTarget, PF73_LocalPending)
                PF73_LocalPending = ""
                if PF73_LocalCreating then
                    PF73_Write(J88_concat(PF73_LocalPath, "Format.pld"), "WW2P_FORMAT_1")
                    BlzSendSyncData("WW2P73Create", "1")
                    PF73_LocalMessage = "Service record created."
                else
                    PF73_LocalMessage = "Service record saved."
                end
            else
                PF73_LocalAttempts = J88_int(PF73_LocalAttempts + 1)
                PF73_Fault("SAVE_UNCONFIRMED", J88_concat(J88_concat("Attempt ", I2S(PF73_LocalAttempts)), "; previous backup preserved"))
                if (PF73_LocalAttempts < 3) then
                    PF73_LocalVerify = J88_int(3 + J88_int(PF73_LocalAttempts * 2))
                    PF73_LocalMessage = "Save delayed. Retrying automatically..."
                else
                    PF73_LocalMessage = "Record could not be saved. Your previous record has been kept."
                end
            end
        end
    end
    if ((PF73_LocalCreating and (PF73_LocalPending == "")) and (PF73_State[localId] == 2)) then
        BlzSendSyncData("WW2P73Create", "1")
    end
    if (DG73_Dirty and (J88_int(PF73_Time - DG73_LastExport) >= 15)) then
        DG73_Export()
    end
    PF73_LocalBusy = false
end

function PF73_LocalPulse()
    local pid = GetPlayerId(GetLocalPlayer())
    if ((((PF73_LocalReplay or PF73_LocalDisabled) or (pid < 0)) or (pid >= 8)) or (not PF73_Human[pid])) then
        do return end
    end
    if PF73_LocalBusy then
        if (J88_int(PF73_Time - PF73_LocalBusyAt) >= 8) then
            PF73_LocalDisabled = true
            PF73_LocalMessage = "Service record unavailable this match. You may continue playing."
            PF73_Fault("WORKER_TIMEOUT", "Storage worker stopped; further file access disabled")
        end
        do return end
    end
    PF73_LocalBusy = true
    PF73_LocalBusyAt = PF73_Time
    --  A plain protected call: no engine thread is started on only some clients. An error
    --  leaves the worker busy, and the timeout above then disables local storage.
    pcall(PF73_LocalWork)
end

function PF73_Init()
    local sync = CreateTrigger()
    local leave = CreateTrigger()
    local debugTrigger = CreateTrigger()
    local pid = 0
    local first = J88_int(-1)
    local probe = nil
    local selected = false
    PF73_ResultTimer = CreateTimer()
    PF73_Config()
    PF73_Multiplayer = (not ReloadGameCachesFromDisk())
    PF73_ProbeToken = J88_concat(J88_concat(I2S(GetRandomInt(1, 1000000000)), "_"), I2S(GetRandomInt(1, 1000000000)))
    while true do
        if (pid == 8) then break end
        PF73_Identity[pid] = GetPlayerName(Player(pid))
        PF73_Human[pid] = ((GetPlayerController(Player(pid)) == MAP_CONTROL_USER) and (GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING))
        if (PF73_Human[pid] and (first == J88_int(-1))) then
            first = pid
        end
        BlzTriggerRegisterPlayerSyncEvent(sync, Player(pid), "WW2P73Load", false)
        BlzTriggerRegisterPlayerSyncEvent(sync, Player(pid), "WW2P73Create", false)
        TriggerRegisterPlayerEvent(leave, Player(pid), EVENT_PLAYER_LEAVE)
        TriggerRegisterPlayerChatEvent(debugTrigger, Player(pid), "-debug", true)
        TriggerRegisterPlayerChatEvent(debugTrigger, Player(pid), "-profileoff", true)
        pid = J88_int(pid + 1)
    end
    --  GameStatus technique: selectable stock dummy, before gameplay triggers exist.
    --  Selection is deliberately tested immediately (network selection is queued).
    if (first >= 0) then
        probe = CreateUnit(Player(first), 1751543663, 0.0, 0.0, 0.0)
        SelectUnit(probe, true)
        selected = IsUnitSelected(probe, Player(first))
        RemoveUnit(probe)
        probe = nil
        PF73_LocalReplay = (PF73_Multiplayer and selected)
    end
    pid = GetPlayerId(GetLocalPlayer())
    if ((pid >= 0) and (pid < 8)) then
        PF73_LocalPath = J88_concat(J88_concat(J88_concat(J88_concat("WW2BT_LuaTrial\\", I2S(StringHash(PF73_Identity[pid]))), "_"), I2S(StringLength(PF73_Identity[pid]))), "\\")
    end
    TriggerAddAction(sync, PF73_OnSync)
    TriggerAddAction(leave, PF73_OnLeave)
    TriggerAddAction(debugTrigger, DG73_OnChat)
    TimerStart(CreateTimer(), 1.0, true, PF73_Tick)
    TimerStart(CreateTimer(), 1.0, true, PF73_LocalPulse)
    sync = nil
    leave = nil
    debugTrigger = nil
end

function PF73_Frame(key)
    do return LoadFrameHandle(PF73_Frames, 0, key) end
end

function PF73_IsOpen()
    do return (PF73_Open and BlzFrameIsVisible(PF73_Frame(1))) end
end

function PF73_Close()
    PF73_Open = false
    BlzFrameSetVisible(PF73_Frame(1), false)
end

function PF73_Render()
    local pid = GetPlayerId(GetLocalPlayer())
    local rank = 0
    local i = 0
    local column = 0
    local value = 0
    local label = nil
    local message = PF73_LocalMessage
    local x = 0.0949999988079071
    local y = 0.17499999701976776
    local width = 0.6100000143051147
    local height = 0.36500000953674316
    local top = 0.0
    local rowHeight = 0.0
    local font = 0.00800000037997961
    local show = false
    if ((pid >= 0) and (pid < 8)) then
        show = ((PF73_Human[pid] and Nation58_Done[pid]) and (not DifficultyChoice_Pending))
    end
    UI5_Box(PF73_Frame(0), UI70_Left(), 0.5370000004768372, 0.11500000208616257, 0.024000000208616257)
    BlzFrameSetVisible(PF73_Frame(0), show)
    BlzFrameSetVisible(PF73_Frame(1), (show and PF73_Open))
    if ((not show) or (not PF73_Open)) then
        do return end
    end
    if PF73_Large then
        x = 0.02500000037252903
        y = 0.14000000059604645
        width = 0.75
        height = 0.4000000059604645
        font = 0.008999999612569809
    end
    top = J88_real(y + height)
    rowHeight = J88_real(J88_real(height - 0.16099999845027924) / 13.0)
    rank = PF73_Rank(pid)
    UI5_Box(PF73_Frame(1), x, y, width, height)
    UI5_Box(PF73_Frame(2), J88_real(x + 0.01600000075995922), J88_real(top - 0.03099999949336052), J88_real(width - 0.22499999403953552), 0.020999999716877937)
    UI5_Box(PF73_Frame(3), J88_real(J88_real(x + width) - 0.1940000057220459), J88_real(top - 0.032999999821186066), 0.08399999886751175, 0.02199999988079071)
    UI5_Box(PF73_Frame(4), J88_real(J88_real(x + width) - 0.10000000149011612), J88_real(top - 0.032999999821186066), 0.08399999886751175, 0.02199999988079071)
    UI5_Box(PF73_Frame(5), J88_real(x + 0.017999999225139618), J88_real(top - 0.0820000022649765), 0.03799999877810478, 0.03799999877810478)
    BlzFrameSetTexture(PF73_Frame(5), PF73_Icon(rank), 0, true)
    UI5_Box(PF73_Frame(6), J88_real(x + 0.06599999964237213), J88_real(top - 0.06599999964237213), J88_real(width - 0.08299999684095383), 0.023000000044703484)
    UI5_Box(PF73_Frame(7), J88_real(x + 0.06599999964237213), J88_real(top - 0.08900000154972076), J88_real(width - 0.08299999684095383), 0.020999999716877937)
    BlzFrameSetText(PF73_Frame(6), J88_concat(J88_concat(J88_concat(J88_concat("|cffffd36b", PF73_RankName[rank]), "|r  -  "), I2S(PF73_Honor(pid))), " Honor"))
    if (rank < 17) then
        BlzFrameSetText(PF73_Frame(7), J88_concat(J88_concat(J88_concat(J88_concat("Next: ", PF73_RankName[J88_int(rank + 1)]), " at "), I2S(PF73_RankThreshold[J88_int(rank + 1)])), " Honor"))
    else
        BlzFrameSetText(PF73_Frame(7), "Highest rank attained.")
    end
    if PF73_Large then
        BlzFrameSetText(PF73_Frame(3), "Shrink")
    else
        BlzFrameSetText(PF73_Frame(3), "Enlarge")
    end
    --  A fixed grid keeps both faction names and six-digit records readable.
    while true do
        if (i == 13) then break end
        column = 0
        while true do
            if (column == 6) then break end
            label = ""
            if (i == 0) then
                if (column == 0) then
                    label = "Nation"
                elseif (column == 1) then
                    label = "Games"
                elseif (column == 2) then
                    label = "Champion"
                elseif (column == 3) then
                    label = "Runner-up"
                elseif (column == 4) then
                    label = "Top 4"
                else
                    label = "Top 8"
                end
            elseif (column == 0) then
                label = PF73_FactionName[J88_int(i - 1)]
            elseif (PF73_State[pid] == 1) then
                label = I2S(PF73_Stats[J88_int(J88_int(J88_int(J88_int(pid * 60) + J88_int(J88_int(i - 1) * 5)) + column) - 1)])
            else
                label = "--"
            end
            if (column == 0) then
                UI5_Box(PF73_Frame(J88_int(J88_int(100 + J88_int(i * 6)) + column)), J88_real(x + 0.017999999225139618), J88_real(J88_real(top - 0.1080000028014183) - J88_real(I2R(J88_int(i + 1)) * rowHeight)), J88_real(J88_real(width - 0.035999998450279236) * 0.3199999928474426), rowHeight)
            else
                UI5_Box(PF73_Frame(J88_int(J88_int(100 + J88_int(i * 6)) + column)), J88_real(J88_real(x + 0.017999999225139618) + J88_real(J88_real(width - 0.035999998450279236) * J88_real(0.3199999928474426 + J88_real(I2R(J88_int(column - 1)) * 0.13600000739097595)))), J88_real(J88_real(top - 0.1080000028014183) - J88_real(I2R(J88_int(i + 1)) * rowHeight)), J88_real(J88_real(width - 0.035999998450279236) * 0.13600000739097595), rowHeight)
            end
            BlzFrameSetFont(PF73_Frame(J88_int(J88_int(100 + J88_int(i * 6)) + column)), "Fonts\\FRIZQT__.TTF", font, 0)
            if ((i == 0) or (i == 1)) then
                label = J88_concat(J88_concat("|cffffd36b", label), "|r")
            end
            BlzFrameSetText(PF73_Frame(J88_int(J88_int(100 + J88_int(i * 6)) + column)), label)
            column = J88_int(column + 1)
        end
        i = J88_int(i + 1)
    end
    if (not PF73_Multiplayer) then
        message = "Single-player mode: service records do not advance."
    elseif (PF73_State[pid] == 0) then
        message = "Loading service record..."
    elseif (PF73_State[pid] == 3) then
        message = "Service record unavailable. Existing files are kept."
    end
    UI5_Box(PF73_Frame(8), J88_real(x + 0.017999999225139618), J88_real(y + 0.00800000037997961), J88_real(width - 0.035999998450279236), 0.032999999821186066)
    BlzFrameSetText(PF73_Frame(8), message)
    UI5_Box(PF73_Frame(10), J88_real(x + 0.017999999225139618), J88_real(top - 0.10999999940395355), J88_real(width - 0.035999998450279236), 0.017000000923871994)
    BlzFrameSetText(PF73_Frame(10), "Honor: Top 8 +10  |  Top 4 +25  |  Runner-up +50  |  Champion +100")
end

function PF73_Click()
    local f = BlzGetTriggerFrame()
    local pid = GetPlayerId(GetTriggerPlayer())
    if (((GetTriggerPlayer() == GetLocalPlayer()) and (pid >= 0)) and (pid < 8)) then
        BlzFrameSetFocus(f, false)
        if (f == PF73_Frame(0)) then
            PF73_Open = (not PF73_Open)
        elseif (f == PF73_Frame(4)) then
            PF73_Open = false
        elseif (f == PF73_Frame(3)) then
            PF73_Large = (not PF73_Large)
        end
        if PF73_Open then
            PM69_Activate(PF73_Panel)
        end
        PF73_Render()
    end
    f = nil
end

function PF73_Text(key)
    local f = BlzCreateFrameByType("TEXT", "ServiceRecordText", PF73_Frame(1), "", key)
    SaveFrameHandle(PF73_Frames, 0, key, f)
    BlzFrameSetFont(f, "Fonts\\FRIZQT__.TTF", 0.008999999612569809, 0)
    BlzFrameSetTextAlignment(f, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
    BlzFrameSetEnable(f, false)
    BlzFrameSetLevel(f, 3)
    f = nil
end

function PF73_Button(key, parent, text)
    local f = BlzCreateFrame("ScriptDialogButton", parent, 0, key)
    SaveFrameHandle(PF73_Frames, 0, key, f)
    BlzFrameSetText(f, text)
    BlzTriggerRegisterFrameEvent(PF73_ClickTrigger, f, FRAMEEVENT_CONTROL_CLICK)
    f = nil
end

function PF73_UIInit()
    local i = 0
    local f = nil
    PF73_Frames = InitHashtable()
    PF73_ClickTrigger = CreateTrigger()
    TriggerAddAction(PF73_ClickTrigger, PF73_Click)
    PF73_Button(0, UI5_Frame(3), "Achievements")
    f = BlzCreateFrameByType("BACKDROP", "ServiceRecord", UI5_Frame(3), "", 1)
    SaveFrameHandle(PF73_Frames, 0, 1, f)
    BlzFrameSetTexture(f, "UI\\WW2HUD\\panel.blp", 0, true)
    BlzFrameSetLevel(f, 30)
    PF73_Text(2)
    BlzFrameSetText(PF73_Frame(2), "Achievements")
    PF73_Button(3, f, "Enlarge")
    PF73_Button(4, f, "Minimize")
    SaveFrameHandle(PF73_Frames, 0, 5, BlzCreateFrameByType("BACKDROP", "ServiceRank", f, "", 5))
    BlzFrameSetEnable(PF73_Frame(5), false)
    PF73_Text(6)
    PF73_Text(7)
    PF73_Text(8)
    PF73_Text(10)
    while true do
        if (i == 78) then break end
        PF73_Text(J88_int(100 + i))
        if (ModuloInteger(i, 6) ~= 0) then
            BlzFrameSetTextAlignment(PF73_Frame(J88_int(100 + i)), TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        end
        i = J88_int(i + 1)
    end
    PF73_Panel = PM69_Register(PF73_IsOpen, PF73_Close)
    BlzFrameSetVisible(PF73_Frame(0), false)
    BlzFrameSetVisible(PF73_Frame(1), false)
    TimerStart(CreateTimer(), 0.25, true, PF73_Render)
    f = nil
end
