# Protocols read for this mod

What this session actually read, at which version, and whether it earned its place. Kept so a later pass doesn't
reread a document that has already proven useless for this mod, and rereads one that has moved since. "Version" is the
file's modification date (monorepo documents carry no version number); compare it with the file's date before rereading.

Last updated 2026-10-02.

| Doc | Version read | Read how | Useful here? |
| --- | --- | --- | --- |
| `AGENTS.md` | 2026-09-29 | in full | Yes — gate order, evidence-retention rule (keep the latest report per scenario, delete the rest). |
| `AUDIT.md` | 2026-10-02 | in full | Yes — the chain, the `done -> showcase` fall-back rule, the new `tested` criteria (no `@wip`, every `@requires` played, no manual test), pass ordering (new/red first, non-regression last), evidence keep rules. |
| `TRANSLATIONS.md` | 2026-10-02 | lines 1-200 (sections 1-3 and the start of 4) | Yes — the 2026-09-30 French agreement rule (three-segment switch, o-series) is what lowers this mod to `options`; `Make-FrenchReview.ps1` now exists. Not reread: the tail of section 4 and later. |
| `PUBLISHING.md` | 2026-10-02 | headings and lines 1-30 only | Partly — original-repo PR rule (line 20: no upstream repo exists here, so none is possible) and where `PUBLICATION.md`/`BACKLOG.md` are named. The body (description, images, CI) belongs to `tested -> prepublished`, not reached; reread then. |
| `MOD_SETTINGS.md` | 2026-09-13 (unchanged since the 2026-09-25 read) | not reread | No new ground: `settings_audit: not_applicable` still holds (no `Verse.Mod` subclass, no settings class). |
| `STYLE_RIMWORLD.md` | 2026-10-02 | not read | Not needed: no icon or Preview work. Reread when `Mod/About/` images are touched. |
| `WORKSHOP_COMMENTS.md` | 2026-10-02 | not read | Not needed: no comment goes out before `published`. |
| `scripts/SEARCHING.md` | 2026-09-27 | not read | Not needed: no cross-mod defName or class search. |
| `PickleTools/README.md`, `PickleTools/docs/steps.md` | 2026-10-01 | not read this pass | Reread before writing or fixing a step; the red aura and pastimes scenarios will need them. |
| `PickleTools/Headless/README.md` | 2026-09-26 | not read this pass | Not needed: no run launched (the Windows game never is). |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 2026-09-26 | not read | Not needed: no CI publish touched. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `docs/SUBMIT.md` | 2026-09-27 / 2026-09-26 | not read; `Submit-PickleRun.ps1 -List` only | Not needed yet: no ticket submitted this pass (the queue holds none for this mod). |
| `BACKLOG.md` (monorepo) | 2026-09-26 | `grep` for this mod: no entry | Not useful. |

Mod documents read this pass: `STATUS.md`, `CHANGELOG.md`, `TESTING.md`, `docs/PROTOCOLS-READ.md` (all in full), the Pickle
evidence reports (`summary.md`, `summary.json`, `junit.xml`, `Player.log` header) and `ATTRIBUTION.md` (source lines).
Not read this pass: `README.md`, `LICENSE`, `Mod/About/About.xml`, `Tests/Pickle/README.md`, the `.feature` files
(only grepped for `@wip`/`@requires`/`@review`).

Absent from this repo, deliberately: `PUBLICATION.md` (first needed at `tested -> prepublished`), `NOTES.md`, `BUGS.md`,
`BACKLOG.md` (no upstream repo, so no pull request to track; known defects live in `STATUS.md` and `TESTING.md`).
