# WW2 Blood Tournament — ECS 179 Competency Claims

This repository contains draft claims for **System Interrelations**, **Debugging and Testing**, and **Interaction Loops**, all at **Developed**. The claims are based on my work extending WW2 Blood Tournament, a Warcraft III custom map originally created by **Krackles**.

The source snapshot is from **1.0.6 (Lua31)**. This is a collection of code and test evidence, not a complete playable map. The original map contains inherited work; my contributions and AI assistance are described below.

## 1. System Interrelations — Developed

### What counts as a loss when the winner advances to the center?

A player can defeat their assigned opponent, advance to the central battlefield, and lose their entire army there. Suppose that player entered the round with two consecutive losses. If the economy counted losses by checking for surviving units at the end of the round, it would count a third loss and pay 3,000 Blood Points to someone who won their pairing.

**Why I am claiming Developed.** I adapted the compensation rule to the map's two stages of combat. I chose the paired battle as the result that determines compensation. Once a player wins that fight, the win stands through the central battle. Round settlement reads the saved win, resets the streak to zero, and awards zero streak compensation. A player who actually loses three pairings in a row earns 3,000 Blood Points.

**My contribution.** I defined which battle counted, set the payout rules, and wrote the initial framework. Claude Code helped extend and debug the implementation and wrote the mock tests. I tested the payout in Warcraft III by deliberately fielding weak armies against AI opponents.

**Code and tests**

