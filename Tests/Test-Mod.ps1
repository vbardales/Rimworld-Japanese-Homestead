param([string]$GameRoot='C:/Program Files (x86)/Steam/steamapps/common/RimWorld', [string]$GlassRoot='C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/826153738')
$ErrorActionPreference='Stop';$root=Split-Path $PSScriptRoot -Parent
$errors=[Collections.Generic.List[string]]::new()
function Assert($condition,[string]$message){if(-not $condition){$errors.Add($message)}}
$own=@(Get-ChildItem "$root/Mod/Defs" -Recurse -Filter *.xml|ForEach-Object{[xml](Get-Content $_.FullName -Raw)})
$core=@(Get-ChildItem "$GameRoot/Data/Core/Defs" -Recurse -Filter *.xml|ForEach-Object{[xml](Get-Content $_.FullName -Raw)})
$defs=@{};$parents=@{};$names=@{}
foreach($doc in @($core)+@($own)){foreach($n in $doc.SelectNodes('/Defs/*')){if($n.defName -and $n.GetAttribute('Abstract') -ine 'true'){$k=$n.LocalName+':'+$n.defName;Assert (-not $defs.ContainsKey($k)) "Duplicate Def $k";$defs[$k]=$n;$names[[string]$n.defName]=$true};if($n.GetAttribute('Name')){$parents[$n.GetAttribute('Name')]=$true}}}
$refs=0
$xpath='//products/*|//costList/*|//thingDefs/li|//recipeUsers/li|//recipes/li|//fixedBillGiverDefs/li|//researchPrerequisites/li|//prerequisites/li|//researchPrerequisite|//unfinishedThingDef|//mineableThing|//designationCategory|//tab|//effectWorking|//soundWorking|//workSpeedStat|//workSkill|//workType|//statBases/*|//statOffsets/*|//stuffCategories/li|//thingCategories/li|//hediffToAdd|//joyKind|//joySkill|//taleOnCompletion|//researchUnlocks/li|//harvestedThingDef|//ingestEffect'
foreach($doc in $own){foreach($n in $doc.SelectNodes('//*[@ParentName]')){Assert ($parents.ContainsKey($n.GetAttribute('ParentName'))) "Missing parent $($n.GetAttribute('ParentName'))"};foreach($n in $doc.SelectNodes($xpath)){$v=if($n.ParentNode.LocalName -in 'products','costList','statBases','statOffsets'){$n.LocalName}else{$n.InnerText};if(-not $v){continue};$refs++;Assert ($names.ContainsKey($v)) "Missing Core+WA reference $v ($($n.LocalName))"}}
$all=@(Get-ChildItem "$root/Mod" -Recurse -Filter *.xml);foreach($f in $all){$null=[xml](Get-Content $f.FullName -Raw)}
$inventory=Get-Content "$PSScriptRoot/TranslationInventory.json" -Raw|ConvertFrom-Json
$translated=@{};foreach($f in Get-ChildItem "$root/Mod/Languages/French/DefInjected" -Recurse -Filter *.xml){$d=[xml](Get-Content $f.FullName -Raw);foreach($n in $d.DocumentElement.ChildNodes|Where-Object NodeType -eq Element){$k=(Split-Path $f.DirectoryName -Leaf)+':'+$n.Name;Assert (-not $translated.ContainsKey($k)) "Duplicate FR $k";$translated[$k]=$n.InnerText}}
foreach($row in $inventory){$k=$row.type+':'+$row.key;Assert ($translated.ContainsKey($k)) "Missing FR $k";Assert (-not [string]::IsNullOrWhiteSpace($translated[$k])) "Empty FR $k";Assert ($row.english -notmatch '[一-龯ぁ-んァ-ン]') "Non-English text $k";foreach($language in 'french','english'){$a=(@([regex]::Matches($row.source,'\{[^{}]+\}')|ForEach-Object Value)|Sort-Object)-join ',';$b=(@([regex]::Matches($row.$language,'\{[^{}]+\}')|ForEach-Object Value)|Sort-Object)-join ',';Assert ($a -eq $b) "Parameter mismatch $language $k"}}
$about=[xml](Get-Content "$root/Mod/About/About.xml" -Raw)
Assert ($about.ModMetaData.packageId -eq 'nelim.wa') 'PackageId changed'
Assert ($about.ModMetaData.description.Trim().EndsWith('[url=https://github.com/vbardales/Rimworld-Japanese-Homestead]Source code on GitHub[/url]')) 'Repository link missing'
$glass=[xml](Get-Content "$GlassRoot/About/About.xml" -Raw)
Assert ($glass.ModMetaData.packageId -ieq 'NanoCE.GlassLights') 'Glass packageId mismatch'
Assert ($glass.ModMetaData.name -eq 'Glass+Lights') 'Glass patch display-name mismatch'
$glassDefs=@(Get-ChildItem "$GlassRoot/Defs","$GlassRoot/v1.6/Core/Defs" -Recurse -Filter *.xml|ForEach-Object{[xml](Get-Content $_.FullName -Raw)})
Assert (@($glassDefs|ForEach-Object{$_.SelectNodes('/Defs/ThingDef[defName="Glass"]')}).Count -gt 0) 'Glass target not found'
$aquarium=$defs['ThingDef:WA_Aquarium'];Assert ($aquarium.costList.Steel -gt 0) 'Base aquarium must use steel without Glass'
$patch=[xml](Get-Content "$root/Mod/Patches/Patches_GlassLights.xml" -Raw);Assert ($patch.Patch.Operation.GetAttribute('Class') -eq 'PatchOperationFindMod') 'Patch is not conditional';Assert ($patch.Patch.Operation.mods.li -eq $glass.ModMetaData.name) 'Patch gate differs from mod name';$changed=$aquarium.CloneNode($true);$cost=$changed.SelectSingleNode('costList');$null=$changed.ReplaceChild($changed.OwnerDocument.ImportNode($patch.Patch.Operation.match.value.costList,$true),$cost);Assert ($changed.costList.Glass -eq 60 -and -not $changed.costList.Steel) 'Glass-present cost replacement failed'
$settings=@(Get-ChildItem "$root/Source" -Recurse -Filter *.cs|Select-String -Pattern 'ModSettings|SettingsCategory|DoSettingsWindowContents|class\s+\w+\s*:\s*(Verse\.)?Mod\b');Assert ($settings.Count -eq 0) 'Settings changed; audit required'
Assert (@($own|ForEach-Object{$_.SelectNodes('/Defs/MainButtonDef')}).Count -eq 0) 'Unexpected settings shortcut'
foreach($file in 'README.md','LICENSE','ATTRIBUTION.md','CHANGELOG.md'){Assert ((Get-FileHash "$root/$file").Hash -eq (Get-FileHash "$root/Mod/$file").Hash) "Distributed copy differs: $file"}
if($errors.Count){$errors|ForEach-Object{Write-Output "FAIL $_"};throw "$($errors.Count) static checks failed"}
"PASS: $($all.Count) XML files; $refs selected references resolve in Core+WA; $($inventory.Count) EN/FR text entries and parameters; conditional aquarium costs; settings surface; metadata copies."
'No game execution, complete engine Def loading, optional mod runtime or save migration is claimed.'

