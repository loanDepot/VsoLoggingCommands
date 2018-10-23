---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Add-VsoAttachment

## SYNOPSIS
Upload and attach attachment to current timeline record.

## SYNTAX

```
Add-VsoAttachment [-Path] <String> [-Name] <String> [-Type] <String> [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Add-VsoAttachment -Path $Path
```

## PARAMETERS

### -Name
Friendly name

```yaml
Type: String
Parameter Sets: (All)
Aliases: BaseName

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Path

```yaml
Type: String
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Attachment Type

```yaml
Type: String
Parameter Sets: (All)
Aliases: Extension

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
These files are not available for download with logs.
These can only be referred to by extensions using the type or name values.

## RELATED LINKS
