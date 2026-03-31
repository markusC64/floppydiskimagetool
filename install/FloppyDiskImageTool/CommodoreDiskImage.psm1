Function ConvertFrom-Kryoflux {
   [CmdletBinding()]
   param (
      [parameter(Position=0, Mandatory=$true)]
      [string] $srcKryofluxImage,
      [parameter(Position=1)]
      [string] $dstG64,
      [parameter]
      [string] $dstP64,
      [parameter()]
      $rotation = 0,
      [parameter()]
      [CommodoreDiskImageTool.Sides] $side = [CommodoreDiskImageTool.Sides]::sideA,
      [parameter()]
      [bool] $doubleStep = $true,
      [parameter()]
      [string] $floppy = "1541"
   )

   process  {
      $moreParams = @{}
      if ($doubleStep) { $moreParams.Add("DoubleStep", $true) }
      $kryofluximage = Get-FloppyDiskImage -KryofluxImage -Basename $srcKryofluxImage -Sides $side @moreParams
      Update-FloppyDiskImage -FixRotationsFluxDump -FluxDumpImage $kryofluximage
      $p64 = Convert-FloppyDiskImage -FluxDumpToFlux -FluxDumpImage $kryofluximage -Rotation $rotation -Sides $side -Floppy $floppy
      if ( $dstP64 -ne "" -and $dstP64 -ne $null) { Export-FloppyDiskImage -Flux -Filename $dstP64 -FLuxImage $p64 }
      if ( $dstG64 -ne "" -and $dstG64 -ne $null) {
         $g64 = Convert-FloppyDiskImage -FluxToBitsteam -FLuxImage $p64
         Update-FloppyDiskImage -PadGCRBitstream -BitStreamImage $g64
         Export-FloppyDiskImage -Bitstream -Filename $dstG64 -BitStreamImage $g64
      }
   }
}



function Find-ErrorsInDxx {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [Object]$SectorImage,

        [Switch]$UsePhysicalView
    )

    process {
        if ($UsePhysicalView) {
            # Physische View benutzen
            $view = $SectorImage.physicalView
            foreach ($block in $view.blocksOfDisk) {
                $side   = ($block -band 0xFF0000) -shr 16
                $track  = ($block -band 0x00FF00) -shr 8
                $sector = $block -band 0x0000FF

                $errorCode = $view.getErrorInfo($track, $sector, $side)
                if ($errorCode -ne 1) {
                    [PSCustomObject]@{
                        Track     = $track
                        Sector    = $sector
                        Side      = $side
                        ErrorCode = $errorCode
                    }
                }
            }
        }
        else {
            # Logisches Image benutzen
            $noTracks = $SectorImage.getNoTracks()
            for ($track = 1; $track -le $noTracks; $track++) {
                $sectorsPerTrack = $SectorImage.getNumberOfSectorsPerTrack($track)
                for ($sector = 0; $sector -lt $sectorsPerTrack; $sector++) {
                    $errorCode = $SectorImage.getErrorInfo($track, $sector)
                    if ($errorCode -ne 1) {
                        [PSCustomObject]@{
                            Track     = $track
                            Sector    = $sector
                            Side      = 0 # nicht benutzt, aber der einheitlichen Rückgabe wegen
                            ErrorCode = $errorCode
                        }
                    }
                }
            }
        }
    }
}


function Convert-G64resp71ToDxx {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [Object]$g64Image,
        [double[]]$tracks = (1..35),
        [int]$numTracks = 35
    )

    process {
        if ($g64.MaxTracks -le 84)
        {
           $d64 = Get-FloppyDiskImage -SectorImage -SectorImageType D64 -noTracks $numTracks
        }
        else
        {
   $d64 = Get-FloppyDiskImage -SectorImage -SectorImageType D71 -noTracks (2*$numTracks)
        }

        foreach ($track in $tracks) {
            $trackData = Read-FloppyDiskImageTrack -BitStreamImage $g64Image -TracknumberingStyle Commodore1541 -Track $track -Side 0
            foreach ($sector in $trackData) {
                $realTrack = $sector.track
                $sectorsPerTrack = $d64.getNumberOfSectorsPerTrack($realTrack)

                if ($realTrack -le $d64.getNoTracks() -and $sector.sector -lt $sectorsPerTrack) {
                    $null = $d64.setErrorInfo($realTrack, $sector.sector, $sector.errorCode)
                    if ($sector.data -ne $null -and $sector.data.Count -eq 256) {
                        $d64.writeSector($realTrack, $sector.sector, $sector.data)
                    }
                }
            }
            $trackData = Read-FloppyDiskImageTrack -BitStreamImage $g64Image -TracknumberingStyle Commodore1541 -Track $track -Side 1
            foreach ($sector in $trackData) {
                $realTrack = $sector.track
                $sectorsPerTrack = $d64.getNumberOfSectorsPerTrack($realTrack)

                if ($realTrack -le $d64.getNoTracks() -and $sector.sector -lt $sectorsPerTrack) {
                    $null = $d64.setErrorInfo($realTrack, $sector.sector, $sector.errorCode)
                    if ($sector.data -ne $null -and $sector.data.Count -eq 256) {
                        $d64.writeSector($realTrack, $sector.sector, $sector.data)
                    }
                }
            }
        }

        return $d64
    }
}

