# DESIGN.md

This is the shared design and production brief for HEYGENFRAME / HyperFrames
output in this workspace. Codex, GitHub Copilot, and any AI coding assistant
must read this file before starting a task.

This document is the source of truth for:

- Brand direction
- Visual system
- Copywriting style
- Scene structure
- HyperFrames production rules
- HyperFrames terminology

## 0. Assistant Startup Rule

For every new task:

1. Read this `DESIGN.md`.
2. Read the nearest assistant instruction file for the target project:
   `AGENTS.md`, `CLAUDE.md`, or `.github/copilot-instructions.md` when present.
3. Inspect the target `index.html`, `meta.json`, `hyperframes.json`, and media
   assets before editing.
4. Use the relevant HyperFrames skill before changing compositions.
5. After editing any composition HTML, run the target project's check command.

Do not rely on memory of earlier tasks. Treat this file as the current source of
truth.

## 1. Brand Direction

This video system serves the content brand "剛來學".

Core content categories:

- AI 工具實戰
- WordPress / SEO / 自媒體
- Vibe Coding / Codex / Claude Code / n8n / 自動化工作流
- 聯盟行銷與內容變現
- 親子旅遊懶人包
- 布料控 Luna 產業觀點

The overall style is not cold enterprise tech and not cute classroom slides.
It should feel:

**實戰派、直接、有知識焦慮感、有流程感、能讓觀眾覺得這件事現在就該學。**

Core visual keywords:

- 實戰感
- 工程化
- 工具流
- 快速試錯
- 社群短影音
- 知識焦慮
- 懶人包
- 不廢話
- 一看就知道重點

## 2. Target Audience

Primary audience:

- 20-40 歲中文語系觀眾
- 內容創作者
- 自媒體經營者
- SEO 操作者
- WordPress 使用者
- 想用 AI 提升產能的人
- 對 Codex、Claude Code、n8n、Canva、NotebookLM、HyperFrames 有興趣的人

Audience traits:

- 不想聽太多理論
- 喜歡可以直接照做的流程
- 害怕自己錯過新工具
- 對「省時間」「自動化」「快速產出」很有感
- 喜歡有真實踩坑經驗的內容
- 不喜歡太官方、太空泛、太像課本的說法

## 3. Visual Personality

The visuals should have strong information-short-video recognition.

Visual feeling:

- 有速度感
- 有工具介面感
- 有文件規格感
- 有 AI 工作流感
- 有一點壓迫感，但不要太暗黑
- 像是在拆解一套真的能執行的系統

Avoid:

- 太素
- 太像 PowerPoint
- 太像公司內訓簡報
- 太多無意義 icon
- 太多漸層裝飾但沒有重點
- 太可愛、太軟、太兒童感
- 太高冷導致不親近

## 4. Canvas & Export Format

### Short Video

- 直式短影音：1080x1920
- 適合 YouTube Shorts、Reels、Threads、TikTok
- 預設 30fps
- 建議長度 30 秒
- 重要文字、Logo、CTA、UI 元素必須放在安全區內
- 背景、光效、裝飾圖層可以延伸到畫面邊緣，但不要承載關鍵資訊

### YouTube Thumbnail / Banner Variant

- 橫式：1920x1080 或 2048x1152
- 適合 YouTube 封面、Blog CTA 圖片
- 標題必須巨大、清楚、手機上也能看懂
- 重要標題與 Logo 應放在 title safe 內

### Blog CTA Variant

- 16:9
- 用於 WordPress 文章中的 CTA Banner
- 視覺要比一般內容區塊更醒目
- 不要太像廣告，但要有點擊慾望

## 4.1 Safe Area / 安全線

Use safe areas whenever placing titles, captions, logos, CTA buttons, important
UI, faces, product details, or key actions. Decorative backgrounds may bleed to
the edge, but important information should not.

### Full HD 16:9 Safe Area

For `1920x1080` output, use the traditional two-zone safe area model:

- `Action Safe`: inset 5% from each edge.
- `Title Safe`: inset 10% from each edge.

Conservative pixel guides for `1920x1080` when applying the inset to each edge:

- `Action Safe` 5% inset:
  - Left: `96px`
  - Right: `1824px`
  - Top: `54px`
  - Bottom: `1026px`
  - Safe rectangle: `1728x972`
- `Title Safe` 10% inset:
  - Left: `192px`
  - Right: `1728px`
  - Top: `108px`
  - Bottom: `972px`
  - Safe rectangle: `1536x864`

Some editing templates describe safe area as a total retained area instead of a
per-edge inset. If the brief explicitly asks for that looser interpretation:

- 95% retained action-safe rectangle: `1824x1026`
- 90% retained title-safe rectangle: `1728x972`

Default to the conservative per-edge guide for important text unless the user or
platform template requires the looser guide.

Placement rules:

