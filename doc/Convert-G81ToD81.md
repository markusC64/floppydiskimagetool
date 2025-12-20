---
external help file: FloppyDiskImageTool-help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Convert-G81ToD81

## SYNOPSIS
Converts a G81 disk image object to a D81 disk image object.

## SYNTAX

```
Convert-G81ToD81 [-g81Image] <Object> [<CommonParameters>]
```

## DESCRIPTION
Takes a G81 image object and converts it to a D81 image object.
The input object can be passed through the pipeline or directly via the -g81Image parameter.
This cmdlet performs a basic sector image conversion and does not alter the underlying data structure.

## EXAMPLES

### Example 1
```powershell
PS C:\> PS C:\> $d81 = Get-FloppyDiskImage -SectorImage -SectorImageType D81 -Filename disk.g81 | Convert-G81ToD81 -g81Image $g81
```

Converts the G81 image to a D81 image object stored in $d81.

### Example 1
```powershell
PS C:\> $g81 = Get-FloppyDiskImage -SectorImage -SectorImageType D81 -Filename disk.g81
PS C:\> $d81 = Convert-G81ToD81 -g81Image $g81
```

Converts the G81 image stored in $g81 to a D81 image object stored in $d81.

## PARAMETERS

### -g81Image
The G81 disk image object to convert. Can be passed via pipeline or as a direct argument.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
