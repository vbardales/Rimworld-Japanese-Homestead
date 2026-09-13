# Automated checks

Run from the repository root with PowerShell and the .NET SDK:

```powershell
dotnet build Source/WA/WA.csproj -c Release
./Tests/Test-Mod.ps1
../scripts/Check-DefInjected.ps1 -TransMod "$PWD/Mod" -ExtraAssemblies "$PWD/Mod/Assemblies/WA.dll"
```

Test-Mod accepts GameRoot and GlassRoot for installations in other locations.
Check-DefInjected is the shared parent workspace checker, not bundled with the mod.
Recorded outputs are Static-results.txt and DefInjected-results.txt.

The static suite parses distributed XML, checks selected Core+WA references,
French coverage and formatting parameters, conditional aquarium costs against the
installed optional mod, metadata copies and the absence of a settings surface.
The shared checker resolves translation injection paths against loaded definitions
and assembly fields. These are automated data/integration checks, not game execution.

Build-Translations.ps1 regenerates EN/FR files using stable SourceStrings.json IDs
and the EnglishByIndex/FrenchByIndex dictionaries. English source text is retained
where no override is needed. TranslationInventory.json records resolved fields.

The real map component depends on Unity/RimWorld pawn, health, tick and save state.
Its behavior is covered by written runtime scenarios in ../TEST_SCENARIOS.md;
these scenarios have not been executed. No substitute game implementation is used
as evidence that the delivered component works in game.
