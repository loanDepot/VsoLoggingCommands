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
            ValueFromPipeline
        )]
        [String[]]
        $Message,

        [string]
        $SourcePath,

        [string]
        $LineNumber,

        [string]
        $ColumnNumber,

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
