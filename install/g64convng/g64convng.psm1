$filetypes = @(
       @( $null, 40, '??.0.raw', { param($p) Get-FloppyDiskImage -KryofluxImage -Filename $p | Update-FloppyDiskImage -FixRotationsFluxDump -Passthru }, { throw "Invalid Operation" }),
       @( $null, 41, '??.1.raw', { param($p) Get-FloppyDiskImage -KryofluxImage -Filename $p | Update-FloppyDiskImage -FixRotationsFluxDump -Passthru}, { throw "Invalid Operation" }),
       @( $null, 42, '??.?.raw', { param($p) Get-FloppyDiskImage -KryofluxImage -Filename $p | Update-FloppyDiskImage -FixRotationsFluxDump -Passthru}, { throw "Invalid Operation" }),
       @( $null, 45, '.scp', { param($p) Get-FloppyDiskImage -SCPImage -Filename $p | Update-FloppyDiskImage -FixRotationsFluxDump -Passthru}, { param($v, $p)  $v | Export-FloppyDiskImage -SCP -Filename  $p }),

       @( "1541", 30, '.p64', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "1571", 30, '.p71', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "1581", 30, '.p81', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "8050", 30, '.p80', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "8250", 30, '.p82', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "FD1K", 30, '.p1m', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "FD2K", 30, '.p2m', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),
       @( "FD4K", 30, '.p4m', { param($p)  Get-FloppyDiskImage -FLux -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Flux  -Filename $p } ),

       @( "1541", 20, '.g64', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "1571", 20, '.g71', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "1581", 20, '.g81', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "8050", 20, '.g80', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "8250", 20, '.g82', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "FD1K", 20, '.g1m', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "FD2K", 20, '.g2m', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),
       @( "FD4K", 20, '.g4m', { param($p)  Get-FloppyDiskImage -Bitstream -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -Bitstream  -Filename $p } ),

       @( $null,  11, '.txt', { param($p)  Get-FloppyDiskImage -Text  -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -TextualBitstream -Filename $p } ),
       @( "1541", 10, '.d64', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D64 -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "1571", 12, '.d71', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D71 -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "1581", 13, '.d81', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D81 -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "FD1K", 14, '.d1m', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D1M -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "FD2K", 15, '.d2m', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D2M -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "FD4K", 16, '.d4m', { param($p)  Get-FloppyDiskImage -SectorImage -SectorImageType D4M -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),

       @( "8050", 17, '.d80', { param($p)  Get-FloppyDiskImage -SectorImage -UseFactory -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } ),
       @( "8250", 18, '.d82', { param($p)  Get-FloppyDiskImage -SectorImage -UseFactory -Filename $p }, { param($v, $p)  $v | Export-FloppyDiskImage -SectorImage  -Filename $p } )
)

$conversions = @(
   @( 40, 30, {param($v,$p) $v | Convert-FloppyDiskImage -FluxDumpToFlux -Floppy $p.Floppy -RotationDecider $p.RotDecider -Sides sideA } ),
   @( 41, 30, {param($v,$p) $v | Convert-FloppyDiskImage -FluxDumpToFlux -Floppy $p.Floppy -RotationDecider $p.RotDecider -Sides sideB } ),
   @( 42, 30, {param($v,$p) $v | Convert-FloppyDiskImage -FluxDumpToFlux -Floppy $p.Floppy -RotationDecider $p.RotDecider -Sides bothSides } ),
   @( 45, 30, {param($v,$p) $v | Convert-FloppyDiskImage -FluxDumpToFlux -Floppy $p.Floppy -RotationDecider $p.RotDecider -Sides $p.Sides } ),

   @( 30, 45, {param($v,$p) $v | Convert-FloppyDiskImage -FluxToSCP } ),

   @( 30, 20, { param($v,$p) $t=$p.param8250; $v | Convert-FloppyDiskImage -FluxToBitstream @t | Pad-BitstreamIfRequired -isRequired $p.shouldPad } ),

   @( 20, 30, { param($v,$p) $v | Convert-FloppyDiskImage -BitstreamToFlux } ),


   @( 20, 11, { param($v,$p) $v | Convert-FloppyDiskImage -BitstreamToText -BitstreamToTextOptions $p.TextMode } ),
   @( 20, 10, { param($v,$p) $v | Convert-G64resp71ToDxx -tracks $p.TrackRange1541} ),
   @( 20, 12, { param($v,$p) $v | Convert-G64resp71ToDxx -tracks $p.TrackRange1541} ),

   @( 20, 13, { param($v,$p) $v | Convert-G81ToD81} ),

   @( 20, 14, { param($v,$p) $v | Convert-GxMToDxM} ),
   @( 20, 15, { param($v,$p) $v | Convert-GxMToDxM} ),
   @( 20, 16, { param($v,$p) $v | Convert-GxMToDxM} ),

   @( 20, 17, { param($v,$p) $v | Convert-G80resp82ToDxx -tracks $p.TrackRange1541} ),
   @( 20, 18, { param($v,$p) $v | Convert-G80resp82ToDxx -tracks $p.TrackRange1541} ),

   @( 11, 20, { param($v,$p) $v | Convert-FloppyDiskImage -TextToBitstream -Floppy $p.Floppy } ),
   
   @( 10, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppy1541 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 12, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppy1571 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 13, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppy1581 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 14, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppyFD2000DD | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 15, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppyFD2000 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 16, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppyFD4000 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 17, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppy8050 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } ),
   @( 18, 20, { param($v,$p) New-FloppyDiskTemplate -Floppy floppy8250 | Convert-FloppyDiskImage -TemplateToText -SourceDxx $v | Convert-FloppyDiskImage -TextToBitstream } )
)

