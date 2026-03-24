---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Set-C64CMDPartition

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### FromFile
```
Set-C64CMDPartition [-OutPath] <String> [-Partition] <CMDPartition> [-Path] <String> [<CommonParameters>]
```

### FromByteArray
```
Set-C64CMDPartition [-OutPath] <String> [-Partition] <CMDPartition> [-ImageBytes] <Byte[]> [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ImageBytes
{{ Fill ImageBytes Description }}

```yaml
Type: Byte[]
Parameter Sets: FromByteArray
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
{{ Fill OutPath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Partition
{{ Fill Partition Description }}

```yaml
Type: CMDPartition
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: FromFile
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### C64OSTool.CMDPartition

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
