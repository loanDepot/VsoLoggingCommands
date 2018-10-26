function Set-VsoVariable
{
    <#
        .Synopsis
        Sets a VSO variable

        .Example
        Set-VsoVariable -Name TestVar -Value TestValue

        .Notes
        Sets a variable in the variable service of taskcontext. The first task can set a variable, and following tasks in the same phase are able to use the variable. The variable is exposed to the following tasks as an environment variable. When issecret is set to true, the value of the variable will be saved as secret and masked out from log. Secret variables are not passed into tasks as environment variables and must be passed as inputs.

    #>
    [Alias('VsoVariable')]
    [cmdletbinding()]
    param(
        # Variable Name
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,

        # variable value
        [Parameter(
            Mandatory,
            Position = 1,
            ValueFromPipelineByPropertyName,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String]
        $Value,

        # secures this value from logs
        [Parameter()]
        [switch]
        $IsSecret
    )

    process
    {
        try
        {
            $Attrbiutes = @{
                Variable = $Name
                issecret = $IsSecret
            }

            Write-Vso -Task task.setvariable -Text $Value -Attributes $Attrbiutes

        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
