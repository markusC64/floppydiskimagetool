---
external help file: FloppyDiskImageTool-help.xml
Module Name: FloppyDiskImageTool
online version:
schema: 2.0.0
---

# Convert-G64resp71ToDxx

## SYNOPSIS
Converts a G64 or G71 bitstream image object to a compatible sector image object (Dxx).

## SYNTAX

```
Convert-G64resp71ToDxx [-g64Image] <Object> [[-tracks] <Int32[]>] [[-numTracks] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Converts a G64 or G71 bitstream image object to a compatible D64 or D71 sector image object.

The input object can be provided via the -g64Image parameter or passed through the pipeline.  

- The -tracks parameter specifies which tracks to convert.  
- The -numTracks parameter specifies the total number of tracks per side in the target image.  

All Commodore sectors are 256 bytes. Only sectors containing 256 bytes of data are written to the target image, even if they contain errors. Error codes are preserved.

Note: This function is not fully standardized. The cmdlet exists in the source code and may be adjusted or extended by users.

## EXAMPLES

### Example 1
```powershell
PS C:\> $g64 = Get-FloppyDiskImage -Bitstream -Filename disk.g64
PS C:\> $d64 = Convert-G64resp71ToDxx -g64Image $g64
```

Converts the G64 to a D64.

### Example 2
```powershell
PS C:\> $g64 = Get-FloppyDiskImage -Bitstream -Filename disk.g64
PS C:\> $d64 = Convert-G64resp71ToDxx -g64Image $g64 -Tracks 2..36
```

Converts the G64 to a D64. Looking for the sectors one track above than normal.

## PARAMETERS

### -g64Image
The G64 or G71 bitstream image object to convert. Can be passed via pipeline or directly as an argument.

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
Specifies the number of tracks per side to store in the target image. If omitted, 35 tracks are converted..

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
An array of track numbers to convert from the bitstream image. Defaults to 1..35.

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
