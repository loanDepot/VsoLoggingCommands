function Set-VsoReleaseName
{
    <#
        .Synopsis
        Set release name

        .Example
        Set-VsoReleaseName -Name $Name

        .Notes

    #>
    [Alias('VsoReleaseName')]
    [cmdletbinding()]
    param(
        # Release name
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name
    )

    process
    {
        try
        {
            Write-Vso -Task release.updatereleasename -Text $Name
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
