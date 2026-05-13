param(
  [string]$PlanPath = "..\BROLL_PLAN.md",
  [int]$StartNumber = 1,
  [int]$EndNumber = 5,
  [int]$BatchNumber = 1,
  [string]$ProjectName = "EP03 GitHub Obsidian",
  [string]$OutputRoot = "",
  [string]$Canvas = "1920x1080",
  [int]$Fps = 30,
  [double]$HandleSeconds = 0.3,
  [switch]$UseSourceTimeForRender
)

$ErrorActionPreference = "Stop"

function Convert-SrtTimeToSeconds {
  param([string]$Timecode)
  $normalized = $Timecode.Trim().Replace(",", ".")
  $parts = $normalized.Split(":")
  return ([double]$parts[0] * 3600) + ([double]$parts[1] * 60) + [double]$parts[2]
}

function Convert-SecondsToSrtTime {
  param([double]$Seconds)
  if ($Seconds -lt 0) { $Seconds = 0 }
  $ts = [TimeSpan]::FromSeconds($Seconds)
  return "{0:00}:{1:00}:{2:00},{3:000}" -f [Math]::Floor($ts.TotalHours), $ts.Minutes, $ts.Seconds, $ts.Milliseconds
}

function Convert-TimeToCompact {
  param([string]$Timecode)
  $seconds = Convert-SrtTimeToSeconds $Timecode
  $ts = [TimeSpan]::FromSeconds($seconds)
  $centiseconds = [Math]::Floor($ts.Milliseconds / 10)
  return "{0:00}{1:00}{2:00}" -f [Math]::Floor($ts.TotalMinutes), $ts.Seconds, $centiseconds
}

function Get-Slug {
  param(
    [string]$Prompt,
    [string]$Id
  )

  $stop = @(
    "1920x1080", "dark", "tutorial", "graphic", "frame", "b-roll", "broll",
    "clean", "style", "high", "contrast", "chinese", "labels", "background",
    "animation", "animated", "cinematic", "tech", "explainer", "workflow"
  )
  $words = [regex]::Matches($Prompt.ToLowerInvariant(), "[a-z0-9][a-z0-9-]{2,}") |
    ForEach-Object { $_.Value } |
    Where-Object { $stop -notcontains $_ } |
    Select-Object -Unique -First 4

  if ($words.Count -eq 0) {
    return $Id.ToLowerInvariant().Replace("_", "-")
  }

  return ($words -join "-").Replace("--", "-")
}

