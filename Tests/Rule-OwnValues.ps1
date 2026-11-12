# What only this mod asserts: the package identity, the conditional Glass+Lights patch and the two aquarium costs (without and with Glass+Lights).
# The generic checks (XML parse, Def references against Core, duplicate defNames, French coverage, About shape, distributed copies, settings absence)
# are the shared scripts' (Check-ModBasics, Check-DefRefs, Check-Translations, Check-SettingsContract), not repeated here.
# Takes -ModRoot (repository root), -GlassRoot (installed Glass+Lights, optional: the patch gate is also checked against its About.xml when found)
# and -SharedDir (unused, kept for the Test-Mod.ps1 contract). Prints findings, exits 1 on any.
param(
    [string]$ModRoot = (Join-Path $PSScriptRoot '..'),
    [string]$SharedDir,
    [string]$GlassRoot = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/826153738'
)
$ErrorActionPreference = 'Stop'
$ModRoot = (Resolve-Path -LiteralPath $ModRoot).Path
$mod = Join-Path $ModRoot 'Mod'
$script:findings = New-Object System.Collections.Generic.List[string]
function Assert-True($Condition, [string]$Message) { if (-not $Condition) { $script:findings.Add("FAIL: $Message") } }

$meta = [xml](Get-Content (Join-Path $mod 'About/About.xml') -Raw)
Assert-True ($meta.ModMetaData.packageId -ceq 'nelim.japanesehomestead') 'PackageId is nelim.japanesehomestead'
Assert-True ($meta.ModMetaData.description.Trim().EndsWith('[url=https://github.com/vbardales/Rimworld-Japanese-Homestead]Source code on GitHub[/url]')) 'Description ends with the repository link'

$aquarium = $null
foreach ($file in Get-ChildItem (Join-Path $mod 'Defs') -Recurse -Filter *.xml -File) {
    $xml = [xml](Get-Content $file.FullName -Raw)
    $node = $xml.SelectSingleNode('/Defs/ThingDef[defName="WA_Aquarium"]')
    if ($node) { $aquarium = $node }
}
Assert-True ($null -ne $aquarium) 'WA_Aquarium is defined'
if ($aquarium) {
    Assert-True ([int]$aquarium.costList.WoodLog -eq 80) 'Base aquarium costs 80 wood'
    Assert-True ([int]$aquarium.costList.Steel -eq 40) 'Base aquarium costs 40 steel without Glass+Lights'
    Assert-True ($null -eq $aquarium.costList.Glass) 'Base aquarium has no glass cost'
}

$patchPath = Join-Path $mod 'Patches/Patches_GlassLights.xml'
Assert-True (Test-Path $patchPath) 'Glass+Lights patch file present'
if ((Test-Path $patchPath) -and $aquarium) {
    $patch = [xml](Get-Content $patchPath -Raw)
    $op = $patch.Patch.Operation
    Assert-True ($op.GetAttribute('Class') -eq 'PatchOperationFindMod') 'Glass+Lights patch is conditional (PatchOperationFindMod)'
    Assert-True ($op.mods.li -eq 'Glass+Lights') 'Patch gate is the display name "Glass+Lights"'
    # Apply the replacement by hand on a clone: the cost with Glass+Lights is 80 wood and 60 glass, no steel.
    $changed = $aquarium.CloneNode($true)
    $null = $changed.ReplaceChild($changed.OwnerDocument.ImportNode($op.match.value.costList, $true), $changed.SelectSingleNode('costList'))
    Assert-True ([int]$changed.costList.WoodLog -eq 80) 'Aquarium with Glass+Lights keeps 80 wood'
    Assert-True ([int]$changed.costList.Glass -eq 60) 'Aquarium with Glass+Lights costs 60 glass'
    Assert-True ($null -eq $changed.costList.Steel) 'Aquarium with Glass+Lights has no steel'
}

$glassAbout = Join-Path $GlassRoot 'About/About.xml'
if (Test-Path $glassAbout) {
    $glass = [xml](Get-Content $glassAbout -Raw)
    Assert-True ($glass.ModMetaData.packageId -ieq 'NanoCE.GlassLights') 'Installed Glass+Lights packageId is NanoCE.GlassLights'
    Assert-True ($glass.ModMetaData.name -eq 'Glass+Lights') 'Installed Glass+Lights display name matches the patch gate'
} else {
    Write-Output "NOTE: Glass+Lights not installed at $GlassRoot; its About.xml was not compared with the patch gate."
}

if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Output $_ }; Write-Output "$($script:findings.Count) finding(s)"; exit 1 }
Write-Output 'PASS: package identity, conditional Glass+Lights patch, aquarium costs without and with Glass+Lights.'
