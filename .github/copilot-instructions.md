# GitHub Copilot Instructions

Before helping with this workspace, read `DESIGN.md` in the repository root.
Treat it as the shared design brief for both GitHub Copilot and Codex.

When working inside a subproject such as `product-intro/` or `tiktok-hook/`,
also read that subproject's `AGENTS.md` and `CLAUDE.md` if present.

This workspace contains HyperFrames video composition projects. Before changing
composition HTML:

- Inspect the target `index.html`, `meta.json`, `hyperframes.json`, and
  available media assets.
- Preserve the target project's resolution, duration, tone, and motion language
  unless the user asks for a change.
- Keep animation deterministic. Do not use live network fetches, `Date.now()`,
  or non-seeded `Math.random()` in rendered compositions.
- Register GSAP timelines on `window.__timelines` and keep them paused.
- After editing composition HTML, run `npm run check` from the affected
  subproject directory.

Prefer updating `DESIGN.md` for long-lived design rules so all assistants share
one source of truth.
