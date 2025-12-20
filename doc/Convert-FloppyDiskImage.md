---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Convert-FloppyDiskImage

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### BitstreamToText
```
Convert-FloppyDiskImage [-BitstreamToText] -BitStreamImage <GxxImageV1>
 [-BitstreamToTextOptions <RawToTextOptions>] [<CommonParameters>]
```

### TextToBitstream
```
Convert-FloppyDiskImage [-TextToBitstream] -Text <TextualRepresentation> [<CommonParameters>]
```

### BitstreamToFlux
```
Convert-FloppyDiskImage [-BitstreamToFlux] -BitStreamImage <GxxImageV1> [-HighRes] [<CommonParameters>]
```

### FluxToBitstream
```
Convert-FloppyDiskImage [-FluxToBitstream] -FLuxImage <P64File> [-Use8250SpeedZones]
 [-SpeedDetector <ISpeedDetector>] [<CommonParameters>]
```

### TemplateToTextSetFile
```
Convert-FloppyDiskImage [-TemplateToText] -Text <TextualRepresentation> -DataFilename <String>
 [<CommonParameters>]
```

### TemplateToTextSetDxx
```
Convert-FloppyDiskImage [-TemplateToText] -Text <TextualRepresentation> -SourceDxx <AbstractCommodoreDisk>
 [<CommonParameters>]
```

### FluxToSCPSet
```
Convert-FloppyDiskImage [-FluxToSCP] -FLuxImage <P64File> [-NoRevolutions <Int32>] [<CommonParameters>]
```

### FluxDumpToFluxRotDec
```
Convert-FloppyDiskImage -FluxDumpImage <AbstractFluxImage> [-FluxDumpToFlux] [-Floppy <String>]
 [-Sides <Sides>] [-HighRes] [-RotationDecider <IRotationDecider>] [<CommonParameters>]
```

### FluxDumpToFluxRot
```
Convert-FloppyDiskImage -FluxDumpImage <AbstractFluxImage> [-FluxDumpToFlux] [-Floppy <String>]
 [-Sides <Sides>] [-HighRes] [-Rotation <Int32>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FloppyDiskImage -Bitstream -Filename disk.g64 |
>> Convert-FloppyDiskImage -BitstreamToText |
>> Export-FloppydiskImage -TextualRepresentation -Filename disk.g64.txt
```

Converts the disk.g64 to its textual representation and saves it as disk.g64.txt

## PARAMETERS

### -BitStreamImage
Input bitstream image object

```yaml
Type: GxxImageV1
Parameter Sets: BitstreamToText, BitstreamToFlux
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -BitstreamToFlux
Convert a bitstream to flux format

```yaml
Type: SwitchParameter
Parameter Sets: BitstreamToFlux
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BitstreamToText
Convert a Gxx bitstream to text

```yaml
Type: SwitchParameter
Parameter Sets: BitstreamToText
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BitstreamToTextOptions
Options for the Conversion. Cf. New-FloppyDiskImageConfiguration

```yaml
Type: RawToTextOptions
Parameter Sets: BitstreamToText
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataFilename
The data to insert into a template which should be a Dxx image.

```yaml
Type: String
Parameter Sets: TemplateToTextSetFile
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FLuxImage
Input flux image object

```yaml
Type: P64File
Parameter Sets: FluxToBitstream, FluxToSCPSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Floppy
A 4 character string to store inside the header of the format. 
In case of "8050", "8250" abd "1001", flux resoltion is the one of the commodore 8250.

```yaml
Type: String
Parameter Sets: FluxDumpToFluxRotDec, FluxDumpToFluxRot
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FluxDumpImage
The flux image to process.

```yaml
Type: AbstractFluxImage
Parameter Sets: FluxDumpToFluxRotDec, FluxDumpToFluxRot
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FluxDumpToFlux
Converts multi revolution dumps to single revolution representation

```yaml
Type: SwitchParameter
Parameter Sets: FluxDumpToFluxRotDec, FluxDumpToFluxRot
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FluxToBitstream
Convert flux image to bitstream

```yaml
Type: SwitchParameter
Parameter Sets: FluxToBitstream
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FluxToSCP
Convert flux image to SCP

```yaml
Type: SwitchParameter
Parameter Sets: FluxToSCPSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HighRes
Use a high resolution extension of P64

```yaml
Type: SwitchParameter
Parameter Sets: BitstreamToFlux, FluxDumpToFluxRotDec, FluxDumpToFluxRot
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoRevolutions
The number of identical revolutions to store inside the generated image

```yaml
Type: Int32
Parameter Sets: FluxToSCPSet
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rotation
The revolution to use

```yaml
Type: Int32
Parameter Sets: FluxDumpToFluxRot
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RotationDecider
An object which decides which rotation that is stored into the image is used.

```yaml
Type: IRotationDecider
Parameter Sets: FluxDumpToFluxRotDec
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sides
Which sides should be processed

```yaml
Type: Sides
Parameter Sets: FluxDumpToFluxRotDec, FluxDumpToFluxRot
Aliases:
Accepted values: sideA, sideB, bothSides

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceDxx
The data to insert into a template which should be a Dxx image.

```yaml
Type: AbstractCommodoreDisk
Parameter Sets: TemplateToTextSetDxx
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeedDetector
The detector for getting the bitcell size. Cf. New-FloppyDiskImageConfiguration

```yaml
Type: ISpeedDetector
Parameter Sets: FluxToBitstream
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateToText
Inserts specific data into templates to create a textual resprentation of
a bitstream

```yaml
Type: SwitchParameter
Parameter Sets: TemplateToTextSetFile, TemplateToTextSetDxx
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
Input textual disk representation

```yaml
Type: TextualRepresentation
Parameter Sets: TextToBitstream, TemplateToTextSetFile, TemplateToTextSetDxx
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TextToBitstream
Converts textual representation of bitstream back to bitstream

```yaml
Type: SwitchParameter
Parameter Sets: TextToBitstream
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Use8250SpeedZones
Assume speedzones returned by speed detector are commodore 8250 speed zones when decoding flux

```yaml
Type: SwitchParameter
Parameter Sets: FluxToBitstream
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

### CommodoreDisk.TextualRepresentation.TextualRepresentation

### CommodoreDisk.Image.flux.AbstractFluxImage

### CommodoreDisk.Image.flux.P64File

## OUTPUTS

### CommodoreDisk.Image.flux.SCPImage

### CommodoreDisk.Image.flux.P64File

### CommodoreDisk.TextualRepresentation.TextualRepresentation

### CommodoreDisk.Image.raw.GxxImageV1

## NOTES

## RELATED LINKS
