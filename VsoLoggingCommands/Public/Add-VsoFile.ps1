function Add-VsoFile
{
    <#
        .Synopsis
        Upload user interested file as additional log information to the current timeline record.

        .Example
        Add-VsoFile -Path $Path

        .Notes
        The file shall be available for download along with task logs.
    #>
    [Alias('VsoFile')]
    [cmdletbinding()]
    param(
        # File to upload
        [Alias('FullName')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path
    )

    process
    {
        try
        {
            foreach ( $node in $Path )
            {
                Write-Vso -Task build.uploadlog -Text $node
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
