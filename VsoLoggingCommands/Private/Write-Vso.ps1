function Write-Vso
{
    <#
        .Synopsis
        Writes a VSO logging message to the host

        .Example
        Write-Vso -Action task.logissue -Text $Text -Attributes @{
            type = 'error'
        }

        .Example
        Write-Vso task.logissue $Text @{
            type = 'error'
        }

        .Notes

    #>
    [Alias('VSO')]
    [cmdletbinding()]
    param(

        # VsoTask or action
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateSet(
            'task.logissue',
            'task.setprogress',
            'task.complete',
            'task.logdetail',
            'task.setvariable',
            'task.setendpoint',
            'task.addattachment',
            'task.uploadsummary',
            'task.uploadfile',
            'task.prependpath',
            'artifact.associate',
            'artifact.upload',
            'build.uploadlog',
            'build.updatebuildnumber',
            'build.addbuildtag',
            'release.updatereleasename'
        )]
        [String]
        $Task,

        # Message to log
        [Parameter(
            Position = 1,
            ValueFromPipeline
        )]
        [String[]]
        $Text,

        # Command attributes
        [Parameter(
            Position = 2,
            ValueFromPipelineByPropertyName
        )]
        [Hashtable]
        $Attributes
    )

    process
    {
        try
        {
            $stringBuilder = [System.Text.StringBuilder]::new()

            [void]$stringBuilder.Append("##vso[$Task")

            foreach($key in $Attributes.keys)
            {
                if ( ![string]::IsNullOrEmpty( $Attributes[$key] ) )
                {
                    $stringBuilder.Append((" {1}={0};" -f $key.ToLower(), $Attributes[$key] ) )
                }
            }

            [void]$stringBuilder.Append("]")

            $prefix = $stringBuilder.ToString()
            foreach ( $message in $Text )
            {
                Write-Information -MessageData ("{0}{1}" -f $prefix, $message) -InformationAction Continue -Tags VSO
            }
        }
        catch
        {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }
}
