function Add-VsoArtifactLink
{
    <#
        .Synopsis
        Create an artifact link

        .Example
        Add-VsoArtifactLink -Path $Path

        .Notes
        Create an artifact link, artifact location is required to be a file container path, VC path or UNC share path.
    #>
    [cmdletbinding()]
    param(
        # Artifact location
        [Alias('Path', 'FullName', 'Container', 'FilePath', 'VersionControl', 'GitRef', 'TfvcLabel')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Location,

        # Name of artifact
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        # type of link
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('container', 'filepath', 'versioncontrol', 'gitref', 'tfvclabel')]
        [String]
        $Type
    )

    process
    {
        try
        {
            $Attrbiutes = @{
                ArtifactName = $Name
                Type         = $Type
            }

            Write-Vso -Task artifact.associate -Text $Location -Attributes $Attrbiutes

        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
