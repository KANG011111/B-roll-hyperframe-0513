# Handoff Notes for Agents

This workspace is a HyperFrames B-roll production project for the "剛來學"
content brand. Read `DESIGN.md` before doing any task.

## Current Goal

The project builds B-roll packages from an SRT/script plan for CapCut and
Filmora post-production. The key problem solved here is timeline alignment:
editors need `BROLL_MARKERS.srt` to match the original A-roll / source SRT
timeline, while rendered B-roll batches may start from `0s`.

## Non-Negotiable Timing Rule

Never mix source timeline and render timeline.

- `source_start` / `source_end`: original A-roll or source SRT time. Use these
  for `BROLL_MARKERS.srt`, `BROLL_INDEX.csv`, `BROLL_INDEX.md`, filenames, and
  editor instructions.
- `render_start` / `render_end`: time inside the rendered B-roll full file. Use
  these only for FFmpeg splitting and thumbnail extraction.
- `BROLL_MARKERS.srt` must always use `source_start` / `source_end`.
- If a batch render starts at `00:00:00,000`, do not let that reset marker SRT
  timing unless the source time is actually `00:00:00,000`.

## Important Files

- `DESIGN.md`: source of truth for brand, safety areas, HyperFrames rules, and
  B-roll delivery rules.
- `AGENTS.md`: startup instructions for Codex-like agents.
- `.github/copilot-instructions.md`: Copilot-facing instruction file.
- `broll/ep03-github-obsidian/BROLL_PLAN.md`: full B-roll plan for the EP03
  SRT.
- `broll/ep03-github-obsidian/generation-prompts.md`: generation prompts per
  B-roll segment.
- `broll/ep03-github-obsidian/tools/generate-broll-package.ps1`: reusable
  generator that reads `BROLL_PLAN.md` and creates marker/index/manifest files.
- `broll/ep03-github-obsidian/batch-01/composition/index.html`: existing
  HyperFrames preview composition for `BROLL_01` to `BROLL_05`.
- `broll/ep03-github-obsidian/batch-01/tools/split-broll.ps1`: FFmpeg clip
  splitter copied into each batch.

## Current Batches

### Batch 01

- Path: `broll/ep03-github-obsidian/batch-01/`
- Segments: `BROLL_01` to `BROLL_05`
- Has a HyperFrames composition.
- Current render timing is source-aligned because the existing composition uses
  source positions.

### Batch 02

- Path: `broll/ep03-github-obsidian/batch-02/`
- Segments: `BROLL_06` to `BROLL_10`
- Contains delivery package files only; no HyperFrames composition yet.
- Its manifest demonstrates the intended split:
  - `source_start` begins at original times such as `00:00:59,820`.
  - `render_start` begins at `00:00:00,000`.

## Generate Another Batch

Run from repo root:

```powershell
powershell.exe -ExecutionPolicy Bypass -File broll\ep03-github-obsidian\tools\generate-broll-package.ps1 -StartNumber 11 -EndNumber 15 -BatchNumber 3
```

For a legacy/source-aligned batch render, add:

```powershell
-UseSourceTimeForRender
```

## Preview and Render Rules

Do not render immediately after edits unless the user explicitly asks.

Default HyperFrames workflow:

1. Edit composition.
2. Run `npm run check`.
3. Start preview with `npm run dev`.
4. Give the user the local Studio URL.
5. Render only after preview approval.

## FFmpeg Split Rule

After a full B-roll batch render exists in `renders/full/`, use the batch
`tools/split-broll.ps1` script to create clips and contact sheet. The splitter
must read `render_start` / `render_end`, not source time.

Default FFmpeg path:

```text
C:\ffmpeg\bin\ffmpeg.exe
```

## CapCut / Filmora Workflow

1. Import the main A-roll video.
2. Import `BROLL_MARKERS.srt` as a temporary subtitle marker track.
3. Import `renders/clips/`.
4. Align each `BROLL_XX...mp4` clip to its matching marker subtitle strip.
5. Hide or delete the marker subtitle track before final export.
