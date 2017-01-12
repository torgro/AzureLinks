function Open-AzureLink
{
[cmdletbinding()]
Param(
    [Parameter(ParameterSetName='PipeLine')]
    [Parameter(ValueFromPipelineByPropertyName)]
    $Link
    ,
    [Parameter(ParameterSetName='Named')]
    [string]$Name
)
Process
{
    foreach($Item in $Link)
    {
        Start-Process $item.Link
    }
}
}