function Convert-G80resp82ToDxx {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [Object]$g8xImage,
        [int[]]$tracks = (1..77),
        [int]$numTracks = 77
    )

    process {
        if ($g8xImage.MaxTracks -le 84)
        {
           $d64 = Get-FloppyDiskImage -SectorImage -SectorImageType D80 -noTracks $numTracks
        }
        else
        {
           $d64 = Get-FloppyDiskImage -SectorImage -SectorImageType D82 -noTracks (2*$numTracks)
        }
        foreach ($track in $tracks) {
            $trackData = Read-FloppyDiskImageTrack -BitStreamImage $g8xImage -TracknumberingStyle Commodore8250 -Track $track -Side 0
            foreach ($sector in $trackData) {
                $realTrack = $sector.track
                $sectorsPerTrack = $d64.getNumberOfSectorsPerTrack($realTrack)

                if ($realTrack -le $d64.getNoTracks() -and $sector.sector -lt $sectorsPerTrack) {
                    $null = $d64.setErrorInfo($realTrack, $sector.sector, $sector.errorCode)
                    if ($sector.data -ne $null -and $sector.data.Count -eq 256) {
                        $d64.writeSector($realTrack, $sector.sector, $sector.data)
                    }
                }
            }
            $trackData = Read-FloppyDiskImageTrack -BitStreamImage $g8xImage -TracknumberingStyle Commodore8250 -Track $track -Side 1
            foreach ($sector in $trackData) {
                $realTrack = $sector.track
                $sectorsPerTrack = $d64.getNumberOfSectorsPerTrack($realTrack)

                if ($realTrack -le $d64.getNoTracks() -and $sector.sector -lt $sectorsPerTrack) {
                    $null = $d64.setErrorInfo($realTrack, $sector.sector, $sector.errorCode)
                    if ($sector.data -ne $null -and $sector.data.Count -eq 256) {
                        $d64.writeSector($realTrack, $sector.sector, $sector.data)
                    }
                }
            }
        }

        return $d64
    }
}

function Convert-G81ToD81 {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, Position=0)]
        [Object]$g81Image  # G81-Objekt direkt übergeben, mit ValueFromPipeline
    )

    process {
        $d81 = Get-FloppyDiskImage -SectorImage -SectorImageType D81

        foreach ($track in 0..($d81.getNoTracks()-1)) {
            foreach ($side in 0..1) {
                $trackData = Read-FloppyDiskImageTrack -BitStreamImage $g81Image -TracknumberingStyle ZeroBased -Track $track -Side $side
                foreach ($sector in $trackData) {
                    $physicalTrack = $sector.track
                    $physicalSide = $side
                    $sectorData = $sector.data

                    if ($physicalTrack -ne $sector.track) {
                        Write-Warning "Track im Header stimmt nicht mit dem Schleifen-Track überein: $($sector.track) vs $physicalTrack"
                        continue  # Überspringe diesen Sektor, da die Tracknummer nicht übereinstimmt
                    }

                    if ($d81.physicalView.isValid($physicalTrack, $sector.sector, $physicalSide)) {
                        $null = $d81.physicalView.setErrorInfo($physicalTrack, $sector.sector, $physicalSide, $sector.errorCode)
                        if ($sector.data -ne $null -and $sector.data.Count -eq 512) {
                           $null = $d81.physicalView.writeSector($physicalTrack, $sector.sector, $physicalSide, $sectorData)
                       }
                    }
                    else {
                        Write-Warning "Ungültiger Sektor: Track=$physicalTrack, Sektor=$($sector.sector), Seite=$physicalSide"
                    }
                }
            }
        }

        return $d81
    }
}


