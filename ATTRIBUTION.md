# Nelim's Japanese Homestead — attribution

(Udon's "WA", brought back for 1.6)

Written in English, private build or not: this is the file an upstream author is shown when they
ask how they were credited, and it only does its job if its subject can read it
(see `PUBLISHING.md`). This file was in French until 2026-09-05; it was translated whole rather
than left half and half, when the Tatara section below was added.

## WA v1.0

- **Original author:** Udon
- **Source:** Steam Workshop `1548358607`, last supported version 1.0 (June 2019). The page has
  since been taken down.
- **Reused here:** the whole mod — defs, textures, patches, and the Japanese and Chinese
  translations.

WA v1.0 was itself the merge of nine 0.19 mods by the same author: WA-Wall, WA-Alcove,
WA-Amusement, WA-Bedding, WA-Door, WA-FoldingScreen, WA-Glow, WA-Seat, WA-TeaSet, plus the kimonos
that had not appeared before. The separate 0.19 pages (`1494983695` WA-Seat, `1494983060`
WA-FoldingScreen, `1383834577` WA-Amusement, `1275072073` SHO-JI) are therefore obsolete:
everything is here.

### The two dead dependencies

WA required two base mods by Udon, both pulled from the Workshop and untraceable:

**ResourcePackCore** (`1543671683`, 1.3 at most) supplied the materials. WA consumed seven of
them. Three turned out to be defined by WA itself — `RPC_Kouzo`, `RPC_Cocoon` and their two plants
— and the other four are recreated here under their original `defName`s, so that none of the
twenty-odd cost lists in the mod had to be touched. There is no collision risk: ResourcePackCore
cannot load in 1.6.

| Material | Treatment |
|---|---|
| `RPC_JapanesePaper` (washi) | Redefined. Its recipe `RPC_MakePaper` was already in WA. |
| `RPC_PureSilk` (pure silk) | Redefined. Its recipe `RPC_MakePureSilk` was already in WA. |
| `RPC_Charcoal` (charcoal) | Redefined, plus a new recipe `WA_MakeCharcoal` (campfire, smithy), the original kiln not being recoverable. |
| `RPC_Dirt` (soil) | Redefined, plus a new recipe `WA_DigSoil` (crafting spot, stonecutting table), the original gathering spot not being recoverable. |
| `RPC_GlassCullet` (glass cullet) | Dropped: one use, the aquarium. Its cost became steel, with a patch switching back to glass when **Glass+Lights** is loaded. |

The icons for the four recreated materials are tinted vanilla textures: the original art lived in
ResourcePackCore and does not ship with WA. The cocoon had the same problem inside WA itself — its
`texPath` had always pointed at an image that was not there.

**HealthDifferenceAuraCore** (`1544596991`) carried the aura of the two special kimonos through a
`ThingDef` subclass and an `Apparel` subclass. Rewritten in `Assemblies/WA.dll` (source under
`Source/`): a `DefModExtension` holds the settings and a `MapComponent` drives the pulse.
**The thing worth remembering:** in 1.6 worn apparel is never ticked — `Pawn_ApparelTracker` only
handles wear and locking. A `tickerType` on a garment therefore does nothing the moment somebody
puts it on, and the pulse has to come from somewhere else.

### 1.0 → 1.6 migration

| Point | Decision |
|---|---|
| `CompProperties_RoomIdentifier` | Removed from the game with no replacement. Taken out of 13 buildings across 6 files. This was the real killer of the lot: an unresolved `<li Class="...">` fails the entire def, not just the component. |
| `TailoringSpeed`, `SculptingSpeed`, `SmithingSpeed`, `UnskilledLaborSpeed` | Folded into `GeneralLaborSpeed` since 1.0. Replaced everywhere, merging the pairs that became duplicates (one `statOffsets` block cannot carry the same stat twice). |
| `ToxicSensitivity` | Became `ToxicResistance`, with the sense reversed: `-0.3` sensitivity is written `+0.3` resistance. |
| `MealRottable` | A meal base that has not existed since 1.0. The ten confections and the green tea inherited from it, so their whole defs failed and there was nothing left to eat. Reparented on `MealCooked`, the 1.6 equivalent — rots, keeps its ingredients. |
| Hediffs with no `<description>` | Fourteen of them. Tolerated in 1.0, refused in 1.6: `ErrorCheckAllDefs` emits one error per def. Descriptions written. |
| `placingDraggableDimensions`, `acceptFilth`, `acceptTerrainSourceFilth`, `holdSnow`, `workSpeedPenaltyOutdoors`, `workSpeedPenaltyTemperature` | Fields removed from the game. Harmless, but sixteen errors at every load. Taken out. |
| `WA_Wall_Demado`, `WA_Fence_Sukibei` | `Impassable` with a `fillPercent` below 1. In 1.6 the game refuses an impassable wall you can shoot through. Raised to 1. |
| `WhiteRice` | Came from the ZIPANGU mod, which is absent. Removed from five ingredient filters where `RawRice` already sat beside it. |
| `<designationCategoryDef>` | Renamed `<DesignationCategoryDef>`: the node name is what finds the type, and case matters. |
| `Languages/*/DefInjected/JoyKinds/` | Renamed `JoyKindDef/`. The folder has to carry the def type's name or nothing is injected — the three joy-kind translations had never worked. |
| `encoding="utf_8"` | Corrected to `utf-8` in nine language files. |
| `Lang_WA-Dressing.xml` (Simplified Chinese) | A stray `< ` before the XML declaration made the file unreadable. |
| Shogi board | Removed: Joy Preservation already carries a version of it. |
| `WA_SutrasDesk` | Japanese label and description, the last ones left on a visible concrete def. Put into English like the rest of the mod. |

Checked against RimWorld 1.6.4871: the fifteen def types used, the 56 classes named in `Class=`,
`thingClass`, `giverClass`, `driverClass` and `placeWorkers`, every stat, and every cross-reference
in costs, products and ingredients. No unresolved reference remains.

Left as found: `WA_Zabuton_Dummy` carries `Abstruct="true"`, a typo for `Abstract`. The typo is
load-bearing — the def has to stay concrete, three buildings use it as their
`interactionCellIcon`. Correcting it would break the irori.

---

## WA-only rights recheck — 2026-09-13

Tatara is excluded from this classification at the user's request; its separate
restriction is not attributed to WA. WA v1.0 (1548358607), by Udon, declares only 1.0
in its installed About.xml and Workshop listing. No licence file, redistribution
permission or prohibition was found in the inspected WA source XML/text files,
Workshop description or retrieved comment-page rights searches (pages 1–4).
Workflow classification for WA itself: silent, not open and not forbidden.
The Chinese translation contributor Shion is credited on the original Workshop page.
https://steamcommunity.com/sharedfiles/filedetails/?id=1548358607

Correction to older dependency notes: ResourcePackCore (1543671683) and
HealthDifferenceAuraCore (1544596991) are present in the local Workshop installation;
calling them untraceable is inaccurate. ResourcePackCore lists RimWorld相談所 as author,
not Udon, and its About.xml expressly states:
"Prohibiting modification and redistribution of this Mod."
Its upstream content therefore has a forbidden classification, independently of Tatara.
HealthDifferenceAuraCore's inspected About.xml declares 1.0 and contains no rights grant
or redistribution prohibition; no such notice was found by the source-text search.

Our WA-Materials.xml defines four replacement resources with locally written descriptions
and references to vanilla StoneBlocks/WoodLog/Cloth textures. Retaining RPC identifiers
for compatibility is not by itself evidence that upstream assets were copied. The
upstream resource restriction must not automatically be transferred to this replacement
implementation. Full provenance comparison of any retained RPC-derived content remains
unverified; no finding of prohibited copying is made here. The aura implementation is
recorded as rewritten, not a redistributed dependency assembly. Velcroboy is not a
source incorporated by this project and supplies no licence for Udon's work.

Evidence: local Workshop About.xml files under IDs 1548358607, 1543671683, 1544596991;
retrieved WA pages under .audit/rights-wa (local evidence, excluded from Git). The
ResourcePackCore web scrape did not provide a usable mod description; the restriction
above is evidenced by its installed About.xml, line 25. No claim that silence grants
permission is made. No publication or visibility change was performed in this recheck.


## Extraction completed

Tatara definitions, textures, kiln code and kiln translations were transferred to RolledUpSleeves on 2026-09-13. Historical credits remain in TATARA_HISTORY.md outside the installed Mod folder. JapaneseHomestead retains its WA content and locally reconstructed shared materials. No redistribution permission for WA is asserted.
