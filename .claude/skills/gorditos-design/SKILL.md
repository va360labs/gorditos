---
name: gorditos-design
description: Use this skill to generate well-branded interfaces and assets for GorditOS, either for production or throwaway prototypes/mocks/etc. Contains essential design guidelines, colors, type, fonts, assets, and UI kit components for prototyping.
user-invocable: true
---

The GorditOS design system lives in `doc/design/design-system/` (Claude Design
handoff bundle). Read `doc/design/design-system/project/readme.md` first, then
explore tokens, components, guidelines and the `ui_kits/gorditos_app/` screens.

GorditOS is a Spanish-language mobile habit-tracking app (Flutter) built on one
rule: **motivar, nunca presionar**. There is no weight, no calories, no macros,
no rankings — ever. The emotional core is the "jardín de hábitos" (active day =
plant grows; empty day = soil, never a wilted plant) and the warm mascot/copilot
**Gordi**.

**Flutter implementation (production code, already in this repo):**
- Tokens & themes: `lib/core/theme/` (GordiColors, GordiType, GordiSpacing,
  GordiRadii/GordiShadows, GordiMotion, AppTheme.light/dark).
- Widgets: `lib/core/widgets/` (GordiButton, GordiIconButton, GordiBadge,
  GordiChip, GordiCard, GordiAvatar, GordiInput, GordiSwitch,
  GordiSegmentedControl, GordiBubble, GordiProgressRing, HabitTile,
  GardenGrid, GordiBottomNav).
- Assets: `assets/brand/` (gordi.svg, app-icon.svg — placeholders).
- Living gallery: `lib/main.dart` (DesignGalleryPage).

When building new screens: compose the existing widgets, author against the
semantic tokens (never raw hex), keep copy in es-ES under the forbidden
glossary (no peso/calorías/rachas rotas), pending states neutral (never red),
and use emoji as iconography. Above all: never ship copy or UI that could
create anxiety, guilt or pressure — it's the brand's North Star.
