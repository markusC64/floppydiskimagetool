---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Update-FloppyDiskImage

## SYNOPSIS
Performs maintenance and fixes on Gxx bitstream or flux images.
Note the object is modified in place.

## SYNTAX

### PadGCRBitstream
```
Update-FloppyDiskImage [-Passthru] [-PadGCRBitstream] -BitStreamImage <GxxImageV1> [<CommonParameters>]
```

### FixRotationsFluxDump
```
Update-FloppyDiskImage [-Passthru] [-FixRotationsFluxDump] -FluxDumpImage <AbstractFluxImage>
 [<CommonParameters>]
```

### WriteSectorToBitstream
```
Update-FloppyDiskImage -BitStreamImage <GxxImageV1> -WriteSectorToBitstream <Block> [<CommonParameters>]
```

## DESCRIPTION
Allows padding of GCR bitstreams and fixing rotations in flux dump images. Use -Passthru to return the processed object.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -BitStreamImage
The BitStream Image to process

```yaml
Type: GxxImageV1
Parameter Sets: PadGCRBitstream, WriteSectorToBitstream
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FixRotationsFluxDump
Tries to correct the Revolutions by best effort

```yaml
Type: SwitchParameter
Parameter Sets: FixRotationsFluxDump
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FluxDumpImage
The SCP or Kryoflux Image to process

```yaml
Type: AbstractFluxImage
Parameter Sets: FixRotationsFluxDump
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PadGCRBitstream
Pads GCR bitstream images to have a multiple of 8 bits in length for each track

```yaml
Type: SwitchParameter
Parameter Sets: PadGCRBitstream
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru
Returns the updated object

```yaml
Type: SwitchParameter
Parameter Sets: PadGCRBitstream, FixRotationsFluxDump
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WriteSectorToBitstream
{{ Fill WriteSectorToBitstream Description }}

```yaml
Type: Block
Parameter Sets: WriteSectorToBitstream
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### CommodoreDisk.Image.raw.GxxImageV1

### CommodoreDisk.Image.flux.AbstractFluxImage

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
