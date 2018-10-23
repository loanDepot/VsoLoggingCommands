function Add-VsoPath
{
    <#
        .Synopsis
        Instruction for the agent to update the PATH environment variable

        .Example
        Add-VsoPath -Path $Path

        .Notes
        The specified directory is prepended to the PATH. The updated environment variable will be reflected in subsequent tasks.
    #>
    [cmdletbinding()]
    param(
        # value to prepend to ENV:PATH
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path
    )

    process
    {
        try
        {
            Write-Vso -Task task.prependpath -Text $Path
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
