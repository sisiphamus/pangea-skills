---
name: ui
purpose: Visual craft layer for frontend UI — layout, color, type, components, Tailwind v4 + Next.js quality bar; pure look (not deploy/ops).
description: The visual craft layer for any frontend build — layout, color, type, components, the Tailwind v4 + Next.js quality bar and hard rules. Pure look; deploy/ops is a separate skill (ui-ops, not in this pack).
share: public
layers: []
---

# UI build

## Load stack (shared pack)

This skill is self-contained. If it is installed under your agent skills folder (e.g. `~/.claude/skills/ui/`), load and follow it for any UI build.

Visual craft layer for any work touching a line of UI: the quality bar, the look, the rules that make a build distinctive rather than templated.

Deploy/ops (project setup, brand assets, screenshot review loop, GitHub + Vercel) is **not** in this pack — ask the sharer if you need that layer.

## Principles
1. **Awwwards-grade, never templated:** every build calibrates against the named reference set below and aims for distinctively-curated quality, not a CMS-theme look.
2. **Ask before touching a line:** at least 10 refining questions (do not assume a top bar or sidebar).
3. **Visual weight on every section:** if removing the heading leaves nothing, the section needs more content or a stronger background treatment.

## Workflow
1. **Look at the references.** Open awwwards.com and the studios in the Reference set; for any treatment that matches the idea, view-source or open devtools to inspect the HTML/CSS.
2. **Refine** with at least 10 questions on vibe, look, structure, colors, user flow, specific components, typography, layout.
3. **Set up** a subfolder named after the app for new builds.
4. **Decompose** into parallel workstreams (one per component) when components and styling cleanly separate; otherwise build single-threaded.
5. **Verify the dev server renders fonts correctly** before moving to components.
6. **Build** per the Rules.
7. **Run every piece of on-page copy through a human-voice pass before calling it done.** Scan headline, body, labels, and CTA against the copy-side AI tells below (em-dash overuse, marketing buzzwords, "Not X. Just Y." cadence). Fix before ship. Copy is judged as hard as pixels.

## Rules
- **Do** use a custom color palette; ask the operator, do not default.
- **Do** use real images from the web.
- **Do** make mock/placeholder data look real: 5+ list items, labeled chart axes, enough rows to feel populated.
- **Do** define explicit font utility rules in CSS (`.font-serif { font-family: var(--font-serif), Georgia, serif; }`); Next.js injects `next/font` variables on `<body>`, so do not re-register them in `@theme inline`.
- **Don't** use icons or emojis in the design.
- **Don't** use pre-made templates or basic 2x3 card grids; custom everything.
- **Don't** use `position: absolute/fixed` for readable content; use flex/grid so content contributes to layout sizing.
- **Don't** use viewport units (`vh/svh/dvh`) for section height; let content determine height, use padding for spacing.
- **Don't** create circular CSS variable references in `@theme` blocks.
- **Don't** use a universal `*` reset; Tailwind v4 has its own preflight.
- **Don't** over-specify visual design in a comparison or bake-off brief (one where the goal is to see how different skills or tastes differ). Give the product, audience, goal, and voice, plus only the constraints needed for fair comparison (e.g., one page, a clear primary action). Leave color, typography, layout, motion, and any signature element open so each skill's taste drives a divergent result. Mandating a specific palette or treatment collapses all outputs to near-identical and defeats the comparison. (The separate real-build case is different: when you want one specific branded result, specificity is correct.)

