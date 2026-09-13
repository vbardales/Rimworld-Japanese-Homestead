---
localization: partial
translation_en: partial
translation_fr: partial
mod:          Nelim's Japanese Homestead (unofficial)
packageId:    nelim.wa
repo:         Rimworld-Japanese-Homestead
visibility:   public
detached:     yes
remote:       https://github.com/vbardales/Rimworld-Japanese-Homestead.git
local_path:   C:\Users\nelim\Documents\rimworld\JapaneseHomestead
stage:        Preview générée
settings_audit: not_applicable
licence:      silent
licence_at:   WA source and Workshop recheck; Tatara extracted to RolledUpSleeves
wa_licence:   silent
wa_licence_at: source About.xml and Workshop rechecked 2026-09-13
rights_scope: WA-only payload after completed Tatara extraction
dependencies: to check
showcase:     partial
tested_on:
workshop:
remaining:
  - defect: Preview still says prohibited; update to unofficial and reposition text as discussed
  - defect: French resources absent and Japanese source reports lack English overrides
  - unverified: complete dependency closure and optional Glass+Lights integration
  - unverified: functional scenarios, gameplay automated tests and in-game EN/FR validation
session:      maj:        2026-09-12, releve automatique
updated:      2026-09-13, evidence-based audit
---

# Nelim's Japanese Homestead (prohibited) — status

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