- Put important text, logos, captions, lower thirds, and CTA inside `Title Safe`.
- Keep faces, key product movement, and important action inside `Action Safe`.
- Backgrounds, abstract motion, glows, and decorative overlays may extend beyond
  both guides.

### 9:16 Short Video Safe Area

For `1080x1920` vertical output, platform UI may cover the right side, bottom
caption area, and top system/title area. Use the following conservative default
unless a platform-specific brief says otherwise.

Default short-video safe guide:

- Left safe inset: `60px`
- Right safe inset: `120px`
- Top safe inset: `126px`
- Bottom soft danger zone starts at `1568px` (`1920 - 352`)
- Bottom hard danger zone starts at `1490px` (`1920 - 430`)

This means:

- Keep key titles, subtitles, logos, and CTA between `x=60` and `x=960`.
- Keep primary text and UI between `y=126` and `y=1490` when possible.
- Avoid placing important information in the bottom `352-430px` because platform
  captions, descriptions, buttons, or interaction UI may cover it.
- Avoid placing important information near the right `120px` because social
  platform interaction buttons often sit there.

Practical layout bands for `1080x1920`:

- Hook title zone: `y=180-620`
- Main explanation zone: `y=600-1280`
- CTA safe zone: `y=1280-1480`
- Avoid important content below `y=1490`

If a video must work across TikTok, YouTube Shorts, Instagram Reels, Threads,
and Facebook Reels, use the most conservative version above.

## 5. Color System

Overall direction:

- 深色科技底
- 高對比文字
- 重點使用亮色
- 不要過度繽紛
- 每一幕最多 2-3 個主要顏色

### Default Palette

Background:

- 深藍黑：`#0B1020`
- 深紫黑：`#111027`
- 深灰黑：`#15171F`

Main text:

- 白色：`#FFFFFF`
- 淺灰：`#E5E7EB`

Accent:

- 電光藍：`#38BDF8`
- 紫色：`#A855F7`
- 螢光綠：`#A3E635`
- 警示黃：`#FACC15`
- CTA 橘紅：`#FB7185`

Usage:

- Hook 關鍵字可用黃色或螢光綠。
- AI / 工具 / 系統感可用藍紫色。
- 警告、踩坑、錯誤、不要這樣做，可用橘紅色。
- CTA 可用亮色按鈕，但不要花到看不清楚。

## 6. Typography

Typography direction:

- 中文要粗、清楚、好讀。
- 不要用太細的字。
- 手機觀看時，第一眼要看懂重點。
- Use system font stacks that render reliably in browser video output.

### Title

- 超大字
- 粗體
- 一幕最多 1-2 行
- 每行盡量不超過 12 個中文字
- 適合用在 Hook、痛點、結論

Examples:

- 你還在手動剪片？
- AI 影片不是亂生
- 先寫規格，再生畫面

### Subtitle

- 中等大小
- 用來補充主標
- 一幕最多 1-2 句
- 不要塞滿畫面

### Label

Use labels for small headings, document names, process names, and technical
entities:

- `VIDEO_SPEC.md`
- `DESIGN.md`
- `Codex`
- `Claude Code`
- `n8n`
- `HyperFrames`
- `Render MP4`
- `Step 01`
- `Scene 03`

### Brand Bug / Corner Brand

When showing the "剛來學" brand bug in the upper-left corner:

- The visible "剛來學" text must be at least `62px` in 1080x1920 output.
- Use bold/heavy black weight (`font-weight: 900` or heavier).
- Keep it inside the platform safe area.
- It must be visible in the poster frame when the composition is meant for
  social upload preview.
- On CTA/end-card scenes, the bottom logo lockup must be centered, visually
  treated with glow or motion, and larger than the CTA button.

### Text Style

The brand may use these symbols to create emphasis:

- `|` / `▍`
- `>` / `➤`
- `*` / `✦`
- `▸`
- `⬥`

Do not put symbols on every line. Symbols should cut emphasis, not decorate
without purpose.

## 7. Copywriting Style

The voice should feel like "剛來學" short videos and FB posts.

Core principles:

- Hook 要猛
- 不要太官方
- 不要廢話
- 要像真的踩過坑的人在講
- 可以有一點吐槽
- 結尾要有 CTA
- 資訊要有步驟感

### Good Hook Examples

- 你以為 AI 影片是輸入一句話就好了？
- 真正會拉開差距的，不是工具，是規格。
- 你還在剪片，人家已經在寫影片系統了。
- AI 生影片最可怕的不是不會用，是你根本沒給它規格。
- 這套流程跑起來，短影音就不是一支一支做，而是一批一批生。

### Bad Hook Examples

Avoid weak openings:

- 今天要來介紹一個很好用的工具
- HyperFrames 是一個很棒的影片工具
- 讓我們一起來看看怎麼使用
- 這是一個簡單的教學

These are too soft and do not create click pressure.

## 8. Layout System

