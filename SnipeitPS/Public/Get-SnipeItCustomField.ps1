<#
    .SYNOPSIS
    Returns specific Snipe-IT custom field or a list of all custom field

    .PARAMETER id
    A id of specific field

    .PARAMETER url
    URL of Snipeit system, can be set using Set-SnipeItInfo command

    .PARAMETER apiKey
    Users API Key for Snipeit, can be set using Set-SnipeItInfo command

    .EXAMPLE
    Get-Field -url "https://assets.example.com" -token "token..."

#>

function Get-SnipeItCustomField()
{
    Param(
        [int]$id,

        [parameter(mandatory = $true)]
        [string]$url,

        [parameter(mandatory = $true)]
        [string]$apiKey
    )

    Test-SnipeItAlias -invocationName $MyInvocation.InvocationName -commandName $MyInvocation.MyCommand.Name

    if ($id) {
        $apiurl= "$url/api/v1/fields/$id"
    } else {
        $apiurl = "$url/api/v1/fields"
    }

    $Parameters = @{
        Uri           = $apiurl
        Method        = 'Get'
        Token         = $apiKey
    }


    $result = Invoke-SnipeitMethod @Parameters

    $result
}
