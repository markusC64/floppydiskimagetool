---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Update-FloppyDiskImageConfiguration

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### RotationDecider
```
Update-FloppyDiskImageConfiguration -RotationDetector <RotationDecider1> [-Passthru] -TrackFrom <Double>
 [-TrackTo <Double>] [-TrackStep <Double>] [-Side <Sides>] -Value <Int32>
 -TracknumberingStyle <TracknumberingStyle> [<CommonParameters>]
```

### SpeedDetector
```
Update-FloppyDiskImageConfiguration [-Passthru] -SpeedDetector <SpeedDetector2> -TrackFrom <Double>
 [-TrackTo <Double>] [-TrackStep <Double>] [-Side <Sides>] -Value <Int32>
 -TracknumberingStyle <TracknumberingStyle> [<CommonParameters>]
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

### -Passthru
{{ Fill Passthru Description }}

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

### -RotationDetector
{{ Fill RotationDetector Description }}

```yaml
Type: RotationDecider1
Parameter Sets: RotationDecider
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Side
{{ Fill Side Description }}

```yaml
Type: Sides
Parameter Sets: (All)
Aliases:
Accepted values: sideA, sideB, bothSides

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpeedDetector
{{ Fill SpeedDetector Description }}

```yaml
Type: SpeedDetector2
Parameter Sets: SpeedDetector
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TrackFrom
{{ Fill TrackFrom Description }}

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrackStep
{{ Fill TrackStep Description }}

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrackTo
{{ Fill TrackTo Description }}

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TracknumberingStyle
{{ Fill TracknumberingStyle Description }}

```yaml
Type: TracknumberingStyle
Parameter Sets: (All)
Aliases:
Accepted values: ZeroBased, Commodore1541, Commodore8250

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
{{ Fill Value Description }}

```yaml
Type: Int32
Parameter Sets: (All)
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

### CommodoreDisk.Image.flux.RotationDecider1

### CommodoreDisk.Image.Convert.SpeedDetector2

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
