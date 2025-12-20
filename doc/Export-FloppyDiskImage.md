---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Export-FloppyDiskImage

## SYNOPSIS
Exports an object representation of a floppy disk image to a file.

## SYNTAX

### SectorImageSet
```
Export-FloppyDiskImage [-SectorImage] -Filename <String> -sectorDiskImage <AbstractDisk> [<CommonParameters>]
```

### BitstreamSet
```
Export-FloppyDiskImage [-Bitstream] [-useGCM] [-useClassicG64ConvFormat] -Filename <String>
 -BitStreamImage <GxxImageV1> [<CommonParameters>]
```

### FluxSet
```
Export-FloppyDiskImage [-Flux] -Filename <String> -FLuxImage <P64File> [<CommonParameters>]
```

### SCPSet
```
Export-FloppyDiskImage [-SCP] -Filename <String> -scpImage <SCPImage> [<CommonParameters>]
```

### TextSet
```
Export-FloppyDiskImage -Filename <String> [-TextualBitstream] -Text <TextualRepresentation>
 [<CommonParameters>]
```

## DESCRIPTION
Exports an object representation of a floppy disk image to a file.

The first parameter should always be the switch parameter selecting the output
format (bitstream, sector image, flux, ...).

The image object to export is provided via a format-specific parameter
and can also be passed through the pipeline.

Note: This cmdlet does not convert images between formats.
The exported format must match the input format.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -BitStreamImage
The bitstream image object to export.

```yaml
Type: GxxImageV1
Parameter Sets: BitstreamSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Bitstream
Selects bitstream image export (G64, G71, G81, ...).

```yaml
Type: SwitchParameter
Parameter Sets: BitstreamSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FLuxImage
The flux image object to export.

```yaml
Type: P64File
Parameter Sets: FluxSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Filename

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Flux
Selects flux image export (P64, P71, ...).

```yaml
Type: SwitchParameter
Parameter Sets: FluxSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SCP
Selects SCP image export.

```yaml
Type: SwitchParameter
Parameter Sets: SCPSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SectorImage
Selects sector image export.

```yaml
Type: SwitchParameter
Parameter Sets: SectorImageSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
The textual representation of bitstream to export.

```yaml
Type: TextualRepresentation
Parameter Sets: TextSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TextualBitstream
Selects export of a textual bitstream representation.

```yaml
Type: SwitchParameter
Parameter Sets: TextSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -scpImage
The SCP image object to export.

```yaml
Type: SCPImage
Parameter Sets: SCPSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -sectorDiskImage
Selects sector image export.

```yaml
Type: AbstractDisk
Parameter Sets: SectorImageSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -useClassicG64ConvFormat
Currently required for many existing G64 and G71 images. Subject to change.

```yaml
Type: SwitchParameter
Parameter Sets: BitstreamSet
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -useGCM
Writes the GCM identifier instead of GCR into the Gxx header.


```yaml
Type: SwitchParameter
Parameter Sets: BitstreamSet
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

### CommodoreDisk.Image.raw.GxxImageV1

### CommodoreDisk.Image.flux.P64File

### CommodoreDisk.TextualRepresentation.TextualRepresentation

### CommodoreDisk.Image.flux.SCPImage

### CommodoreDisk.Image.AbstractDisk

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
