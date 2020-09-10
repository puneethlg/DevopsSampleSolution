[string]$Year = get-date -format yy
[string]$DayOfYear = (Get-Date).DayofYear
$version = @"
$(GitVersion.SemVer)
"@
$subVersion = $version.Remove(1,1)
$newVersion = $subVersion.Replace('0-unstable.','dev.')
$format = $Year+"."+$DayOfYear+"."+"03"+$newVersion
#$format =$version+"."+'02'+"."+$DayOfYear+"."+$Year
Write-Host $format 
Write-Verbose -Verbose "##vso[build.updatebuildnumber]$format"