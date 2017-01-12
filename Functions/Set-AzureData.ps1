function Set-AzureData
{
[cmdletbinding()]
Param(
    [string]$Name
    ,
    [string]$Description
    ,
    [string]$Link
)

$f = $MyInvocation.InvocationName
Write-Verbose -Message "$f - START
"
$links = Get-AzureData -ErrorAction Stop

foreach ($linkItem in $links)
{
    if ($linkItem.Name -eq $Name)
    {
        $currentLink = $linkItem
        Write-Verbose -Message "$f -  Found Item [$($linkItem.Name)]"
        break
    }
}

[bool]$updated = $false

if ($currentLink)
{
    if ($PSBoundParameters.ContainsKey("Description"))
    {
        $currentLink.Description = $Description
        Write-Verbose -Message "$f -  Updating description to [$Description]"
        $updated = $true
    }

    if ($PSBoundParameters.ContainsKey("Link"))
    {
        $currentLink.Link = $Link
        Write-Verbose -Message "$f -  Updating link to [$Link]"
        $updated = $true
    }

    if ($updated)
    {
        Save-AzureData -AzureData $links
    }
}

Write-Verbose -Message "$f - END"
}