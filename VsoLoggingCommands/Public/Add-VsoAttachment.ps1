function Add-VsoAttachment
{
    <#
        .Synopsis
        Upload and attach attachment to current timeline record.

        .Example
        Add-VsoAttachment -Path $Path

        .Notes
        These files are not available for download with logs. These can only be referred to by extensions using the type or name values.
    #>
    [Alias('VsoAttachment')]
    [cmdletbinding()]
    param(
        # Path
        [Alias('FullName')]
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path,

        # Friendly name
        [Alias('BaseName')]
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        # Attachment Type
        [Alias('Extension')]
        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Type

    )

    process
    {
        try
        {
            $Attrbiutes = @{
                Type = $Type
                Name = $Name
            }

            Write-Vso -Task task.addattachment -Text $Path -Attributes $Attrbiutes
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
