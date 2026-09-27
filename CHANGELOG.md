# Changelog

## Unreleased

The `1.0.0` tag and GitHub release land here once the item created by `0.1.0` passes
final in-game validation and the owner switches it to public.

## [0.1.0] - 2026-09-27

Creation of a `Mod/About/PublishedFileId.txt` (Workshop item `3806764776`). This entry
does not claim the mod is public or tested: the item is created private, as Steam
creates every item, and stays that way until the owner switches it herself. It records
what the prepublishing upload contained — `Mod/` as it stood at this commit — and
everything that had already changed since the port was imported:

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
