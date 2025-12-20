---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# New-FloppyDiskTemplate

## SYNOPSIS
Generated a bitstream image template

## SYNTAX

### CfgSet
```
New-FloppyDiskTemplate -Configration <RawFormatDescription> [<CommonParameters>]
```

### FloppySet
```
New-FloppyDiskTemplate -Floppy <Floppies> [-GeosGaps <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Generated a bitstream image template

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Configration
{{ Fill Configration Description }}

```yaml
Type: RawFormatDescription
Parameter Sets: CfgSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Floppy
Sets the floppy for which the image is created

```yaml
Type: Floppies
Parameter Sets: FloppySet
Aliases:
Accepted values: floppy1541, floppy1571, floppy1581, floppyFD2000DD, floppyFD2000, floppyFD4000, floppy8050, floppy8250

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GeosGaps
Use Geos Gaps. Only valid for GCR disks.

```yaml
Type: Boolean
Parameter Sets: FloppySet
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

### CommodoreDisk.TextualRepresentation.TextualRepresentation

## NOTES

## RELATED LINKS
