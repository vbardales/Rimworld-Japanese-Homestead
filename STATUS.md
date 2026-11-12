---
localization: complete
translation_en: complete
translation_fr: complete
mod:          Nelim's Japanese Homestead (unofficial)
packageId:    nelim.japanesehomestead
repo:         Rimworld-Japanese-Homestead
visibility:   public
detached:     yes
remote:       https://github.com/vbardales/Rimworld-Japanese-Homestead.git
local_path:   C:\Users\nelim\Documents\rimworld\JapaneseHomestead
workflow_stage: writeTests[1.0.0]
settings_audit: not_applicable
licence:      silent
licence_at:   WA source and Workshop recheck; Tatara extracted to RolledUpSleeves
wa_licence:   silent
wa_licence_at: source About.xml and Workshop rechecked 2026-09-13
upstream_mod_remotes: N/A
rights_scope: WA-only payload after completed Tatara extraction
dependencies: none
showcase:     complete
tested_on:    2026-11-12 (three passes green on efb8301, see remaining)
workshop:     3806764776 (0.1.0 prepublish, 2026-09-27; item created private, not switched to public)
remaining:
  - done (2026-11-12): three passes GREEN on the same tree efb8301 (Mod/ and Tests/Pickle unchanged since): pass 1 English 20261112-115451-399-6512 (25 of 26 passed, 0 failed, 1 skipped), pass 2 French 20261112-115453-718-9d8e (25 of 26 passed, 0 failed, 1 skipped; it finished despite the worker restart), pass 3 20261112-110354-408-e883 (25 of 25). The one skip in passes 1 and 2 is the Glass+Lights aquarium set stagedecor, covered by e883. The first passes on 4a7449e were red only on the aura and save scenarios, cause in the steps (fixed in b854c32, docs/runs/history.md). Evidence kept in Tests/Pickle/Evidence/2026-11-12-pass1-english, 2026-11-12-pass2-french and 2026-11-12-pass3-glasslights; Inbox emptied. No ticket pending. Next: the stage move `done` -> `tested` per AUDIT.md.
  - done (2026-11-12): ticket 20261110-113828-221-a1cf (431b804, 03-pastimes with a zabuton beside each building) PASSED 9 of 9 (the seven pastime givers, Enjoy_Aquarium, the no-koto control). Evidence kept in Tests/Pickle/Evidence/2026-11-10-pastimes-seat (summary.md, summary.json, junit.xml); 08-diagnosis.feature deleted; Inbox emptied (relay notes a1cf and 7962 treated). Still not a certified green: `tested` needs the full three passes (see below).
  - open (replay 2026-11-10, 7.b): Tests/Rule-OwnValues.ps1 written 2026-11-12 (package identity, Glass+Lights patch gate, aquarium costs without and with Glass+Lights; PASS with pwsh and Windows PowerShell). Still open: the generated Tests/Test-Mod.ps1 skeleton replaces the hand-written one only after CI/CD generates it (needs the `Mod/` junction into RimWorld/Mods, PUBLISHING.md "jonction"; until then the hand-written Test-Mod.ps1 stays, PASS under pwsh 134 XML 865 references 458 texts; under Windows PowerShell 5 it fails to parse its CJK regex, run it with pwsh), and Audit validates the LOCAL_SCRIPTS row (told 2026-11-12). The hand-written script also caught a stale Mod/CHANGELOG.md copy (fixed).
  - unverified: Art/Preview-source.png value mean 0.286, below the 0.30 floor (AUDIT.md 2.e); waived by Virginie on 2026-10-11
    ("tolère"). Source left unchanged.
  - unverified: the six French stage labels now carry three-segment {PAWN_gender ? ... : ... : ...} switches (al neutral -æ,
    2026-10-11). Whether a hediff stage label resolves PAWN_gender in game is not established; check at playTests.
  - unverified: the aquarium giver (Enjoy_Aquarium, uncommented 2026-10-26) is a row of 03-pastimes and has never played.
  - defect (scene, cause found 2026-11-10): the pastime reds come from the Pickle scenes, not the mod. JoyGiver_InteractBuildingSitAdjacent defaults to requireChair True (also on Play_Koto, which sets none); every scene stood the building on open ground with no seat, so the four cardinal cells were sittable False and TryGiveJob gave no job (c850 vanilla Play_Chess, 7962 Play_Koto, both read and deleted). Fix: a seat beside the building in 03-pastimes (Play_Koto, PoemCardGame, BozuMekuri, ShellMatching, Sugoroku, WatchTheFire; Enjoy_Aroma and Enjoy_Aquarium are WatchBuilding, no seat). Step asked of NPT (local_03a66e9e) 2026-11-10: "a <def> named <name> stands next to the <thing>"; no local step meanwhile. Fixed and replayed green on a1cf (2026-11-12, see `done` above); 08-diagnosis deleted. ec97 stays in Tests/Pickle/Parked/diag-chess (RELEASE.md).
  - defect: Pickle suite red on 7fd0d8b (2026-09-30, docs/runs/history.md). Pass 1 (English) 13/25 passed, 11 failed;
    pass 2 (French) 13/25, 11 failed; pass 3 (Glass+Lights) 10/17, 7 failed; exitReason failed, flaky 0. Same failures
    in all three: aura (3: "Near carries no HDA_Hediff_..."), pastimes (7: "CanBeGivenTo holds but TryGiveJob
    returned no job"), save (1). The 79874e9 suite fixes did not clear them. The vanilla control (Play_Chess) red on b35b9d0 is explained (no chair in the scene, c850, 2026-11-10); the koto pastime reds are still being diagnosed.
  - unverified: pass 3 ended after 17 scenarios (up to 4 of the 7 pastimes; none of 04-aquarium, 05, 06 played), so the
    Glass+Lights aquarium cost scenario has never run. `tested` needs all three passes complete and green, no @wip,
    every @requires played, no manual test.
session:      maj:        2026-09-12, releve automatique
updated:      2026-11-10, replay: 7.b open (Test-Mod.ps1 CUT not done), stage back to writeTests; TRANSLATION_REVIEW.md regenerated
protocols_read_sha: ed905476e9fb34ccdfdac687aaac1f9fd87751f4
---

# Nelim's Japanese Homestead (unofficial) — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Journal

The dated audit sections (2026-09-13 to 2026-10-11) moved to `Docs/runs/status-journal.md` on 2026-11-12 (STATUS.md was over 40 KB). The test history stays in `Docs/runs/history.md`.
