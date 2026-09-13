# Changelog

## Unreleased

### Existing port imported from the monorepo
- Port WA content and the Tatara ironmaking chain to RimWorld 1.6.
- Replace unavailable material and apparel-aura dependencies locally.
- Include firing kiln implementation in WA.dll and optional Glass+Lights costs.
- Preserve original art, attribution and existing language resources.

### Repository preparation — 2026-09-13
- Prepare an independent private repository with explicit no-redistribution notices.
- Add initial English documentation and keep build intermediates inside the repository.
- Add the private-build title suffix and repository link to About metadata.

The existing port has not passed final in-game validation. French coverage and some
English translations remain incomplete; see STATUS.md for the audited state.

### Tatara extraction — 2026-09-13
- Move the ironmaking definitions, textures, kiln implementation and translations to
  the separate RolledUpSleeves catalogue. WA retains soil, charcoal and their recipes.
- Rebuild WA.dll with only its apparel-aura implementation.
- Update current metadata and rights notices for the WA-only scope.
- Existing saves using Tatara must enable RolledUpSleeves together with this update;
  back up first. Save migration has not been tested in game.

### Localization and validation — 2026-09-13
- Move Preview text to the lower right and display the unofficial suffix.
- Add French translations for 458 concrete inherited/direct text fields and English
  corrections for Japanese reports and inaccurate source wording.
- Make the advertised aquarium concrete so it can be constructed.
- Add reproducible translation generation, static checks and functional scenarios.
- Validate 1,896 injection keys without errors and 861 selected Core+WA references.
- Runtime behavior, aura gameplay and save migration remain untested.
