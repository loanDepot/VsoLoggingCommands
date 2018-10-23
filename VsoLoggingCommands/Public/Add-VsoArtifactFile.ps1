function Add-VsoArtifactFile
{
    <#
        .Synopsis
        Upload local file into a file container folder, create artifact if artifactname provided.

        .Example
        Add-VsoArtifactFile -Path $Path -Name $ArtifactName -Folder $ContainerFolder

        .Notes

    #>
    [Alias('VsoArtifactFile')]
    [cmdletbinding()]
    param(
        # Path to file to add to artifact
        [Alias('FullName')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path,

        # container folder to use
        [Alias('ContainerFolder')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Folder,

        # Name of the artifact
        [Alias('ArtifactName')]
        [Parameter(
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [String]
        $Name

    )

    process
    {
        try
        {
            $Attrbiutes = @{
                ArtifactName    = $Name
                ContainerFolder = $Folder
            }

            foreach ( $node in $Path )
            {
                Write-Vso -Task artifact.upload -Text $node -Attributes $Attrbiutes
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