Every scene must have one clear focal point.

### Layout A: Big Hook

Use for the first 0-3 seconds.

Elements:

- 中央巨大標題
- 背景有模糊工具介面或文件卡片
- 關鍵字用亮色標出
- 可加入震動、放大、快速滑入

Example:

- Main: 你還在手動剪短影音？
- Sub: AI 影片真正的關鍵，是規格化。

### Layout B: Problem Cards

Use for pain points.

Elements:

- 3-4 cards appearing sequentially
- One pain point per card
- Error labels, warning marks, or red hairlines are allowed

Example cards:

- 想法太散
- 風格不一致
- 動畫很陽春
- 每支影片都重做

### Layout C: Document Transformation

Use for "idea becomes spec".

Elements:

- Left: messy ideas
- Right: `VIDEO_SPEC.md`
- Center: arrow or transformation motion

Visual effect:

- Left side looks like messy notes.
- Right side becomes clean Markdown.
- The message is: inspiration becomes engineering.

### Layout D: Design System

Use for explaining `DESIGN.md`.

Elements:

- 色票
- 字體規則
- 動畫規則
- 元件清單
- 品牌語氣

Presentation:

- Like a design specification split into cards.

### Layout E: Code To Motion

Use for Codex producing animation.

Elements:

- Left: code window
- Right: animated output
- Bottom: timeline

Visual point:

- Let viewers understand that video frames can be written as code.
- Code should feel real but not overload the viewer.
- The right-side motion must be more visually attractive than the code.

### Layout F: Final CTA

Use for the last 3-5 seconds.

Elements:

- One strong conclusion
- One CTA
- Button or comment prompt

Examples:

- 不要只會叫 AI 生影片。
- 先把你的影片流程規格化。

CTA examples:

- 留言「規格」，我整理一份模板給你。
- 想看完整流程，追蹤剛來學。
- 把這套流程存起來，之後一定會用到。

## 9. Motion System

Animation should be fast, but not chaotic.

### Opening

The first 3 seconds must have strong motion.

Allowed:

- 快速放大
- 文字撞進來
- 卡片快速堆疊
- 畫面閃切
- 背景文件快速掃過

Avoid:

- 慢慢淡入
- 很久才出現主標
- 開場先放 Logo
- 開場鋪陳太久

### Scene Transition

Allowed transitions:

- 卡片滑入
- 文件翻頁
- 程式碼掃描
- 時間軸推進
- 視窗切換
- 圖層縮放

Transitions must serve content. Do not add motion just to show off.

### Text Animation

Rules:

- 主標：快速進場
- 關鍵字：延遲 0.2 秒後亮起
- 補充文字：比主標慢一點出現
- CTA：最後放大一次，停留 1 秒以上

Do not keep text bouncing. It lowers perceived professionalism.

## 10. Component System

### HookTitle

Purpose: opening title.

- 超大字
- 高對比
- 關鍵字亮色
- 可搭配震動或放大

### InfoCard

Purpose: key point card.

Content limit:

- 標題 8 字以內
- 說明 20 字以內
- 可加小 icon 或標籤

### StepCard

Purpose: process steps.

Format:

- `Step 01`
- `Step 02`
- `Step 03`

Suitable for:

- 想法
- 規格
- 設計
- Codex
- HyperFrames
- 輸出

### FileCard

Purpose: show documents.

Common file names:

- `VIDEO_SPEC.md`
- `DESIGN.md`
- `PROMPT.md`
- `SCRIPT.md`
- `EXPORT.md`

Visual:

- Like a code or Markdown document.
- File name in the upper-left corner.
- Content appears as short Markdown fragments.

### CodeWindow

Purpose: show Codex / HTML / CSS / JavaScript / GSAP.

Do not show too much real code. The feeling should be:

**這個影片是被寫出來的。**

### CTAButton

Purpose: final action prompt.

Style:

- 亮色
- 圓角
- 微發光
- 有點像 SaaS 工具按鈕

Text examples:

- 存起來
- 留言拿模板
- 追蹤剛來學
- 下一集拆實作

## 11. Scene Structure

Default video structure: 5 scenes.

### Scene 1: Hook

- Time: 0-3s
- Purpose: 製造知識焦慮
- Visual: 大標 + 快速動態

### Scene 2: Pain

- Time: 3-8s
- Purpose: 說出觀眾痛點
- Visual: 錯誤卡片 / 混亂流程

### Scene 3: Framework

- Time: 8-16s
- Purpose: 提出方法
- Visual: 流程圖 / 文件轉換

### Scene 4: Demo

- Time: 16-25s
- Purpose: 展示工具如何執行
- Visual: Codex + HyperFrames + animation preview

### Scene 5: CTA

- Time: 25-30s
- Purpose: 讓觀眾留言、收藏、追蹤
- Visual: 強結論 + CTA

## 12. Content Rules

