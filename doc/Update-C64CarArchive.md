---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Update-C64CarArchive

## SYNOPSIS
Warning: This Cmdlet is likely to change in future.
It provides reading and writzing to car files

## SYNTAX

### mergeFromFile
```
Update-C64CarArchive -Car <C64Car> -UpdatePath <String[]> [-Merge] [<CommonParameters>]
```

### directory
```
Update-C64CarArchive -Car <C64Car> -Path <String> [-PathIsPETSCII] [-FileType <Byte>] [-Locked <Boolean>]
 [-FilenameASCII <String>] [-FilenamePETSCII <String>] [-Directory] [<CommonParameters>]
```

### get
```
Update-C64CarArchive -Car <C64Car> -Path <String> [-PathIsPETSCII] [-Get] [<CommonParameters>]
```

### getContent
```
Update-C64CarArchive -Car <C64Car> -Path <String> [-PathIsPETSCII] [-GetContent] [<CommonParameters>]
```

### file
```
Update-C64CarArchive -Car <C64Car> -Path <String> [-PathIsPETSCII] [-File] [-FileType <Byte>]
 [-Locked <Boolean>] [-FilenameASCII <String>] [-FilenamePETSCII <String>] [-FileContent <Byte[]>]
 [<CommonParameters>]
```

### updateMetadata
```
Update-C64CarArchive -Car <C64Car> [-UpdateMetadata] [-CarType <carType>] [-Version <Byte>]
 [-Date <carDateTime>] [-NotesASCII <String>] [<CommonParameters>]
```

### mergeFromCar
```
Update-C64CarArchive -Car <C64Car> [-Merge] -CarUpdate <C64Car[]> [<CommonParameters>]
```

## DESCRIPTION
This cmdlet provides functions for reading and writign to car files

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Car
@{Text=}

```yaml
Type: C64Car
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CarType
@{Text=}

```yaml
Type: carType
Parameter Sets: updateMetadata
Aliases:
Accepted values: general, restore, install

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CarUpdate
@{Text=}

```yaml
Type: C64Car[]
Parameter Sets: mergeFromCar
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Date
@{Text=}

```yaml
Type: carDateTime
Parameter Sets: updateMetadata
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Directory
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: directory
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -File
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: file
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileContent
@{Text=}

```yaml
Type: Byte[]
Parameter Sets: file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileType
@{Text=}

```yaml
Type: Byte
Parameter Sets: directory, file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilenameASCII
@{Text=}

```yaml
Type: String
Parameter Sets: directory, file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilenamePETSCII
{{ Fill FilenamePETSCII Description }}

```yaml
Type: String
Parameter Sets: directory, file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Get
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetContent
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: getContent
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Locked
@{Text=}

```yaml
Type: Boolean
Parameter Sets: directory, file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Merge
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: mergeFromFile, mergeFromCar
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotesASCII
@{Text=}

```yaml
Type: String
Parameter Sets: updateMetadata
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
@{Text=}

```yaml
Type: String
Parameter Sets: directory, get, getContent, file
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PathIsPETSCII
{{ Fill PathIsPETSCII Description }}

```yaml
Type: SwitchParameter
Parameter Sets: directory, get, getContent, file
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdateMetadata
@{Text=}

```yaml
Type: SwitchParameter
Parameter Sets: updateMetadata
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatePath
@{Text=}

```yaml
Type: String[]
Parameter Sets: mergeFromFile
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
@{Text=}

```yaml
Type: Byte
Parameter Sets: updateMetadata
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
