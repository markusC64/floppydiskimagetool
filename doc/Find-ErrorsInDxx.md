---
external help file: FloppyDiskImageTool-help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Find-ErrorsInDxx

## SYNOPSIS
Detects and reports errors in a Dxx sector image. Optionally uses a physical track/sector view.

## SYNTAX

```
Find-ErrorsInDxx [-SectorImage] <Object> [-UsePhysicalView] [<CommonParameters>]
```

## DESCRIPTION
Analyzes a sector-based Commodore disk image and identifies any errors per sector. 
Use `-UsePhysicalView` to inspect the image as it exists on the physical disk
(track/side layout), which may differ from the logical sector layout.

Output: PSCustomObject with properties: Track, Sector, Side, ErrorCode

## EXAMPLES

### Example 1
```powershell
PS C:\> $d64 = Get-FloppyDiskImage -SectorImage -Filename disk.d64
PS C:\> Find-ErrorsInDxx -SectorImage $d64
```

Checks all sectors in the disk image for errors and outputs a report.

## PARAMETERS

### -SectorImage
The sector image to inspect

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

### -UsePhysicalView
Use the physical layout for returning error positions. Only valid for Dxx Formats
where the physical view differs from the logical view that is Commodore's MFM disk
formats.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
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

### System.Object

## OUTPUTS

### System.Object
## NOTES
This function is not fully standardized. The cmdlet exists in the source code and may be adjusted or extended by users.

## RELATED LINKS