function Convert-GxMToDxM {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [Object]$gxmImag
    )

    process {
        if ($gxmImag.tracks[0].speed -eq 8) {
           $dxm = Get-FloppyDiskImage -SectorImage -SectorImageType D1M
        }
        elseif ($gxmImag.tracks[0].speed -eq 9) {
           $dxm = Get-FloppyDiskImage -SectorImage -SectorImageType D2M
        }
        elseif ($gxmImag.tracks[0].speed -eq 10) {
           $dxm = Get-FloppyDiskImage -SectorImage -SectorImageType D4M
        }

        foreach ($track in 0..($dxm.getNoTracks()-1)) {
            foreach ($side in 0..1) {
                $trackData = Read-FloppyDiskImageTrack -BitStreamImage $gxmImag -TracknumberingStyle ZeroBased -Track $track -Side $side

                foreach ($sector in $trackData) {
                    $physicalTrack = $sector.track
                    $physicalSide = $side
                    $sectorData = $sector.data
                    if ($physicalTrack -ne $sector.track) {
                        Write-Warning "Track im Header stimmt nicht mit dem Schleifen-Track überein: $($sector.track) vs $physicalTrack"
                        continue
                    }

                    if ($dxm.physicalView.isValid($physicalTrack, $sector.sector, $physicalSide)) {
                        $null = $dxm.physicalView.setErrorInfo($physicalTrack, $sector.sector, $physicalSide, $sector.errorCode)
                        if ($sector.data -ne $null -and $sector.data.Count -eq $dxm.physicalView.sectorSize) {
                           $null = $dxm.physicalView.writeSector($physicalTrack, $sector.sector, $physicalSide, $sectorData)
                       }
                    }
                    else {
                        Write-Warning "Ungültiger Sektor: Track=$physicalTrack, Sektor=$($sector.sector), Seite=$physicalSide"
                    }
                }
            }
        }

        return $dxm
    }
}

