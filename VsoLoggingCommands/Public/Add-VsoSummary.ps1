function Add-VsoSummary
{
    <#
        .Synopsis
        Add summary to status page

        .Example
        Add-VsoSummary -Path $Path

        .Notes
        This needs to be a path to a markdown file
    #>
    [Alias('VsoSummary')]
    [cmdletbinding()]
    param(
        # Path to markdown page to use for summary
        [Alias('FullName')]
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
            Write-Vso -Task task.uploadsummary -Text $Path
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
