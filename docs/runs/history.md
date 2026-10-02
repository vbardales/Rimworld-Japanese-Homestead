# Run history

One line per Pickle run. Older runs are superseded by the line below them; the verdict lives in
`Tests/Pickle/Evidence/<run>/` (on disk, not in git) and `STATUS.md` cites the line.

- 2026-09-28 pass 1 (English, bare) on `16826d1`: first play of the suite; failures traced to two step bugs (wearing vs dressing, anchor overlap). Superseded.
- 2026-09-29 pass 1/2/3 reruns on `d46ec68`: pass 1 13/25 passed, 11 failed; pass 2 14/25, 10 failed; pass 3 WSL runner segfault (exit 139), no report. Three more suite bugs found; superseded by 2026-09-30.
- 2026-09-30 pass 1 (English, bare, `sans-facultatifs`) on `7fd0d8b` (Mod/ and Tests/Pickle identical to `79874e9`): `exitReason: failed`, 25 scenarios, 13 passed, 11 failed, 1 skipped, flaky 0. Evidence `2026-09-29-pass1-en-rerun2`.
- 2026-09-30 pass 2 (French, bare) on `7fd0d8b`: `exitReason: failed`, 25 scenarios, 13 passed, 11 failed, 1 skipped, flaky 0. Evidence `2026-09-29-pass2-fr-rerun2`.
- 2026-09-30 pass 3 (English, Glass+Lights) on `7fd0d8b`: `exitReason: failed`, 17 scenarios played (stopped before 04-aquarium), 10 passed, 7 failed, 0 skipped, flaky 0. Evidence `2026-09-29-pass3-en-glass-rerun2`.
  Common failures of the three passes: aura (`Near carries no HDA_Hediff_...`, 3 scenarios) and pastimes (`CanBeGivenTo holds but TryGiveJob returned no job`, 7 scenarios). Nothing here proves the mod works; the 79874e9 fixes did not clear them.