$filetypesregex = "("+(($filetypes | ForEach-Object { "(?:"+[regex]::Escape($_[2])+")" }) -join "|")+")$"

$filetypesDict = @{}

foreach ($ft in $filetypes) {
    $obj = [PSCustomObject]@{
        Floppy   =  $ft[0]
        Priority =  $ft[1]
        Extension = $ft[2]
        Import    = $ft[3]
        Export    = $ft[4]
    }

    $filetypesDict[$obj.Extension] = $obj
}

# Dictionary<int, Dictionary<int, ScriptBlock>>
$conversionsDict = @{}

foreach ($c in $conversions) {
    $from = $c[0]
    $to   = $c[1]
    $conv = $c[2]

    if (-not $conversionsDict.ContainsKey($from)) {
        $conversionsDict[$from] = @{}
    }

    $conversionsDict[$from][$to] = $conv
}

function ConvertToFileName {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$content,

        [Parameter(Mandatory)]
        [string]$outputFile,
        
                
        [Parameter()]
        $par
    )

    # 1) Prüfen, ob Dateiname erkannt wird
    if ($outputFile -notmatch $filetypesregex) {
        throw "Unbekannter oder nicht unterstützter Ziel-Dateityp: $outputFile"
    }

    # 2) Key aus Regex
    $key = $Matches[1]

    if (-not $filetypesDict.ContainsKey($key)) {
        throw "Kein Handler für Dateityp '$key' registriert."
    }

    # 3) Zielformat ermitteln
    $targetFormat = $filetypesDict[$key].Priority

    # 4) Konvertieren
    $converted = ConvertToFormat -content $content -targetFormat $targetFormat -par $par

    # 5) Rückgabe oder direkt WriteFile
    return $converted
}

function ConvertToFormat {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$content,

        [Parameter(Mandatory)]
        [int]$targetFormat,
        
        [Parameter()]
        $par
    )

    # aktuelles Format
    $current = $content.No
    $data    = $content.Content

    while ($current -ne $targetFormat) {
        # berechne nächsten Schritt in Richtung Ziel
        $currentP = [math]::Floor($current / 10)
        $targetP  = [math]::Floor($targetFormat / 10)
        $direction = [math]::Sign($targetP - $currentP)

        if ($direction -eq 0) {
            # gleiche Ebene → direkte Konvertierung
            $next = $targetFormat
        }
        elseif ($currentP + $direction -eq $targetP) {
           $next = $targetFormat
        }
        else {
            # Schritt zur benachbarten Ebene
            $next = ($currentP + $direction) * 10
        }
        $next = [int] $next
        
        # Lookup in Dictionary
        
        if (-not $conversionsDict.ContainsKey($current)) {
            throw "Keine Konvertierung von $current nach $next definiert (1)."
        }

        if (-not $conversionsDict[$current].ContainsKey($next)) {
            throw "Keine Konvertierung von $current nach $next definiert (2)."
        }
        
        $cnv = $conversionsDict[$current][$next];

        # Ausführen
        $data = & $cnv $data $par

        # Update
        $current = $next
    }
    # Rückgabe
    [PSCustomObject]@{
        Content     = $data
        No         = $targetFormat
    }
}

