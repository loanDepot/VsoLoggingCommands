function Add-VsoTag
{
    <#
        .Synopsis
        Add a tag for current build.

        .Example
        Add-VsoTag -Tag $Tag

        .Notes

    #>
    [Alias('VsoTag')]
    [cmdletbinding()]
    param(
        # Build ag to add to current build
        [Alias('BuildTag')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Tag
    )

    process
    {
        try
        {
            foreach ( $node in $Tag )
            {
                Write-Vso -Task build.addbuildtag -Text $node
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