Each scene should communicate only one point.

Do not paste full article paragraphs into the video.

Maximum per scene:

- One main title
- One supporting sentence
- One visual focus

Text limits:

- Main title: 6-16 Chinese characters
- Subtitle: 15-30 Chinese characters
- Card text: shorter is better

Rhythm:

- 前 3 秒：一定要有壓迫感
- 中段：用流程讓人理解
- 結尾：一定要收斂到一句可以記住的話

## 13. Brand Voice

The tone should sound like:

- 朋友跟你說實戰心得
- 不是老師照課本唸
- 不是業配新聞稿
- 不是科技媒體翻譯文
- 是真的用過、踩過坑、整理出流程的人

Useful sentence patterns:

- 我後來發現，真正卡住的不是工具。
- 這件事最可怕的是，你以為你在做影片，其實你在重複打工。
- 如果你沒有先寫規格，AI 只會幫你生出一堆很像簡報的東西。
- 這套流程跑起來後，內容就不是一支一支做，而是系統化產出。

## 14. Do / Don't

### Do

- Hook 要強
- 重點要短
- 畫面要有層次
- 風格要一致
- 每一幕都要有目的
- 要有文件、工具、流程感
- 要讓觀眾覺得這是可以照做的

### Don't

- 不要太素
- 不要像普通簡報
- 不要整段文字貼上去
- 不要動畫太慢
- 不要開場先自我介紹
- 不要使用過多 emoji
- 不要讓畫面看起來像免費模板
- 不要只講工具功能，要講使用場景

## 15. Default Video Style Prompt

When Codex or another AI agent needs to create visuals, follow this style:

請製作一支中文資訊型短影音動畫，風格要有「AI 工具實戰、知識焦慮、工程化流程」的感覺。畫面不能太素，也不能像普通 PowerPoint。請使用深色科技背景、高對比大字、文件卡片、程式碼視窗、流程步驟卡與 CTA 按鈕。動畫節奏要快，前三秒必須用強 Hook 抓住觀眾。每一幕只呈現一個重點，文字要短，適合手機觀看。整體視覺要像一個內容創作者正在把 AI 工作流拆成可執行的系統。

## 15.1 SRT B-roll Workflow

When the user provides an SRT script and asks for B-roll, analyze the subtitles
and mark the portions that need B-roll support. The goal is to turn spoken
content into segmented, generate-ready `1920x1080` B-roll prompts.

### Default Output

- Output format: Markdown table.
- B-roll canvas: `1920x1080`.
- Visual mode: mixed, chosen per segment.
- Minimum segments: 5 B-roll segments per SRT.
- Segment count: automatically increase based on SRT length and information
  density.
- Do not render video unless the user explicitly asks to enter HyperFrames
  production.

### What To Mark

Prioritize SRT lines that contain:

- Abstract concepts that need visual explanation.
- Pain points or mistakes.
- Workflow steps.
- Tool names, platform names, or file names.
- Turning points, strong claims, or quotable lines.
- Numbers, comparisons, before/after ideas, or results.

Do not mark ordinary filler lines, greetings, repeated phrasing, or soft
transition sentences unless they are needed to bridge two visual ideas.

### Segmentation Rules

- Adjacent SRT lines may be merged when they express one idea.
- Each B-roll segment must be independently generatable.
- Timing should default to the original SRT timecode range.
- A segment may extend `0.3-0.5s` beyond the subtitle timing when a transition
  or visual handoff needs breathing room.
- Keep all B-roll concepts aligned with the "剛來學" style: practical,
  engineered, tool-driven, high-contrast, and not like a generic slide deck.

### Visual Type Selection

Choose the visual type per segment:

- `資訊圖解`: for concepts, frameworks, comparisons, numbers, and workflows.
- `工具介面動畫`: for AI tools, Codex, Claude Code, n8n, WordPress, SEO, or
  automation flow.
- `文件流程`: for `VIDEO_SPEC.md`, `DESIGN.md`, scripts, prompts, exports, or
  structured planning.
- `真實素材感`: for travel, parenting, industry scenes, real-world context, or
  human situations.
- `混合`: when the segment needs both real-world context and interface/process
  overlays.

### Required Table Columns

Use this table format:

| # | SRT時間碼 | 原文字幕 | B-roll理由 | 視覺類型 | 畫面方向 | 鏡頭/動畫 | 1920x1080 Prompt | 負面提示 | 可否切成獨立生成段 |
|---|---|---|---|---|---|---|---|---|---|

Column requirements:

- `#`: Use `BROLL_01`, `BROLL_02`, etc.
- `SRT時間碼`: Use the merged SRT start/end timecode.
- `原文字幕`: Keep the original subtitle text, merged if needed.
- `B-roll理由`: Explain why this line needs visual support.
- `視覺類型`: Pick one of the visual types above.
- `畫面方向`: Describe the intended image or animation in one concise paragraph.
- `鏡頭/動畫`: Describe camera movement, layer motion, UI motion, or transition.
- `1920x1080 Prompt`: Write a generation-ready prompt for the B-roll segment.
- `負面提示`: Include things to avoid, such as clutter, generic stock visuals,
  unreadable text, wrong aspect ratio, childish style, or PowerPoint-like design.
