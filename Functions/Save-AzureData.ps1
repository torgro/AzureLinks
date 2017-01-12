function Save-AzureData
{
[cmdletbinding()]
Param(
    $Path
    ,
    $AzureData
)

$f = $MyInvocation.InvocationName
Write-Verbose -Message "$f -  START"
if (-not $PSBoundParameters.ContainsKey("Path"))
{
    $path = $PSScriptRoot | Split-Path -Parent
}

$fileName = Get-AzureDataFile
$fullpath = Join-Path -Path $path -ChildPath $fileName

Write-Verbose -Message "$f -  Fullpath is [$fullpath]"
$json = ConvertTo-Json -InputObject $AzureData -Depth 1

Write-Verbose -Message "$f -  Saving to [$fullPath]"
Set-Content -Path $fullPath -Value $json -Encoding UTF8 -Force

Write-Verbose -Message "$f - END"
}