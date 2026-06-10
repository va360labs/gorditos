# GorditOS — Design System

> **GorditOS** (*Gorditos* + *OS*) is a Spanish-language (Spain + LATAM) **mobile
> habit-tracking app** built on one non-negotiable principle: **motivar, nunca
> presionar** (motivate, never pressure). Built in Flutter by VA360 LABS S.L.

This repository is the brand + product design system: design tokens, foundation
specimens, reusable React components, and an interactive recreation of the app.

---

## 1. Product context

GorditOS helps people build healthy habits and feel better — **weight, calories,
macros, BMI and body photos do not exist anywhere in the product** (not on
screens, not in the database). Its emotional core is a **"jardín de hábitos"**
(habit garden): every active day grows a plant; an empty/missed day is just
*soil* (tierra) — **never a wilted or dead plant**. There are no streaks that
"break", no rankings, no guilt.

The user's guide and companion is **Gordi** — a warm, lightly-humorous mascot /
copilot (powered by Claude) that motivates, celebrates and never judges.

**Core surfaces (MVP):** kind onboarding · 1-tap habit tracker · no-gym home
workouts · adaptive daily steps · Gordi (AI motivation chat + daily tip + kind
"comeback" messages) · food ideas (no diets) · meal planner & recipes · gentle
celebrations/gamification.

**Audience:** ICP-1 — adults 25-55 starting from zero, sedentary or beginner, no
gym, who have abandoned other apps because of pressure. Anti-persona: athletes
chasing performance metrics; strict calorie/macro counters.

### Sources
- `uploads/app_prd.md` — the canonical App PRD (v1), derived from
  `docs/PRD-GorditOS.md` (v1.0). **The only source provided.**
- **No codebase, Figma file, or existing brand assets were supplied.** The entire
  visual identity in this system was therefore *defined from the PRD's tone and
  product constraints* — see Caveats at the bottom.

---

## 2. Content fundamentals (voice & tone)

The product's North Star governs every word: *"Si una funcionalidad puede generar
ansiedad, culpa o presión, no entra en el producto."*

- **Language:** Spanish (Spain + LATAM neutral). Address the user as **tú**
  (informal, close), never *usted*.
- **Tone:** warm, close, encouraging, with **gentle humor** — a friend/copilot,
  not a coach or a clinician. Gordi speaks in the first person and is playful but
  never silly to the point of undermining trust.
- **Casing:** sentence case everywhere. The only "shouty" element is the mono
  **OS** in the wordmark and small mono labels.
- **Emoji:** used, but **sparingly and warmly** — mostly 🌱 (growth), 💧, 🥗, 🧘,
  💚. They reinforce the garden/health metaphor; never decorative spam.
- **Numbers:** framed as **constancy, not performance** — "12 días activos este
  mes", "tu mejor mes". Never streaks, never "you failed to…".

**Examples — SÍ decimos / NUNCA decimos:**

| ✓ Sí | ✕ Nunca |
|---|---|
| "Aquí no se pierde nada, se retoma." | "Has roto tu racha." |
| "¿Empezamos suave hoy?" | "No llegaste a los 10.000 pasos." |
| "18 días activos este mes 🌱" | "Llevas 3 días sin entrenar." |
| "Hoy no puedo con todo" (→ ofrece 5 min) | calorías · peso · IMC · ranking |

Forbidden glossary (PRD §9.1, enforced by automated copy tests): *peso, calorías,
macros, IMC, racha rota, dieta estricta, ranking, "deberías"*.

---

## 3. Visual foundations

**Aesthetic:** *"warm paper + growing garden."* Cozy, optimistic, tactile — the
opposite of a clinical fitness tracker.

- **Backgrounds:** warm **cream paper** (`--sand-100`), never stark white or cool
  gray. Flat color fields — **no busy gradients**. The one allowed gradient is a
  subtle vertical green on the app icon. Surfaces are rounded "paper" cards.
- **Color:** a tight, warm palette — **green** primary (growth/garden), **apricot**
  secondary (celebration/food/joy), **sky** tertiary (calm/sleep/hydration), with
  **berry** and **clay** as sparing accents. Per-habit colors (agua, ejercicio,
  comida, sueño, calma, pasos) thread through the whole app. **No harsh error
  red** — the strongest negative is soft clay, used only for gentle attention.