function ReadFile {
    param(
        [Parameter(Mandatory)]
        [string]$Filename
    )

    # Existiert die Datei überhaupt?
    #if (-not (Test-Path -LiteralPath $Filename -PathType Leaf)) {
    #    return $null
    #}

    # Unterstützte Extension?
    if ($Filename -notmatch $filetypesregex) {
        return $null
    }

    $ext = $Matches[1]

    # Sicherheitshalber prüfen
    if (-not $filetypesDict.ContainsKey($ext)) {
        return $null
    }

    $handler = $filetypesDict[$ext]

    try {
        $content = & $handler.Import $Filename
    }
    catch {
        return $null
    }

    if ($null -eq $content) {
        return $null
    }

    [PSCustomObject]@{
        Content = $content
        No      = $handler.Priority
    }
}

function WriteFile {
    param(
        [Parameter(Mandatory)]
        [string]$Filename,

        [Parameter(Mandatory)]
        [pscustomobject]$Content
    )

    # 1) Format aus Dateinamen bestimmen
    if ($Filename -notmatch $filetypesregex) {
        throw "Unbekannter oder nicht unterstützter Dateityp: $Filename"
    }

    $key = $Matches[1]

    if (-not $filetypesDict.ContainsKey($key)) {
        throw "Kein Handler für Dateityp '$key' registriert."
    }

    $handler = $filetypesDict[$key]

    # 2) Formatnummer prüfen
    if ($Content.No -ne $handler.Priority) {
        throw "Format passt nicht zum Dateityp '$key'. Erwartet: $($handler.Priority), erhalten: $($Content.No)"
    }

    # 3) Export durchführen
    try {
        & $handler.Export $Content.Content $Filename
    }
    catch {
        throw "Fehler beim Schreiben der Datei '$Filename': $_"
    }
}


