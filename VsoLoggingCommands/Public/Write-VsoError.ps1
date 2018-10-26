function Write-VsoError
{
    <#
        .Synopsis
        Writes a VSO Error that shows on the summary screen

        .Example
        Write-VsoError -Message $message

        .Notes

    #>
    [Alias('VsoError')]
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [String[]]
        $Message,

        # Source file path
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $SourcePath,

        # Line number in the file
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $LineNumber,

        # column number of the error
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
                Type         = 'error'
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
