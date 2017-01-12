function Get-AzureLink
{
[cmdletbinding()]
Param(
    [string]$Name
)

$links = Get-AzureData -ErrorAction Stop

foreach ($link in $links)
{
    if ($link.Name -like "$Name")
    {
        $link
    }

    if ($link.Link -like "$Name")
    {
        $link
    }

    if ($link.Description -like "$name")
    {
        $link
    }
}
}