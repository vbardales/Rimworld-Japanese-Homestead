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
workflow_stage: playTests[1.0.0]
settings_audit: not_applicable
licence:      silent
licence_at:   WA source and Workshop recheck; Tatara extracted to RolledUpSleeves
wa_licence:   silent
wa_licence_at: source About.xml and Workshop rechecked 2026-09-13
upstream_mod_remotes: N/A
rights_scope: WA-only payload after completed Tatara extraction
dependencies: none
showcase:     complete
tested_on:
workshop:     3806764776 (0.1.0 prepublish, 2026-09-27; item created private, not switched to public)
remaining:
  - unverified: Art/Preview-source.png value mean 0.286, below the 0.30 floor (AUDIT.md 2.e); waived by Virginie on 2026-10-11
    ("tolère"). Source left unchanged.
  - unverified: the six French stage labels now carry three-segment {PAWN_gender ? ... : ... : ...} switches (al neutral -æ,
    2026-10-11). Whether a hediff stage label resolves PAWN_gender in game is not established; check at playTests.
  - defect: the aquarium's JoyGiverDef and JobDef (Enjoy_Aquarium) are commented out in Mod/Defs/Joy/JoyGivers.xml
    and Mod/Defs/JobDefs/Jobs_Joy.xml; the aquarium builds but no giver ever sends a colonist to it (TESTING.md,
    "Known defects")
  - defect: Pickle suite red on 7fd0d8b (2026-09-30, docs/runs/history.md). Pass 1 (English) 13/25 passed, 11 failed;
    pass 2 (French) 13/25, 11 failed; pass 3 (Glass+Lights) 10/17, 7 failed; exitReason failed, flaky 0. Same failures
    in all three: aura (3: "Near carries no HDA_Hediff_..."), pastimes (7: "CanBeGivenTo holds but TryGiveJob
    returned no job"), save (1). The 79874e9 suite fixes did not clear them. Cause: a vanilla control (Play_Chess on a vanilla ChessTable) fails the same way on b35b9d0 (docs/runs/history.md, 2026-10-12): the reds come from the step or the harness, not the mod; cause inside TryGiveJob still to find.
  - unverified: pass 3 ended after 17 scenarios (up to 4 of the 7 pastimes; none of 04-aquarium, 05, 06 played), so the
    Glass+Lights aquarium cost scenario has never run. `tested` needs all three passes complete and green, no @wip,
    every @requires played, no manual test.
session:      maj:        2026-09-12, releve automatique
updated:      2026-10-11, audit: playTests[1.0.0]; French reading validated by Virginie, translations complete
protocols_read_sha: 2f4e0002e2543fcde57999c51ff8b2f0dfc8efdb
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


## Evidence-based audit — 2026-09-13

Previous stage: empty; retained literal workflow stage: `dansMonoRepo` (no legacy-code
mapping). Previous showcase: complete; now partial. Later independent checks do not
advance the cumulative stage past the first blocked transition.

Scope: C:/Users/nelim/Documents/rimworld/JapaneseHomestead; distributed folder: Mod/.
Git root is C:/Users/nelim/Documents/rimworld, revision
7845c3f59b59534972aaebc8a6e976838d94eb85. Only STATUS.md was locally modified in this
project before audit: three unchecked localization fields had been added. Its exact
pre-audit contents are preserved in .audit/2026-09-13/STATUS.before.md. This audit changes
STATUS.md and adds isolated evidence/build files only; no sources, images or delivered
assemblies changed. Historical narrative above is retained, not treated as proof.
Read parent PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.
The user's audit request overrides conflicting protocol details, particularly runtime
settings checks: they belong to final in-game validation, not the options gate.

### Ordered transition results

| Transition | Finding |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | **Defect / blocked.** This folder is still part of the monorepo. No autonomous checkout was identified in inspected locations/worktrees. The exact GitHub repository exists, is public and is EMPTY: `gh repo view vbardales/Rimworld-Nelim-Japanese-Homestead --json name,isPrivate,url,defaultBranchRef` returned isPrivate=false and an empty branch name; `gh api repos/vbardales/Rimworld-Nelim-Japanese-Homestead/commits` returned HTTP 409, Git Repository is empty. First pushed commit is therefore absent. No autonomous remote is certified; the monorepo does not need a remote. README.md and CHANGELOG.md are absent. STATUS exists and both ATTRIBUTION copies are identical. |
| horsMonoRepo -> ModIcon générée | **Independent checks passed; cumulative transition blocked.** Release build succeeds with zero warnings/errors; resulting DLL exactly matches the delivered DLL. ModIcon is PNG, 128x128, 24,864 bytes, directly inspected: outlined winking mascot. Build alone does not certify all development finished. |
| ModIcon générée -> Preview générée | **Artifact independently validated.** Preview is PNG, 896x504, 662,920 bytes, below 1 MB. Direct inspection shows an overhead tatami interior, warm hearth and no detailed face. No concrete camera defect found; neither a generation history nor a recorded screenshot comparison is required. |
| Preview générée -> preOptions | **Defects.** French summary on the image does not match the English About description. The title prefix Nelim's uses the same principal ink as the main title: secondary colour is absent, so its required distinction from the amber accent is not established. The private `(prohibited)` suffix and opening PERSONAL USE ONLY paragraph are absent in About. Description ends with the save-removal warning, not the required final Source code on GitHub BBCode link. The url field does identify the verified repository. |
| preOptions -> options | **Independent not_applicable justified.** See settings inventory below. |
| options -> l10n | **Defects / partial.** French entirely absent; some original Japanese job reports lack English overrides. Existing injection paths pass, but this does not establish coverage. |
| l10n -> preTest | **Not fully verified.** About supports 1.6. C# uses game/Unity and internal WA classes; old aura/material dependencies have local replacements. Glass+Lights patch is conditional by display name, with NanoCE.GlassLights in loadAfter. No LoadFolders. DLC loadAfter entries alone do not imply required dependencies. Full Def-reference closure and verification of installed Glass+Lights identity/Glass target remain unverified. No undeclared mandatory dependency is asserted from loadAfter alone. |
| preTest -> done | **Not passed.** XML checks passed below. No project functional scenario document or automated gameplay-test suite/results found. These are required pending work for aura, kiln loading/burning/refuelling/extraction and persistence; build is not a functional test. |
| done -> tested | **Not verified.** No game session, logs, translated UI, new-game or existing-save scenarios were executed. tested_on remains empty. |

### Rights and metadata

ATTRIBUTION.md, Tatara section, records the author's explicit request not to redistribute,
and states this is a private build. This local evidence contradicts the old alive label;
licence is now forbidden. This records the supplied rights evidence, not a fresh external
rights investigation. Observed visibility remains public; required visibility is private.
Do not falsify actual visibility by writing private before it is changed. GitHub is empty;
this audit does not allege that assets have been uploaded. No visibility mutation occurred.
No blanket third-party LICENSE should be invented. Any own-work licence needs an explicit
scope respecting the recorded restrictions. Root/distributed ATTRIBUTION hashes match:
B01DE465FE2C122D218A67C4219B2B9DFE924933D5ADEE863D0360D7E0D6F5BB.
PackageId nelim.wa, JapaneseHomestead folder and repository name refer coherently to this
project; no literal identity or packageId change is required.

### Settings audit

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

### Translation and XML checks

English contains one Keyed file; Japanese, ChineseSimplified and ChineseTraditional
also exist. French is absent. Six owned WA_FK keys in C# resolve to nonempty English
entries; positional parameters agree with calls (3, 2, 0, 2, 1, 0). Inspect text uses
Translate and product Def labels; technical warnings remain English logs. English
source Def values need no redundant English DefInjected resources. However
Mod/Defs/JobDefs/Jobs_Joy.xml contains Japanese reportString values, e.g. line 42
(koto), with no English DefInjected override. These are confirmed EN coverage gaps.
All owned text lacks French coverage. Full semantic/grammar/text coverage is partial.

Executed parent scripts/Check-DefInjected.ps1 with -TransMod <project>/Mod and
-ExtraAssemblies <project>/Mod/Assemblies/WA.dll: 30 patch operations applied,
11,914 definitions indexed, 1,456 keys checked, zero errors and no unresolved findings
reported. Full output: .audit/2026-09-13/definjected.log. This checks EXISTING injection
paths, including Asian languages, not missing EN/FR coverage or runtime display.
PowerShell XML parsing of every distributed XML: 140 files, zero parse errors.

### Build and evidence limits

Executed dotnet build Source/WA/WA.csproj -c Release with BaseIntermediateOutputPath
and OutputPath redirected into .audit/2026-09-13/obj/ and bin/. First sandboxed attempt
could not access Microsoft SDKs; permitted retry succeeded, zero warnings/errors.
Build log: .audit/2026-09-13/build.log. Rebuilt and shipped WA.dll SHA256 both:
E5C1E154122680A427CAD57F6DCB704A1A94E4989561E3099EF8C068FA25BD84.
First GitHub read also lacked config access; read-only retry succeeded. These access
failures are not source defects. No gameplay execution is inferred from compilation,
matching hashes, valid XML or passing DefInjected checks.

### Next transition and optional recommendations

Strictly necessary for horsMonoRepo: establish the autonomous checkout and GitHub remote,
make the currently empty repository private consistently with documented rights, complete
required English documentation and private-build notices, and establish a first pushed
commit in that private repository. Verify actual visibility and remote SHA afterwards.
No such development, publication, push or repository mutation was performed by this audit.
Later image, localization and test defects remain independent pending work.

Optional maintenance: Source/Directory.Build.props currently points to the parent
monorepo .build; adapt this when detaching. Preserve Art/Preview-source.png. No extra
camera reservation is raised.



## Standalone preparation — 2026-09-13

The user authorized the next transition after the audit. Current facts in this section
supersede the historical snapshot above; its findings remain preserved for traceability.

- Initialized an independent repository at the existing JapaneseHomestead path on
  branch codex/standalone. Git reports this directory as its root. The enclosing
  monorepo no longer tracks JapaneseHomestead and ignores /JapaneseHomestead/.
  This is Git detachment in place; existing game paths remain usable. The monorepo's
  index removals and ignore change are intentionally uncommitted, preserving other work.
- Origin: https://github.com/vbardales/Rimworld-Nelim-Japanese-Homestead.git.
  GitHub is verified private before any upload. The repository was empty before import.
- Added English README, CHANGELOG and a LICENSE rights notice granting no redistribution
  licence. All three are copied into Mod/. Existing ATTRIBUTION copies remain unchanged.
- Added the exact private title suffix and personal-use paragraph, plus the final
  Source code on GitHub link. PackageId remains nelim.wa.
- Adapted build paths to this repository's .build/ and added Git ignore/attributes rules.
  Release build succeeded, zero warnings/errors; shipped DLL SHA256 is still
  E5C1E154122680A427CAD57F6DCB704A1A94E4989561E3099EF8C068FA25BD84.
- The initial import preserves current content without replaying unrelated monorepo
  commit messages. Original history remains in the monorepo at audit revision
  7845c3f59b59534972aaebc8a6e976838d94eb85. Local .audit evidence is preserved and ignored;
  build intermediates and audit binaries will not be uploaded.
- Settings not_applicable and partial localization remain valid: no behavior, settings
  UI, Def or translation resource changed. Preview and final tests remain pending.

The first pushed commit will be recorded after remote verification; until then the
cumulative stage remains dansMonoRepo.

### First push verified — 2026-09-13

Initial private commit e96cccd8a3dec97132d988dedec3455ee6fc3ea8 was pushed to
origin/codex/standalone. git ls-remote returned that exact SHA. The cumulative stage
is now horsMonoRepo. All first-transition requirements are established: independent
Git root and excluded parent index, matching origin, existing private repository,
first pushed commit, initialized status and English documentation, consistent identity,
and rights/visibility justified by the preserved attribution. LICENSE is a no-grant
rights notice, not an invented third-party licence.

Build and images retain their earlier independent passes; higher cumulative gates
are not certified here. Preview corrections, complete EN/FR coverage, dependency
verification and meaningful gameplay tests remain outstanding. git diff --check on
the initial full import reported legacy whitespace in unchanged XML; it is cosmetic
and preserved. A trailing blank line in the edited About.xml was removed afterwards.


## Showcase continuation — 2026-09-13

User requested continuation. The current delivered Preview has been corrected with the
built-in imagegen workflow (two targeted edits), then resized to the required PNG canvas.
Original Art/Preview-source.png is unchanged; the previous delivered image is archived as
Art/Preview-before-english-2026-09-13.png. Final full-size generation is retained as
Art/Preview-english-final-source.png. Earlier candidates remain available in Art/.

Final prompt summary: preserve the existing scene/camera/furnishings; replace French
summary with "Japanese architecture, gardens, pastimes and kimono."; use ivory main
title, ochre Nelim's and (prohibited) at reduced size, vivid turquoise divider, and a
triangular top-right turquoise 1.6 badge with dark rotated digits. Second edit enlarged
the suffix and replaced the first rectangular badge with the triangle. Generated
raster typography was visually checked; exact font-family identity is not certified.

Delivered Mod/About/Preview.png: 896x504, 886,709 bytes. Directly inspected full output
and 268-pixel thumbnail (.audit/2026-09-13/preview-thumbnail.png): English text correct,
title and suffix legible, version identifiable, accent distinct from secondary ink,
no overlap with the hearth subject and no new camera reservation. No scene regeneration
was requested; minor raster variation from the image edit is retained.

Current cumulative stage: options (literal workflow name). The existing content
implementation and matching successful build establish the ModIcon gate; the image
artifacts pass their format checks. Corrected Preview and previously verified English
About/private naming/final repository link establish preOptions. The unchanged,
justified settings_audit: not_applicable establishes options. These checks do not
certify runtime behavior or complete localization. The next transition is l10n;
French resources and English coverage gaps remain outstanding. No game test was run.

Monorepo detachment was subsequently committed as 75c3000e; earlier statements that
its removals were uncommitted describe the previous preparation snapshot.

## WA-only licence recheck — 2026-09-13

WA itself is silent under the requested workflow: version 1.0, no licence grant or
redistribution restriction found in inspected local source and retrievable Workshop
material. See the appended ATTRIBUTION recheck, also copied into Mod/ATTRIBUTION.md.
Tatara is excluded from this evaluation, as requested. The historical top-level
forbidden label describes the still-combined files, not a newly found restriction
on WA. The user commits to removing Tatara before publication.

A separate explicit restriction was found in installed ResourcePackCore/About/About.xml
(line 25). Replacement resources in WA use local descriptions and vanilla textures;
this is not a finding of prohibited copying. Remaining check: establish retained RPC
content provenance rather than infer rights from its identifiers. Source dependency
availability and ResourcePackCore author attribution in older prose were corrected.
The session RolledUpSleeves has been informed. No source extraction or publication
was performed as part of this rights recheck.

## Tatara source extraction completed — 2026-09-13

After destination build confirmation, removed 73 files: 22 Tatara Def XML, 43 PNG,
2 kiln C# files, 4 Japanese DefInjected files, 2 EN/JP kiln Keyed files. Each source
file was backed up under .audit/tatara-extraction/source-backup before removal;
manifest hashes and destination presence were checked, and the extra Japanese Keyed
file was verified identical at destination. Both shared WA material/recipe files
remain unchanged. Historical Tatara attribution is retained in TATARA_HISTORY.md,
outside Mod/. Existing local Preview/status/rights edits were preserved.

WA rebuilt successfully (0 warnings/errors); SHA256:
AFE4509F5822DE4F0C222F7DD0F902783C7054BC9633D0CA2E4670029B824613.
Only HediffAuraExtension.cs and WaAuraMapComponent.cs remain in Source/WA.
No exact removed-def/parent references remain in retained non-language XML.
DefInjected check: 1,248 keys, 0 errors; log .audit/tatara-extraction/definjected.log.
That run preceded removal of the Japanese Keyed file, which does not supply any
DefInjected entry. Combined-mode validation is being rerun by the destination task.
No in-game save migration or runtime validation is claimed; no publication performed.

About/README/LICENSE now describe WA only; classification silent excludes Tatara.
Actual remote remains private. New metadata uses unofficial. Preview still carries
prohibited, so preOptions naming coherence is invalidated and cumulative stage is
Preview générée pending that image update (also move text to lower right as discussed).
Settings audit remains not_applicable; localization remains partial. Prior full-package
and matching-DLL statements above are historical, superseded by this extraction.

Destination confirmation: RolledUpSleeves reports combined checks on actual post-extraction files passed (531 selected references, zero duplicates, missing selected references or parents). Standalone: 557 selected references. 43 transferred PNG hashes match. These are static checks, not gameplay or save-migration evidence.


## Repository reinitialization — 2026-09-13

User authorized a new WA-only root commit, new Rimworld-Japanese-Homestead repository and deletion of the old GitHub repository. Old private history is preserved locally in .audit/repo-reinitialization/old-private-history.bundle. Historic URLs and statuses above describe prior snapshots. Only the new branch will be pushed; no old refs, audit backups or build caches are included. Existing source and artwork work is included in the new snapshot. Final verification is recorded locally after upload.

## Current validation — 2026-09-13 (supersedes historical findings)

Current cumulative stage: preTest. Showcase, metadata, settings (not_applicable),
localization and static dependency checks pass. done is not claimed: the static
suite does not execute apparel-aura gameplay. tested_on remains empty.

Preview: 896x504 PNG, 944887 bytes, visually inspected at full size and thumbnail.
Text is in the lower right, with unofficial suffix and the English summary.

French: 458 concrete inherited/direct text fields. English overrides cover Japanese
reports and corrected source wording. Stable source IDs and generators live in Tests/.
Check-DefInjected: 1896 keys checked, zero errors; 30 patch operations applied.
Test-Mod: 134 XML files parsed, 861 selected references resolved against Core+WA,
translation parameters, settings surface, document copies and conditional costs pass.
These checks are not a complete engine Def loader or a runtime translation review.

No mandatory external dependency identified. Glass+Lights is optional; its installed
identity and Glass Def were verified, and aquarium costs checked with/without it.
The aquarium's Abstract flag was removed to make the advertised object constructible;
its cooling component, placement and gameplay behavior still require in-game testing.

TEST_SCENARIOS.md records the remaining functional scenarios, including aura targeting,
pulses, save/load, aquarium, optional integration, food, construction and EN/FR UI.
No runtime results have been fabricated. Tatara implementation remains outside this mod.

## Gate correction and final automated validation — 2026-09-13

Retained stage: done (ready for final in-game validation), superseding the preTest
conclusion above. The user workflow requires relevant automated tests and XML tests
passing, with functional scenarios written. It does not require a separate mocked
RimWorld gameplay suite. The previous additional gate was an audit interpretation
error. No aura gameplay test is claimed or replaced by a mock implementation.

Revision: 737bd378055f3db2422acaa22a3097a4909ae744 plus the uncommitted Preview,
aquarium definition, EN/FR resources, Tests, scenarios and documentation changes.
Release build rerun: zero warnings and errors. Delivered WA.dll SHA256:
AFE4509F5822DE4F0C222F7DD0F902783C7054BC9633D0CA2E4670029B824613.
Test-Mod.ps1 rerun: PASS (134 XML files, 861 selected references, 458 text entries,
parameters, conditional aquarium costs, settings surface and document copies).
Check-DefInjected.ps1 rerun: 1896 keys, zero errors; 30 patch operations, 11824 Defs.

Tests exercise real distributed XML and installed dependency definitions. They do
not execute Unity, Pawn health updates, ticks or game serialization. These runtime
behaviors have explicit scenarios in TEST_SCENARIOS.md and belong to done -> tested.
No additional isolated pure gameplay module exists to unit-test independently;
settings tests beyond absence checks are not applicable because there are no settings.
Final game validation, including EN/FR UI and new/existing saves, is still unverified.

## Pickle suite written — 2026-09-28

`TESTING.md` replaces `TEST_SCENARIOS.md`. `Tests/Pickle/` holds a companion mod (`nelim.japanesehomestead.pickletests`),
six features (101 step lines) and 17 local steps. Checked, not run: the step assembly builds (`dotnet build`, no
warning), and `Check-Steps.ps1` reports 17 patterns compiled, none declared twice, every line resolving to exactly
one expression across Pickle and 65 other suites. `Test-Mod.ps1` under pwsh still passes (134 XML, 861 references).

Three passes are declared in `TESTING.md` (English bare, French bare, English with Glass+Lights). None has been
played: no ticket was submitted, so `tested_on` stays empty and the stage stays `done`. The steps are untried code
against the real game; a failure in a first run may be a step's, not the mod's.

The packageId became `nelim.japanesehomestead` on 2026-09-28 (commit `12b45a8`). Earlier sections of this file that
say `nelim.wa` describe the state at their date.

## Translation audit — 2026-09-30

`translation_fr` was reset to `unchecked` for the mod-wide gender-agreement rule (TRANSLATIONS.md,
"French gender agreement", 2026-09-30). Read all 13 French DefInjected files (this mod carries no Keyed
strings): `ApparelLayerDef`, `DesignationCategoryDef`, `HediffDef`, `JobDef`, `JoyKindDef`, `RecipeDef`,
`ResearchProjectDef`, `ResearchTabDef`, `TerrainDef`, `ThingCategoryDef`, `ThingDef`, `WorkGiverDef`, all
under `Mod/Languages/French/DefInjected/`.

Two texts agree with a pawn in the masculine only, with no `{PAWN_gender ? ...}` switch: "encouragé"
(`HDA_Hediff_EncouragementOfThePrincess`, five duplicate stage labels) and "Intimidé"
(`HDA_Hediff_IntimidateOfTheYokozuna`, one stage label) — the princess's and rikishi's auras land on a
pawn of any gender. Recorded as a `defect` above and flagged in `FRENCH_REVIEW.md`. Not fixed here: a
session does not correct French text pending Virginie's own reading of it.

Every other French text read (recipes, research, buildings, terrain, furniture, job report strings) is
either gender-neutral by construction (nouns, infinitives, object descriptions) or has no pawn to agree
with.

`FRENCH_REVIEW.md` generated at the mod root by `scripts/Make-FrenchReview.ps1`, from the working tree
after commit `79874e9`. Original column: ChineseSimplified DefInjected text, merged by key across every
file in each def type's folder (that language splits one file per category where French and English each
keep one file per def type) — WA is a Chinese-authored mod and its own Defs carry English, not the source
language, natively. `translation_fr` set to `partial`: the gender-agreement defect is recorded and the
review file exists, but `complete` is reserved for Virginie's own reading, per TRANSLATIONS.md.

