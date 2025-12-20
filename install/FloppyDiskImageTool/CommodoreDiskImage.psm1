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
        [int[]]$tracks = (1..35),
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