function do-g64conv {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,Mandatory=$true)]
        $param1,

        [Parameter(Position=1,Mandatory=$true)]
        $param2,

        [Parameter(Position=2)]
        $param3 = "",

        [Parameter(Position=3)]
        $param4 = "",

        [Parameter(Position=4)]
        $param5 = "",

	[Parameter()]
	[string]$Floppy = "",
	
	[Parameter()]
	[bool]$NoPadding = $false
    )
    

    # Restliche CLI-Parameter weiterhin als Array, falls dynamisch benötigt
    $ParamArray = @($param1,$param2,$param3,$param4,$param5)
    
    $match1 = $null;
    $match2 = $null;
    
    if ($param1 -match $filetypesregex) { $match1 = $Matches[1]; }
    if ($param2 -match $filetypesregex) { $match2 = $Matches[1]; }

    if ($param1 -eq "verify" -and $null -ne $match2 ) {
       $sourceFloppy = $filetypesDict[$match2].Floppy

       if ("" -eq $Floppy) { $Floppy = $sourceFloppy }
       if ("" -eq $Floppy) { $Floppy = '1541' }
       
       $OptionalParams = [PSCustomObject]@{
         TextMode = $null
         TrackRange1541 = $null
         RotDecider = $null
         SpeedDetector = $null
         Sides = $null
         param8250 = $null
         Floppy = $Floppy
         shouldPad = $false
       }

       $nextParam = 2
       
       if ($filetypesDict[$match2].Priority -ge 20 ) {
         $para = $ParamArray[$nextParam++]
         if ($para -eq "") { $para = '1..35' }
         $OptionalParams.TrackRange1541 = Parse-Range -Range $para | Sort-Object
       }
       
      if ($filetypesDict[$match2].Priority -ge 30 ) {
          $tmp = Parse-RotationSpeedParameter -Range $ParamArray[$nextParam++]
          $OptionalParams.RotDecider = New-RotationConfiguration -parsed $tmp
          $OptionalParams.SpeedDetector = New-SpeedDetectorFromParsed -parsed $tmp -floppy $Floppy
          $OptionalParams.Sides = switch ($tmp.scpside) {
           0 { "sideA" }
           1 { "sideB" }
           default { "bothSides" }
	  }
          $OptionalParams.param8250 =
               if ($tmp.floppy8250) { @{ Use8250SpeedZones = $true } }
    	       else { @{} }
           }

       $file = ReadFile $param2
       
       $targetFormat = $filetypesDict.Values |
         Where-Object {
           $_.Priority -ge 10 -and
           $_.Priority -le 19 -and
           $_.Floppy -eq $Floppy
         } | Select-Object -First 1 -ExpandProperty Priority
       
       if ($null -eq $targetFormat) { throw "Cannot determine sector format for floppy type '$Floppy'" }

       $file = ConvertToFormat -content $file -targetFormat $targetFormat -par $OptionalParams
       $file.Content | Find-ErrorsInDxx
    }
    elseif ($param1 -match '\.d64' -and $param2 -match '\.d71') {
	New-FloppyDiskTemplate -Floppy floppy1541 |
    		Convert-FloppyDiskImage -TemplateToText -DataFilename $param1 |
    		Convert-FloppyDiskImage -TextToBitstream |
    		Update-G64ToDoubleSided -Passthru |
    		Convert-G64resp71ToDxx |
    		Export-FloppyDiskImage -SectorImage -Filename $param2       
    }
    elseif ($param1 -match '\.g64' -and $param2 -match '\.g71') {
	Get-FloppyDiskImage -Bitstream -Filename $param2 |
    		Update-G64ToDoubleSided -Passthru |
    		Export-FloppyDiskImage -Bitstream -Filename $param2
    }
    elseif ($null -ne $match1 -and $null -ne $match2)
    {
       Write-Host "Konvertiere von $param1 nach $param2"
       
       $sourceFloppy = $filetypesDict[$match1].Floppy
       $destinationFloppy = $filetypesDict[$match2].Floppy
       
       if ("" -eq $Floppy) { $Floppy = $destinationFloppy }
       if ("" -eq $Floppy) { $Floppy = $sourceFloppy }
       if ("" -eq $Floppy) { $Floppy = '1541' }
       
       $OptionalParams = [PSCustomObject]@{
         TextMode = $null
         TrackRange1541 = $null
         RotDecider = $null
         SpeedDetector = $null
         Sides = $null
         param8250 = $null
         Floppy = $Floppy
         shouldPad = -not $NoPadding
       }

       $nextParam = 2
       
       if ($param2 -match '\.txt$') {
          $OptionalParams.TextMode = Parse-TextModeParameter -Value $ParamArray[$nextParam++] | Build-Bitstream2TextOptions
          $OptionalParams.shouldPad = -not $NoPadding -and -not ($match2 -match '\.txt$' -and $OptionalParams.TextMode.RawFluxUnpadded)

       }
       
       if ($param2 -match '\.d..$') {
         $para = $ParamArray[$nextParam++]
         if ($para -eq "") { $para = '1..35' }
         $OptionalParams.TrackRange1541 = Parse-Range -Range $para | Sort-Object
       }
       
      if ($filetypesDict[$match1].Priority -ge 30 && $filetypesDict[$match2].Priority -lt 30 ) {
          $tmp = Parse-RotationSpeedParameter -Range $ParamArray[$nextParam++]
          $OptionalParams.RotDecider = New-RotationConfiguration -parsed $tmp
          $OptionalParams.SpeedDetector = New-SpeedDetectorFromParsed -parsed $tmp -floppy $Floppy
          $OptionalParams.Sides = switch ($tmp.scpside) {
           0 { "sideA" }
           1 { "sideB" }
           default { "bothSides" }
	  }
          $OptionalParams.param8250 =
               if ($tmp.floppy8250) { @{ Use8250SpeedZones = $true } }
    	       else { @{} }
           }
           $OptionalParams.shouldPad = -not $NoPadding -and -not ($match2 -match '\.txt$' -and $RawFluxUnpadded)
       

       
       $file = ReadFile $param1
       $file = ConvertToFileName -Content $file -outputFile $param2 -Par $OptionalParams
       WriteFile -Filename $param2 -Content $file
    }
}







