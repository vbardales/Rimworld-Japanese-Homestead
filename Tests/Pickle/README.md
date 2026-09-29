# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those. `Mod/` is a
companion mod, **Japanese Homestead - Pickle tests**, never published: it lives beside the mod's own `Mod/`, outside the
folder Steam receives.

**Read `Tests/Test-Mod.ps1` and the shared `Check-DefInjected.ps1` first.** They prove the XML, the references, the
translation keys and both aquarium costs in seconds, without a game. A Pickle run takes the machine for tens of
minutes. Nothing here restates any of it.

## What is here

| File | What it holds |
| --- | --- |
| `Mod/Pickle/Features/01-loads.feature` | the key defs after the game's loader, no error, no warning from the mod |
| `Mod/Pickle/Features/02-aura.feature` | the princess's kimono, the rikishi's kimono, the pulses stopping when it comes off |
| `Mod/Pickle/Features/03-pastimes.feature` | eight joy givers sending a colonist to their building, and one offering nothing without it |
| `Mod/Pickle/Features/04-aquarium.feature` | the aquarium's cost with and without Glass+Lights |
| `Mod/Pickle/Features/05-language.feature` | the game language of the pass, and no Japanese left in a label, description or report |
| `Mod/Pickle/Features/06-save.feature` | a save taken with the aura running, reloaded |
| `wsl-deps.avec-glasslights.map` | pass 3: Glass+Lights and nothing else |
| `Source/` | the step assembly, `JapaneseHomestead.PickleSteps.dll` (17 steps) |
| `Check-Steps.ps1` | compiles every step pattern with Pickle's own engine and checks each feature line resolves to exactly one |

The mod's own assembly, `WA.dll`, is not referenced: the aura extension is read by reflection, so a renamed field fails a
scenario with a message that names it, not the build.

**Every step text starts with `Japanese Homestead:`.** Pickle loads the steps of every active suite into one namespace.
`Check-Steps.ps1` compares this suite's lines with Pickle's vocabulary and with 65 other suites when the collection is
around this repository.

## Tags that select

`@without-optional`, `@english` and `@french` exist so that a pass can leave out what is false by design in it. `@requires:
NanoCE.GlassLights` skips the glass scenario where the mod is absent. None of them installs anything.

## Three passes

```powershell
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 `
  -Mod JapaneseHomestead -Owner local_<session id> -Label "<sha> pass 1 English" -Language English `
  -Filter 'Japanese Homestead - Pickle tests,!@french' `
  -EvidenceDir JapaneseHomestead/Tests/Pickle/Evidence/<date>-pass1-en
```

Pass 2 is the same with `-Language French` and `!@english`. Pass 3 adds `-DepMap wsl-deps.avec-glasslights.map` and
filters `!@without-optional,!@french`. TESTING.md carries the table. Write the SHA in the label: a request carries none,
and the mod is staged from the working tree when the ticket is played.

Runs are not started from a session: a request is dropped and the dispatcher wakes the session. One request per pass.
