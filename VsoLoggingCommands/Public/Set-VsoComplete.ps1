
function Set-VsoComplete
{
    <#
        .Synopsis
        Finish timeline record for current task, set task result and current operation. When result not provide, set result to succeeded.

        .Example
        Set-VsoComplete -Message $Message

        .Notes

    #>
    [Alias('VsoComplete','VsoStatus','Set-VsoStatus')]
    [cmdletbinding()]
    param(
        # Task complete action
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message,

        # Set the result of the task
        [VsoResult]
        $Result
    )

    process
    {
        try
        {
            Write-Vso -Task task.complete -Text $Message @{
                Result = $Result
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