### AI-tell bans (mined from Impeccable)
The next two sections are a match-and-refuse reference, not a read-through: scan for the shape you are about to ship and refuse it. If nothing matches, move on. Match-and-refuse: the shapes that read "AI made this" without doubt. Mined from [Impeccable](https://github.com/pbakaus/impeccable) (`impeccable.style`) — an open-source design-taste skill with a 45-rule deterministic antipattern detector, ~40k GitHub stars, a16z-backed, built by Paul Bakaus (jQuery UI). If about to ship one of these, rewrite the element with different structure; don't just tweak it.
- **Side-stripe borders** — `border-left`/`border-right` >1px as a colored accent on a card or callout. Use a full hairline border, a background tint, or a leading icon/number instead.
- **Gradient text** — `background-clip: text` + gradient. Decorative, not meaningful. Solid color; carry emphasis with weight or size.
- **Cream / beige / sand body background** — the saturated "tasteful" AI default (OKLCH L 0.84–0.97, C < 0.06, hue 40–100; token names like `--paper`/`--cream`/`--linen` are tells in themselves). Pick a saturated brand color, a true chroma-0 off-white, or a brand-tinted dark neutral instead.
- **Purple/violet gradients, cyan-on-dark** — the other saturated AI palette default.
- **Icon-tile-stack** — a small rounded-square icon container centered above a heading; the universal AI feature-card template. Put the icon in flow or side-by-side with the heading instead.
- **Hero eyebrow / pill chip** — a tiny uppercase tracked label immediately above an oversized headline. Shows up in 55–95% of AI generations regardless of brief. Drop it or fold the kicker into the headline.
- **Numbered section markers (01/02/03)** as default scaffolding — the eyebrow trope one tier deeper. Earns its place only when the section really is a sequence.
- **Identical card grids** — same-size icon+heading+text cards, repeated endlessly (nested cards are always wrong).
- **The hero-metric template** — big number, small label, supporting stats, gradient accent. SaaS cliché unless it's real user data.
- **Italic serif display hero** (Fraunces, Recoleta, Playfair, Newsreader-italic) as the primary headline — reads as taste in isolation, is the default AI-startup hero in aggregate. Set roman or a non-serif display face unless the register is genuinely editorial.
- **Overused fonts** — Inter, Roboto, Fraunces, Geist, Plus Jakarta Sans, Space Grotesk, DM Sans, Outfit, Instrument Sans/Serif, Newsreader, Lora, Crimson (Pro/Text), Cormorant (Garamond), Syne, IBM Plex (Mono/Sans/Serif), Space Mono. Every new AI wave converges on the same handful; pick a face with real personality.
- **Bounce or elastic easing** — dated and tacky. Use exponential ease-out (quart/quint/expo).
- **Dark mode with glowing color box-shadows** — the default "cool" AI look. Subtle, purposeful lighting, or skip dark mode.
- **Glassmorphism as default** — blurred glass cards used decoratively everywhere. Rare and purposeful, or nothing.
- **Repeated section kickers** — the same tiny tracked label above every section, turning a brand page into AI scaffolding.
- **Em-dash overuse, marketing buzzwords, aphoristic cadence** ("Not X. Just Y.") — the copy-side tells. These are caught by the copy scan gate (Workflow step 7), not by eyeballing.

### More AI-tell bans (mined from field research + a local build-judge system)
Cross-referencing Anthropic's own `frontend-design` skill, a Reddit-mined 3,000-comment tell study, independent design-slop critics, and a hard-earned local corpus (a build → screenshot → harsh-critic → iterate loop judged against world-class exemplars, with every finding calibrated against the operator's own eye before it counted):
- **Unmodified shadcn/ui defaults** — default radius, default neutral-grey palette, default ghost-button style, still-Inter. Every AI page-builder (Bolt, v0, Lovable, Cursor) scaffolds from shadcn, so an unedited install is now its own fingerprint. Re-theme the tokens (a `tweakcn.com`-style pass or hand-authored CSS vars) before shipping.
- **Uniform, oversized border-radius on everything** — cards, buttons, inputs, and images all rounded to the same 24px+ value, "rounding everything into the same soft blob."
- **Status dots that don't represent a real state** — colored circles implying a live/status system that isn't actually there.
- **The "I-know-Inter-is-bad" escape-hatch combo** — Geist + Space Grotesk + Instrument Serif repeating together is now its own recognized cliché, not an escape from one.
- **Dark mode with medium-grey body text on near-black**, specifically (not just "dark mode exists") — the single most-cited individual AI-UI tell in a 2026 field survey (34%), and frequently a genuine WCAG-AA failure, not just an aesthetic one.
- **The three AI "escape hatch" looks Anthropic's own skill names verbatim** — treat all three as defaults to avoid, not safe choices: (1) warm cream (~#F4F1EA) + high-contrast serif + terracotta accent, (2) near-black + a single acid-green or vermilion accent, (3) broadsheet layout — hairline rules, zero border-radius, dense newspaper columns. Each one was originally the *escape* from purple-gradient slop; each has since calcified into its own tell.
- **For B2B/dev-tool SaaS specifically**, the current unguided fashion-mean is: dark mode, single amber accent, a canvas node-graph/network-diagram hero, a manifesto/belief section, monospace metadata labels, alternating dark/cream rhythm. Six independently-briefed builds with zero shared instructions converged on nearly this exact page — treat it as the genre's own forgettable middle, not a safe default.

