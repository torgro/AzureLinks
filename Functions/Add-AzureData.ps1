function Add-AzureData
{
[cmdletbinding()]
Param(
    [string]$Name
    ,
    [String]$Description
    ,
    [string]$Link
)
$f = $MyInvocation.InvocationName
Write-Verbose -Message "$f - START"

$exists = Get-AzureLink -Name $Name

if ($exists)
{
    Write-Error -Message "Item with name [$Name] already exists" -ErrorAction Stop
}

$links = Get-AzureData

Write-Verbose -Message "$f -  Adding [$Link]"
$links += [pscustomobject]@{
    Name = $Name
    Description = $Description
    Link = $Link
}

Save-AzureData -AzureData $links

}