- `可否切成獨立生成段`: Use `是` by default; use `否` only when the segment
  depends on the previous or next visual.

### Segmented Generation List

After the table, always include:

```text
分段生成清單
BROLL_01: ...
BROLL_02: ...
BROLL_03: ...
```

Each line should summarize the segment's generation target, visual type, and
timecode. This list is used as the execution checklist for later generation.

### Quality Checks

Before finalizing SRT B-roll output:

- Confirm there are at least 5 B-roll segments.
- Confirm every segment has a clear timecode range.
- Confirm every segment has a `1920x1080` prompt.
- Confirm filler lines were not over-selected.
- Confirm the prompts preserve the "剛來學" tone: practical, urgent,
  process-oriented, engineered, and visually clear.
- Confirm the output is only a B-roll plan/prompt table unless the user
  explicitly asks to make HyperFrames scenes or render video.

## 15.2 CapCut / Filmora B-roll Delivery

CapCut and Filmora do not use the same professional XML conform workflow as
Premiere Pro or DaVinci Resolve. For these editors, default B-roll delivery must
optimize for fast human timeline alignment.

### Default Delivery Package

Every B-roll batch should be delivered as:

- `renders/full/<PROJECT>_BROLL_BATCH_<NN>_FULL.mp4`: one full preview/render.
- `renders/clips/BROLL_01_<START>-<END>_<slug>.mp4`: one MP4 per B-roll segment.
- `renders/index/broll-manifest.json`: machine-readable segment manifest.
- `renders/index/BROLL_MARKERS.srt`: editor marker subtitles for CapCut/Filmora.
- `renders/index/BROLL_INDEX.csv`: spreadsheet-friendly lookup table.
- `renders/index/BROLL_INDEX.md`: human-readable editing checklist.
- `renders/index/BROLL_CONTACT_SHEET.jpg`: thumbnail overview generated after
  clips exist.

### Marker SRT Rules

`BROLL_MARKERS.srt` is not a real subtitle file for publishing. It is a temporary
timeline marker layer.

- Each SRT item time range must match the original A-roll / source SRT
  timeline. This is non-negotiable.
- Never use batch-relative render time in `BROLL_MARKERS.srt`.
- If a batch render starts at `0s` but the B-roll belongs at `00:03:20,920` in
  the main edit, the marker SRT must still use `00:03:20,920`.
- Each SRT item text must include the B-roll ID, short title, and clip filename.
- Recommended text format:
  `BROLL_01 | Agent 接上第二大腦 | file: BROLL_01_000000-000752_agent-second-brain.mp4`
- Import this SRT into CapCut or Filmora to create visible timeline blocks.
- After placing B-roll clips, hide or delete the marker subtitle track.
- Keep formal subtitles separate from marker subtitles.

### Manifest Timing Fields

Use separate timing fields so editor placement and FFmpeg cutting do not get
mixed up:

- `source_start` / `source_end`: original SRT or A-roll timeline. Use these for
  `BROLL_MARKERS.srt`, `BROLL_INDEX.csv`, and editing instructions.
- `render_start` / `render_end`: time inside the rendered B-roll full file. Use
  these only for FFmpeg splitting and thumbnail extraction.
- For a full episode-length B-roll render, source time and render time may be the
  same.
- For a small batch render that starts at `0s`, render time may start at `0s`,
  while source time must preserve the original episode placement.

### Package Generator

Use a generator script whenever possible instead of hand-editing delivery files.

- Input: `BROLL_PLAN.md`.
- Output: `broll-manifest.json`, `BROLL_MARKERS.srt`, `BROLL_INDEX.csv`, and
  `BROLL_INDEX.md`.
- The generator must read Markdown as UTF-8.
- The generator must preserve `source_start` / `source_end` from the B-roll
  plan.
- The generator may create contiguous `render_start` / `render_end` values for a
  new batch render, or source-aligned render times for legacy batches.
- Generated marker SRT files must always use source time, never render time.

### Clip File Rules

- Clip filenames must start with the B-roll ID.
- Include source start/end time in compact `HHMMSS-HHMMSS` format.
- Include a short ASCII slug for searchability.
- Keep filenames sortable in the same order as the episode timeline.
- Default clip codec: H.264 MP4 for broad CapCut/Filmora compatibility.
- Default handle: add `0.3s` before and after each clip when possible, but never
  before `0s`.

### CapCut Workflow

