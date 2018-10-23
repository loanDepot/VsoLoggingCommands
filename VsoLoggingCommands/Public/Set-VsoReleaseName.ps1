function Set-VsoReleaseName
{
    <#
        .Synopsis
        Set release name

        .Example
        Set-VsoReleaseName -Name $Name

        .Notes

    #>
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
