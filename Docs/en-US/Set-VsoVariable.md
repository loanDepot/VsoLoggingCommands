---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Set-VsoVariable

## SYNOPSIS
Sets a VSO variable

## SYNTAX

```
Set-VsoVariable [-Name] <String> [-Value] <String> [-IsSecret] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Set-VsoVariable -Name TestVar -Value TestValue
```

## PARAMETERS

### -IsSecret
secures this value from logs

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Variable Name

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

### -Value
variable value

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Sets a variable in the variable service of taskcontext.
The first task can set a variable, and following tasks in the same phase are able to use the variable.
The variable is exposed to the following tasks as an environment variable.
When issecret is set to true, the value of the variable will be saved as secret and masked out from log.
Secret variables are not passed into tasks as environment variables and must be passed as inputs.

## RELATED LINKS