function Parse-RotationSpeedParameter {
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$Range
    )

    # Defaults exakt wie Original
    $ret = @{
        rotation = @{ default = 0 }
        deltaMax = 500
        decoderalgorithm = 2
        speedzonealgorithm = 1
        verifyRange1 = -250
        verifyRange2 = 250
        rpm = 300
        scpside = 0
        nomfm = 0
        floppy8250 = 0
        epsilon1 = -10
        epsilon2 = 10
        speed = @{}
        sectorspeed = @{}
        
        useSstd = $false
        # useSstd8250 = $false
    }
    
    if ($Range -eq "") {
        return $ret
    }

    $ranges = $Range -split ","

    foreach ($r in $ranges) {

        switch -Regex ($-r) {

            '^sstd$' {
                    $ret.useSstd = $true
                    continue
            }
                
            '^sstd8250$' {
                    $ret.useSstd = $true
                    # $ret.useSstd8250 = $true
                    $ret.floppy8250 = 1   # wie im Original
                    continue
            }
                
            '^nomfm$' {
                $ret.nomfm = 1
                continue
            }

            '^8250$' {
                $ret.floppy8250 = 1
                continue
            }

            '^ad([0-3])$' {
                $ret.decoderalgorithm = [int]$Matches[1]
                continue
            }

            '^as([1-2])$' {
                $ret.speedzonealgorithm = [int]$Matches[1]
                continue
            }

            '^rpm([0-9\.]+)$' {
                $ret.rpm = [double]$Matches[1]
                continue
            }

            '^v(-?\d+)(?:\.\.(-?\d+))?$' {
                $a = [int]$Matches[1]
                $b = $Matches[2]

                if ($b) {
                    $b = [int]$b
                    if ($a -ge $b) { throw "Empty verification range" }
                    $ret.verifyRange1 = $a
                    $ret.verifyRange2 = $b
                }
                else {
                    $ret.verifyRange1 = -$a
                    $ret.verifyRange2 = $a
                }
                continue
            }

            '^e(-?\d+)(?:\.\.(-?\d+))?$' {
                $a = [int]$Matches[1]
                $b = $Matches[2]

                if ($b) {
                    $b = [int]$b
                    if ($a -ge $b) { throw "Empty verification range" }
                    $ret.epsilon1 = $a
                    $ret.epsilon2 = $b
                }
                else {
                    $ret.epsilon1 = -$a
                    $ret.epsilon2 = $a
                }
                continue
            }

            '^r?(\d+)$' {
                $ret.rotation.default = [int]$Matches[1]
                continue
            }

            '^rs$' {
                $ret.rotation.default = -1
                continue
            }

            '^d(\d+)$' {
                $ret.deltaMax = [int]$Matches[1]
                continue
            }

            '^s(\d+)$' {
                $ret.speed.default = [int]$Matches[1]
                continue
            }

           # Komplexer Speed-Bereich, optionales Inkrement, rs-Flag und Wert
           '^([0-9]+(?:\.5)?)(?:\.\.([0-9]+(?:\.5)?))?(?:/([0-9]+(?:\.5)?))?=([rs])(m|a|[0-9]+)$' {
               # Extrahiere alle Gruppen
               $start = [double]$Matches[1]
               $end   = if ($Matches[2]) { [double]$Matches[2] } else { $start }
               $incr  = if ($Matches[3]) { $Matches[3] } else { 1 }
               $rs    = $Matches[4]
               $val   = $Matches[5]
           
               # Spezielle Flags wie "8250" nur im Schritt merken
               $convention = "1571"
               if ($incr -eq "8250") {
                   $convention = "8250"
                   $incr = 1
               }
           
               # Erzeuge Tabelle / Objekt für diesen Eintrag
               $entry = [PSCustomObject]@{
                   StartTrack    = $start
                   EndTrack      = $end
                   Increment     = [double]$incr
                   SpeedValue    = $val
                   Convention    = $convention
               }
           
               # Füge den Eintrag in eine Liste im Rückgabeobjekt ein
               
               if ($rs -eq "S") {
                  if (-not $ret.speedTable) { $ret.speedTable = @() }
               	  $ret.speedTable += $entry
               } else {
                  if (-not $ret.rotationTable) { $ret.rotationTable = @() }
               	  $ret.rotationTable += $entry
               }
           
               continue
            } 
          
           '^([0-9]+(?:\.5)?)(?:\.\.([0-9]+(?:\.5)?))?(?:/([0-9]+(?:\.5)?))?:([0-9]+(?:\.5)?)(?:\.\.([0-9]+(?:\.5)?))?(?:/([0-9]+))?=s([0-9]+)$' {
               $start     = [double]$Matches[1]
               $end       = if ($Matches[2]) { [double]$Matches[2] } else { $start }
               $incr      = if ($Matches[3]) { [double]$Matches[3] } else { $null }
           
               $startS    = [double]$Matches[4]
               $endS      = if ($Matches[5]) { [double]$Matches[5] } else { $startS }
               $incrS     = if ($Matches[6]) { [double]$Matches[6] } else { $null }
           
               $val       = [int]$Matches[7]
           
               # Track-Inkrement ableiten, wenn nicht angegeben
               if (-not $incr) {
                   $d = $end - $start + 0.01
                   $incr = ( [math]::Abs($d - [math]::Floor($d)) -lt 0.1 ) ? 1 : 0.5
               }
           
               # Sektor-Inkrement ableiten, wenn nicht angegeben
               if (-not $incrS) { $incrS = 1 }
           
               # Erzeuge strukturiertes Objekt
               $entry = [PSCustomObject]@{
                   TrackStart      = $start
                   TrackEnd        = $end
                   TrackIncrement  = $incr
                   SectorStart     = $startS
                   SectorEnd       = $endS
                   SectorIncrement = $incrS
                   SpeedValue      = $val
                   Convention      = "1571"
               }
           
               # Tabelle anlegen, falls noch nicht vorhanden
               if (-not $ret.sectorSpeedTable) { $ret.sectorSpeedTable = @() }
               $ret.sectorSpeedTable += $entry
           
               continue
           }
           
        '^scpside([0-2])$' {
                $ret.scpside = [int]$Matches[1]
                continue
            }

            default {
                throw "UNKNOWN $r"
            }
        }
    }

    return $ret
}


