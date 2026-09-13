# Functional validation scenarios

Target: RimWorld 1.6. These scenarios are written, not executed. Use separate backed-up
test saves and record exact game version, mod list, language, actions, outcomes and logs.
Run the core scenarios in English and French. Do not mark tested until they pass.

| Scenario | Preconditions | Actions | Expected result |
| --- | --- | --- | --- |
| Clean load | Core + Japanese Homestead, new colony | Start game, create colony, inspect logs and architect/research tabs | No missing Def/class/translation errors; WA tabs and text readable |
| Existing WA save | Backed-up colony using earlier WA content | Enable current WA and reload; inspect buildings, outfits, crops and bills; save and reload again | Retained content and settings of buildings persist without errors |
| Tatara migration | Backed-up pre-extraction save with kiln, unfinished batch, active hauling job and research; current RolledUpSleeves installed | Update both mods together and load, never saving between removal and replacement; finish kiln work, save and reload | Tatara content preserved by RUS; no duplicate Defs/classes or lost batch; WA resources still usable |
| Basic building | New colony, materials and research available | Build walls, fusuma, shoji, tatami, gravel, futons, zabuton, tokonoma and screens; rotate supported furniture and assign beds | Correct textures, construction costs, placement, room access and sleeping; no broken rotations |
| Aquarium without Glass | Core + WA only | Unlock furniture research, build aquarium with 80 wood and 40 steel; inspect graphics, quality, selection overlay, room temperature and logs | Aquarium is present and buildable, no missing components/errors; cooling behavior and placement overlay require explicit observation |
| Aquarium with Glass | Core + Glass+Lights 1.6 + WA | Repeat aquarium construction and inspect cost list | Uses 80 wood and 60 Glass, no steel or unresolved resource; no duplicate mod-required costs |
| Food and materials | Crops mature, workbenches available | Grow/harvest azuki, tea, rush, kozo and mulberry; make paper, silk, soil, charcoal, tea and sweets; cook bulk meals | All recipes find ingredients, finish and yield correct products; labels and job reports translated |
| Pastimes | Recreation time, accessible objects | Use tea hearth, koto, karuta, shell matching, sugoroku and incense; observe jobs and recreation meters | Jobs can start and finish, appropriate recreation gained, no raw keys or missing job classes |
| Apparel auras | Player colonists plus friendly and hostile targets at known distances; princess and wrestler outfits | Equip each outfit, wait across multiple pulse intervals, cross range boundary, unequip; inspect hediffs and decay | Correct friendly/hostile targeting, wearer excluded, severity bounded by Def values, no effects beyond range and no further pulses after removal |
| Aura save/load | Colony with aura wearers and active hediffs | Save/reload while wearing, change outfit and verify subsequent pulses | No lost apparel, duplicated effects, exceptions or stale behavior |
| Food effects | Colonists able to consume sweets and tea | Consume several types, inspect stage labels, descriptions and discovery letters | Effects apply and decay as defined; {0} resolves to pawn name, no untranslated Japanese or broken formatting |
| No settings | Core + WA | Inspect Mod options and bottom main buttons | No empty WA settings page or shortcut; RIMMSQOL not needed |
| Language regression | Repeat with English and French | Inspect all architect categories, research, build info, recipe bills, jobs, clothing, hediffs and letters at normal UI scale | No raw keys, accidental fallback, clipped critical labels or malformed parameters |

Record pass/fail and Player.log locations in Tests/Runtime-results.md when performed.
No runtime results file is created merely to imply these checks occurred.
