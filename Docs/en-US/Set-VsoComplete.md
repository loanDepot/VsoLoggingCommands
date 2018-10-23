---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Set-VsoComplete

## SYNOPSIS
Finish timeline record for current task, set task result and current operation.
When result not provide, set result to succeeded.

## SYNTAX

```
Set-VsoComplete [-Message] <String> [-Result <VsoResult>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Set-VsoComplete -Message $Message
```

## PARAMETERS

### -Message
Task complete action

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Result
{{Fill Result Description}}

```yaml
Type: VsoResult
Parameter Sets: (All)
Aliases:
Accepted values: Succeeded, SucceededWithIssues, Failed, Cancelled, Skipped

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
