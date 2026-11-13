# MegaAssCross – Werkzeuge für den MegaAssembler-Cross-Assembler.
# Setzt FloppyDiskImageTool voraus (CommodoreFSProvider, Get-DriveQualifiedPath, Test-GeoWrite,
# Convert-GeoWriteToMegaAssemblerSource, CommodoreDisk.Helper.Convert.geosToCVT).

function ConvertTo-MegaAssemblerFileName {
    <#
    .SYNOPSIS
    Dateiname zu einem GEOS-Namen; dieselbe Regel wie MegaAss.Assembler.SourceFileName im Assembler.
    .DESCRIPTION
    1. Deutscher Zeichensatz: @ [ \ ] { | } ~  ->  § Ä Ö Ü ä ö ü ß  (wie in den konvertierten Quelltexten).
    2. Unter Windows unzulässig -> {xx} (Hex): / : * ? " < >, Steuerzeichen, Zeichen ab $7F (außer den Umlauten
       aus 1.) sowie Punkt oder Leerzeichen am Ende.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([Parameter(Mandatory, ValueFromPipeline)][AllowEmptyString()][string]$Name)
    process {
        $ascii = '@[\]{|}~'
        $german = '§ÄÖÜäöüß'
        $forbidden = '/:*?"<>'
        $sb = [System.Text.StringBuilder]::new()
        for ($i = 0; $i -lt $Name.Length; $i++) {
            [char]$c = $Name[$i]
            $a = $ascii.IndexOf($c)
            if ($a -ge 0) { $c = $german[$a] }
            $last = $i -eq $Name.Length - 1
            $code = [int]$c
            $escape = $code -lt 0x20 -or $code -eq 0x7F -or ($code -ge 0x80 -and $german.IndexOf($c) -lt 0) -or
                      $forbidden.IndexOf($c) -ge 0 -or ($last -and ($c -eq '.' -or $c -eq ' '))
            if ($escape) { [void]$sb.Append('{').Append($code.ToString('X2')).Append('}') }
            else { [void]$sb.Append($c) }
        }
        $sb.ToString()
    }
}

function Get-MegaAssemblerFileName {
    <#
    .SYNOPSIS
    Dateiname (ohne Endung) zu einem Eintrag aus Get-ChildItem. Einzige Stelle, die festlegt, welche Property des
    DirectoryEntry als Name gilt.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([Parameter(Mandatory)]$Item)
    $entry = $Item.directoryEntry
    if ($null -eq $entry) { return [IO.Path]::GetFileNameWithoutExtension($Item.Name) }
    # Die Namensbytes unverändert (ISO-8859-1, ohne $A0-Auffüllung): bei GEOS-Dateien ASCII.
    ConvertTo-MegaAssemblerFileName $entry.filenamePETSCII
}

function Get-MegaAssemblerFileDate {
    <#
    .SYNOPSIS
    Datum und Uhrzeit aus dem Verzeichniseintrag eines Eintrags aus Get-ChildItem, als lokale Zeit; $null, wenn das
    Datum (Jahr, Monat, Tag) oder die Uhrzeit (Stunde, Minute) 0 ist oder kein Verzeichniseintrag da ist.
    .DESCRIPTION
    Jahrbyte: ab 100 als Jahr - 1900 (2026 = 126); darunter zweistellig, wie es der C64 unter GEOS/MegaPatch tatsächlich
    schreibt (2026 = 26): unter 80 -> 20xx, sonst 19xx. Ungültige Werte (Monat 13, 31. April, 25 Uhr) ergeben eine
    Warnung und $null.
    #>
    [CmdletBinding()]
    [OutputType([datetime])]
    param([Parameter(Mandatory)]$Item)
    $e = $Item.directoryEntry
    if ($null -eq $e) { return $null }
    [int]$y = $e.Year; [int]$mo = $e.Month; [int]$d = $e.Day; [int]$h = $e.Hour; [int]$mi = $e.Minute
    if (($y -eq 0 -and $mo -eq 0 -and $d -eq 0) -or ($h -eq 0 -and $mi -eq 0)) { return $null }
    $year = if ($y -ge 100) { 1900 + $y } elseif ($y -lt 80) { 2000 + $y } else { 1900 + $y }
    if ($mo -lt 1 -or $mo -gt 12 -or $d -lt 1 -or $d -gt [datetime]::DaysInMonth($year, $mo) -or $h -gt 23 -or $mi -gt 59) {
        Write-Warning ("Ungültiges Datum im Verzeichniseintrag von {0}: {1}-{2:00}-{3:00} {4:00}:{5:00} (Rohwerte), Datum nicht übernommen" -f
            $Item.Name, $y, $mo, $d, $h, $mi)
        return $null
    }
    [datetime]::new($year, $mo, $d, $h, $mi, 0, [DateTimeKind]::Local)
}

