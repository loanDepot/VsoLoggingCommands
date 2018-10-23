function Set-VsoEndpoint
{
    <#
        .Synopsis
        Set an endpoint field with given value.

        .Example
        Set-VsoEndpoint -Value $Value

        .Notes
        Value updated will be retained in the endpoint for the subsequent tasks that execute within the same job.
    #>
    [Alias('VsoEndpoint')]
    [cmdletbinding()]
    param(
        # Value to set
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Value,

        # Endpoint ID
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Id,

        # Field Type
        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('authParameter', 'dataParameter', 'url')]
        [String]
        $Field,

        # Endpoint ID
        [Parameter(
            Position = 3,
            ValueFromPipelineByPropertyName
        )]
        [String]
        $Key
    )

    process
    {
        try
        {
            $Attrbiutes = @{
                Key   = $Key
                Field = $Field
                ID    = $ID
            }

            Write-Vso -Task task.setendpoint -Text $Value -Attributes $Attrbiutes

        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
