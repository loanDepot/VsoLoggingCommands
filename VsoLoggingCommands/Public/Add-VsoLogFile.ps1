function Add-VsoLogFile
{
    <#
        .Synopsis
        Upload user interested log to build’s container “logs\tool” folder.

        .Example
        Add-VsoLogFile -Path $Path

        .Notes

    #>
    [Alias('VsoLogFile')]
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
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
