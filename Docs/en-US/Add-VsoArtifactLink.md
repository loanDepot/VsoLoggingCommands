---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Add-VsoArtifactLink

## SYNOPSIS
Create an artifact link

## SYNTAX

```
Add-VsoArtifactLink [-Location] <String> [-Name] <String> [-Type] <String> [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Add-VsoArtifactLink -Path $Path
```

## PARAMETERS

### -Location
Artifact location

```yaml
Type: String
Parameter Sets: (All)
Aliases: Path, FullName, Container, FilePath, VersionControl, GitRef, TfvcLabel

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
{{Fill Name Description}}

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

### -Type
{{Fill Type Description}}

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Create an artifact link, artifact location is required to be a file container path, VC path or UNC share path.

## RELATED LINKS
