# WW2 Blood Tournament — ECS 179 Competency Claims

This repository contains draft claims for **Game Systems**, **Debugging and Testing**, and **Interaction Design**, all at **Developed**. The claims are based on my work extending WW2 Blood Tournament, a Warcraft III custom map originally created by **Krackles**.

The source snapshot is from **1.0.6 (Lua31)**. This is a collection of code and test evidence, not a complete playable map. The original map contains inherited work; my contributions and AI assistance are described below.

`[TODO]` marks demonstration evidence still to add, such as screenshots, videos, or log excerpts.

## 1. Game Systems — Developed

### Losing-streak compensation

This system tracks consecutive losses and awards Blood Points at the end of a round. Starting with the third consecutive loss, the reward is the current streak multiplied by 1,000. A win or draw resets the streak. A round without troops does not pay a reward or change the streak.

The main difficulty is defining a loss in this map. Winning a paired battle and then dying in the central battle should not count as losing that paired battle. Also, an army with reinforcements still waiting to spawn should not be classified as defeated. The implementation separates round-start participation, battle outcome detection, and round-end settlement to handle these cases.

I am applying for Developed because this adapts a gameplay rule to the existing battle system and handles its edge cases. The tests check the behavior of the rules; they do not prove that the reward amounts are balanced.

**Code and tests**

- [Losing-streak implementation](source/modules/losing-streak.lua#L1): `LS103_RoundStart`, `LS103_CheckSides`, and `LS103_RoundEnd`.
- [Round-start hook](source/modules/inherited-map.lua#L1456), [battle-outcome hook](source/modules/movement-and-battle.lua#L874), and [round-end hook](source/modules/inherited-map.lua#L2077).
- [Test cases](tests/test_streak103.py): thresholds, resets, empty rounds, simultaneous elimination, and queued reinforcements.
- [Test results](results/mock-streak103.json): **10/10 passed** in mock Lua 5.3.

**My contribution:** I defined the losing-streak compensation rules, including starting compensation at three consecutive losses and setting each payment to the streak length multiplied by 1,000 Blood Points. I specified that wins and draws reset the streak, while rounds without troops leave it unchanged and award no compensation. I also specified that winning a paired battle and later dying in the central battle must not count as a loss.

I wrote the initial framework for this system, then used Claude Code to help extend the implementation and debug issues.

**My verification:** I test the system in actual matches against AI opponents. I deliberately build poorly balanced armies to lose battles, then check whether the losing-streak system responds according to the rules I specified. This is my manual in-game testing; the automated test results linked above are separate evidence.

**In-game demonstration (November 21, 2026)**

- My third consecutive loss triggered the first compensation payment. The highlighted message reads “Losing streak: 3 rounds. +3000 Blood Points.” [Three-loss screenshot](evidence/game-systems/three-losses.png)
- My fourth consecutive loss raised the payment to 4,000 Blood Points. The settlement lists the 300 points from my army on a separate line above the streak bonus. [Four-loss screenshot](evidence/game-systems/four-losses.png)
- The recording shows round four against AI opponents. At **1:41**, the round ends and the +4,000 message appears. [Round four gameplay video (MP4)](evidence/game-systems/round-four.mp4)

The [win-reset test](tests/test_streak103.py#L61) checks the separate rule that winning a paired battle clears the streak.

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

**Single-player panel check (November 21, 2026, map version 1.0.6)**

I opened and closed panels in a solo game. In the 19-second clip, Commanders is visible at 0:02, Army Overview at 0:10, and Achievements at 0:14. At 0:18 the panels are closed and the round countdown has continued. [Watch the panel check (MP4)](evidence/debugging/single-player-panels.mp4)

[Army Overview open](evidence/debugging/army-overview.jpg) · [Back in the game with the panels closed](evidence/debugging/back-to-game.jpg)

This recording shows panel behavior on one client. My observations about multiplayer disconnects come from the earlier matches with my friend.

## 3. Interaction Design — Developed

### MacArthur commander upgrades

The commander panel shows the current level, the next upgrade's cost, and the abilities unlocked at each level. When the player lacks enough Blood Points, it explains the restriction and disables the upgrade button. At maximum level, it states that no further upgrade is available.

A click sends a synchronized upgrade request. While waiting, the interface can show a confirmation message and temporarily prevent further requests. The synchronized handler validates the upgrade and provides a result message. The intended flow is for the player to understand the requirements, request an upgrade, and receive feedback about what happened.

I am applying for Developed because these design choices explain upgrade requirements and give players feedback about available actions. The supporting tests verify gameplay rules behind the interface. My manual tests below check the interface's behavior in the game; screenshots and a video are still to be added.

**Code and tests**

- [Panel text and presentation](source/modules/macarthur.lua#L92): `Mac70_PanelText` and `Mac70_RenderPanel`.
- [Upgrade validation and response](source/modules/macarthur.lua#L51), and [request handling](source/modules/macarthur.lua#L140).
- [Supporting tests](tests/test_mac70.py): affordability, deductions, ability unlocks, and maximum-level rejection.
- [Test results](results/mock-mac70.json): **65/65 passed** for the broader MacArthur module. These are not 65 interface or usability tests.

**My contribution:** I proposed the level and cost displays, disabling the upgrade button when resources are insufficient, and feedback after upgrading. For example, I wanted the button to be disabled when the player could not afford an upgrade while still showing the required cost, so the player could understand why upgrading was unavailable and how much it would cost.

Claude Code handled most of the implementation, and I was responsible for testing the interface in the game.

**My verification:** I personally tested the interface in Warcraft III and confirmed that the upgrade button was disabled when resources were insufficient, the required upgrade cost was displayed correctly, and upgrading worked when I had enough resources. These were manual in-game checks, separate from the automated test results linked above.

**Screenshot:** [TODO: Add an actual in-game screenshot of the commander panel.]

**Video:** [TODO: Show insufficient resources, an affordable upgrade, successful completion, and maximum level. Show the pending state only if it is visible.]

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
- **My work:** I continued developing the map and added four factions: **Free France, Vichy France, Communist China, and Italy**. For the claims in this repository, I defined the losing-streak rules and wrote the initial framework, investigated multiplayer disconnects and tested repair iterations, and proposed the commander upgrade interaction and tested it in the game. The claim sections above describe these contributions and my manual verification.
- **Assistance with this submission:** Codex helped draft the claims and README, collect the relevant source files, adapt test paths, and run the mock tests.
- **Earlier AI assistance:** For the losing-streak compensation system, I wrote the initial framework and used Claude Code to assist with further implementation and debugging. For the multiplayer desynchronization issue, Claude Code handled most of the code-level analysis and repair. My main verification role was manual in-game testing during every repair iteration. For the commander upgrade interface, I proposed the interaction design, Claude Code handled most of the implementation, and I tested it in the game. Claude Code also wrote the original automated test scripts included here.

The Interaction Design screenshots and video are still to be added. All three competency levels are requested, not yet verified by the course staff.