function Update-G64ToDoubleSided {
 [CmdletBinding()]
 param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [object]$g64,

        [Parameter(Mandatory = $false)]
        [switch]$Passthru     # Gibt das aktualisierte G64-Objekt zurück, falls dieser Schalter gesetzt ist
 )
 process {

   $trackdata = $g64 | Read-FloppyDiskImageTrack -TracknumberingStyle Commodore1541 -Track 18 -side 0
   $block18sec0 = $trackdata | Where-Object { $_.track -eq 18 -and $_.sector -eq 0 }

   if (-not $block18sec0) {
       throw "BAM sector (Track 18 / Sector 0) not found in image"
   }

   if ($block18sec0.Count -ne 1) {
       throw "Expected exactly one BAM sector, found $($block18sec0.Count)"
   }

   $block18sec0 = $block18sec0[0]

   if ($block18sec0.errorCode -ne 1) {
       throw "BAM sector read error (Track 18 / Sector 0), errorCode=$($block18sec0.errorCode)"
   }

   $block18sec0content = $block18sec0.data

   if ($null -eq $block18sec0content) {
       throw "BAM sector data is null (Track 18 / Sector 0)"
   }

   if ($block18sec0content.Count -ne 256) {
       throw "BAM sector has invalid size: $($block18sec0content.Length) bytes (expected 256)"
   }

   # Modify the BAM sector data for D71
   $block18sec0content[3] = 0x80

   $index = 0xDD

   1..17 | ForEach-Object {
       $block18sec0content[$index] = 0x15
       $index++
   }

   $block18sec0content[$index] = 0x00
   $index++

   1..6 | ForEach-Object {
       $block18sec0content[$index] = 0x13
       $index++
   }

   1..6 | ForEach-Object {
       $block18sec0content[$index] = 0x12
       $index++
   }

   1..5 | ForEach-Object {
       $block18sec0content[$index] = 0x11
       $index++
   }
   $block18sec0.data = $block18sec0content

   Update-FloppyDiskImage -BitStreamImage $g64 -WriteSectorToBitstream $block18sec0

   $d71 = Get-FloppyDiskImage -SectorImage -SectorImageType D71 -clear
   $tr53sec0 = $d71.readSector(53,0)
   $index = 0

   # Definiere die Werte und die Anzahl der Wiederholungen
   $pattern = @(
       @{ Value = 0xFF; Count = 34 },
       @{ Value = 0x1F; Count = 17 },
       @{ Value = 0x00; Count = 3 },
       @{ Value = 0xFF; Count = 34 },
       @{ Value = 0x07; Count = 6 },
       @{ Value = 0xFF; Count = 34 },
       @{ Value = 0x03; Count = 6 },
       @{ Value = 0xFF; Count = 34 },
       @{ Value = 0x01; Count = 5 }
   )

   # Durchlaufe die Muster und füge die entsprechenden Werte zum Array hinzu
   foreach ($entry in $pattern) {
       for ($i = 0; $i -lt $entry.Count; $i++) {
           $tr53sec0[$index++] = $entry.Value
       }
   }

   $tr53sec0.write()

   $g71 = New-FloppyDiskTemplate -Floppy floppy1571 -id ($block18sec0.id1),($block18sec0.id2) | Convert-FloppyDiskImage -TemplateToText -SourceDxx $d71 | Convert-FloppyDiskImage -TextToBitstream

   $g64.Identifier = "1571"
   $g64.MaxTracks = 168

   for ($i = 0; $i -le 84; $i++) {
       $trackNumber = 2 * $i + 1
       if ($g71.tracks.ContainsKey($trackNumber)) {
           $g64.tracks[$trackNumber] = $g71.tracks[$trackNumber]
       }
   }

   if ($Passthru) {
      return $g64
   }
 }
}












        function Get-DriveQualifiedPath {
            param(
                [Parameter(Mandatory)]
                $Item
            )

            if ($Item.PSDrive -and $Item.PSObject.Properties.Match('Path').Count -gt 0) {
                return '{0}:{1}' -f $Item.PSDrive.Name, $Item.Path
            }

            return $Item.PSPath
        }

        function New-CallbackContext {
            param(
                [string]$Path,
                $Item,
                [string]$ParentPath,
                $ParentItem,
                [int]$Depth,
                $CurrentContainer,
                $ParentContainer,
                $ChildItem,
                [string]$ChildPath,
                $Content
            )

            [pscustomobject]@{
                Path             = $Path
                Item             = $Item
                ParentPath       = $ParentPath
                ParentItem       = $ParentItem
                Depth            = $Depth
                CurrentContainer = $CurrentContainer
                ParentContainer  = $ParentContainer
                ChildItem        = $ChildItem
                ChildPath        = $ChildPath
                Content          = $Content
            }
        }

        function Get-DebugIndent {
            param([int]$Depth)
            '  ' * $Depth
        }