function Parse-TextModeParameter {
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$Value
    )
    
    $mode = @{
        HexOnly               = $false
        BinaryHexDump         = $false
        ParseGCR              = $false
        Warp25Heuristic       = $false
        Max16BytesPerLine     = $false
        IncludeRawBytesComment= $false
        P64FluxList           = $false
        RawFlux               = $false
        RawFluxUnpadded       = $false
    }

    switch ($Value.ToLower()) {

        "00" {
            $mode.BinaryHexDump = $true
            return $mode
        }

        "0" {
            $mode.HexOnly = $true
            return $mode
        }

        "1" {
            $mode.ParseGCR = $true
            return $mode
        }

        "2" {
            $mode.ParseGCR = $true
            $mode.Warp25Heuristic = $true
            return $mode
        }

        "3" {
            $mode.ParseGCR = $true
            $mode.Max16BytesPerLine = $true
            return $mode
        }

        "5" {
            $mode.ParseGCR = $true
            $mode.IncludeRawBytesComment = $true
            return $mode
        }

        "6" {
            $mode.ParseGCR = $true
            $mode.Max16BytesPerLine = $true
            $mode.IncludeRawBytesComment = $true
            return $mode
        }

        "raw" {
            $mode.RawFlux = $true
            return $mode
        }

        "rawunpadded" {
            $mode.RawFluxUnpadded = $true
            return $mode
        }

        "" {
            $mode.ParseGCR = $true
            return $mode
        }

        default {
            throw "Invalid mode parameter: $Value"
        }
    }
}
















function Parse-Range {
    param(
        [Parameter(Mandatory)]
        [string]$Range
    )

    $values = @()

    $parts = $Range -split ','

    foreach ($part in $parts) {

        # 1) Single integer
        if ($part -match '^([0-9]+)$') {
            $values += [double]$Matches[1]
            continue
        }

        # 2) Range with optional increment (supports .5)
        if ($part -match '^([0-9]+(?:\.5)?)\.\.([0-9]+(?:\.5)?)(?:\/([0-9]+(?:\.5)?))?$') {

            $a = [double]$Matches[1]
            $b = [double]$Matches[2]
            $c = $Matches[3]

            if (-not $c) {
                # Auto increment detection
                $d = $b - $a
                $d -= [math]::Floor($d)

                if ([math]::Abs($d) -lt 0.1) {
                    $c = 1
                }
                else {
                    $c = 0.5
                }
            }
            else {
                $c = [double]$c
            }

            for ($i = $a; $i -le $b; $i += $c) {
                $values += $i
            }

            continue
        }

        # 3) Single half-track (redundant in Perl, but kept for parity)
        if ($part -match '^([0-9]+\.5)$') {
            $values += [double]$Matches[1]
            continue
        }

        # 4) Simple integer range (redundant but explicit in Perl)
        if ($part -match '^([0-9]+)\.\.([0-9]+)$') {
            $a = [int]$Matches[1]
            $b = [int]$Matches[2]

            for ($i = $a; $i -le $b; $i++) {
                $values += [double]$i
            }

            continue
        }

        # Perl silently ignores invalid parts — wir machen das auch so
    }

    # Deduplication like Perl: %ret = map { $_ => 1 } @ret;
    $hashSet = [System.Collections.Generic.HashSet[double]]::new()

    foreach ($v in $values) {
       $hashSet.Add($v) | Out-Null   # Add gibt bool zurück, aber wir ignorieren
    }

    return $hashSet
}