function Export-MegaAssemblerProject {
    <#
    .SYNOPSIS
    Wandelt die Dateien eines eingebundenen Images so um, dass der Cross-Assembler sie verwenden kann.
    .DESCRIPTION
    Je Eintrag (rekursiv über Verzeichnisse):
      geoWrite-Dokument      -> Name.s   (Test-GeoWrite, Convert-GeoWriteToMegaAssemblerSource, assemblierbar;
                                          Grafiken nach -ImageOutput: Block oder Bytes)
      andere GEOS-Datei      -> Name.cvt (geosToCVT; Fonts, Alben, Datendateien für d/v/u)
      Nicht-GEOS-Datei       -> Name.prg/.seq/.usr/… unverändert (Endung wie im Provider)
    Datum und Uhrzeit aus dem Verzeichniseintrag werden als Änderungszeit übernommen, wenn beide von 0 verschieden
    sind (Get-MegaAssemblerFileDate); sonst bleibt die Zeit des Schreibens.
    -ImageOutput Block (Vorgabe des Konverters): Grafiken als lesbarer Grafikblock G für den Cross-Assembler (kürzeste
    Packung, also nicht bitgleich zum Original). -ImageOutput Bytes: b-Zeilen mit den Originalbytes (bitgleich).
    Ohne Angabe gilt die Vorgabe des Konverters (ältere Fassungen kennen den Parameter nicht).
    Unterverzeichnisse werden nachgebildet, mit -Flatten landet alles in einem Verzeichnis. Zwei Einträge mit
    demselben Dateinamen (unter Windows auch nur in Groß/Klein verschieden) sind ein Fehler; der zweite wird
    nicht geschrieben.
    .EXAMPLE
    Export-MegaAssemblerProject dt:\ C:\build\dtopdesk
    MegaAss auto C:\build\dtopdesk\ass.DTopDesk.s.s -d C:\build\out
    .EXAMPLE
    Export-MegaAssemblerProject mp:\ C:\build\mp3 -ImageOutput Bytes
    Quelltexte mit den Originalbytes der Grafiken, z. B. um bitgleich zur Distribution zu bauen.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)][string]$Path,
        [Parameter(Mandatory, Position = 1)][string]$Destination,
        [switch]$Flatten,
        [switch]$NoClobber,
        [ValidateSet('Block', 'Bytes')][string]$ImageOutput
    )

    # Nur weitergeben, wenn angegeben: So läuft das Skript auch mit einem Konverter ohne -ImageOutput.
    $convert = @{}
    if ($ImageOutput) { $convert['ImageOutput'] = $ImageOutput }

    $root = $PSCmdlet.GetUnresolvedProviderPathFromPSPath($Destination)
    $written = @{}     # Zielpfad (ohne Groß/Klein) -> Quelle

    function Export-Folder($sourcePath, $targetDir) {
        foreach ($item in @(Get-ChildItem -LiteralPath $sourcePath)) {
            # PSPath des Providers enthält kein Laufwerk; erst "dt:\..." findet Get-Content das Image.
            $itemPath = Get-DriveQualifiedPath -Item $item
            $name = Get-MegaAssemblerFileName $item
            if ($item.PSIsContainer -or $item.IsContainer) {
                $sub = if ($Flatten) { $targetDir } else { Join-Path $targetDir $name }
                Export-Folder $itemPath $sub
                continue
            }

            try {
                $fc = Get-Content -LiteralPath $itemPath -AsFileContent -ErrorAction Stop
            }
            catch {
                Write-Error "Kann $itemPath nicht lesen: $($_.Exception.Message)"
                continue
            }
            if ($null -eq $fc) {
                Write-Error "Kein Inhalt: $itemPath"
                continue
            }
            if ($item.isGeosFile -and (Test-GeoWrite $fc)) {
                $kind = 'Quelltext'; $file = $name + '.s'
            }
            elseif ($item.isGeosFile) {
                $kind = 'CVT'; $file = $name + '.cvt'
            }
            else {
                $kind = 'Roh'; $file = $name + [IO.Path]::GetExtension($item.Name)
            }

            $target = Join-Path $targetDir $file
            $key = $target.ToLowerInvariant()
            if ($written.ContainsKey($key)) {
                Write-Error "Name doppelt: $itemPath ergäbe $target, das schon aus $($written[$key]) kommt"
                continue
            }
            $written[$key] = $itemPath
            if ($NoClobber -and (Test-Path -LiteralPath $target)) {
                Write-Error "Datei existiert schon: $target"
                continue
            }
            if (-not $PSCmdlet.ShouldProcess($target, "$kind aus $itemPath")) { continue }

            [void][IO.Directory]::CreateDirectory($targetDir)
            # (kein switch: dort wirkte continue auf den switch, nicht auf die Schleife)
            if ($kind -eq 'Quelltext') {
                $source = $fc | Convert-GeoWriteToMegaAssemblerSource @convert   # Warnungen und Fehler gehen durch
                if ($null -eq $source) { continue }
                [IO.File]::WriteAllLines($target, [string[]]$source.Lines, [Text.UTF8Encoding]::new($false))
            }
            elseif ($kind -eq 'CVT') {
                [IO.File]::WriteAllBytes($target, [CommodoreDisk.Helper.Convert]::geosToCVT($item.directoryEntry, $fc))
            }
            else {
                [IO.File]::WriteAllBytes($target, [byte[]]$fc.content)
            }
            $date = Get-MegaAssemblerFileDate $item
            if ($null -ne $date) { [IO.File]::SetLastWriteTime($target, $date) }
            [pscustomobject]@{ Kind = $kind; Source = $itemPath; Path = $target; Date = $date }
        }
    }

    Export-Folder $Path $root
}