function Split-MarkdownTableRow {
  param([string]$Line)
  $trimmed = $Line.Trim()
  if ($trimmed.StartsWith("|")) { $trimmed = $trimmed.Substring(1) }
  if ($trimmed.EndsWith("|")) { $trimmed = $trimmed.Substring(0, $trimmed.Length - 1) }
  return $trimmed -split "\s*\|\s*"
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$planFullPath = Resolve-Path -Path (Join-Path $scriptRoot $PlanPath)

if ([string]::IsNullOrWhiteSpace($OutputRoot)) {
  $OutputRoot = "..\batch-{0:00}" -f $BatchNumber
}

$batchRoot = Join-Path $scriptRoot $OutputRoot
$rendersIndex = Join-Path $batchRoot "renders\index"
$rendersClips = Join-Path $batchRoot "renders\clips"
$rendersFull = Join-Path $batchRoot "renders\full"
$toolsDir = Join-Path $batchRoot "tools"

New-Item -ItemType Directory -Force -Path $rendersIndex, $rendersClips, $rendersFull, $toolsDir | Out-Null

$rows = New-Object System.Collections.Generic.List[object]
$lines = Get-Content -Path $planFullPath -Encoding UTF8
$titleMap = @{}

foreach ($line in $lines) {
  if ($line -notmatch "^BROLL_\d+:") { continue }
  $parts = $line -split ([string][char]0xFF5C)
  if ($parts.Count -lt 3) { continue }
  $idPart = ($parts[0] -split ":")[0].Trim()
  $titleMap[$idPart] = $parts[2].Trim()
}

foreach ($line in $lines) {
  if ($line -notmatch "^\|\s*BROLL_\d+\s*\|") { continue }

  $cols = Split-MarkdownTableRow $line
  if ($cols.Count -lt 9) { continue }

  $id = $cols[0].Trim()
  $number = [int]($id -replace "BROLL_", "")
  if ($number -lt $StartNumber -or $number -gt $EndNumber) { continue }

  $timeParts = $cols[1].Trim() -split "-"
  $sourceStart = $timeParts[0].Trim()
  $sourceEnd = $timeParts[1].Trim()
  $sourceStartSeconds = Convert-SrtTimeToSeconds $sourceStart
  $sourceEndSeconds = Convert-SrtTimeToSeconds $sourceEnd
  $durationSeconds = [Math]::Round($sourceEndSeconds - $sourceStartSeconds, 3)
  $slug = Get-Slug -Prompt $cols[7] -Id $id
  $compactStart = Convert-TimeToCompact $sourceStart
  $compactEnd = Convert-TimeToCompact $sourceEnd
  $outputFile = "{0}_{1}-{2}_{3}.mp4" -f $id, $compactStart, $compactEnd, $slug

  $title = if ($titleMap.ContainsKey($id)) { $titleMap[$id] } else { $cols[3].Trim() }

  $rows.Add([pscustomobject]@{
    id = $id
    number = $number
    source_start = $sourceStart
    source_end = $sourceEnd
    source_start_seconds = $sourceStartSeconds
    source_end_seconds = $sourceEndSeconds
    duration_seconds = $durationSeconds
    source_srt = $cols[2].Trim()
    reason = $cols[3].Trim()
    type = $cols[4].Trim()
    direction = $cols[5].Trim()
    motion = $cols[6].Trim()
    prompt = $cols[7].Trim()
    negative_prompt = $cols[8].Trim()
    title = $title
    slug = $slug
    output_file = $outputFile
  })
}

if ($rows.Count -eq 0) {
  throw "No B-roll rows found for BROLL_$('{0:00}' -f $StartNumber)-BROLL_$('{0:00}' -f $EndNumber)."
}

$renderCursor = 0.0
$segments = New-Object System.Collections.Generic.List[object]

foreach ($row in $rows) {
  if ($UseSourceTimeForRender) {
    $renderStart = $row.source_start_seconds
    $renderEnd = $row.source_end_seconds
  } else {
    $renderStart = $renderCursor
    $renderEnd = $renderCursor + $row.duration_seconds
    $renderCursor = $renderEnd
  }

  $segments.Add([pscustomobject]@{
    id = $row.id
    source_start = $row.source_start
    source_end = $row.source_end
    render_start = Convert-SecondsToSrtTime $renderStart
    render_end = Convert-SecondsToSrtTime $renderEnd
    duration_seconds = $row.duration_seconds
    type = $row.type
    title = $row.title
    slug = $row.slug
    source_srt = $row.source_srt
    output_file = $row.output_file
  })
}

$batchLabel = "BROLL_BATCH_{0:00}" -f $BatchNumber
$fullRenderName = "{0}_FULL.mp4" -f $batchLabel

$manifest = [ordered]@{
  project = $ProjectName
  batch = $batchLabel
  editor_targets = @("CapCut", "Filmora")
  canvas = $Canvas
  fps = $Fps
  default_handle_seconds = $HandleSeconds
  full_render = "../full/$fullRenderName"
  clips_dir = "../clips"
  segments = $segments
}

$manifest | ConvertTo-Json -Depth 6 | Set-Content -Path (Join-Path $rendersIndex "broll-manifest.json") -Encoding UTF8

$srtPath = Join-Path $rendersIndex "BROLL_MARKERS.srt"
$srtLines = New-Object System.Collections.Generic.List[string]
$counter = 1
foreach ($segment in $segments) {
  $srtLines.Add([string]$counter)
  $srtLines.Add("$($segment.source_start) --> $($segment.source_end)")
  $srtLines.Add("$($segment.id) | $($segment.title) | file: $($segment.output_file)")
  $srtLines.Add("")
  $counter++
}
$srtLines | Set-Content -Path $srtPath -Encoding UTF8

$csvRows = foreach ($segment in $segments) {
  [pscustomobject]@{
    id = $segment.id
    source_start = $segment.source_start
    source_end = $segment.source_end
    render_start = $segment.render_start
    render_end = $segment.render_end
    duration_seconds = $segment.duration_seconds
    type = $segment.type
    title = $segment.title
    output_file = $segment.output_file
    editor_note = "Import BROLL_MARKERS.srt, then align this clip to marker $($segment.id)."
  }
}
$csvRows | Export-Csv -Path (Join-Path $rendersIndex "BROLL_INDEX.csv") -NoTypeInformation -Encoding UTF8

$mdPath = Join-Path $rendersIndex "BROLL_INDEX.md"
$md = New-Object System.Collections.Generic.List[string]
$md.Add("# $ProjectName $batchLabel Editing Index")
$md.Add("")
$md.Add("Editor targets: CapCut / Filmora")
$md.Add("")
$md.Add("Use `BROLL_MARKERS.srt` as a temporary marker subtitle track. Marker timing follows the original A-roll / source SRT timeline.")
$md.Add("")
$md.Add("## Files")
$md.Add("")
$md.Add("- Full render target: ``renders/full/$fullRenderName``")
$md.Add("- Clip folder: ``renders/clips/``")
$md.Add("- Marker SRT: ``renders/index/BROLL_MARKERS.srt``")
$md.Add("- Machine manifest: ``renders/index/broll-manifest.json``")
$md.Add("- Spreadsheet index: ``renders/index/BROLL_INDEX.csv``")
$md.Add("- Contact sheet target: ``renders/index/BROLL_CONTACT_SHEET.jpg``")
$md.Add("")
$md.Add("## Timeline")
$md.Add("")
$md.Add("| ID | Source Timecode | Render Timecode | Type | Title | Clip file |")
$md.Add("|---|---|---|---|---|---|")
foreach ($segment in $segments) {
  $md.Add("| $($segment.id) | $($segment.source_start)-$($segment.source_end) | $($segment.render_start)-$($segment.render_end) | $($segment.type) | $($segment.title) | ``$($segment.output_file)`` |")
}
$md.Add("")
$md.Add("## CapCut / Filmora Steps")
$md.Add("")
$md.Add("1. Import the A-roll video.")
$md.Add("2. Import ``BROLL_MARKERS.srt``.")
$md.Add("3. Import the whole ``renders/clips/`` folder.")
$md.Add("4. Use each marker subtitle strip to place the matching B-roll clip.")
$md.Add("5. Hide or delete the marker subtitle track before final export.")
$md | Set-Content -Path $mdPath -Encoding UTF8

$splitScriptSource = Join-Path $scriptRoot "..\batch-01\tools\split-broll.ps1"
if (Test-Path $splitScriptSource) {
  $splitDestination = Join-Path $toolsDir "split-broll.ps1"
  $sourceResolved = (Resolve-Path $splitScriptSource).Path
  $destinationResolved = if (Test-Path $splitDestination) { (Resolve-Path $splitDestination).Path } else { $splitDestination }
  if ($sourceResolved -ne $destinationResolved) {
    Copy-Item -Path $splitScriptSource -Destination $splitDestination -Force
  }
}

Write-Host "Generated $batchLabel package:"
Write-Host "  $rendersIndex"
Write-Host "Segments: $($segments.Count)"
