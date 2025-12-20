---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Get-FloppyDiskImage

## SYNOPSIS
Reads a Floppy disk image from disk and returns it as an object.

## SYNTAX

### TextSet
```
Get-FloppyDiskImage [-Text] -Filename <String> [<CommonParameters>]
```

### SectorImageSet
```
Get-FloppyDiskImage [-SectorImage] [-Filename <String>] -SectorImageType <SectorImageTypes> [-useFactory]
 [-noTracks <Int32>] [<CommonParameters>]
```

### BitstreamSet
```
Get-FloppyDiskImage [-Bitstream] [-useClassicG64ConvFormat] -Filename <String> [<CommonParameters>]
```

### FluxSet
```
Get-FloppyDiskImage [-Flux] -Filename <String> [<CommonParameters>]
```

### KryofluxImageSetBasename
```
Get-FloppyDiskImage [-KryofluxImage] [-Sides <Sides>] [-DoubleStep] -Basename <String> [<CommonParameters>]
```

### KryofluxImageSetFilename
```
Get-FloppyDiskImage [-KryofluxImage] [-Sides <Sides>] [-DoubleStep] -Filename <String> [<CommonParameters>]
```

### SCPImageSet
```
Get-FloppyDiskImage [-SCPImage] -Filename <String> [<CommonParameters>]
```

## DESCRIPTION
Reads a floppy disk image from disk and returns it as an object.

The first parameter should always be the switch parameter selecting the format
(bitstream, sector image, flux, ...).

In most cases, the second parameter is the filename.
For KryoFlux images, this can be replaced by a basename.
For empty (unformatted) sector images, the filename can be omitted.

Sector images additionally require the SectorImageType parameter.

## EXAMPLES

### Example 1
```powershell
PS C:\> $g64 = Get-FloppyDiskImage -Bitstream -Filename g1b.g64
```

Reads the file g1b.g64 and stores the resulting object in $g64

## PARAMETERS

### -Basename
Sets the name excluding "00.0.raw" for kryoflux image.

```yaml
Type: String
Parameter Sets: KryofluxImageSetBasename
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Bitstream
Tells the cmdlet you want to read bitstream images, that is G64, G71, G81, ... files.

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

### -DoubleStep
Reads only every second track

```yaml
Type: SwitchParameter
Parameter Sets: KryofluxImageSetBasename, KryofluxImageSetFilename
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
The filename of the image. In case of kryoflux imagesany single file of the image set will do.

```yaml
Type: String
Parameter Sets: TextSet, BitstreamSet, FluxSet, KryofluxImageSetFilename, SCPImageSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: SectorImageSet
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Flux
Tells the system you want to read flux files, that is P64, P71, ... files.

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

### -KryofluxImage
Tells the system you want to read a kryoflux image. You'll get a FLuxDump object.

```yaml
Type: SwitchParameter
Parameter Sets: KryofluxImageSetBasename, KryofluxImageSetFilename
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SCPImage
Tells the system you want to read an SCP image. You'll get a FLuxDump object.

```yaml
Type: SwitchParameter
Parameter Sets: SCPImageSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SectorImage
Tells the system you want to read a sector image.

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

### -SectorImageType
Chooses the type of sector image

```yaml
Type: SectorImageTypes
Parameter Sets: SectorImageSet
Aliases:
Accepted values: D64, D71, D81, D1M, D2M, D4M, D80, D82

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sides
Specifies sides to read for kryoflux image.

```yaml
Type: Sides
Parameter Sets: KryofluxImageSetBasename, KryofluxImageSetFilename
Aliases:
Accepted values: sideA, sideB, bothSides

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
Tells the system you want to read either bitstream's textual representation or
a template of textual representation.

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

### -noTracks
For sector images that can work with different number of tracks, choose the number
of tracks.

```yaml
Type: Int32
Parameter Sets: SectorImageSet
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -useClassicG64ConvFormat
Needed in most cases for existing G64, G71 images. MAY CHANGE LATER.

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

### -useFactory
WIP - not ready in this alpha.

```yaml
Type: SwitchParameter
Parameter Sets: SectorImageSet
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

### CommodoreDisk.Image.flux.P64File

### CommodoreDisk.Image.raw.GxxImageV1

### CommodoreDisk.Image.flux.SCPImage

### CommodoreDisk.Image.flux.KryofluxImage

## NOTES

## RELATED LINKS