## Audit — 2026-10-02

Revision 7fd0d8b, working tree clean before this audit (changes: STATUS.md, TESTING.md, docs/).
Previous `stage: done` -> retained `stage: showcase`, `workflow_stage: options` (the field was missing; added).

- **options -> l10n fails** against TRANSLATIONS.md as of 2026-10-02 (French agreement, 2026-09-30): "encouragé"
  and "Intimidé" agree with a pawn in the masculine only, no three-segment switch. Recorded as a defect on
  2026-09-30 but `stage` was left at `done`; a translation defect lowers it. Not fixed here (a session does not
  correct French pending Virginie's reading). Return path: add the switches, regenerate FRENCH_REVIEW.md, audit again.
  Plural keys: none (the mod carries no Keyed strings). The shared `scripts/Make-FrenchReview.ps1` now exists; this
  mod now uses it (own copy deleted 2026-10-11; output regenerated).
- l10n -> preTest and preTest -> done: not rejudged below the failing gate. The Pickle suite is written and justified
  (TESTING.md). `Test-Mod.ps1` and `Check-DefInjected.ps1` were not rerun this audit (unverified).
- done -> tested: not reached. Three passes played on 7fd0d8b, all red (see `remaining`). `tested_on` stays empty.
- Upstream: the original WA (Workshop 1548358607, Udon) has no git repository that could be found (web search
  2026-10-02 finds only Workshop pages). `upstream_mod_remotes: N/A` stands; no pull request is possible. The source
  is the Workshop copy, see ATTRIBUTION.md.
- 0.1.0: `Mod/About/PublishedFileId.txt` is committed (3806764776) and CHANGELOG.md opens with `## [0.1.0]`.
- .dds: none is tracked (`git ls-files` finds none) and `*.dds` is in .gitignore.
- Evidence: `Tests/Pickle/Evidence/` 348 MB -> 1.6 MB. Kept the latest run per pass (summary, junit, Player.log,
  evidence-complete) of 7fd0d8b; removed the three superseded 2026-09-29 reports and the screenshots, report.html and
  messages.ndjson of the kept ones. Nothing in this file points at a removed report.
- Not touched: the shared `pickle-reports-archive/` (full copies for every mod; no folder there was identified as
  this mod's own run).
- Docs read and their value: docs/PROTOCOLS-READ.md.

## Audit — 2026-10-11

Revision bfae7aa. Working tree not clean before this audit: `Art/` holds other uncommitted work (Preview re-render,
`Art/Gallery/`, `Art/echo.png`, `Art/Preview.config.json`, deleted `Preview-*.png`, `Mod/About/Preview.png`), left untouched.
`stage` retired (was `showcase`); `options` reassessed against the 2026-10-11 chain (AUDIT.md section 16). This section
replaces the 2026-10-02 stage decision; that section's evidence notes stand.

- **makeSources -> code:** `Mod/About/ModIcon.png` (2026-09-03, RGB) was older than `Art/ModIcon-source.png` (2026-09-29, 128x128
  RGBA): stale derivative (2.b). Regenerated from the source by the session (Lanczos, 128x128, 25,512 bytes, within 20-30 KB).
  `Art/ModIcon.ico` (2026-10-03) postdates the source. `Art/Preview-source.png` present. 2.e palette checks not rerun (unverified).
- **code -> declareDependencies:** build not rerun this audit (unverified). No `feature` left in `remaining`; `[Unreleased]` open.
- **declareDependencies (4.g):** `Mod/About/About.xml` at bfae7aa, 2026-10-11: no `modDependencies`; `loadAfter` Core, Royalty,
  Ideology, Biotech, Anomaly, Odyssey, `NanoCE.GlassLights` (optional, patch gated by display name); `supportedVersions` 1.6 only.
  Glass+Lights identity and costs verified 2026-09-13, unchanged.
- **auditSettings:** `not_applicable` stands (no `Verse.Mod`, no settings class, no MainButtonDef; inventory 2026-09-13).
- **localize -> writeTests: fails (6.d).** `Mod/Languages/French/DefInjected/HediffDef/WA.xml` still has "m'a encouragé" (5 stage
  labels) and "Intimidé" with no `{PAWN_gender ? ... : ... : ...}` switch. Retained state `localize[1.0.0]`; `translation_fr` stays
  `partial`. Return path: add the switches, regenerate `FRENCH_REVIEW.md`, audit again; Virginie's reading precedes the `writeTests` exit (6.g).
- **writeTests / playTests:** not rejudged below the failing gate. `Test-Mod.ps1` and `Check-DefInjected.ps1` not rerun (unverified).
  Pickle red on 7fd0d8b (see `remaining`); `tested_on` stays empty.
- `protocols_read_sha` not written: `Mark-ProtocolsRead.ps1` refuses (`WORKSHOP_COMMENTS.md` uncommitted in the protocols repo) and
  this session read AUDIT.md and WELCOME.md only this pass (the other protocols: unread). Linter WARN stays until a full read.

`_tools/` removed 2026-10-11 (its one script, `Generate-FrenchReview.ps1`, replaced by the shared `scripts/Make-FrenchReview.ps1`;
`FRENCH_REVIEW.md` regenerated, new layout, same 479 rows' worth of content to be re-read by Virginie). `.build/` stays: gitignored
build output (`Source/Directory.Build.props`), no tracked file.

### Audit 2026-10-11, second pass (supersedes the stage above)

- **makeSources -> code: fails (2.e).** `scripts/Measure-Palette.sh Art/Preview-source.png`: 2 families, dominant 95%, Vmean 0.286
  (floor 0.30). Defect recorded, source left to the owner. Retained state `makeSources`; the French gender defect (6.d) is
  behind it. The `localize` conclusion above stays valid for the later gates.
- Rerun now: `Tests/Test-Mod.ps1` PASS (134 XML, 861 references, 458 text entries); `Check-DefInjected.ps1` 1896 keys, 0 errors,
  30 patch operations; `dotnet build Source/WA/WA.csproj -c Release` 0 warnings, 0 errors; `Tests/Pickle/Source` builds.
  `build/obj/Release/WA.dll` and `Mod/Assemblies/WA.dll` both SHA256 AFE4509F...4613.
- **Closing pass, step 3 (mod root clean):** `.build/` renamed `build/` (PUBLISHING.md, owner rule 2026-10-10; both
  `Directory.Build.props` and `.gitignore` updated, READMEs say `build/`); `.audit/` moved to the ignored
  `Tests/Pickle/Evidence/audit-archive/`; scratch art in the old `.build/` (drafts, cutouts) deleted. `_tools/` removed earlier.
  The build scripts are the CI/CD session's contact (AUDIT.md 3.b): `Directory.Build.props` changed.
- Not rejudged: closing pass steps 1 (Art/ has the owner's uncommitted work), 4 to 8.
- Protocols read this pass: AGENTS.md, AUDIT.md, TRANSLATIONS.md, MOD_SETTINGS.md, PUBLISHING.md (in full), STYLE_RIMWORLD.md (palette
  rule only), WELCOME.md. Not read: PICKLE.md, WORKSHOP_COMMENTS.md (no ticket, no comment at this state).

### Audit 2026-10-11, third pass (supersedes the two above for the stage)

- Palette 0.286: waived by Virginie (2026-10-11, "tolère"); 2.e not a blocker. makeSources -> code -> declareDependencies -> auditSettings pass.
- 6.d: the two unswitched texts (6 stage labels in `HediffDef/WA.xml`) now use `{PAWN_gender ? masculine : feminine : neutral}`
  (encouragé / encouragée / encouragæ, Intimidé / Intimidée / Intimidæ). `FRENCH_REVIEW.md` regenerated, `french-review-flags.json`
  added (source text and the runtime doubt; the shared script leaves Original/English empty for stage keys). `Test-Mod.ps1`
  (pwsh) PASS, `Check-DefInjected.ps1` 1896 keys, 0 errors. Still `localize[1.0.0]`: `translation_fr` stays `partial` until
  Virginie reads `FRENCH_REVIEW.md` (6.g, required before leaving `writeTests`, not `localize`). Next: exit `localize` to `writeTests`.
- **localize -> writeTests (6.i): passed.** 6.a to 6.f done (inventory, coverage, switches, `FRENCH_REVIEW.md`); 6.g is required at the
  `writeTests` exit, not here. Stage now `writeTests[1.0.0]`. Exit blocked by 7.g (`translation_fr` partial: Virginie's reading of
  `FRENCH_REVIEW.md`, revision of the commit after 26e8ffa) and by 7.b/7.c reruns at the final SHA (done today on this tree: PASS).

### French review corrections, 2026-10-11 (Virginie's full reading)

Applied in commit 4bee295: `WA_Wall_DryMoats.description` (FR and EN: dry, not filled with water), `WA_Hediff_GreenTea.description` (FR and
the English Def: tea, not a sweet), `Enjoy_ChanoYu.label` (FR "Cérémonie du thé", EN "Tea ceremony"; the task report strings keep their
wording), `WA_Hediff_Geppei` stage label (seventh gendered label: ravi / ravie / ravix; the epicene fallback "Quel régal, cette pâte de
haricots et ces noix croquantes !" is the answer if `PAWN_gender` turns out not to resolve in a stage label, unverified). Not changed:
clothing names (no systematic neutralisation), upstream English (no upstream git in this file, no pull request identifiable).
`FRENCH_REVIEW.md` generation: `french-review-sources.json` now gives Original from the real source (ChineseSimplified; JobDef from the
Defs, e.g. Japanese for the koto) and English from `Languages/English` over the Defs; revision shown is 4bee295, the `+uncommitted`
suffix comes from the owner's uncommitted `Art/` tree. 36 rows read "(not found in ChineseSimplified)": the source has no such text.
CHANGELOG `[Unreleased]` lists the corrections; 0.1.0 wording changed to "The initial upload created this item privately."
`Test-Mod.ps1` PASS, `Check-DefInjected.ps1` 1896 keys, 0 errors. `translation_fr` stays `partial` until Virginie validates the corrected texts.
- 2026-10-11, second reading: `scripts/Make-FrenchReview.ps1` now resolves duplicate-label stage handles (`<handle>-N` is the Nth item
  of that label), so the five princess stages show their English; revision is a clean `4bee295` (generated from a detached worktree
  at HEAD, so the uncommitted `Art/` tree does not taint it). `french-review-flags.json` trimmed to the three runtime doubts.
  Virginie: the four corrections are present, no other French correction. `PAWN_gender` in stage labels: verify in game at `playTests`.

### Translation audit: French review, 2026-10-11

Reviewer: Virginie (confirmed in chat, 2026-10-11). Revision reviewed: `4bee295`. Corrections requested and applied: dry moats
description, Green Tea description, "Cérémonie du thé" label, Geppei gender switch (`ravi : ravie : ravix`), review file generation
(English for duplicate stage labels, clean revision). No further French correction. `translation_fr` set to `complete`; the remaining
reserve is in `remaining` as `unverified`: `PAWN_gender` resolution in the seven hediff stage labels, to check in game at `playTests`.
- **writeTests -> playTests (7.a to 7.i): passed 2026-10-11.** Scenarios in TESTING.md, Pickle suites written (3 passes, `@requires:NanoCE.GlassLights`
  in pass 3 with its map), `Test-Mod.ps1` and `Check-DefInjected.ps1` rerun at `4bee295` (PASS, 0 errors), translations complete.
  Tested SHA for this state: `4bee295` (later commits touch documents only). Stage `playTests[1.0.0]`.
