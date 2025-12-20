---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# New-FloppyDiskImageConfiguration

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### RotationDecider
```
New-FloppyDiskImageConfiguration [-RotationDecider] [-Rotation <Int32>] [<CommonParameters>]
```

### SpeedDetector
```
New-FloppyDiskImageConfiguration [-SpeedDetector] [-SpeedZone <Int32>] [-SpeedZoneType <SpeedZoneTypes>]
 [-FallbackSpeedZoneType <SpeedZoneTypes>] [<CommonParameters>]
```

### Bitstream2TextOptions
```
New-FloppyDiskImageConfiguration [-Bitstream2TextOptions] [-Bitstream2TextFormat <TextOptionsFormat>]
 [<CommonParameters>]
```

### GCRTemplateOptions
```
New-FloppyDiskImageConfiguration [-GCRTemplate] -MaxTracks <Int32> -HeaderMaxTrackSize <Int32>
 -NoTracks <Int32> -NoTracksPerSide <Int32> [-GeosGaps <Boolean>] [<CommonParameters>]
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

### -Bitstream2TextFormat
{{ Fill Bitstream2TextFormat Description }}

```yaml
Type: TextOptionsFormat
Parameter Sets: Bitstream2TextOptions
Aliases:
Accepted values: bytes, bits, decoded

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Bitstream2TextOptions
{{ Fill Bitstream2TextOptions Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Bitstream2TextOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FallbackSpeedZoneType
{{ Fill FallbackSpeedZoneType Description }}

```yaml
Type: SpeedZoneTypes
Parameter Sets: SpeedDetector
Aliases:
Accepted values: none, cbm1571, cbm1571NoHalfTracks, cbm8250

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GCRTemplate
{{ Fill GCRTemplate Description }}

```yaml
Type: SwitchParameter
Parameter Sets: GCRTemplateOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GeosGaps
{{ Fill GeosGaps Description }}

```yaml
Type: Boolean
Parameter Sets: GCRTemplateOptions
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeaderMaxTrackSize
{{ Fill HeaderMaxTrackSize Description }}

```yaml
Type: Int32
Parameter Sets: GCRTemplateOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxTracks
{{ Fill MaxTracks Description }}

```yaml
Type: Int32
Parameter Sets: GCRTemplateOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoTracks
{{ Fill NoTracks Description }}

```yaml
Type: Int32
Parameter Sets: GCRTemplateOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoTracksPerSide
{{ Fill NoTracksPerSide Description }}

```yaml
Type: Int32
Parameter Sets: GCRTemplateOptions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rotation
{{ Fill Rotation Description }}

```yaml
Type: Int32
Parameter Sets: RotationDecider
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RotationDecider
{{ Fill RotationDecider Description }}

```yaml
Type: SwitchParameter
Parameter Sets: RotationDecider
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeedDetector
{{ Fill SpeedDetector Description }}

```yaml
Type: SwitchParameter
Parameter Sets: SpeedDetector
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeedZone
{{ Fill SpeedZone Description }}

```yaml
Type: Int32
Parameter Sets: SpeedDetector
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeedZoneType
{{ Fill SpeedZoneType Description }}

```yaml
Type: SpeedZoneTypes
Parameter Sets: SpeedDetector
Aliases:
Accepted values: none, cbm1571, cbm1571NoHalfTracks, cbm8250

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

### CommodoreDisk.Image.Convert.RawFormatDescription

### CommodoreDisk.Image.Convert.RawToTextOptions

### CommodoreDisk.Image.Convert.SpeedDetector2

### CommodoreDisk.Image.flux.RotationDecider1

## NOTES

## RELATED LINKS