1. Import the main A-roll video.
2. Import `BROLL_MARKERS.srt`.
3. Import the entire `renders/clips/` folder.
4. Find marker block `BROLL_03` on the subtitle track.
5. Drag the matching `BROLL_03...mp4` above the A-roll and align to the marker.
6. Hide or delete the marker subtitle track before final export.

### Filmora Workflow

1. Import the main A-roll video.
2. Import `BROLL_MARKERS.srt` from the media area.
3. Import the entire `renders/clips/` folder.
4. Use each SRT subtitle strip as the placement marker.
5. Enable Magnetic Timeline if it helps clip snapping.
6. Hide or delete the marker subtitle track before final export.

### FFmpeg Split and Contact Sheet

After HyperFrames renders the full B-roll file:

- Use `broll-manifest.json` to cut individual clips with FFmpeg.
- FFmpeg must read `render_start` / `render_end`, not `source_start` /
  `source_end`, unless the manifest intentionally sets them equal.
- Re-encode clips to H.264 to avoid inaccurate keyframe-only cuts.
- Generate one representative thumbnail per segment.
- Generate a contact sheet with B-roll ID, timecode, and short title burned in.

Do not replace HyperFrames with FFmpeg. HyperFrames creates the animation; FFmpeg
only packages the render into editor-friendly assets.

### HyperFrames Batch Metadata

Every B-roll scene clip inside a HyperFrames batch composition should include:

- `data-broll-id`
- `data-source-start`
- `data-source-end`

These attributes are for traceability and editing alignment. HyperFrames timing
attributes such as `data-start` and `data-duration` may remain render-relative.

## 16. HyperFrames Production Notes

HyperFrames uses HTML, CSS, JavaScript, data attributes, and animation timelines
to produce video. In this workspace, the default output is:

- HTML / CSS / JavaScript composition
- GSAP timeline animation
- 1080x1920 short video unless the user asks otherwise
- 30fps
- About 30 seconds
- Renderable MP4

Production rules:

- Use `index.html` as the root composition entry point.
- Use `meta.json` for project metadata.
- Use `hyperframes.json` for registry and path configuration.
- Use `assets/` for video, audio, and images when the project has that folder.
- Use `compositions/` for reusable sub-compositions.
- Every scene must have a clear timeline.
- Components should be reusable when reuse is likely.
- File cards, process cards, code windows, and CTA buttons should share a
  consistent design language.

### Preview Before Render

Do not render MP4 immediately after making changes unless the user explicitly
asks for a direct render.

Default workflow:

1. Edit the composition.
2. Run `npm run check`.
3. Start HyperFrames preview with `npm run dev`.
4. Give the user the local Studio URL.
5. Wait for user confirmation.
6. Render MP4 only after the user approves the preview.

This prevents wasting time on renders when the user only needs to inspect layout,
timing, or first-frame behavior.

### Social Preview / Poster Frame

Facebook, Instagram, TikTok, Threads, and other platforms may use the first frame
or an early frame as the upload preview. Avoid black or empty previews.

Rules:

- The frame at `0s` must contain visible content.
- The first frame should clearly show the Hook, brand mark, and enough visual
  context to work as a thumbnail.
- Do not start with every important element at `opacity: 0`.
- Use a `0.3-0.5s` poster hold before the main entrance animation when needed.
- The poster frame must obey the 9:16 safe area rules.
- Background alone is not enough; important text or brand content must already
  be visible.

Recommended pattern:

- Show Hook title, brand, and key document/tool visual at `0s`.
- Hold them still for about `0.45s`.
- Then begin the animated entrance or motion sequence.

If a platform still shows a bad preview, export a separate cover image or choose
the cover manually in the upload UI when available.

After HTML composition changes, run:

```bash
npm run check
```

If running directly with the CLI, the equivalent checks are:

```bash
npx hyperframes lint
npx hyperframes validate
npx hyperframes inspect
```

## 17. HyperFrames Terminology

Use these terms consistently in prompts, code comments, scene labels, and
implementation notes.

### Core Product Terms

- `HyperFrames`: HTML-based video composition and rendering framework.
- `HyperFrames Studio`: Browser preview/editor started by `npx hyperframes preview`.
- `HyperFrames CLI`: Command-line tool used for init, preview, lint, validate,
  inspect, render, publish, docs, and composition listing.
- `HyperFrames skills`: AI-agent skill pack installed with
  `npx skills add heygen-com/hyperframes`.
- `Catalog`: Ready-to-use blocks, transitions, overlays, data visualizations,
  and effects.
- `Packages`: HyperFrames package ecosystem.
- `Reference`: Technical API and schema reference.

### Agent Skill Terms

- `/hyperframes`: Composition authoring skill.
- `/hyperframes-cli`: Dev-loop skill for init, lint, inspect, preview, render,
  doctor, and related CLI work.
- `/hyperframes-media`: Asset preprocessing skill for TTS, transcription, and
  background removal.
