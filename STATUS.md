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

## Records kept here (AUDIT 4.g, 5.g, 6.h)

Copied back from `Docs/runs/status-journal.md` on 2026-11-12: these three records must live in STATUS.md, the rest of the dated journal stays in that file.

### Dependencies (4.g)

- **declareDependencies (4.g):** `Mod/About/About.xml` at bfae7aa, 2026-10-11: no `modDependencies`; `loadAfter` Core, Royalty,
  Ideology, Biotech, Anomaly, Odyssey, `NanoCE.GlassLights` (optional, patch gated by display name); `supportedVersions` 1.6 only.
  Glass+Lights identity and costs verified 2026-09-13, unchanged.

### Settings audit (5.g)

All four C# files and XML definitions/patches reviewed. No Verse.Mod subclass, ModSettings,
GetSettings, SettingsCategory, DoSettingsWindowContents or MainButtonDef found. The mod
adds content, kiln work and apparel auras. Kiln capacity/product/burn duration and aura
faction/range/interval/severity are content-definition and balance data, not a documented
player-preference interface. No concrete missing player setting was identified. Building
materialCount/progress serialization is gameplay save state; vanilla bills/refuelling
are gameplay controls. No empty settings page or shortcut exists. Thus settings_audit is
not_applicable, justified by inventory, not merely by absence of a settings class.
Settings default/input/reset/access/shortcut tests are not applicable. No RIMMSQOL or
other customization integration was tested or claimed. Gameplay persistence is still
pending final functional verification.


### Translation audit (6.h)

**~~Validation struck 2026-11-12~~** (owner rule relayed by TM): the plugin now records the pages sent; the review behind this validation was multi-page
(TRANSLATION_REVIEW.md is 3 pages) and cannot be proven complete. `translation_fr` is `pending_review` until all 3 pages are reviewed without
WARN "pages not reviewed yet", the justified corrections are applied, and Virginie validates again. The text below is history only.

**ChatGPT review 2026-11-12, pages 1, 2, 3 all sent (last run printed "all 3 pages sent for this content"), answers read.** Applied: `WA_Wall_WaterMoats.description`
(EN and FR said "dry", copied from DryMoats: now filled with water, matches the Def and the Japanese); French labels and descriptions of five apparel
`WA_Dressing_{Elder,Suke,Kaku,Kin,PriestSoldier}` (Kaku source description says "Kimono of Elder", upstream error, French follows the key). Rejected:
"une escalier" (the file reads "un escalier"); mixed-script and simplified/traditional edits in ChineseSimplified, ChineseTraditional and Japanese
(upstream WA text, licence silent: upstream pull request only, not a local edit); machine translations of the 58/58/55 missing Chinese and Japanese keys
(nobody here can judge them, English fallback stays); the eight abstract bases (`WA_AlcoveBase`, `WA_Drawer`, `WA_*Base`, `WA_PlantBase`: `Abstract="True"`, never
displayed). Left for Virginie: French of `WA_DressingHat_{Hood,Towel,Katou}` (ChatGPT: "Kimono à capuche", "Kimono avec serviette", "Kimono de Katou"; the
English "Kimono-Hood" is a headgear name, wording is a real choice). `Check-Translations.ps1` PASS, `Check-DefInjected.ps1` 1908 keys 0 errors.
**Rerun 2026-11-12 (after 718692a, refusals file sent):** pages 1, 2, 3 all sent on the same content, last run printed "all 3 pages sent for this content" (no WARN).
Applied: `WA_Recipe_Kasuteira.description` FR ("une pâte à gâteau légère", as the English "light cake batter"). Refused, logged in `Docs/review-refusals.md`: Chinese Futon and
Enjoy_WA labels, Japanese Koto/Karuta/Brazier (upstream text), FR SutrasDesk rephrase (taste). Hat labels still for Virginie: ChatGPT again proposes "Kimono à capuche",
"Kimono avec serviette", "Kimono-Katou" (Towel role not established by the table).
**Rerun 2 (same content, no regeneration in between):** pages 2, 1, 3 sent, last run printed "all 3 pages sent for this content". Nothing applied, all refused and logged (Chinese and
Japanese upstream text, unproven length risk); hats: ChatGPT's third variant ("Capuche de kimono", "Serviette de kimono", "Kimono-Katou"). Virginie asked to see the hat images
(contact sheet sent 2026-11-12). **Virginie chose the hat names 2026-11-12:** `WA_DressingHat_Hood` "Capuche", `_Towel` "Serviette", `_Katou` "Cagoule" (the image is a balaclava; "Katou" alone
was her other option); applied. Open before `complete`: her validation of the French (asked, not yet given).
**French validated by Virginie, 2026-11-12 ("Je valide", chat).** Revision reviewed: `d8cb862` (ChatGPT pages 1, 2, 3 all read on this content, no WARN; later commits touch `docs/` only). Corrections applied
in this round: water moats description, eight apparel and headgear labels and descriptions, Kasuteira recipe wording. `translation_fr` set to `complete`; refusals in `docs/review-refusals.md`.

Reviewer: Virginie (confirmed in chat, 2026-10-11). Revision reviewed: `4bee295`. Corrections requested and applied: dry moats
description, Green Tea description, "Cérémonie du thé" label, Geppei gender switch (`ravi : ravie : ravix`), review file generation
(English for duplicate stage labels, clean revision). No further French correction. `translation_fr` set to `complete`; the remaining
reserve is in `remaining` as `unverified`: `PAWN_gender` resolution in the seven hediff stage labels, to check in game at `playTests`.
- **writeTests -> playTests (7.a to 7.i): passed 2026-10-11.** Scenarios in TESTING.md, Pickle suites written (3 passes, `@requires:NanoCE.GlassLights`
  in pass 3 with its map), `Test-Mod.ps1` and `Check-DefInjected.ps1` rerun at `4bee295` (PASS, 0 errors), translations complete.
  Tested SHA for this state: `4bee295` (later commits touch documents only). Stage `playTests[1.0.0]`.

