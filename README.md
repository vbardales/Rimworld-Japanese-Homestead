# Nelim's Japanese Homestead (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

A RimWorld 1.6 revival of Udon's WA.
Japanese architecture, furniture, tatami, gardens, pastimes, clothing, crops and
confections accompany locally implemented apparel auras.

## Rights and credits

WA is classified as silent: no explicit licence or permission was found. Original WA content belongs to Udon; the Chinese translation credits Shion. Read [ATTRIBUTION.md](ATTRIBUTION.md) and [LICENSE](LICENSE). This WA-only repository is public. Tatara has moved to the separate private RolledUpSleeves catalogue; it is no longer included here. No general adoption permission is granted for third-party content.

## Personal installation

Use the contents of `Mod/` as the mod directory under RimWorld's Mods folder, or point
an existing directory junction there. Do not install the repository root as a mod.
Enable package `nelim.wa` in RimWorld 1.6. Glass+Lights is an optional integration;
its presence changes the aquarium material cost. Full dependency validation is pending.
Removing this content mod from a save can remove its buildings and items. Keep backups.

## Build

Install the .NET SDK and run:

```powershell
dotnet build Source/WA/WA.csproj -c Release
```

Reference assemblies come from Krafs.Rimworld.Ref via NuGet. The compiled WA.dll goes
to `Mod/Assemblies/`; intermediate files remain in `.build/`, outside installed content.

## Validation status

See [STATUS.md](STATUS.md). The audited build matches the delivered DLL, XML parsing
and existing injection-path checks passed. No final in-game validation is claimed.
French is absent and some Japanese Def text lacks English coverage. There are no
mod-wide settings or empty settings shortcuts; vanilla gameplay controls remain available.

## Repository layout

- `Mod/`: installed game content and copies of rights documentation.
- `Source/`: C# source and project configuration.
- `Art/`: original showcase artwork.
- `STATUS.md`: current workflow state and preserved audit history.
- `CHANGELOG.md`: changes and known release limitations.

Source repository: https://github.com/vbardales/Rimworld-Japanese-Homestead