**The ingredient trap.** A safe-looking ingredient list — cream field, muted palette, editorial serif, restrained motion — does not by itself signal quality; the same ingredients show up in both the best pages in the world and the most generic ones. What separates them is never the palette, it's one **named, specific mechanism** that earns it: a numbered-conviction manifesto, structural underlines paired with a data-viz accent, a signed founder letter mid-page, a sustained display-type system used as the actual structural spine, an editorial risk a generic brand wouldn't take. Before shipping a "restrained" or "warm" look, name the one specific thing that earns it — if the only answer is the ingredient list itself, it hasn't earned it yet.

### Color strategy (mined from Impeccable)
Name the strategy before naming colors:
- **Restrained** — tinted neutrals + one accent ≤10% of the surface. Default for product/functional UI.
- **Committed** — one saturated color carries 30–60% of the surface. Brand default for identity-driven pages.
- **Full palette** — 3–4 named roles, each deliberate.
- **Drenched** — the surface IS the color. Brand heroes, campaign pages.

Use OKLCH throughout (`oklch(L C H)`); reduce chroma near white/black or it looks garish. Tint neutrals 0.005–0.015 chroma toward the brand's own hue, not toward generic warm or cool. Name a real reference for the strategy ("Klim Type Foundry #ff4500 drench", "Stripe purple-on-white restraint") before picking colors — unnamed ambition becomes beige.

### A few more craft specifics (mined from Impeccable)
- Cap body line length at 65–75ch.
- Hero/display heading ceiling: `clamp()` max ≤ 6rem (~96px) — above that the page is shouting, not designing.
- Pair fonts on a contrast axis (serif + sans, geometric + humanist), not two faces that are similar but not identical; or use one family across weights.
- Prefer a 4pt spacing scale (4, 8, 12, 16, 24, 32, 48, 64, 96px) over 8pt — 8pt skips the 12px step you'll frequently need.
- Touch targets ≥44×44px even when the visual element is smaller; expand the hit area with an inset pseudo-element rather than resizing the visible glyph.
- Build a semantic z-index scale (dropdown → sticky → modal-backdrop → modal → toast → tooltip). Never arbitrary values like 999 or 9999.

### Calibrated house rules (earned the hard way, from a local build → screenshot → harsh-critic → iterate loop)
- **One accent, or none — never two competing synthetic accents running at once.** Every genuinely great reference checked commits to a single accent; two colors fighting for the same role reads as indiscipline, not richness.
- **Negative space must counterweight something, not be leftover.** A large uncounterweighted void (e.g. half the viewport left blank) doesn't read as confident restraint — it reads as content that stopped short of the edge.

