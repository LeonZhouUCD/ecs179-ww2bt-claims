function LS103_RoundStart()
    local pid = 0
    --  Called after every army of a regular versus round has been placed.
    while true do
        if (pid >= 8) then break end
        LS103_Side[pid] = 0
        LS103_Fielded[pid] = ((SPAWN_UNITS_COUNT[pid] or 0) > 0) or Naval_HasLivingArmy(pid)
        pid = J88_int(pid + 1)
    end
end

function LS103_CheckSides()
    local pid = 0
    local opponent = 0
    --  The first army of a pairing to be wiped out loses the side battle; its opponent wins it.
    while true do
        if (pid >= 8) then break end
        opponent = udg_int_Opponent[pid]
        if ((LS103_Side[pid] == 0) and LS103_Fielded[pid] and (opponent ~= nil) and (opponent >= 0) and (opponent <= 7) and (opponent ~= pid)) then
            if (((SPAWN_UNITS_COUNT[pid] or 0) == 0) and (not Naval_HasLivingArmy(pid))) then
                if ((LS103_Side[opponent] == 0) and LS103_Fielded[opponent] and ((SPAWN_UNITS_COUNT[opponent] or 0) == 0) and (not Naval_HasLivingArmy(opponent))) then
                    --  Both armies fell together: a draw, not a loss for either side.
                    LS103_Side[pid] = 3
                    LS103_Side[opponent] = 3
                else
                    LS103_Side[pid] = 2
                    if (LS103_Side[opponent] == 0) then
                        LS103_Side[opponent] = 1
                    end
                end
            end
        end
        pid = J88_int(pid + 1)
    end
end

function LS103_RoundEnd()
    local pid = 0
    local streak = 0
    local reward = 0
    --  A side-battle loss extends the streak; anything else ends it. Rounds without troops change nothing.
    while true do
        if (pid >= 8) then break end
        if (IsPlayerInForce(Player(pid), udg_AllPlayers) and LS103_Fielded[pid]) then
            if (LS103_Side[pid] == 2) then
                streak = J88_int((LS103_Streak[pid] or 0) + 1)
            else
                streak = 0
            end
            LS103_Streak[pid] = streak
            if (streak >= 3) then
                reward = J88_int(streak * 1000)
                AdjustPlayerStateBJ(reward, Player(pid), PLAYER_STATE_RESOURCE_LUMBER)
                DisplayTimedTextToPlayer(Player(pid), 0.0, 0.0, 15.0, J88_concat(J88_concat(J88_concat(J88_concat("|cffff5555Losing streak:|r ", I2S(streak)), " rounds. |cffff0000+"), I2S(reward)), "|r Blood Points"))
            end
        end
        LS103_Fielded[pid] = false
        LS103_Side[pid] = 0
        pid = J88_int(pid + 1)
    end
end
