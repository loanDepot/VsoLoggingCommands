function Write-VsoLogDetail
{
    <#
        .Synopsis
        Create and update detail timeline records.

        .Example
        Write-VsoLogDetail -Path $Path

        .Notes
        The first time a ##vso[task.detail] message is seen for a given task, a detailed timeline is created for that task.
        Nested timeline records are created and updated based on id and parentid.
        The task author needs to remember which Guid they used for each timeline record. The logging system tracks the Guid for each timeline record that has been created, so any new Guid results in a new timeline record

    #>
    [cmdletbinding()]
    param(
        # The message to log
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Message,

        # Timeline record Guid (Required)
        [String]
        $id = (New-Guid),

        # Parent timeline record Guid
        [String]
        $ParentId,

        # Record type (Required for first time, can't overwrite)
        [string]
        $Type,

        # Record name (Required for first time, can't overwrite)
        [string]
        $Name,

        # order of timeline record (Required for first time, can't overwrite)
        [string]
        $Order,

        # Datetime
        [DateTime]
        $StartTime,

        # Datetime
        [DateTime]
        $FinishTime,

        # percentage of completion
        [string]
        $Progress,

        # Unknown|Initialized|InProgress|Completed
        [VsoState]
        $State = 'Unknown',

        # Succeeded|SucceededWithIssues|Failed|Cancelled|Skipped
        [VsoResult]
        $Result
    )

    process
    {
        try
        {
            $Attrbiutes = @{
                id         = $id
                parentid   = $parentid
                type       = $type
                name       = $name
                order      = $order
                starttime  = $starttime
                finishtime = $finishtime
                progress   = $progress
                state      = $state
                result     = $result
            }

            Write-Vso -Task task.logdetail -Text $Message -Attributes $Attrbiutes
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end
    {

    }
}