- **Type:** rounded but mature. **Baloo 2** for display/headings & Gordi's voice;
  **Nunito** for UI/body (excellent Spanish legibility); **DM Mono** for the "OS"
  accent, stat chips and system labels. Sentence case; generous sizes (body 16px+).
- **Spacing:** 4px base grid. 20px screen gutters. **44px minimum tap target.**
- **Corners:** generous, friendly rounding — cards = 20px (`--radius-lg`), tiles
  & controls = 14px, buttons/chips/bubbles = pill.
- **Shadows:** soft, **warm brown-tinted**, diffuse (never cold/gray). Celebration
  & active states get a colored glow (`--shadow-brand`, `--shadow-apricot`).
- **Cards:** rounded paper on cream — soft shadow (default), hairline border
  (flat), or tinted green (info/Gordi panels). No colored-left-border cards.
- **Borders:** hairlines in warm sand (`--border-soft`); brand borders in soft
  green.
- **Animation:** soft and **springy** — gentle overshoot (`--ease-soft`) on press
  and check-in, fades + small scale for entrances. Press = scale down ~0.96.
  **No abrupt motion, no infinite looping on content.** Confetti only on genuine
  celebrations.
- **Hover/press:** hover = slightly darker brand color or a soft tint; press =
  shrink (`scale(0.96)`). Focus = a soft green ring (`--focus-ring`), never harsh.
- **Transparency/blur:** minimal. The app is opaque, warm and grounded; the iOS
  frame supplies any glass chrome.
- **Imagery vibe:** warm, bright, friendly — home cooking, gentle home movement,
  plants. No gym-bro, no "before/after", no bodies-as-objects.

See the **Design System** tab for live specimen cards of every foundation.

---

## 4. Iconography

- **Approach:** GorditOS uses **emoji as its primary iconography** — a deliberate
  brand choice. They are warm, universally legible, render natively in Flutter,
  and match the friendly, non-clinical tone (💧 agua, 🤸 ejercicio, 🥗 comida,
  🧘 calma, 🌱 garden/growth, ☀️ Hoy, 💬 Gordi). Used sparingly and consistently
  per concept, never as decorative filler.
- **Mascot:** **Gordi** (`assets/gordi.svg`) — a round, happy sprout-character.
  ⚠️ This is a **placeholder built from basic shapes**; it should be replaced with
  finished illustrated character art (resting / waving / celebrating poses).
- **Logo / app icon:** `assets/app-icon.svg` (rounded-square, Gordi on green).
  Wordmark = "Gordit" in Baloo 2 + tracked-out mono **OS** in green.
- **No icon font / SVG sprite** is shipped, because emoji cover the need. If a
  future surface needs line icons, adopt a single rounded set (e.g. Lucide via
  CDN) at consistent stroke weight and document it here.

---

## 5. Index / manifest

**Root**
- `styles.css` — the single entry point consumers link (imports only).
- `components.css` — shipped component styles (`gds-*` classes).
- `readme.md` — this guide. · `SKILL.md` — Agent-Skill wrapper.

**`tokens/`** — `fonts.css`, `colors.css`, `typography.css`, `spacing.css`,
`radii.css` (radii + shadows + motion), `base.css` (element defaults).

**`assets/`** — `gordi.svg` (mascot, placeholder), `app-icon.svg`.

**`guidelines/`** — foundation specimen cards (Colors, Type, Spacing, Brand).

**`components/`** — reusable React primitives:
- `core/` — **Button, IconButton, Badge, Chip, Card, Avatar**
- `forms/` — **Input, Switch, SegmentedControl**
- `feedback/` — **GordiBubble, ProgressRing**
- `app/` — **HabitTile, GardenGrid, BottomNav** (product-specific)

**`ui_kits/gorditos_app/`** — interactive recreation of the app (Onboarding →
Hoy → Jardín → Gordi → Cocina) inside an iPhone frame. See its `README.md`.

Namespace for cards: `window.GorditOSDesignSystem_613d73`.

---

## 6. Caveats

- **No real brand assets were provided.** Fonts (Baloo 2 / Nunito / DM Mono),
  the full color palette, the Gordi mascot and the app icon are all *proposals*
  derived from the PRD — see the bold ask at the end of the build.
- Fonts load from **Google Fonts** (substitutions), so the compiler reports
  0 self-hosted `@font-face` webfonts. Provide licensed binaries to self-host.
- **Gordi is a placeholder illustration** built from primitive shapes.
