function Add-VsoSummary
{
    <#
        .Synopsis
        Add summary to status page

        .Example
        Add-VsoSummaryFile -Path $Path

        .Notes
        This needs to be a path to a markdown file
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSAvoidDefaultValueForMandatoryParameter","",
        Justification="There are multiple parameter sets"
    )]
    [Alias('VsoSummary','Add-VsoSummaryFile')]
    [cmdletbinding(DefaultParameterSetName = 'Markdown')]
    param(
        # Path to markdown page to use for summary
        [Alias('FullName')]
        [Parameter(
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Path'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Markdown'
        )]
        [String]
        $Path = ([System.IO.Path]::GetTempFileName()),

        # Markdown data to be displayed in the summary
        [Alias('Markdown','Data','InputObject')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ParameterSetName = 'Markdown'
        )]
        [String[]]
        $Summary
    )

    process
    {
        try
        {
            if($Summary)
            {
                $folder = Split-Path -Path $Path
                $null = New-Item -Path $folder -ItemType Directory -ErrorAction Ignore
                $Summary | Add-Content -Path $Path
            }
            Write-Vso -Task task.uploadsummary -Text $Path
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
