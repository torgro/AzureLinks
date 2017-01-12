function Get-AzureData
{
[cmdletbinding()]
Param(
    [string]$Path
)
if (-not [string]::IsNullOrWhiteSpace($path))
{
    $path = $PSScriptRoot | Split-Path -Parent | Join-Path -ChildPath Data
    Write-Verbose -Message "$f -  Path is [$Path]"
}

$file = Get-AzureDataFile
$fullpath = Join-Path -Path $Path -ChildPath $file

if (-not (Test-Path -Path $fullpath))
{
    Write-Error -Message "$f -  Path [$path] was not found" -ErrorAction Stop
}

$json = Get-Content -Path $fullpath -Encoding UTF8

ConvertFrom-Json -InputObject $json

}