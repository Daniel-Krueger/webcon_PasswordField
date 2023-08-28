param($absoluteProjectFolder)
$fileContent = (Get-Content $absoluteProjectFolder\Properties\AssemblyInfo.cs -Encoding UTF8) | Out-String
$pattern = new-object System.Text.RegularExpressions.Regex("AssemblyVersion\(`"[^`"]*")
$matches = $pattern.match($fileContent)
$currentVersion = $matches.groups[0].Value
$buildVersion= $currentVersion.substring(0,$currentVersion.LastIndexOf('.')+1)

$increasedRevisionVersion = [Int]::Parse($currentVersion.substring($currentVersion.LastIndexOf('.')+1))+1
$newVersion = $buildVersion + $increasedRevisionVersion.ToString()
$fileContent= $fileContent.Replace($currentVersion,$newVersion)
$fileContent.TrimEnd("`r","`n") | Out-File -FilePath $absoluteProjectFolder\Properties\AssemblyInfo.cs  -Encoding utf8