function Build-Bitstream2TextOptions {
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [pscustomobject]$parsedParams
    )

    $configParams = @{}

    # Bitstream2TextOptions
    if ($parsedParams.ParseGCR) { $configParams.Bitstream2TextOptions = "decoded" }
    elseif ($parsedParams.BinaryHexDump) { $configParams.Bitstream2TextOptions = "bits" }
    elseif ($parsedParams.HexOnly) { $configParams.Bitstream2TextOptions = "bytes" }

    # Switches
    if ($parsedParams.Max16BytesPerLine)   { $configParams.MultilineData = $true }
    if ($parsedParams.IncludeRawBytesComment) { $configParams.RawDataComment = $true }

    # RawFlux Optionen können später auch gemappt werden, falls Cmdlet sie kennt

    # Return als Splat-Hashtable
    return New-FloppyDiskImageConfiguration -Bitstream2TextOptions @configParams
}


function New-RotationConfiguration {

    param($parsed)

    $config = New-FloppyDiskImageConfiguration -RotationDecider -Rotation $parsed.rotation.default

    if (-not $parsed.rotationTable) {
        return $config
    }

    foreach ($r in $parsed.rotationTable) {

       $trackStyle =
           switch ($r.Convention) {
              "8250" { "Commodore8250" }
               default { "Commodore1541" }
           }

        Update-FloppyDiskImageConfiguration `
            -RotationDetector $config `
            -TrackFrom $r.StartTrack `
            -TrackTo $r.EndTrack `
            -TrackStep $r.Increment `
            -TracknumberingStyle $trackStyle `
            -Value $r.SpeedValue
    }

    return $config
}











function New-SpeedDetectorFromParsed {
    param(
        $parsed,
        $floppy
    )

    $fallback = switch ($floppy) {
        "1541" { "cbm1571" }
        "1571" { "cbm1571" }
        "8050" { "cbm8250" }
        "8250" { "cbm8250" }
        default { $null }
    }
    
    $fallbackFixedSpeed = $null;
    if ($null -eq $fallback) {
       $fallbackFixedSpeed = switch ($floppy) {
        "1581" { 8 }
        "FD1K" { 8 }
        "FD2K" { 9 }
        "FD4K" { 10 }
        default { 8 }
        }
    }
    
    $config = $null

   $params = @{
        SpeedDetector = $true
    }

    if ($parsed.speed.ContainsKey("default")) {
        $params["SpeedZone"] = $parsed.speed.default
    }
    elseif ($null -ne $fallbackFixedSpeed) {
        $params["SpeedZone"] = $fallbackFixedSpeed
    }

    if ($null -ne $fallback) {
        $params["FallbackSpeedZoneType"] = $fallback
    }
    
    if ($parsed.useSstd) {
        $params["SpeedZoneType"] = $fallback
    }

    $config = New-FloppyDiskImageConfiguration @params

    if ($parsed.speedTable) {
        foreach ($s in $parsed.speedTable) {
            $trackStyle = switch ($s.Convention) {
                "8250" { "Commodore8250" }
                default { "Commodore1541" }
            }

            $config | Update-FloppyDiskImageConfiguration `
                -SpeedDetector `
                -Side bothSides `
                -TrackFrom $s.StartTrack `
                -TrackTo $s.EndTrack `
                -TrackStep $s.Increment `
                -TracknumberingStyle $trackStyle `
                -Value $s.SpeedValue
        }
    }

    return $config
}


function Pad-BitstreamIfRequired {
    param(
        [Parameter(ValueFromPipeline=$true)]
        $v,

        $isRequired
    )

    process {
        if ($isRequired) {
            $v | Update-FloppyDiskImage -PadGCRBitstream -Passthru
        }
        else {
            $v
        }
    }
}
