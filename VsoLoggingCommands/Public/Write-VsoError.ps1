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
            ValueFromPipeline
        )]
        [String[]]
        $Message,

        # Source file path
        [string]
        $SourcePath,

        # Line number in the file
        [string]
        $LineNumber,

        # column number of the error
        [string]
        $ColumnNumber,

        # Error code
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