function Invoke-RecursiveItemWalkInternal {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path,

        [scriptblock]$OnContainerBegin,
        [scriptblock]$OnChildItem,
        [scriptblock]$OnContainerEnd,
        [scriptblock]$OnLeaf,

        [Parameter(DontShow)]
        $CurrentContainer,

        [Parameter(DontShow)]
        [int]$Depth = 0
    )

    process {
        $indent = Get-DebugIndent -Depth $Depth
        Write-Debug "${indent}Resolve item: $Path"

        $item = Get-Item -LiteralPath $Path
        Write-Debug ("{0}Resolved: Name='{1}', IsContainer={2}" -f $indent, $item.Name, $item.IsContainer)

        if ($item.IsContainer) {
            $thisContainer = $null

            if ($OnContainerBegin) {
                Write-Debug "${indent}Invoke OnContainerBegin: $Path"

                $context = New-CallbackContext `
                    -Path $Path `
                    -Item $item `
                    -Depth $Depth

                $result = (& $OnContainerBegin $context)
                
                if ($null -ne $result) {
                    $thisContainer = $result
                }
            }

            if ($OnContainerEnd -or $OnContainerBegin) {
                Write-Debug ("{0}Container object: {1}" -f $indent, $(if ($null -eq $thisContainer) { '<null>' } else { $thisContainer.GetType().FullName }))
            }

            foreach ($childItem in (Get-ChildItem -LiteralPath $Path)) {
                $childPath = Get-DriveQualifiedPath -Item $childItem

                Write-Debug ("{0}Child: Name='{1}', Path='{2}', IsContainer={3}" -f $indent, $childItem.Name, $childPath, $childItem.IsContainer)

                if ($OnChildItem) {
                    Write-Debug "${indent}Invoke OnChildItem: $childPath"

                    $context = New-CallbackContext `
                        -Path $Path `
                        -Item $item `
                        -Depth $Depth `
                        -CurrentContainer $thisContainer `
                        -ChildItem $childItem `
                        -ChildPath $childPath

                    & $OnChildItem $context
                }

                Write-Debug "${indent}Recurse into: $childPath"

                $recursiveParams = @{
                    Path             = $childPath
                    OnContainerBegin = $OnContainerBegin
                    OnChildItem      = $OnChildItem
                    OnContainerEnd   = $OnContainerEnd
                    OnLeaf           = $OnLeaf
                    CurrentContainer = $thisContainer
                    Depth            = $Depth + 1
                }

                #if ($PSBoundParameters.ContainsKey('Debug')) {
                #    $recursiveParams['Debug'] = $true
                #}

                Invoke-RecursiveItemWalkInternal @recursiveParams
            }

            if ($OnContainerEnd) {
                Write-Debug "${indent}Invoke OnContainerEnd: $Path"

                $context = New-CallbackContext `
                    -Path $Path `
                    -Item $item `
                    -Depth $Depth `
                    -CurrentContainer $thisContainer `
                    -ParentContainer $CurrentContainer

                $endResult = (& $OnContainerEnd $context)
            }

            Write-Debug "${indent}Leave container: $Path"
            return
        }

        Write-Debug "${indent}Process leaf: $Path"

        $content = $null
        try {
            Write-Debug "${indent}Read content: $Path"
            $content = Get-Content -LiteralPath $Path -ErrorAction Stop
        }
        catch {
            Write-Debug ("{0}Get-Content failed for '{1}': {2}" -f $indent, $Path, $_.Exception.Message)
        }

        if ($OnLeaf) {
            Write-Debug "${indent}Invoke OnLeaf: $Path"

            $context = New-CallbackContext `
                -Path $Path `
                -Item $item `
                -Depth $Depth `
                -CurrentContainer $CurrentContainer `
                -Content $content

            & $OnLeaf $context
        }
    }
}











function Invoke-RecursiveItemWalk {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path,

        [scriptblock]$OnPreparation,

        [scriptblock]$OnContainerBegin,
        [scriptblock]$OnChildItem,
        [scriptblock]$OnContainerEnd,
        [scriptblock]$OnLeaf,

        [scriptblock]$OnFinalization
    )

    process {
        Write-Debug "Validate root path: $Path"

        $rootContainer = $null

        if ( $null -ne $OnPreparation ) {
           Write-Debug "Caling OnPreparation"
           $rootContainer = (& $OnPreparation -Path $path)
        }

        Write-Debug "Start recursive walk below root: $Path"

        $recursiveParams = @{
                Path             = $Path
                OnContainerBegin = $OnContainerBegin
                OnChildItem      = $OnChildItem
                OnContainerEnd   = $OnContainerEnd
                OnLeaf           = $OnLeaf
                CurrentContainer  = $rootContainer
                Depth            = 0
        }

        #if ($PSBoundParameters.ContainsKey('Debug')) {
        #        $recursiveParams['Debug'] = $true
        #}

        Invoke-RecursiveItemWalkInternal @recursiveParams

       $finalContext = @{
            Path          = $Path
            RootContainer = $rootContainer
        }

        if ($OnFinalization) {
           Write-Debug "Invoke OnFinalization: $Path"
           return (& $OnFinalization @finalContext)
        }
    }
}







function New-CarDateTimeNow {
    [CmdletBinding()]
    param()

    $now = Get-Date

    if ($now.Year -lt 1900 -or $now.Year -gt 2155) {
        throw "Das CAR-Datum unterstützt nur Jahre von 1900 bis 2155."
    }

    $dt = [CommodoreDisk.Archive.car.carDateTime]::new()
    $dt.year   = [byte]($now.Year - 1900)
    $dt.month  = [byte]$now.Month
    $dt.day    = [byte]$now.Day
    $dt.hour   = [byte]$now.Hour
    $dt.minute = [byte]$now.Minute

    return $dt
}

function New-C64CarRootCollector {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Path
    )
    
    $dir = [CommodoreDisk.Archive.car.carDirectory]::new()
    $dir.type = 0
    $dir.filename = [CommodoreDisk.Archive.car.carFilename]::new()
    $dir.childs = [System.Collections.Generic.List[CommodoreDisk.Archive.car.carfileOrDir]]::new()

    return $dir
}

function New-C64CarDirectoryNode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Context
    )

    $dir = [CommodoreDisk.Archive.car.carDirectory]::new()
    $dir.type = [byte][char]'D'

    $dir.filename = [CommodoreDisk.Archive.car.carFilename]::new()
    if ( $null -ne $Context.Item.directoryEntry ) {
       $dir.date = $Context.Item.directoryEntry.DateTime
       $dir.filename.asByteArray = $Context.Item.directoryEntry.filename
       if ($Context.Item.isTopdeskSubdir) { $dir.type = [byte][char]'T' }
    } else {
       $dir.filename.asASCIIString = "root"
    }

    $dir.childs = [System.Collections.Generic.List[CommodoreDisk.Archive.car.carfileOrDir]]::new()

    return $dir
}

function Add-C64CarLeafNode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Context
    )

   Write-Debug "Executing Add-C64CarLeafNde"

    if ($null -eq $Context.CurrentContainer) {
        throw "Leaf '$($Context.Path)' hat keinen CurrentContainer."
    }

    $file = [CommodoreDisk.Archive.car.carFile]::new()
    $file.type = ($Context.Item.directoryEntry.filename.ToUpper())[-3]
    $file.date = $Context.Item.directoryEntry.DateTime
    $file.filename = [CommodoreDisk.Archive.car.carFilename]::new()
    $file.filename.asByteArray = $Context.Item.directoryEntry.filename

    $file.content = $Context.Content

    $null = $Context.CurrentContainer.childs.Add($file)
}

function Complete-C64CarDirectoryNode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Context
    )

    if ($null -ne $Context.ParentContainer) {
        [void]$Context.ParentContainer.childs.Add($Context.CurrentContainer)
    }
}

function Get-C64CarFromCommodoreFSProvider {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path
    )

    process {
        $resultContainer = @{ Value = $null }
    
        $onContainerBegin = {
            param($Context)
            New-C64CarDirectoryNode -Context $Context
        }.GetNewClosure()

        $onLeaf = {
            param($Context)
            Add-C64CarLeafNode -Context $Context
        }.GetNewClosure()

        $onFinalization = {
            param($Path, $RootContainer)
            $resultContainer.Value = $RootContainer
        }.GetNewClosure()

        Invoke-RecursiveItemWalk `
            -Path $Path `
            -OnPreparation ${function:New-C64CarRootCollector} `
            -OnContainerBegin $onContainerBegin `
            -OnContainerEnd ${function:Complete-C64CarDirectoryNode} `
            -OnLeaf $onLeaf `
            -OnFinalization $onFinalization

        $archive = [CommodoreDisk.Archive.car.CarArchive]::new()
        $archive.version   = 2
        $archive.car_type  = "general"
        $archive.noteASCII = 'Autogenerated'
        $archive.date      = New-CarDateTimeNow
        $archive.child     = $resultContainer.Value.childs[0]
        # return $archive
        
        $c64 = [CommodoreDisk.Archive.car.C64Car]::new()
        $c64.car = $archive
        return $c64
    }
}



function Mount-FloppyDiskImageOld {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$ImagePath,
        
        [Parameter(Mandatory=$true, Position=1)]
        [string]$DriveName,
        
        [Parameter(Position=2)]
        [int]$Partition = -1,
        
        [Parameter()]
        [switch]$rw,

        [Parameter()]
        [switch]$UseTopdeskFolder,
        
        [Parameter()]
        [switch]$UseCVT

    )
    
    # Filesystem laden
    if ($Partition -gt 0) {
        $partitionTable = Get-FloppyDiskImage -sectorimage -useFactory -returnPartitionTable -Filename $ImagePath
        $filesystem = Get-FloppyDiskImage -Partition $partitionTable[$Partition] -returnFilesystem
    } else {
        $filesystem = Get-FloppyDiskImage -sectorimage -useFactory -returnFilesystem -Filename $ImagePath
    }
    
    # Root-Pfad
    $root = if ($IsWindows) { "\" } else { "/" }
    
    # Provider wählen
    $provider = if ($rw) { "CommodoreFSWritableProvider" } else { "CommodoreFSProvider" }

    $moreParams = @{}
    if ($UseTopdeskFolder) { $moreParams.Add("UseTopdeskFolder", $true) }
    if ($UseCVT) { $moreParams.Add("UseCVT", $true) }


    # PSDrive erstellen
    New-PSDrive -Name $DriveName -PSProvider $provider -Root $root -Filesystem $filesystem -Scope Global @moreParams
    
    $mode = if ($rw) { "read-write" } else { "read-only" }
    Write-Host "Mounted $ImagePath as $DriveName`: ($mode)"
}

function Mount-FloppyDiskImage {
    [CmdletBinding(DefaultParameterSetName = "Mount")]
    param(
        # --- Mount existing image ---
        [Parameter(Mandatory=$true, Position=0, ParameterSetName="Mount")]
        [string]$ImagePath,

        [Parameter(Position=2, ParameterSetName="Mount")]
        [int]$Partition = -1,

        # --- Create new image ---
        [Parameter(Mandatory=$true, ParameterSetName="Create")]
        [ValidateSet("D64","D71","D81","DNP")]
        [string]$SectorImageType,

        [Parameter(ParameterSetName="Create")]
        [int]$NoTracks = 35,

        [Parameter(Mandatory=$false, ParameterSetName="Create")]
        $DiskName,

        [Parameter(ParameterSetName="Create")]
        $DiskID,

        # --- Shared ---
        [Parameter(Mandatory=$true, ParameterSetName="Create" )]
        [Parameter(Mandatory=$true, Position=1, ParameterSetName="Mount" )]
        [string]$DriveName,

        [Parameter(ParameterSetName="Create" )]
        [Parameter(ParameterSetName="Mount" )]
        [switch]$rw,

        [Parameter(ParameterSetName="Create" )]
        [Parameter(ParameterSetName="Mount" )]
        [switch]$UseTopdeskFolder,
        
        [Parameter(ParameterSetName="Create" )]
        [Parameter(ParameterSetName="Mount" )]
        [switch]$UseCVT
    )

    # -----------------------------
    # Filesystem erzeugen / laden
    # -----------------------------
if ($PSCmdlet.ParameterSetName -eq "Create") {
    Write-Verbose "Creating new $SectorImageType image..."

    # -----------------------------
    # Get-FloppyDiskImage splatting
    # -----------------------------
    $getParams = @{
        SectorImage      = $true
        SectorImageType  = $SectorImageType
        Clear            = $true
        ReturnFilesystem = $true
    }

    if ($PSBoundParameters.ContainsKey("NoTracks")) {
        $getParams["NoTracks"] = $NoTracks
    }

    $fs = Get-FloppyDiskImage @getParams

    # -----------------------------
    # Update-FloppyDiskImage splatting
    # -----------------------------
    $updateParams = @{
        Format      = $true
        CommodoreFS = $fs
    }

    if ($PSBoundParameters.ContainsKey("DiskName")) {
        $updateParams["DiskName"] = $DiskName
    }

    if ($PSBoundParameters.ContainsKey("DiskID")) {
        $updateParams["DiskID"] = $DiskID
    }

    Update-FloppyDiskImage @updateParams

    $filesystem = $fs
    $ImagePath = "[new $SectorImageType image]"
} else {
        if ($Partition -gt 0) {
            $partitionTable = Get-FloppyDiskImage `
                -SectorImage `
                -UseFactory `
                -ReturnPartitionTable `
                -Filename $ImagePath

            $filesystem = Get-FloppyDiskImage `
                -Partition $partitionTable[$Partition] `
                -ReturnFilesystem
        } else {
            $filesystem = Get-FloppyDiskImage `
                -SectorImage `
                -UseFactory `
                -ReturnFilesystem `
                -Filename $ImagePath
        }
    }

    # -----------------------------
    # Root-Pfad
    # -----------------------------
    $root = if ($IsWindows) { "\" } else { "/" }
    
    # Provider wählen
    $provider = if ($rw) { "CommodoreFSWritableProvider" } else { "CommodoreFSProvider" }

    $moreParams = @{}
    if ($UseTopdeskFolder) { $moreParams["UseTopdeskFolder"] = $true }
    if ($UseCVT) { $moreParams["UseCVT"] = $true }

    # -----------------------------
    # PSDrive erstellen
    # -----------------------------
    New-PSDrive `
        -Name $DriveName `
        -PSProvider $provider `
        -Root $root `
        -Filesystem $filesystem `
        -Scope Global `
        @moreParams
    
    $mode = if ($rw) { "read-write" } else { "read-only" }

    Write-Host "Mounted $ImagePath as $DriveName`: ($mode)"
}

function Dismount-FloppyDiskImage {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$DriveName,
        
        [Parameter()]
        [string]$SaveAs
    )
    
    $drive = Get-PSDrive -Name $DriveName -ErrorAction SilentlyContinue
    if (-not $drive) {
        Write-Error "Drive $DriveName not found"
        return
    }
    
    $image = $drive.Image

    # Erst PSDrive entfernen, damit es garatiert niemand mehr ändern kann:
    Remove-PSDrive -Name $DriveName
    
    # Änderungen speichern
    if ($SaveAs) {
        $image | Export-FloppyDiskImage -SectorImage -Filename $SaveAs
    }
    
    Write-Host "Dismounted $DriveName"
}



function Expand-CarArchiveToCommodoreFSWritableProvider {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        $CarArchive,
        
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$DestinationPath,
        
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        
        [Parameter(Mandatory = $false)]
        [switch]$PreserveTimestamps,
        
        [Parameter(Mandatory = $false)]
        [switch]$WhatIf
    )
    
    process {
        # Rekursive Funktion zum Expandieren
        function Expand-Node {
            param(
                [CommodoreDisk.Archive.car.carfileOrDir]$Node,
                [string]$CurrentPath
            )
            
            # Dateinamen aus dem CAR-Objekt holen
            $filename = $Node.filename.asUltimateFilename
            
            $filename += $Node.typeAsExtension
            
            $fullPath = Join-Path $CurrentPath $filename
            
            if ($Node -is [CommodoreDisk.Archive.car.carDirectory]) {
                # Kind des Verzeichnisses bestimmen (normal oder TopdeskFolder)
                $kind = "Directory"
                if ($Node.type -eq [byte][char]'T') {
                    $kind = "TopdeskFolder"
                }
                
                # Verzeichnis anlegen
                if (-not $WhatIf) {
                    if (-not (Test-Path $fullPath)) {
                        $params = @{
                            Path = $fullPath
                            Kind = $kind
                        }
                        
                        if ($PreserveTimestamps) {
                            $params.Now = $true
                        }
                        
                        New-Item @params
                        Write-Verbose "Verzeichnis erstellt: $fullPath (Typ: $kind)"
                    }
                }
                else {
                    Write-Host "WhatIf: Verzeichnis würde erstellt: $fullPath (Typ: $kind)" -ForegroundColor Yellow
                }
                
                # Kinder rekursiv expandieren
                foreach ($child in $Node.childs) {
                    Expand-Node -Node $child -CurrentPath $fullPath
                }
            }
            elseif ($Node -is [CommodoreDisk.Archive.car.carFile]) {
                # Datei mit Inhalt anlegen
                if (-not $WhatIf) {
                    if ($Force -or -not (Test-Path $fullPath)) {
                        $contentAsObjectArray = [object[]]$Node.content
                        
                        $params = @{
                            Path = $fullPath
                            Kind = "File"
                            Value = $contentAsObjectArray
                        }
                        
                        if ($PreserveTimestamps) {
                            $params.Now = $true
                        }
                        
                        New-Item @params
                        Write-Verbose "Datei erstellt: $fullPath ($($Node.content.Length) Bytes)"
                    }
                    else {
                        Write-Warning "Datei existiert bereits: $fullPath (verwenden Sie -Force zum Überschreiben)"
                    }
                }
                else {
                    Write-Host "WhatIf: Datei würde erstellt: $fullPath ($($Node.content.Length) Bytes)" -ForegroundColor Yellow
                }
            }
        }
        
        # Prüfen ob Zielpfad existiert
        if (-not (Test-Path $DestinationPath)) {
            if (-not $WhatIf) {
                New-Item -Path $DestinationPath -ItemType Directory -Force | Out-Null
            }
            else {
                Write-Host "WhatIf: Zielverzeichnis würde erstellt: $DestinationPath" -ForegroundColor Yellow
            }
        }
        
        # Expansion starten
        Expand-Node -Node $CarArchive.car.child -CurrentPath $DestinationPath
    }
}