- **Battle outcome.** During combat, the code records a win when the assigned opponent is eliminated. Later checks skip players whose pairing already has a result. [Combat check](source/modules/movement-and-battle.lua#L882) · [Record the paired result once](source/modules/losing-streak.lua#L19)
- **Economic consequence.** At settlement, only a recorded paired loss increments the streak. A recorded win clears it before the payout threshold is checked. [Round-end call](source/modules/inherited-map.lua#L2077) · [Streak and payout calculation](source/modules/losing-streak.lua#L44)
- **Regression test.** The test eliminates the paired opponent first, then wipes out the remaining armies to simulate deaths in the center. It checks that the winner's streak stays at zero. Later in the same suite, a player on a five-loss streak wins a pairing, dies in the center, and finishes with a zero streak and no compensation. All 10 cases passed in mock Lua 5.3. [Simulated battle sequence](tests/test_streak103.py#L41) · [Winner's later death](tests/test_streak103.py#L53) · [Existing streak reset and payout checked](tests/test_streak103.py#L61) · [Test results](results/mock-streak103.json)

**In-game demonstration of the payouts (November 21, 2026)**

- My third consecutive loss triggered the first compensation payment. The highlighted message reads “Losing streak: 3 rounds. +3000 Blood Points.” [Three-loss screenshot](evidence/game-systems/three-losses.png)
- My fourth consecutive loss raised the payment to 4,000 Blood Points. The settlement lists the 300 points from my army on a separate line above the streak bonus. [Four-loss screenshot](evidence/game-systems/four-losses.png)
- The recording shows round four against AI opponents. At **1:41**, the round ends and the +4,000 message appears. [Round four gameplay video (MP4)](evidence/game-systems/round-four.mp4)

## 2. Debugging and Testing — Developed

### Client-local panel coordination

Different players can open different UI panels. The earlier panel coordination code used engine triggers to query and close panels, so client-specific interface state could cause different engine-trigger operations on different clients. This was a synchronization risk.

The revised implementation uses ordinary Lua callbacks for panel queries and closing actions. The tests check that opening a second panel closes the first, closing the active panel clears its state, and idle polling leaves panels closed. The mock harness raises errors for prohibited trigger operations, and source checks look for those operations being reintroduced.

I am applying for Developed based on my role in investigating a recurring failure, testing a network-related hypothesis, using logs to narrow the problem, and personally testing each repair iteration. The code comparison and automated regression checks provide supporting evidence for the changes. They do not establish that every multiplayer desynchronization has been fixed.

**Code and tests**

- [Before: 0.7.9 panel coordination](before/panel-coordination-0.7.9.lua#L55).
- [After: 1.0.6 panel coordination](source/modules/panel-coordination.lua#L55): `PM69_Register`, `PM69_Activate`, and `PM69_Poll`.
- [Regression tests](tests/test_sync80.py): prohibited-operation stubs, panel behavior tests, and source guards.
- [Test results](results/mock-sync80.json): **17/17 passed** across the broader synchronization suite, including panel checks.

**My contribution:** I tested new Lua versions with a friend who regularly helps playtest my game. During these multiplayer sessions, we repeatedly observed players disconnecting. I investigated the failures by trying different server regions, checking possible network problems, and reviewing disconnect logs.

Claude Code handled most of the code-level analysis and repair. My main verification role was manual in-game testing, and I personally participated in every repair iteration.

The automated regression tests were originally written by Claude Code and are included as supporting project evidence. Codex adapted their file paths and ran the suites while preparing this repository; that recorded run is separate from my personal in-game testing.

**My verification:** My initial hypothesis was that the disconnects were caused by network problems. My friend and I switched among US, European, and Asian servers and tried troubleshooting our connections. These checks did not explain or resolve the disconnects. Reviewing the disconnect logs then indicated a desynchronization error, which shifted the investigation toward client-local UI behavior and Lua object-reference handling. These initial observations identified a desynchronization issue but did not by themselves establish the exact code-level cause.

After the fixes, my friend and I tested approximately three multiplayer matches and observed no further disconnects in those matches. These retests, like my testing during each repair iteration, were manual in-game tests, separate from the automated mock results linked above.

**Online panel check with one human player (November 21, 2026, map version 1.0.6)**

I hosted an online multiplayer game as the only human player, with one computer slot occupied. I stayed connected as I opened and closed the panels. In the 19-second clip, Commanders is visible at 0:02, Army Overview at 0:10, and Achievements at 0:14. At 0:18 the panels are closed and the round countdown has continued. [Online lobby](evidence/debugging/online-lobby.jpg) · [Watch the panel check (MP4)](evidence/debugging/online-panel-check.mp4)

[Army Overview open](evidence/debugging/army-overview.jpg) · [Back in the game with the panels closed](evidence/debugging/back-to-game.jpg)

This recording shows panel behavior on one connected client. My observations about synchronization between two human players come from the earlier matches with my friend.

## 3. Interaction Loops — Developed

### Spending the carrier's 120 mana each battle

At Level 5, MacArthur gives me a choice each battle. If my army needs support now, I can spend 40 mana to call three F6F Hellcats. That leaves 80 mana, enough to spend 60 on a precision strike against one enemy ground unit. If several valuable ground units are close together, I can save all 120 for a group strike. I can watch which units survive the attack and use that observation when choosing support next round. At battle end the map removes summoned aircraft and refills the carrier to 120. [Ability costs and effects](source/modules/macarthur.lua#L92) · [Cast handlers](source/modules/macarthur.lua#L690) · [Battle cleanup and refill](source/modules/carrier-and-naval-units.lua#L29)

**Why I am claiming Developed.** A change to one cost altered the choices in this loop. Precision Strike used to cost 70 mana. With 120 mana, a player could use it once and have 50 left. At 60 mana, two precision strikes fit in the same budget, so the player can hit one target, see what survives, and pick a second target later in the battle. Group Strike commits that same budget at once and selects targets within the chosen area on successive waves. [Release note for the cost change](evidence/interaction-loops/release-0.7.3.txt#L13) · [Group strike target selection](source/modules/macarthur.lua#L534)

**Code and test evidence.** These mock tests cover the effects of individual casts and the refill that starts the next cycle.

- A reinforcement call produces three Hellcats, and a precision strike deals 4,000 damage to its target. [Reinforcement test](tests/test_mac70.py#L232) · [Damage test](tests/test_mac70.py#L264)
- Group Strike runs for four waves and gives priority to the three highest-value eligible targets. [Wave test](tests/test_mac70.py#L326) · [Target priority test](tests/test_mac70.py#L351)
- The refill test starts the carrier at 3 mana and checks that it returns to 120. All 65 cases in the MacArthur mock suite passed. [Refill implementation](source/modules/macarthur.lua#L596) · [Refill test](tests/test_mac70.py#L365) · [Suite results](results/mock-mac70.json)

**My contribution and playtest evidence.** I set the carrier's 120-mana cap, the cost of each ability (40 for reinforcements, 60 for Precision Strike, and 120 for Group Strike), and the rule that refills mana after each battle. I also proposed the upgrade panel's level and cost displays and feedback, and tested the progression in Warcraft III. Claude Code handled most of the upgrade interface implementation and wrote the mock tests. At **0:57** my recording shows the final upgrade unlocking Group Strike. [Upgrade recording](evidence/interaction-design/macarthur-upgrades.mp4) · [Level 5 screenshot](evidence/interaction-design/maximum-level.jpg)

**My two-round playtest (November 21, 2026)**

| Battle | What I did and what the game showed |
| --- | --- |
| **Round 2, Level 4** | I split the mana between two actions. At **0:25**, my F6F reinforcement call leaves **80/120**. While I aim the next ability, the meter rises to **83**. At **0:28.65**, Precision Strike brings it down to **23/120**, a cost of 60. [Round 2 recording](evidence/interaction-loops/round-2-reinforcements-and-precision.mp4) · [After calling the fighters](evidence/interaction-loops/round-2-hellcats.jpg) · [After the precision strike](evidence/interaction-loops/round-2-precision.jpg) |
| **Round 3, Level 5** | I saved all 120 mana for Group Strike because several elite enemy units were close together. I wanted to take them out quickly while successive waves could hit valuable targets in the same area. At **0:26**, I aim the targeting circle with **120/120** mana. At **0:30**, the meter reads **0/120** and the attack plays out over the following seconds. [Round 3 recording](evidence/interaction-loops/round-3-group-strike.mp4) · [Choosing the target area](evidence/interaction-loops/round-3-target.jpg) · [After committing all 120 mana](evidence/interaction-loops/round-3-strike.jpg) |

The recordings cover the two battles separately. The second shows the full meter before the next cast. The [battle-end refill test](tests/test_mac70.py#L365) checks the reset that takes place between battles.

## Running the tests

The tests use Python and Lupa's Lua 5.3 runtime. Run these commands from the repository root:

```sh
python -m pip install -r requirements.txt
python tests/test_streak103.py
python tests/test_sync80.py
python tests/test_mac70.py
```

Results are written to `results/`. The tests stub Warcraft III engine functions, so they do not replace a World Editor, in-game, or multiplayer test.

The Lua files in `source/` are unchanged copies of the 1.0.6 modular project. The test scripts come from that release and were originally written by Claude Code. Codex adapted their file-loading and output paths for this repository. The losing-streak test reads the modular Lua source directly instead of extracting the same functions from the assembled map script. The older panel file is included only for comparison.

Codex reran these three suites while preparing this repository on November 14, 2026. That run is separate from the manual in-game testing described in the claims.

## Credits and AI assistance

- **Original map and inherited work:** The original map was created by **Krackles**. Its original version included eight factions: the United States, the Soviet Union, the United Kingdom, Germany, France, Poland, the Republic of China, and Japan. This map and its existing factions formed the foundation for my further development.
- **My work:** I continued developing the map and added four factions: **Free France, Vichy France, Communist China, and Italy**. For the claims in this repository, I defined the losing-streak rules and wrote the initial framework, investigated multiplayer disconnects and tested repair iterations, and designed the carrier's mana rules and upgrade interaction. I tested the carrier in the two battles shown above.
- **Assistance with this submission:** Codex helped draft the claims and README, collect the relevant source files, adapt test paths, and run the mock tests.
- **Earlier AI assistance:** For the losing-streak compensation system, I wrote the initial framework and used Claude Code to assist with further implementation and debugging. For the multiplayer desynchronization issue, Claude Code handled most of the code-level analysis and repair. My main verification role was manual in-game testing during every repair iteration. For the commander upgrade interface, I proposed the interaction design, Claude Code handled most of the implementation, and I tested it in the game. Claude Code also wrote the original automated test scripts included here.
