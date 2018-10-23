function Set-VsoProgress
{
    <#
        .Synopsis
        Set progress and current operation for current task.

        .Example
        Set-VsoProgress -Message $Message

        .Notes

    #>
    [Alias('VsoProgress')]
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Message,

        [String]
        $Value
    )

    process
    {
        try
        {
            Write-Vso -Task task.setprogress -Text $Message @{
                Value = $Value
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