### Component & motion stack
Cite a real library for any interactive primitive (modal, combobox, drawer, command palette, tooltip, tabs, date picker) instead of hand-rolling one — a hand-rolled primitive a sourced library already solves well reads as amateur, not bespoke.
- **Headless primitives:** Base UI (the actively-maintained, MUI-backed successor to Radix) or Radix UI. Skip Headless UI (Tailwind Labs' own primitive lib) for anything beyond a trivial project — the team is down to one engineer.
- **Styled base:** `shadcn/ui` initialized on Base UI, tokens re-themed (never the default zinc/slate) — `tweakcn.com` is a fast way to do this. Never ship Aceternity/Magic UI/Once UI as a base layer; their signature look (spotlight cards, shimmer buttons, gradient-border cards) is itself now the "obviously AI-built" tell. Pull one block from them surgically for a hero moment only if it earns its place.
- **Motion:** GSAP + ScrollTrigger + SplitText (fully free since 2025) for scroll-driven choreography and text reveals, paired with Lenis for smooth-scroll feel. Add Motion (`motion.dev`) for React component-level state/gesture/layout animation on top. Reach for Three.js/React Three Fiber only when the brief genuinely needs 3D/shader work, not as a default flourish.

### The invisible craft (Rauno / Emil bar — what great looks like up close)
The banlist above says what to avoid; this says what "feels right" is actually made of. These are the compounding micro-details that separate a great build from a merely clean one. Check each before calling any interactive build done.
- **Focus is designed, never default.** Every interactive element has a visible, deliberate focus ring (`:focus-visible`, not `:focus`), keyboard-navigable in logical order. A design that only works with a mouse is unfinished.
- **Every state exists and is styled.** hover, active, focus, disabled, loading, empty, and error are all present for every control and view. An empty state with a real message beats a blank panel; a loading state (skeleton or spinner) beats a layout jump.
- **Feedback is immediate and honest.** An action confirms within ~100ms (optimistic UI where safe); a status indicator reflects a real state, never a decorative dot. Disable-and-spin a button mid-submit so it can't double-fire.
- **Optical alignment over mathematical.** Trust the eye: nudge icons off geometric center, balance uneven glyphs, align to the visual edge not the bounding box. Consistent optical rhythm is what reads as "considered."
- **Edge cases handled invisibly.** Long strings truncate or wrap gracefully; numbers and dates are formatted; zero/one/many all read correctly; nothing overflows or reflows on real content. The user never sees the seam.
- **Respect the system.** Honor `prefers-reduced-motion` (kill non-essential motion), `prefers-color-scheme` if you ship both, and native focus/scroll behavior — don't fight the platform to look clever.

### Fit-to-viewport / dense cockpit layouts
- **Verify content visibility, not just page scroll.** "No scroll" means key content is visible at the target size, unclipped inside its panel. `scrollHeight == clientHeight` only proves the page element does not scroll; an internal panel can satisfy that while clipping or internally scrolling its own content. Assert that key elements are actually within the visible area of their panel.
- **Test at the smaller common desktop size (1440x900), not only the largest target.** Dense layouts look complete at 1600x1000 and degrade at 1440x900; the larger size masks density problems that bite at the common size.
- **Also verify at 375px width (mobile):** no overflow, no text truncation, no elements off-screen. Resize browser or use devtools device toggle.
- **Watch two clipping mechanisms in no-scroll grids:** (1) a greedy `auto` row in a grid starves an adjacent `minmax(0, 1fr)` content row, leaving it too short to show its content; use `minmax(0, auto)` or an explicit size for non-content rows. (2) `min-h-0` on a flex child collapses the reported height of a CSS `columns-2` multi-column container inside it, causing overlap and clip; remove `min-h-0` from any flex child that wraps a multi-column container, or restructure to avoid the conflict.
- **Verify declared motion against the actual rendered frames, not the coded intent.** A claimed effect (a raking light, a camera zoom, a subtle saturation shift) that doesn't visibly read in a screenshot is a fault, full stop — credit motion only for what's visible in the render, never for what the code says it should do.

## Visual sourcing
Where to pull a distinctive, branded look from (not generic AI-vibe-coded).
- **Clone a reference whole-page.** Beyond inspecting one treatment in devtools: find a reference site (dribbble.com, godly.website, awwwards.com), capture a full-page screenshot (F12 console, Cmd/Ctrl+Shift+P, "screenshot"), copy the computed CSS from Elements, then in a fresh session paste the CSS, drop in the screenshot, and clone it to close. Then layer the brand in (colors, logo, copy).
- **21st.dev for component-level polish.** Pull component-level inspiration (backgrounds, shaders, buttons, hero waves, mouse highlights) from [21st.dev](https://21st.dev): copy the component's prompt/code chunk and work it in behind or around the existing layout.
- **Aceternity UI for component-level polish.** [ui.aceternity.com/components](https://ui.aceternity.com/components) — free React/Next.js + Tailwind + Framer Motion component library: aurora/particle backgrounds, 3D hover cards, text-morph/typewriter effects, floating navs, globes/timelines. Same role as 21st.dev — pull the component, then re-skin it with the build's own palette rather than shipping it stock.

## Tools: animation & agent feedback
- **Agentation** ([agentation.com](https://agentation.com)) — desktop app that turns click-to-annotate UI feedback into structured context (CSS selectors, file paths, component hierarchy) for AI coding agents; MCP integration skips the copy-paste step. Built by Benji Taylor, Dennis Jin, Alex Vanderzon.
- **easing.dev** — visual reference for easing curves (in/out/in-out, quad through expo/circ). Use it to pick and name the actual curve instead of guessing a `cubic-bezier`.
- **Torph** ([torph.lochie.me](https://torph.lochie.me)) — dependency-free animated text-morph component (React/TS/Vue/Svelte) for smooth text-to-text transitions.
- **WebHaptics** ([haptics.lochie.me](https://haptics.lochie.me)) — haptic (vibration) feedback for the mobile web.
- **Framer Motion** — default animation library for polished sites; also what Aceternity's components are built on.
- **Paper Shaders** ([shaders.paper.design](https://shaders.paper.design), [GitHub](https://github.com/paper-design/shaders)) — Paper's zero-dependency canvas shader library, now fully open source (Apache 2.0). ~27 effects: gradients (mesh, static mesh, static radial, grain), dithering, halftone (dots, CMYK), dot orbit/grid, warp, spiral, swirl, waves, noise (neuro, Perlin, simplex), voronoi, metaballs, pulsing border, color panels, smoke ring, god rays; plus image filters (paper texture, fluted glass, water) and logo animation effects (liquid metal, gem smoke). Install `@paper-design/shaders-react` (React) or `@paper-design/shaders` (vanilla JS); each effect ships as a typed drop-in component/canvas (colors, distortion, speed, scale as props) — reach for this before hand-rolling GLSL for a hero/background treatment, and before copying a shader chunk off 21st.dev.

## Example
- **Task:** a landing page for a B2B analytics tool.
- **Refine:** asked 10+ questions; operator picks a dark editorial palette, serif display plus grotesk body, no top nav, a single primary CTA.
- **Look:** opened awwwards.com and Lusion, inspected one hero treatment in devtools.
- **Build:** custom palette in CSS, real product screenshots from the web, mock data with 8 populated rows and labeled chart axes, fonts verified rendering on the dev server before components.
- **Verify:** checked at 1440x900, not just the largest size, and confirmed key content sits unclipped inside each panel, not just that the page does not scroll.

## Definition of done (gate before you call it shipped)
Do not call a UI build done until all four pass:
1. **Refined + earned** — 10+ questions asked (palette, type, layout, signature element came from the operator, not a default); you can name the one specific mechanism that earns the look, not just the ingredient list (the ingredient trap).
2. **No tell shipped** — scanned against both ban sections, nothing matches; headline/body/labels/CTA free of the copy-side tells listed above.
3. **Invisible craft** — every state present and styled, focus visible and keyboard-navigable, feedback immediate, edge cases handled.
4. **Verified in frames** — checked at 1440x900 and 375px; key content unclipped inside its panel; declared motion actually reads in the render.

## Reference: the look (must look at before building)
- **awwwards.com** — daily-curated SOTD/SOTM winners; the broad calibration source.
- **dribbble.com** — [dribbble.com](https://dribbble.com/); designer-shot gallery for component- and treatment-level inspiration (heroes, cards, color/type pairings). Mine a shot for a specific idea, then rebuild it in the brand's own palette rather than copying stock.
- **Lusion** — `lusion.co`. WebGL-heavy, immersive interactive product sites.
- **North Kingdom** — `northkingdom.com`. Stockholm studio; brand-led storytelling, polished interaction design.
- **Benji Taylor** — `benji.org`. Design lead at SpaceX (X + SpaceXAI), founder of Los Feliz Engineering (built Honk and the Family crypto wallet, acquired by Aave Labs), co-founder of Dip. `benji.org/family-values` is a case study on Family's design philosophy — simplicity via progressive disclosure, fluidity via a contextual "tray system," delight via text morphing/particles/sound — worth studying whole.
- **Los Feliz Engineering** — `siteinspire.com/website/11302-loz-feliz-engineering`. Benji's former studio; SiteInspire-featured for bold, intentional typography-led web design.
- **Lochie Axon** — `lochieaxon.com`. Design engineer (Aave, Family, Honk, Avara); motion- and haptics-focused experimental work.
- **Rasmus Samuelsson** — `rsms.me`. Created the Inter typeface; SF-based engineer-designer.

Do not anchor on a fixed house style. Before building, always ask the operator 10 or more refining questions about detail, style, vibe, palette, typography, layout, motion, and any signature element, then let those answers drive the look so each build diverges instead of converging on one template.

If any URL 404s, find the current portfolio via search; do not invent a replacement.

**People to learn from:**
- **Rauno Freiberg** (Vercel) — `interfaces.rauno.me`: the invisible interaction details (focus rings, optimistic UI, scroll restoration) named and made checkable.
- **Emil Kowalski** (Linear) — the restraint discipline: keep feedback animation under ~300ms; the hard skill is deciding what *not* to animate.
- **shadcn** (Vercel) — "open code, beautiful defaults": own the component source, don't inherit someone else's unedited look.

## Reference: single-file gift websites
Self-contained HTML, all CSS/JS inline, CDN fonts only. Good interactives: confetti, sparkle cursor, floating particles, tap-to-reveal cards.
