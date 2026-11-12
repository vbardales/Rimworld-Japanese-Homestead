# Historical attribution — extracted content

The following describes Tatara formerly included here, now moved to RolledUpSleeves. It is preserved as historical attribution and does not describe the current WA-only payload.

## たたら製鉄 (Tatara Ironmaking)

- **Original author:** Tosenbo, with textures from IGNI and Gnome and the kiln code from udon —
  the same udon who wrote WA.
- **Source:** Steam Workshop [`1833556876`](https://steamcommunity.com/sharedfiles/filedetails/?id=1833556876),
  1.0 only, last updated 20 February 2020. The page is still up.
- **Reused here:** the ironmaking chain and nothing else.

### ⛔ Why this can never be published

**The author refuses redistribution by name.** The last three lines of his `About.xml`, in
Japanese and then in English, inside `[h1][b]`:

> このModは大勢の協力者によって出来たＭＯＤです。再配布しないでください。
> This mod is a mod made by a large number of collaborators. Please do not redistribute.

The same sentence is on the Workshop page, the description having been sent to Steam when the item
was created. There is no `LICENSE` file and no repository, so a survey looking for a licence *file*
finds nothing and concludes the mod is unlicensed and dead — which under the repository rule would
make it publishable. **Refused is not silent.** The clause sat in the prose, after the thanks to
the people who had contributed art and code, which is exactly where a metadata scan does not look.

This mod was already a private build. It stays one, and this section is the reason it can never
stop being one.

### What came over

| Reused | Detail |
|---|---|
| 13 buildings | magnetite vein, charcoal mound, two iron sand sluices, tatara furnace, great smithy, smithy, firing kiln, production waterwheel, three bellows, ironworks shelf |
| 4 materials | kera, zuku, raw steel, building blocks |
| 6 unfinished things | the work-in-progress items the recipes need |
| 42 recipes | charcoal, firewood, iron sand, kera-oshi and zuku-oshi, wrought iron, pig iron, steel, stonecutting, salvage |
| 6 research projects | the closure the chain needs, no more |
| 42 textures, 4.9 MB | `Textures/Tatara/` |
| `FiringKiln.dll` | 9 classes, rewritten into `WA.dll` |

### What stayed behind

The other half of the mod is `[ZP] Sengoku period`: twenty weapons — katana, odachi, naginata,
yumi with its arrow cylinders, tanegashima, kunai, horokudama — ten pieces of armour, two shields,
five `DamageDef`s, maneuvers, tool capacities and seven weapon-smithing research projects. None of
it is here, which also drops **JecsTools** entirely: `CompOversizedWeapon` and `CompSlotLoadable`
existed only for the weapons.

The wardrobe and the twelve hairstyles went to **Nelim's Hand-Me-Downs**, and the two trait
spectrums to **Nelim's A Perfect Mind in a Perfect Body**. Also dropped: two `HugsLib.UpdateFeatureDef`
entries, HugsLib not being in the load order.

### The chain had no beginning

Tatara never defined **iron sand**. Nor pig iron, wrought iron, tamahagane, firewood, sand, gravel
or mud: all eight lived in ResourcePackCore, and Tatara only *patched* them. The two materials the
mod is named after came from a base mod that no longer exists.

They are recreated here, in `Defs/Tatara/Items_RPC.xml`, joining the four this mod already replaces
above. Five of the eight have real art — Tosenbo shipped icons for iron sand, firewood, pig iron,
wrought iron and tamahagane even though the defs were upstream — and sand, gravel and mud are
tinted vanilla textures like the soil.

**The three metals had no `stuffProps` at all.** Upstream, a patch gave them the `Metallic`
category and stopped there, so anything built from pig iron, wrought iron or tamahagane silently
fell back on defaults: same hit points, same armour, same damage, whichever you chose. They are
written out here and placed around steel — pig iron brittle and cheap, wrought iron soft and
tough, tamahagane sharp and worth about twice steel.

And the four gathering spots that supplied sand, gravel and mud are gone with the same base mod,
which left the sluice with an ingredient filter it could never fill. Three recipes with no
ingredients, on benches the colony already has, in the same shape as `WA_DigSoil` above.

### What 1.6 broke

Two of the rows in the WA migration table above are the same defects, in the same places, five
years apart:

- **`CompProperties_RoomIdentifier`** on the ironworks shelf. Same comp, same removal, same
  consequence: the whole def fails, not just the component.
- **`SmithingSpeed`, `TailoringSpeed` and `UnskilledLaborSpeed`**, in the recipes and on the
  benches. Same fold into `GeneralLaborSpeed`.

Beyond those: the mod's own `[Zipangu]` architect tab and `Tatara` research tab both gave way to
this mod's `WA_Builder` and `WA_Research`, which is also what keeps the two from colliding with
Rising Sun Culture.

### The firing kiln

`FiringKiln.dll` is nine classes and about 730 lines around one building that is loaded, sealed,
and emptied — a hauling job at each end and an unattended burn in between, rather than a work
table with bills. It is now part of `WA.dll`, in the `WA` namespace, and three things changed on
the way:

- `Tick()` is `protected` in 1.6, `MapMeshFlag` became `MapMeshFlagDefOf`, `Draw()` became
  `DrawAt(Vector3, bool)`, and `ReceiveCompSignal` is `protected` too.
- **The six Keyed strings were bare words** — `Baked`, `ContainsMaterial`, `BakingProgress` — in a
  database every mod shares. Whichever mod loaded last decided what the kiln said. Prefixed
  `WA_FK_`. The job defNames went the same way. The "needs material" string was hardcoded
  Japanese; it is a key now.
- **The `RuleDef` is dropped.** It registered a BaseGen symbol, `addMaterialToFiringKiln`, that
  pre-loads kilns when the map generator builds a settlement — and nothing in the mod ever emitted
  that symbol. Its `SymbolResolver` went with it.

Also: the work giver class was spelled `WorkGiver_FillFirinKiln` upstream.

### Two textures that had never loaded

`FK_FiringKiln_wast.png` and `RPC_CharcoalPit_wast.png`. `Graphic_Multi` resolves `_north`,
`_east`, `_south` and `_west`; `_wast` is none of those, so both buildings had been drawing a
mirrored east face from the west since the mod shipped. Renamed, and the west view finally
appears.

**This is the same typo, by the same author, as in Slippers & Mats** — where a slipper's
`_wast.png` had gone unloaded since 2022. Worth knowing when the next Tosenbo mod comes in.

Not a defect, and worth stating because it nearly was treated as one: `TataraFurnace_northm.png`
and its three siblings are **colour masks**, which is what `Graphic_Multi` asks for beside
`_north` when the shader is `CutoutComplex`. The `m` is the convention, not a slip.

### Left as found

The tatara furnace and the balance bellows have no `_south` texture. `Graphic_Multi` falls back to
`_north` for a missing south, silently and correctly, so both show their north face from below.
That is how they were drawn and how they looked in 1.0.

---

**Personal use. Do not republish.** Udon's art and design, and Tosenbo's, and the art IGNI and
Gnome contributed to his mod. If an original author would rather this did not exist, say so and it
goes.


