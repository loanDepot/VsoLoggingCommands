---
external help file: VsoLoggingCommands-help.xml
Module Name: VsoLoggingCommands
online version:
schema: 2.0.0
---

# Write-VsoLogDetail

## SYNOPSIS
Create and update detail timeline records.

## SYNTAX

```
Write-VsoLogDetail [-Message] <String> [-id <String>] [-ParentId <String>] [-Type <String>] [-Name <String>]
 [-Order <String>] [-StartTime <DateTime>] [-FinishTime <DateTime>] [-Progress <String>] [-State <VsoState>]
 [-Result <VsoResult>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
Write-VsoLogDetail -Path $Path
```

## PARAMETERS

### -FinishTime
Datetime

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -id
Timeline record Guid (Required)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (New-Guid)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
Parameter help description

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

### -Name
Record name (Required for first time, can't overwrite)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order
order of timeline record (Required for first time, can't overwrite)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParentId
Parent timeline record Guid

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Progress
percentage of completion

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Result
Succeeded|SucceededWithIssues|Failed|Cancelled|Skipped

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

### -StartTime
Datetime

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
Unknown|Initialized|InProgress|Completed

```yaml
Type: VsoState
Parameter Sets: (All)
Aliases:
Accepted values: Unknown, Initialized, InProgress, Completed

Required: False
Position: Named
Default value: Unknown
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Record type (Required for first time, can't overwrite)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The first time a ##vso\[task.detail\] message is seen for a given task, a detailed timeline is created for that task.
Nested timeline records are created and updated based on id and parentid.
The task author needs to remember which Guid they used for each timeline record.
The logging system tracks the Guid for each timeline record that has been created, so any new Guid results in a new timeline record

## RELATED LINKS
