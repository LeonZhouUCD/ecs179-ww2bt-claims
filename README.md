# WW2 Blood Tournament — ECS 179 Competency Claims

This repository contains draft claims for **Game Systems**, **Debugging and Testing**, and **Interaction Design**, all at **Developed**. The claims are based on my work extending an existing Warcraft III custom map, WW2 Blood Tournament.

The source snapshot is from **1.0.6 (Lua31)**. This is a collection of code and test evidence, not a complete playable map. The original map contains inherited work, so I still need to identify my own contributions below.

`[TO CONFIRM]` marks information I need to fill in before submission. `[TODO]` marks missing screenshots or videos.

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

**Demonstration:** [TODO: Add a short recording of consecutive losses, compensation, and a win resetting the streak.]

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

Claude Code handled most of the code-level analysis and repair. I personally participated in in-game testing during every repair iteration.

[TO CONFIRM: Identify who designed or selected the automated regression tests and which, if any, I personally reviewed or ran.]

**My verification:** My initial hypothesis was that the disconnects were caused by network problems. My friend and I switched among US, European, and Asian servers and tried troubleshooting our connections. These checks did not explain or resolve the disconnects. Reviewing the disconnect logs then indicated a desynchronization error, which shifted the investigation toward client-local UI behavior and Lua object-reference handling. These observations identify the failure as a desynchronization issue; they do not by themselves establish the exact code-level cause or demonstrate that the fixes resolved it.

My testing during the repair iterations was manual in-game testing, separate from the automated mock results linked above. [TO CONFIRM: Describe the results of the multiplayer retests, including whether disconnects recurred and the approximate number or duration of test sessions.]

**Demonstration:** [TODO: Add an anonymized disconnect-log excerpt and a short debugging walkthrough or reproduction record. Record any multiplayer tests after the fix separately, including their actual outcomes.]

## 3. Interaction Design — Developed

### MacArthur commander upgrades

The commander panel shows the current level, the next upgrade's cost, and the abilities unlocked at each level. When the player lacks enough Blood Points, it explains the restriction and disables the upgrade button. At maximum level, it states that no further upgrade is available.

A click sends a synchronized upgrade request. While waiting, the interface can show a confirmation message and temporarily prevent further requests. The synchronized handler validates the upgrade and provides a result message. The intended flow is for the player to understand the requirements, request an upgrade, and receive feedback about what happened.

I am applying for Developed because the interaction accounts for resource availability, progression, and a pending request. The supporting tests verify gameplay rules behind the interface. Actual interface behavior and player comprehension still need demonstration.

**Code and tests**

- [Panel text and presentation](source/modules/macarthur.lua#L92): `Mac70_PanelText` and `Mac70_RenderPanel`.
- [Upgrade validation and response](source/modules/macarthur.lua#L51), and [request handling](source/modules/macarthur.lua#L140).
- [Supporting tests](tests/test_mac70.py): affordability, deductions, ability unlocks, and maximum-level rejection.
- [Test results](results/mock-mac70.json): **65/65 passed** for the broader MacArthur module. These are not 65 interface or usability tests.

**My contribution:** [TO CONFIRM: Which behavior, wording, layout, or feedback did I personally design or change? Explain one decision and the problem it addressed.]

**My verification:** [TO CONFIRM: What did I personally check in the game? Include player observations only if they were actually recorded.]

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

The Lua files in `source/` are unchanged copies of the 1.0.6 modular project. The test cases come from that release; their file-loading and output paths were adapted for this repository. The losing-streak test reads the modular Lua source directly instead of extracting the same functions from the assembled map script. The older panel file is included only for comparison.

Codex reran these three suites while preparing this repository on November 14, 2026. That run is separate from the personal verification statements I still need to complete.

## Credits and AI assistance

- **Original map and inherited work:** [TO CONFIRM: Add the original author credits and identify what existed before my changes.]
- **My work:** [TO CONFIRM: Complete the contribution and verification fields under each claim.]
- **Assistance with this submission:** Codex helped draft the claims and README, collect the relevant source files, adapt test paths, and run the mock tests.
- **Earlier AI assistance:** For the losing-streak compensation system, I wrote the initial framework and used Claude Code to assist with further implementation and debugging. For the multiplayer desynchronization issue, Claude Code handled most of the code-level analysis and repair, while I personally participated in in-game testing during every repair iteration. [TO CONFIRM: Describe AI assistance for the Interaction Design claim and clarify authorship and personal review of the automated regression tests.]

The screenshots and videos are still to be added. All three competency levels are requested, not yet verified by the course staff.