- `/hyperframes-registry`: Registry block/component installation skill.
- `/website-to-hyperframes`: Website-to-video pipeline skill.
- `/tailwind`: Tailwind v4 browser-runtime styling skill.
- `/gsap`: GSAP timeline animation skill.
- `/animejs`: Anime.js runtime skill.
- `/css-animations`: CSS keyframes and seekable animation skill.
- `/lottie`: Lottie and dotLottie animation skill.
- `/three`: Three.js / WebGL scene skill.
- `/waapi`: Web Animations API skill.

### CLI Terms

- `npx hyperframes init`: Scaffold a new HyperFrames project.
- `--non-interactive`: Skip interactive wizard prompts.
- `--example blank`: Start from a blank example.
- `--video ./intro.mp4`: Import a source video for transcription/captions.
- `npx hyperframes preview`: Start HyperFrames Studio in the browser.
- `hot reload`: Preview updates after saving HTML without manual refresh.
- `npx hyperframes lint`: Check composition syntax and common mistakes.
- `npx hyperframes validate`: Validate composition rules and contrast.
- `npx hyperframes inspect`: Headless visual layout inspection.
- `npx hyperframes render`: Render the composition to video.
- `--output output.mp4`: Render output file path.
- `npx hyperframes publish`: Publish and get a shareable link.
- `npx hyperframes docs <topic>`: Read local HyperFrames docs.
- `npx hyperframes compositions`: List compositions in a project.

### File and Folder Terms

- `index.html`: Root composition and video entry point.
- `meta.json`: Project metadata such as name, ID, and creation date.
- `hyperframes.json`: HyperFrames configuration, registry, and paths.
- `compositions/`: Folder for sub-compositions.
- `assets/`: Folder for videos, audio, images, and other media.
- `transcript.json`: Word-level transcript when generated.
- `renders/`: Render output folder when present.

### Composition Terms

- `composition`: An HTML document that defines a video timeline.
- `root composition`: The top-level composition, usually `index.html`.
- `sub-composition`: A reusable nested composition loaded into another
  composition.
- `nested composition`: A composition embedded inside another composition.
- `external composition`: A sub-composition loaded from another HTML file.
- `inline composition`: A nested composition declared directly inside the parent.
- `clip`: A discrete timeline block represented by an HTML element.
- `timed element`: An element with timing data attributes.
- `track`: Timeline row defined by `data-track-index`.
- `z-index`: CSS visual stacking order. Do not confuse with track index.
- `A-roll`: Main talking-head or primary video.
- `B-roll`: Supporting video or visual footage.
- `overlay`: Text, image, UI, or graphic layer above main content.
- `lower third`: Name/title label placed in the lower part of the frame.
- `caption`: On-screen subtitle or spoken-word text.
- `template`: Wrapper used by external sub-composition HTML files.

### Data Attribute Terms

- `data-* attributes`: Declarative controls for timing, media playback, and
  composition structure.
- `data-composition-id`: Unique composition wrapper ID. Required.
- `data-width`: Composition width in pixels.
- `data-height`: Composition height in pixels.
- `data-start`: Clip start time in seconds or relative reference.
- `data-duration`: Clip duration in seconds.
- `data-track-index`: Timeline track number. Same-track clips cannot overlap.
- `data-media-start`: Media trim/playback offset in seconds.
- `data-volume`: Audio/video volume from 0 to 1.
- `data-has-audio`: Indicates a video has an audio track.
- `data-composition-src`: Path to an external composition HTML file.
- `data-variable-values`: JSON object passed to a nested composition instance.
- `data-composition-variables`: JSON array declaring variables and defaults.
- `class="clip"`: Required on timed visible elements so the runtime can manage
  visibility.
- `data-layout-ignore`: Exclude intentional decorative overflow from layout
  inspection.
- `data-layout-allow-overflow`: Allow intentional overflow during inspection.

### Variable Terms

- `window.__hyperframes.getVariables()`: Runtime method for reading resolved
  variables inside a composition.
- `--variables '<json>'`: CLI render-time variable override.
- `--variables-file ./vars.json`: CLI render-time variable file.
- `--strict-variables`: Fail fast on undeclared keys or type mismatches.
- Variable types: `string`, `number`, `color`, `boolean`, `enum`.

### Animation and Runtime Terms

- `GSAP`: Animation library used for timelines and tweens.
- `gsap.timeline({ paused: true })`: Required timeline pattern.
- `window.__timelines`: Global registry for HyperFrames-controlled timelines.
- `timeline`: Ordered animation sequence.
- `tween`: Single animation step.
- `seek`: Move animation/media state to a specific time or frame.
- `seek-driven rendering`: Rendering method where every frame is positioned
  independently before capture.
- `frame adapter`: Runtime adapter that positions animations and DOM state for a
  requested frame.
- `seekFrame(frame)`: Adapter method that must return the same result for the
  same frame.
