---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Set-VsoCompleteStatus

## SYNOPSIS
Finish timeline record for current task, set task result and current operation.
When result not provide, set result to succeeded.

## SYNTAX

```
Set-VsoCompleteStatus [-Status] <VsoResult> [[-Message] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Set-VsoCompleteStatus -Message $Message
```

## PARAMETERS

### -Message
Task complete action message

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Status
Set the result of the task

```yaml
Type: VsoResult
Parameter Sets: (All)
Aliases:
Accepted values: Succeeded, SucceededWithIssues, Failed, Cancelled, Skipped

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
