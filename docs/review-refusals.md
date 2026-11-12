# Review refusals

ChatGPT suggestions from `/review-translation` that were refused. One line each: key or text, proposal, reason, date. The review sends this file with every page and does not propose these again.

| Key or text | Proposal | Reason | Date |
|---|---|---|---|
| `WA_Step.description` (French) | Replace "une escalier" with "un escalier" | Misread: the file already reads "évoquant un escalier" (masculine, correct). | 2026-11-12 |
| ChineseSimplified, ChineseTraditional, Japanese: mixed-script characters and simplified/traditional mixes (`WA_Glow_06Bonfire.description`, `WA_Hediff_Metabolic.stages.*`, `WA_Hediff_Nerikiri` stage label, `WA_Gravel*.description`, `WA_FoldingScreen.description`, `WA_Dressing_Princess`, `WA_Dressing_Sumoman`, `WA_Gate_IronGate`, `WA_Recipe_Kashiwa.description`, `WA_Glow_07LongBrazier.description`, `WA_Koto`, `WA_FarmPlant_Azuki`, `WA_MassCook_*`, nine `WA_Seat_Tatami_*.description`) | Edit the Chinese and Japanese texts | Upstream WA text, licence silent: an upstream pull request only, never a local edit. | 2026-11-12 |
| ChineseSimplified, ChineseTraditional, Japanese missing keys (58, 58 and 55 keys) | Add machine translations | No one here can judge Chinese or Japanese; the English fallback stays. | 2026-11-12 |
| French missing keys `WA_AlcoveBase`, `WA_Drawer`, `WA_WallKawaraBase`, `WA_MoatsBuilding`, `WA_FenceBase`, `WA_WallBase`, `WA_PlantBase` | Translate label and description | Abstract defs (`Abstract="True"`): never displayed. | 2026-11-12 |
| ChineseSimplified, ChineseTraditional `WA_FutonCategory.label` ("被子" / "被子") | Replace with "日式寝具" / "日式寢具" | Upstream WA Chinese text, licence silent: upstream pull request only. | 2026-11-12 |
| ChineseSimplified, ChineseTraditional `Enjoy_WA.label` ("雅乐" / "雅樂") | Replace with "日式传统消遣" / "日式傳統消遣" | Upstream WA Chinese text, licence silent: upstream pull request only. | 2026-11-12 |
| French `WA_SutrasDesk.description` | Rephrase the second sentence ("Ce travail lent et minutieux en fait aussi un lieu d'étude.") | Matter of taste: the current wording is correct and faithful to the English. | 2026-11-12 |
| Japanese `WA_Koto.description`, `WA_Karuta.description`, `WA_Glow_07LongBrazier.description` | Rewrite the Japanese texts | Upstream WA Japanese text, licence silent: upstream pull request only. | 2026-11-12 |
| Japanese `WA_FarmPlant_Azuki.description`, `WA_Recipe_Kasuteira.description`, `RPC_MakePureSilk.description`, `WA_Research_Building_Amusement.description`, `WA_AlcoveA` to `WA_AlcoveE` descriptions | Rewrite the Japanese texts | Upstream WA Japanese text, licence silent: upstream pull request only. | 2026-11-12 |
| Japanese `WA_Fusuma*`, `WA_Shoji*`, `WA_*Futon*` and food descriptions (longer than the English) | Shorten them | No in-game proof of truncation; upstream Japanese text, licence silent. | 2026-11-12 |
| ChineseSimplified, ChineseTraditional `WA_IchigoDaifuku.description`, `WA_Recipe_Kashiwa.description`, `WA_Recipe_Kintuba.description`, `WA_Recipe_Nerikiri.description`, `WA_Glow_04Bonbori.description` | Rewrite the Chinese texts | Upstream WA Chinese text, licence silent: upstream pull request only. | 2026-11-12 |
| Japanese `WA_DoBillsMakeGreenTea.gerund`, `WA_DoBillsIroriCooking.gerund` | Check punctuation and word order | ChatGPT itself says the render cannot be validated statically; no proposed text, upstream Japanese. | 2026-11-12 |
| Japanese `WA_MassCook_SimpleMeal.description` | Replace with "簡単な食事を調理します。" | Upstream WA Japanese text, licence silent: upstream pull request only. | 2026-11-12 |
| `WA_Dressing_Kaku.description` (English source "Kimono of Elder.") | Edit the English source column | Source column of a port with a silent licence and no upstream remote; the French follows the key instead. | 2026-11-12 |
| `WA_Wall_DryMoats.description` (English) | Claimed to copy the water moats text | Already correct (dry moat); only `WA_Wall_WaterMoats` was wrong and is fixed. | 2026-11-12 |
| `TRANSLATION_REVIEW.md` header, Original/English columns holding Chinese or Japanese | Add a source rule | Generation limit of the report, not a mod text defect. | 2026-11-12 |
