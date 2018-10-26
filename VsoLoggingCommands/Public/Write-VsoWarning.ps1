function Write-VsoWarning
{
    <#
        .Synopsis
        Writes a VSO warning that shows on the summary screen

        .Example
        Write-VsoWarning -Message $message

        .Example
       VsoWarning $message

        .Notes

    #>
    [Alias('VsoWarning')]
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [String[]]
        $Message,

        # Source path of file
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $SourcePath,

        # Line number in file
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $LineNumber,

        # Column number in file
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $ColumnNumber,

        # Error code
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Code
    )

    process
    {
        try
        {
            $Attributes = @{
                SourcePath   = $SourcePath
                LineNumber   = $LineNumber
                ColumnNumber = $ColumnNumber
                Code         = $Code
                Type         = 'warning'
            }

            foreach ( $node in $Message )
            {
                $writeVsoLoggingCommandSplat = @{
                    Attributes = $Attributes
                    Task = 'task.logissue'
                    Text = $Message
                }
                Write-Vso @writeVsoLoggingCommandSplat
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
