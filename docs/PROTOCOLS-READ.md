# Protocols read for this mod

What this session actually read, at which version, and whether it earned its place. Kept so
a later pass doesn't reread a document that has already proven useless for this mod, and
rereads one that has moved since.

| Doc | Version read | Useful here? |
| --- | --- | --- |
| `AGENTS.md` | 2026-09-25 | Yes — the ordered gates (settings, then translations, then preTest) and the evidence-retention rule. |
| `AUDIT.md` | 2026-09-25 | Yes — the whole chain, and the fail-fast policy this mod hasn't reached yet. |
| `MOD_SETTINGS.md` | 2026-09-25 | No new ground: `settings_audit: not_applicable` was already established and still holds — no `Verse.Mod` subclass, no settings class. |
| `PUBLISHING.md` | 2026-09-25 | Yes, partially — confirmed committing `About/PublishedFileId.txt` immediately, and that visibility toggling is Virginie's alone, after subscribing to the item and testing it for real. The description-order and dependency sections are for `tested → prepublished`, not reached yet. |
| `TRANSLATIONS.md` | 2026-09-25 | Structure known, not reapplied this pass — no translation file changed since the 2026-09-13 audit that already ran `Check-DefInjected.ps1`. |
| `STYLE_RIMWORLD.md` | 2026-09-25 | Not useful this pass — no icon or Preview work today; the ModIcon-control section stays for whoever next touches `Mod/About/`. |
| `WORKSHOP_COMMENTS.md` | 2026-09-27 | Not useful yet — the item is private, no comment goes out before `published`. |
| `scripts/SEARCHING.md` | 2026-09-25 | Not needed — no cross-mod defName or class search this pass. |
| `PickleTools/README.md`, `Headless/README.md`, `docs/steps.md` | 2026-09-25/26 | Not needed — no Pickle suite exists for this mod yet, and none was run. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 2026-09-26 | Not needed — no CI publish touched. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `docs/SUBMIT.md` | 2026-09-26 | Not needed — no Pickle run submitted this pass. |

`TEST_SCENARIOS.md`, `CHANGELOG.md`, `STATUS.md`, `README.md`, `ATTRIBUTION.md`, `LICENSE`
belong to this mod and were read in full, not logged above since they aren't shared protocols.
`PUBLICATION.md`, `TESTING.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md` don't exist in this repo yet —
see the session report for which of them the `tested → prepublished` gate will actually need.
