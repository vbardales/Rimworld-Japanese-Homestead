# Review refusals

ChatGPT suggestions from `/review-translation` that were refused. One line each: key or text, proposal, reason, date. The review sends this file with every page and does not propose these again.

| Key or text | Proposal | Reason | Date |
|---|---|---|---|
| `WA_Step.description` (French) | Replace "une escalier" with "un escalier" | Misread: the file already reads "évoquant un escalier" (masculine, correct). | 2026-11-12 |
| ChineseSimplified, ChineseTraditional, Japanese: mixed-script characters and simplified/traditional mixes (`WA_Glow_06Bonfire.description`, `WA_Hediff_Metabolic.stages.*`, `WA_Hediff_Nerikiri` stage label, `WA_Gravel*.description`, `WA_FoldingScreen.description`, `WA_Dressing_Princess`, `WA_Dressing_Sumoman`, `WA_Gate_IronGate`, `WA_Recipe_Kashiwa.description`, `WA_Glow_07LongBrazier.description`, `WA_Koto`, `WA_FarmPlant_Azuki`, `WA_MassCook_*`, nine `WA_Seat_Tatami_*.description`) | Edit the Chinese and Japanese texts | Upstream WA text, licence silent: an upstream pull request only, never a local edit. | 2026-11-12 |
| ChineseSimplified, ChineseTraditional, Japanese missing keys (58, 58 and 55 keys) | Add machine translations | No one here can judge Chinese or Japanese; the English fallback stays. | 2026-11-12 |
| French missing keys `WA_AlcoveBase`, `WA_Drawer`, `WA_WallKawaraBase`, `WA_MoatsBuilding`, `WA_FenceBase`, `WA_WallBase`, `WA_PlantBase` | Translate label and description | Abstract defs (`Abstract="True"`): never displayed. | 2026-11-12 |
| `WA_Dressing_Kaku.description` (English source "Kimono of Elder.") | Edit the English source column | Source column of a port with a silent licence and no upstream remote; the French follows the key instead. | 2026-11-12 |
| `WA_Wall_DryMoats.description` (English) | Claimed to copy the water moats text | Already correct (dry moat); only `WA_Wall_WaterMoats` was wrong and is fixed. | 2026-11-12 |
| `TRANSLATION_REVIEW.md` header, Original/English columns holding Chinese or Japanese | Add a source rule | Generation limit of the report, not a mod text defect. | 2026-11-12 |
