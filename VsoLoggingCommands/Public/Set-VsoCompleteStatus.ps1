
function Set-VsoCompleteStatus
{
    <#
        .Synopsis
        Finish timeline record for current task, set task result and current operation. When result not provide, set result to succeeded.

        .Example
        Set-VsoCompleteStatus -Message $Message

        .Notes

    #>
    [Alias('VsoStatus','Set-VsoStatus')]
    [cmdletbinding()]
    param(
        # Set the result of the task
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [VsoResult]
        $Status,

        # Task complete action message
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message
    )

    process
    {
        try
        {
            Write-Vso -Task task.complete -Text $Message @{
                Result = $Status
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
