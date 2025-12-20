---
external help file: CommodoreDiskImageTool.dll-Help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Read-FloppyDiskImageTrack

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
Read-FloppyDiskImageTrack -BitStreamImage <GxxImageV1> -TracknumberingStyle <TracknumberingStyle>
 -Track <Double> -side <Int32> [<CommonParameters>]
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

### -BitStreamImage
{{ Fill BitStreamImage Description }}

```yaml
Type: GxxImageV1
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Track
{{ Fill Track Description }}

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

### -side
{{ Fill side Description }}

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

### CommodoreDisk.Image.raw.GxxImageV1

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
