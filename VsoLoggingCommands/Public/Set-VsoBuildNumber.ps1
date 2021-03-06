function Set-VsoBuildNumber
{
    <#
        .Synopsis
        Sets the build number for the current build

        .Example
        Set-VsoBuildNumber -BuildNumber $BuildNumber

        .Notes

    #>
    [Alias('VsoBuildNumber')]
    [cmdletbinding()]
    param(
        # Build number to set
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $BuildNumber
    )

    process
    {
        try
        {
            Write-Vso -Task build.updatebuildnumber -Text $BuildNumber
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
