# Japanese Homestead — testing

What proves this mod works, where each proof lives, and what counts as a pass. It is not shipped: it sits beside
`Mod/`, never inside it, so Steam never receives it. It replaces `TEST_SCENARIOS.md`, whose table is now split below
between the offline suite, the Pickle suite and the checks written off with a reason.

## Three kinds of proof

| Kind | Where | Runs in | Proves |
| --- | --- | --- | --- |
| Offline | `Tests/Test-Mod.ps1`, the shared `scripts/Check-DefInjected.ps1` | seconds, no game | XML parses, 861 references resolve against Core and the mod, 458 EN/FR text entries and their parameters, both aquarium costs, no settings surface, the document copies in `Mod/` |
| Pickle | `Tests/Pickle/` | the WSL game, tens of minutes | what only a running game can show: the aura pulse, the joy givers, the aquarium after the game's own patch pass, the language as loaded, a save and reload |
| Written off | this file, "Not automated" | | each with its reason |

Offline first: everything that can be proved without the game is proved there, and no Pickle scenario restates it.
Run `Test-Mod.ps1` with `pwsh`; Windows PowerShell 5.1 cannot parse it.

## Scenarios

| # | What | Settled by |
| --- | --- | --- |
| 1 | The mod loads on a fresh colony: its defs exist after the game's loader, no error, no warning from the mod | Pickle `01-loads`. A texture that fails to load logs at startup, outside any scenario: read `Player.log` from the start of each pass |
| 2 | A save taken with the aura running loads clean and the pulses go on | Pickle `06-save` |
| 3 | The aquarium costs 80 wood and 40 steel alone, 80 wood and 60 glass with Glass+Lights | Offline (patch applied by the script) and Pickle `04-aquarium` (the game's own patch pass), one pass each |
| 4 | Pastimes: the joy giver finds its building, gives its job, the colonist starts it. Koto, karuta twice, shell matching, sugoroku, irori, incense | Pickle `03-pastimes`. The aquarium has no working giver at all — see "Known defects" |
| 5 | Aura targeting: the princess's kimono hearten friends in range 10, and no foe, no wearer, no one beyond. The rikishi's cows enemies in range 15, and no friend, no wearer, no one beyond | Pickle `02-aura` |
| 6 | The pulses stop when the kimono comes off | Pickle `02-aura` |
| 7 | Language: the texts of both passes, no Japanese left in a label, description or job report | Offline for keys and parameters; Pickle `05-language` for what the game shows |
| 8 | No settings: no Mod options page, no shortcut | Offline (`Test-Mod.ps1`, "settings surface"): the mod has no `Verse.Mod` subclass. Nothing to see in game |

## Known defects

- **The aquarium has no joy giver.** `Enjoy_Aquarium`, both the `JoyGiverDef` in `Mod/Defs/Joy/JoyGivers.xml` and
  the `JobDef` in `Mod/Defs/JobDefs/Jobs_Joy.xml`, are wrapped in an XML comment ("`<!-- ===== 保留 ...`", "reserved")
  and never load. Found running pass 1 on 2026-09-28: the aquarium's `WA_Aquarium` costs and description promise a
  building colonists can enjoy, but no giver ever sends one to it. It still builds, still glows, still costs what
  `TESTING.md` scenario 3 says. Fixing this is the mod owner's call — uncomment both, or drop the promise from the
  description — not something a test suite decides; the scenario that would cover it is not written until then.

## Not automated, and why

None of these is a manual test waiting for a person. Each is either proved elsewhere or is the game's own behaviour.

- **Building, cooking, harvesting and hauling.** The mod declares costs, recipes, plants and work types; the offline suite resolves every one against Core and the mod. The machinery that builds a wall or bakes a sweet is the game's, and a scenario that exercises it tests the engine.
- **Food effects and their letters.** The hediffs, their stages and their texts are offline (keys, parameters). Their decay is the game's `HediffCompProperties_SeverityPerDay`.
- **The tea ceremony.** `Make_GreenTea` and `Drink_GreenTea` need leaves and a fire; the recipes are offline. The giver-to-building link is the same one scenario 4 proves for the other pastimes.
- **A player wearing the kimono from another faction.** `enableOnlyPlayerFaction` is one condition in one `if`. Pickle's own wearing step reaches colonists only, so the case cannot be set up without writing a second dressing step for one line.
- **Existing saves.** The only earlier build was the private 0.1.0 item, which no player subscribed to. There is no population of saves to migrate. The Tatara content left for `RolledUpSleeves`, and the tests of that mod own its migration.
- **Screenshots for review.** None is written: the `@review` captures of the Workshop gallery are a publication task (`PUBLICATION.md`, when it exists), taken in their own pass on PickleTools' studio. Until then scenario 4 and 5 make no visual claim.
- **A pass without the DLCs.** The mod references nothing outside Core: the offline suite resolves every reference against Core plus the mod alone.
- **A pass beside a declared incompatibility.** The mod declares none.

## Passes

Three, each one request to `Submit-PickleRun.ps1`. The language is fixed at staging and never switched inside a run.

| Pass | Language | Map | Filter | Covers |
| --- | --- | --- | --- | --- |
| 1 | English | none | `Japanese Homestead - Pickle tests,!@french` | everything without the optional mod; the Glass+Lights scenario is skipped by its `@requires` |
| 2 | French | none | `Japanese Homestead - Pickle tests,!@english` | the same, in French |
| 3 | English | `wsl-deps.avec-glasslights.map` | `Japanese Homestead - Pickle tests,!@without-optional,!@french` | the aquarium with Glass+Lights, and everything else beside it |

Glass+Lights is the only optional integration. Its own dependencies are not resolved by the map: read the staged list
of pass 3's first run before believing the mod loaded.

A `-Filter` that matches nothing exits 2 without playing anything. The mod's display name is not the companion's:
the companion is called `Japanese Homestead - Pickle tests`.

## What makes a pass, and what promotes `done` to `tested`

All of the following, from reports read rather than assumed:

- `exitReason` is `passed` in each of the three passes, read before any count.
- Scenarios played match scenarios discovered for the filter of that pass. A skipped scenario is expected in only two places: the Glass+Lights scenario in passes 1 and 2.
- No scenario is tagged `@wip`. At the time of writing none is.
- Every scenario that carries a condition ran in a pass that met it: `@requires:NanoCE.GlassLights` in pass 3, with the map that stages it.
- `flaky` is 0 in each `summary.json`. A scenario that passed only on a retry does not certify anything.
- `Player.log` from startup is read too: `no errors were logged` covers its scenario, not the load.
- No manual test is left to validate: the "Not automated" list above is the complete answer.
- No `@wip` scenario (re-checked 2026-10-02: none), every `@requires` scenario ran in a pass that mounts its mod
  (`@requires:NanoCE.GlassLights`, pass 3 only), and no manual test is left (the "Not automated" list).

## Order of the passes

New and red scenarios first, alone, in small tickets (`-Filter` on the feature or the scenario). The three full passes
above are non-regression: submit them all together, at the end, on the final revision. A scenario is non-regression
once it has a green run on the current logic; a change to the mod or to a step it uses makes it new again.
2026-10-02: `01-loads`, the nine "buildings that carried the dropped component" scenarios, the koto-absent guard, the aquarium
cost without Glass+Lights and the English language check are green on `7fd0d8b` (pass 1). `02-aura` (3), `03-pastimes` (7)
and `06-save` (1) are red, so the next tickets are those features alone, not the full passes.

## What to keep after a run

Launch with `-EvidenceDir JapaneseHomestead/Tests/Pickle/Evidence/<date>-<pass>`. The folder is ignored by git.

Keep, per pass, the latest run only: `summary.json`, `summary.md`, `junit.xml`, `Player.log`, and
`evidence-complete.txt` or `no-report.txt` (about 600 KB; the verdict, the counts, `exitReason` and the startup log).
Delete `messages.ndjson` (tens of MB, the failure messages are in `junit.xml`), `report.html` and `screenshots/`
once the verdict is recorded. Keep `screenshots/` only for a `@review` run whose images have yet to be looked at.
A report superseded by a newer one for the same scenario and the same revision goes, unless it is the only proof of
a check the newer run did not repeat. A report on an older build proves nothing about the current one.

The history is one text line per run in `docs/runs/`, never a folder, and `STATUS.md` cites that line. Never delete a
report a `STATUS.md` field still points to: repoint it first.

## Building the steps

```powershell
dotnet build Tests/Pickle/Source/JapaneseHomestead.PickleSteps.csproj -c Release
pwsh -NoProfile -File Tests/Pickle/Check-Steps.ps1
```

The first writes `Tests/Pickle/Mod/Pickle/Assemblies/`, which git ignores. The second compiles every step pattern with
Pickle's own engine and checks that each feature line matches exactly one expression among Pickle's and every other
suite of the collection. Rebuild before a request is dropped: Pickle loads the step DLL at game start, and the mod is
staged from the working tree when the ticket is played, so keep the tree still until the run is done.
