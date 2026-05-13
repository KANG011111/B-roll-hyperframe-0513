param(
  [string]$ManifestPath = "..\renders\index\broll-manifest.json",
  [string]$FullRenderPath = "..\renders\full\EP03_BROLL_BATCH_01_FULL.mp4",
  [string]$ClipsDir = "..\renders\clips",
  [string]$IndexDir = "..\renders\index",
  [string]$FfmpegPath = "C:\ffmpeg\bin\ffmpeg.exe",
  [double]$HandleSeconds = 0.3
)

$ErrorActionPreference = "Stop"

function Convert-SrtTimeToSeconds {
  param([string]$Timecode)
  $normalized = $Timecode.Replace(",", ".")
  $parts = $normalized.Split(":")
  $hours = [double]$parts[0]
  $minutes = [double]$parts[1]
  $seconds = [double]$parts[2]
  return ($hours * 3600) + ($minutes * 60) + $seconds
}

function Convert-SecondsToFfmpegTime {
  param([double]$Seconds)
  if ($Seconds -lt 0) { $Seconds = 0 }
  $ts = [TimeSpan]::FromSeconds($Seconds)
  return "{0:00}:{1:00}:{2:00}.{3:000}" -f [Math]::Floor($ts.TotalHours), $ts.Minutes, $ts.Seconds, $ts.Milliseconds
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$manifestFullPath = Resolve-Path -Path (Join-Path $scriptRoot $ManifestPath)
$fullRenderFullPath = Join-Path $scriptRoot $FullRenderPath
$clipsFullPath = Join-Path $scriptRoot $ClipsDir
$indexFullPath = Join-Path $scriptRoot $IndexDir

if (!(Test-Path $FfmpegPath)) {
  throw "FFmpeg not found: $FfmpegPath"
}

if (!(Test-Path $fullRenderFullPath)) {
  throw "Full render not found: $fullRenderFullPath"
}

New-Item -ItemType Directory -Force -Path $clipsFullPath | Out-Null
New-Item -ItemType Directory -Force -Path $indexFullPath | Out-Null

$manifest = Get-Content -Raw -Path $manifestFullPath | ConvertFrom-Json
$thumbListPath = Join-Path $indexFullPath "contact-sheet-input.txt"
$thumbDir = Join-Path $indexFullPath "thumbs"
New-Item -ItemType Directory -Force -Path $thumbDir | Out-Null
Set-Content -Path $thumbListPath -Value "" -Encoding UTF8

foreach ($segment in $manifest.segments) {
  $renderStart = if ($segment.render_start) { $segment.render_start } else { $segment.start }
  $renderEnd = if ($segment.render_end) { $segment.render_end } else { $segment.end }
  $sourceStart = if ($segment.source_start) { $segment.source_start } else { $segment.start }
  $sourceEnd = if ($segment.source_end) { $segment.source_end } else { $segment.end }

  $startSeconds = Convert-SrtTimeToSeconds $renderStart
  $endSeconds = Convert-SrtTimeToSeconds $renderEnd
  $clipStart = [Math]::Max(0, $startSeconds - $HandleSeconds)
  $clipEnd = $endSeconds + $HandleSeconds
  $clipDuration = $clipEnd - $clipStart
  $ss = Convert-SecondsToFfmpegTime $clipStart
  $duration = Convert-SecondsToFfmpegTime $clipDuration
  $clipPath = Join-Path $clipsFullPath $segment.output_file

  & $FfmpegPath -y `
    -ss $ss `
    -i $fullRenderFullPath `
    -t $duration `
    -c:v libx264 `
    -preset veryfast `
    -crf 18 `
    -pix_fmt yuv420p `
    -an `
    $clipPath

  $midSeconds = $startSeconds + (($endSeconds - $startSeconds) / 2)
  $thumbPath = Join-Path $thumbDir ($segment.id + ".jpg")
  $label = "$($segment.id)  source $sourceStart-$sourceEnd  file $($segment.output_file)"
  $drawText = "fontcolor=white:fontsize=36:box=1:boxcolor=black@0.65:boxborderw=14:text='$label':x=36:y=h-76"

  & $FfmpegPath -y `
    -ss (Convert-SecondsToFfmpegTime $midSeconds) `
    -i $fullRenderFullPath `
    -frames:v 1 `
    -vf "scale=480:270,$drawText" `
    $thumbPath

  Add-Content -Path $thumbListPath -Value "file '$thumbPath'" -Encoding UTF8
}

$contactSheetPath = Join-Path $indexFullPath "BROLL_CONTACT_SHEET.jpg"
& $FfmpegPath -y `
  -f concat `
  -safe 0 `
  -i $thumbListPath `
  -filter_complex "tile=2x3:margin=18:padding=12:color=0x0b1020" `
  -frames:v 1 `
  $contactSheetPath

Write-Host "B-roll clips exported to: $clipsFullPath"
Write-Host "Contact sheet exported to: $contactSheetPath"