- `renderSeek`: Adapter behavior that pauses and seeks timelines.
- `deterministic rendering`: Same input produces the same video output.
- `finite duration`: Every composition must have a known end.
- `preview vs render parity`: Browser preview and rendered MP4 should visually
  match.
- `__playerReady`: Readiness gate for preview/player loading.
- `__renderReady`: Readiness gate before frame capture.

### Rendering Terms

- `frame-by-frame rendering`: Each video frame is captured independently.
- `frame clock`: Frame time computed from frame index and fps.
- `fps`: Frames per second.
- `Chrome HeadlessExperimental.beginFrame`: Chrome frame capture API used in the
  rendering pipeline.
- `FFmpeg`: Encoder that turns captured frames and audio into MP4.
- `MP4`: Final rendered video format.
- `Docker mode`: Reproducible render mode with fixed Chrome, fonts, and FFmpeg.
- `GPU acceleration`: Render performance option when available.
- `quality presets`: Render quality options.
- `HDR rendering`: High dynamic range render mode.
- `4K rendering`: High-resolution render mode.

### Safe Area Terms

- `safe area`: Region where important content should remain visible after
  platform UI, screen overscan, crop, or compression.
- `Action Safe`: The looser safe region for important motion, faces, products,
  and key visual action.
- `Title Safe`: The stricter safe region for text, logos, subtitles, CTA, and
  UI labels.
- `safe grid`: A visible guide layer showing safe area boundaries.
- `platform UI`: Buttons, captions, usernames, descriptions, and controls added
  by TikTok, YouTube Shorts, Reels, Threads, or other platforms.

### Dependency Terms

- `Node.js 22+`: Required runtime for the CLI and dev server.
- `npm` / `bun`: Package managers.
- `FFmpeg`: Required for local MP4 rendering.
- `Docker`: Optional but useful for deterministic reproducible renders.

## 18. HyperFrames Non-Negotiable Rules

Root composition:

- Root element must have `data-composition-id`, `data-width`, and `data-height`.
- Root composition should live in `index.html`.
- Match requested canvas size. Default short video is `1080x1920`.

Timed elements:

- Timed visible elements need `class="clip"`.
- Timed elements need `data-start`, `data-duration`, and `data-track-index`
  when applicable.
- Clips on the same `data-track-index` must not overlap.
- Use CSS `z-index` for visual stacking, not `data-track-index`.

GSAP:

- Create timelines with `{ paused: true }`.
- Register timelines on `window.__timelines["<composition-id>"]`.
- Do not use infinite `repeat: -1`; calculate finite repeats.
- Build timelines synchronously, not inside `async`, `setTimeout`, or Promises.
- Animate visual properties only: opacity, transform, color, background, scale,
  rotation, border radius.

Media:

- Video elements should be `muted playsinline`.
- Use a separate `<audio>` element for audio tracks.
- Do not call `play()`, `pause()`, or manual seek on media elements.
- Let HyperFrames control media playback and clip visibility.

Determinism:

- Do not use `Date.now()`.
- Do not use unseeded `Math.random()`.
- Do not rely on `requestAnimationFrame` or wall-clock timers for render state.
- Do not fetch live network data at render time.
- Keep output parameters fixed: fps, width, height, and duration.

Layout:

- Build the hero frame layout first, then animate into it.
- Text must fit inside the frame and inside its container.
- Use flex/grid/padding for content layout; reserve absolute positioning for
  intentional decorative layers or precise video framing.
- Mark intentional decorative overflow with `data-layout-ignore` or
  `data-layout-allow-overflow`.

## 19. Existing Workspace Projects

Current projects:

- `product-intro/`: 1920x1080 horizontal product introduction composition.
- `tiktok-hook/`: 1080x1920 vertical short-form hook and CTA composition.

Each subproject is self-contained and has its own `package.json`,
`hyperframes.json`, `meta.json`, media assets, and `index.html`.

### `product-intro/`

- Format: 1920x1080.
- Tone: premium, minimal, product-launch style.
- Current palette: dark navy, white, muted blue, gold accent.
- Existing motion language: staggered entrance, ambient glow, clean fade-out.
- Preserve the calm, editorial feel unless the user asks for a more energetic
  product ad.

### `tiktok-hook/`

- Format: 1080x1920.
- Tone: energetic short-form brand hook.
- Current palette: black, white, brand red, yellow highlight.
- Existing motion language: logo reveal, halo rotation, shatter text, pulse,
  CTA, glitch outro.
- Keep the hook readable and immediate. The CTA should land clearly near the
  end.

## 20. Final Creative Direction

The core of this design system is not just "pretty".

The core is:

**讓觀眾在 3 秒內知道自己落後了，  
在 15 秒內理解一套方法，  
在 30 秒內想把流程存起來。**

The video should feel like:

**這不是 AI 玩具，這是內容生產流程的下一種工作方式。**
