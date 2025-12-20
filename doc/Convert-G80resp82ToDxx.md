---
external help file: FloppyDiskImageTool-help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Convert-G80resp82ToDxx

## SYNOPSIS
Converts a G80 or G82 bitstream image object to a compatible sector image object (Dxx).

## SYNTAX

```
Convert-G80resp82ToDxx [-g8xImage] <Object> [[-tracks] <Int32[]>] [[-numTracks] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Converts a G80 or G82 bitstream image object to a compatible D80 or D82 sector image object.

The input object can be provided via the -g64Image parameter or passed through the pipeline.  

- The -tracks parameter specifies which tracks to convert.  
- The -numTracks parameter specifies the total number of tracks per side in the target image.  

All Commodore sectors are 256 bytes. Only sectors containing 256 bytes of data are written to the target image, even if they contain errors. Error codes are preserved.

Note: This function is not fully standardized. The cmdlet exists in the source code and may be adjusted or extended by users.

cf. Convert-G64resp71ToDxx

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -g8xImage
{{ Fill g8xImage Description }}

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

### -numTracks
{{ Fill numTracks Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -tracks
{{ Fill tracks Description }}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

## RELATED LINKS
