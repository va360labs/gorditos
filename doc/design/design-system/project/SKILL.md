---
name: gorditos-design
description: Use this skill to generate well-branded interfaces and assets for GorditOS, either for production or throwaway prototypes/mocks/etc. Contains essential design guidelines, colors, type, fonts, assets, and UI kit components for prototyping.
user-invocable: true
---

Read the `readme.md` file within this skill, and explore the other available files.

GorditOS is a Spanish-language mobile habit-tracking app (Flutter) built on one
rule: **motivar, nunca presionar**. There is no weight, no calories, no macros,
no rankings — ever. The emotional core is the "jardín de hábitos" (active day =
plant grows; empty day = soil, never a wilted plant) and the warm mascot/copilot
**Gordi**.

Key files:
- `readme.md` — full design guide: product context, voice & tone (Spanish, *tú*,
  warm, gentle humor), visual foundations, iconography, and a manifest.
- `styles.css` — the one stylesheet to link; pulls in all tokens + component CSS.
- `tokens/` — colors, typography, spacing, radii/shadows/motion.
- `components/` — React primitives (Button, Card, Badge, Chip, Input, Switch,
  SegmentedControl, GordiBubble, ProgressRing, HabitTile, GardenGrid, BottomNav).
- `ui_kits/gorditos_app/` — interactive app recreation to copy patterns from.
- `assets/` — Gordi mascot + app icon (placeholders — flag if used in final work).

If creating visual artifacts (slides, mocks, throwaway prototypes, etc), copy
assets out and create static HTML files for the user to view. If working on
production code, copy assets and read the rules here to become an expert in
designing with this brand.

If the user invokes this skill without other guidance, ask them what they want to
build or design, ask a few questions, and act as an expert designer who outputs
HTML artifacts _or_ production code, depending on the need. Above all: never ship
copy or UI that could create anxiety, guilt or pressure — it's the brand's North
Star.
