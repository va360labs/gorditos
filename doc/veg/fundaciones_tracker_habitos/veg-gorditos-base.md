# VEG: GorditOS — Base (uniforme)

> Feature: fundaciones_tracker_habitos (US-01 + US-02) — sirve como VEG base del proyecto
> Modo: 1 — Uniforme (1 solo target primario, ICP-1)
> Arquetipo base: **Consumer cálido** (consumer wellness, anti-"fitness agresivo")
> Generado: 2026-06-10 por /plan desde `doc/app/app_spec.md` zona `brand_visual` + PRD §7
> ✅ ACTUALIZADO 2026-06-10: los tokens provisionales quedan SUPERSEDIDOS por el
> design system canónico `doc/design/design-system/` ("warm paper + growing
> garden"): primary verde `#2F9E66`, secondary apricot `#F2A24E`, tertiary sky
> `#57B0CF`, fondo crema `#FBF4E9`, tipografía Baloo 2 + Nunito + DM Mono,
> radius 20/14/píldora, sombras cálidas. Los pilares de motion y diseño de este
> VEG siguen vigentes y coinciden con el DS (springy suave, spacious,
> pendientes neutros). Implementación Flutter: `lib/core/theme/` + `lib/core/widgets/`.

## Contexto del Target

- **Quién**: adultos 25-55 ES/LATAM, principiantes o sedentarios, nivel técnico medio-bajo. Abandonaron apps de fitness por presión.
- **JTBD emocional**: "Sentirme acompañado y celebrado, nunca juzgado ni medido. Volver tras días de ausencia sin culpa."
- **Referentes visuales**: Finch (mascota que crece contigo), Duolingo (celebración, sin su agresividad de rachas), Headspace (calma cálida).
- **Tolerancia visual**: cálida e ilustrada — espera suavidad y simpatía, NO minimalismo frío ni estética gym (negro/neón/músculos).
- **Plataforma primaria**: mobile only (Flutter iOS+Android). Sesiones ultracortas (<1 min) varias veces al día.

## Pilar 1: Imágenes

| Campo | Valor |
|-------|-------|
| Tipo | illustration_flat con volumen suave (estilo redondito, sin fotografía) |
| Mood | playful + calm — humor amable, jamás burla ni gordofobia |
| Paleta | naranja melocotón `#FF9E6D`, verde menta `#7FD8BE`, crema `#FFF6EC`, acentos coral suave `#F2766B` (solo errores de form) |
| Sujetos | **Gordi** (mascota redondita expresiva) + plantas/flores del jardín. Nunca cuerpos humanos idealizados, básculas, cintas métricas |

### Cuándo usar imágenes

| Sí usar | No usar |
|---------|---------|
| Estados vacíos (Gordi amable + CTA) | Formularios (login/registro) |
| Celebraciones (confeti, Gordi contento) | Listados de hábitos (solo iconos/emoji) |
| Onboarding (Sprint 5) | Pantallas de gestión |

### Prompts de imagen (placeholders en esta US)

| Sección | Tipo | Prompt base |
|---------|------|-------------|
| Empty state Hoy `[IMAGE: gordi-empty]` | illustration_flat | "Cute round orange mascot character, soft flat illustration with subtle volume, friendly smile, waving, cream background #FFF6EC, peach and mint palette, rounded shapes, no text, 1:1" |
| Header login `[IMAGE: gordi-hello]` | illustration_flat | "Cute round orange mascot peeking from bottom edge, soft flat illustration, warm cream background, minimal, friendly, no text, 16:9" |

**Coste estimado**: 2 imágenes × ~0,02-0,19 € = 0,04-0,38 € — muy por debajo del presupuesto (5 €/feature). En /implement se puede elegir `skip` y dejar solo placeholders.

## Pilar 2: Motion

| Campo | Valor |
|-------|-------|
| Nivel | `moderate` — expresivo SOLO en celebraciones; sutil en todo lo demás |
| Personalidad | suave, mullido, "squishy". Las animaciones celebran, nunca urgen |

| Tipo | Animación | Duración | Easing | Uso |
|------|-----------|----------|--------|-----|
| `page_enter` | fade-in + slide-up 12px | 280ms | emphasized decelerate | entrada de pantallas |
| `tap_check` | scale 1.0→0.9→1.05→1.0 (squish) | 350ms | spring suave | marcar hábito (1 tap) |
| `celebration` | confeti + Gordi bounce | ≤1500ms | spring(damping=12) | hábito completado (AC-17) |
| `tab_transition` | fade + slide-x 16px | 220ms | emphasized | cambio de bottom tab |
| `loading` | shimmer skeleton cálido (crema→blanco) | loop 1300ms | linear | carga de Hoy (AC-18) |
| `feedback_error` | shake X suave 2x + borde coral | 250ms | ease-in-out | validación de formularios (única aparición del coral) |

**Reglas**: respetar `prefers-reduced-motion` (mantener solo skeleton); animar solo `transform`/`opacity`; nada de parpadeos ni badges urgentes — política anti-ansiedad.

## Pilar 3: Diseño (directivas para Stitch / mockups)

| Campo | Valor |
|-------|-------|
| Densidad | `spacious` — pocas cosas por pantalla, táctil y respirable |
| Whitespace | `generous` — 24px entre cards, 32-40px entre secciones |
| Jerarquía | card-based con radius alto (20-24px), sombras muy suaves |
| CTA prominence | `medium-high` — botón primario melocotón, redondeado píldora |
| Tipografía | display redondeada (Baloo 2 / Quicksand provisional), body legible (Nunito provisional), line-height 1.5; escalable (a11y) |
| Datos | sin tablas; chips y cards. Estados pendientes SIEMPRE neutros (crema/gris cálido) — prohibido rojo en pendientes (AC-17) |
| Accesibilidad | contraste AA, touch targets ≥48px (supera los 44pt del PRD), labels semánticos |

## Form Factor

- **Mobile only** (390px diseño base): 1 columna, bottom NavigationBar 5 tabs (Material 3, indicator píldora menta), dialogs como bottom sheets redondeados arriba (radius 28px), formularios full-width.
- Modo claro y oscuro desde Sprint 0; el oscuro es cálido (marrón-gris `#2A2522`, nunca negro puro).

## Resumen para inyección en sub-agentes (~350 tokens)

```
VEG [uniforme] GorditOS — Consumer cálido, mobile-only Flutter, light+dark.

Audience: adultos 25-55 ES/LATAM empezando de cero; JTBD emocional "acompañado y celebrado, nunca juzgado". Anti-estética gym. Referentes: Finch, Duolingo (sin presión), Headspace.

Images: illustration_flat redondita (mascota Gordi + plantas). Solo empty states, celebraciones y onboarding; nunca en forms/listados. Jamás cuerpos idealizados, básculas, métricas corporales.

Motion: moderate. page_enter fade+slide-up 12px 280ms. tap_check squish-spring 350ms. celebration confeti+bounce ≤1500ms (única animación expresiva). tabs fade+slide-x 220ms. loading shimmer cálido 1300ms. error shake suave 250ms (único uso de coral). prefers-reduced-motion respetado. Nada urgente/parpadeante (política anti-ansiedad).

Design: density spacious, whitespace generous (24px cards, 32-40px secciones), card-based radius 20-24px, CTA medium-high píldora melocotón. Pendientes SIEMPRE neutros — prohibido rojo/warning en hábitos no completados. Sin tablas. Touch ≥48px, contraste AA, fuentes escalables.

Tokens provisionales (hasta /visual-setup): primary #FF9E6D (melocotón), secondary #7FD8BE (menta), bg #FFF6EC (crema), surface #FFFFFF, text #3D3A36 / #8A847C, error-form #F2766B (solo forms), dark mode cálido #2A2522. Display Baloo 2 / body Nunito (provisionales). Copys es-ES sujetos a glosario prohibido (sin peso/dieta/racha perdida).
```

## Referencias cruzadas

| Archivo | Contiene |
|---------|----------|
| `doc/app/app_spec.md` zona `brand_visual` | Identidad canónica (fuente de este VEG) |
| `docs/PRD-GorditOS.md` §7 + §9.1 | UX, paleta sugerida, glosario prohibido |
| `doc/prd/PRD_fundaciones_tracker_habitos.md` | Audiencia + interacciones UI |
| `doc/design/DESIGN.md` | ⚠️ NO existe aún — se materializa en `/visual-setup` |
