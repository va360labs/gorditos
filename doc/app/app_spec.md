# App Spec — gorditos

**Última actualización:** 2026-06-10T00:00:00Z
**Versión del documento:** 1
**Mantenido por:** /app-init (idempotente) y eventos del pipeline

> Documento canónico técnico derivado del PRD original
> [docs/PRD-GorditOS.md](../../docs/PRD-GorditOS.md) §6 (arquitectura), §7 (UX)
> y §9 (guardarraíles).

---

<!-- @specbox:zone start kind="auto" id="stack" auto_sync_on="lockfile_change,framework_detected,release_version_bump" -->
## 1. Stack

| Capa | Tecnología | Versión | Notas |
|------|------------|---------|-------|
| App móvil | **Flutter (Dart)** | última stable | Un código iOS+Android; UI expresiva para animaciones de Gordi |
| Gestión de estado | **Riverpod** | latest | Testeable, integra con streams de Supabase |
| Backend (BaaS) | **Supabase** | cloud | PostgreSQL + Auth + Realtime + Storage + Edge Functions |
| Base de datos | PostgreSQL (Supabase) con **RLS obligatorio** | 15+ | Política `user_id = auth.uid()` en todas las tablas; catálogos read-only autenticados |
| Lógica de servidor | Supabase **Edge Functions** (Deno/TypeScript) | — | Proxy a Claude API, tips, recomendaciones; API key solo en secrets |
| Jobs programados | Supabase Cron (pg_cron) + Edge Functions | — | Tip diario, mensajes de vuelta amable |
| IA | **Claude API** — claude-sonnet-4-6 (chat) / claude-haiku-4-5 (tips batch) | — | Vía Edge Functions, streaming SSE; nunca desde la app |
| Auth | Supabase Auth (email + Apple/Google Sign-In) | — | Apple Sign-In obligatorio en iOS si hay login social |
| Notificaciones | FCM + flutter_local_notifications | latest | Política anti-ansiedad (PRD §8); opt-in granular |
| Salud | Paquete `health` (pub.dev) | latest | HealthKit/Health Connect; **solo lectura de STEPS, jamás peso** |
| Analítica | PostHog (SDK Flutter) | latest | Privacy-friendly |
| Storage | Supabase Storage | — | Fotos de recetas, assets de Gordi |

> Lockfiles detectados (2026-06-10): `pubspec.yaml` (Flutter 3.41.5 / Dart
> 3.11.3; deps: flutter_svg, google_fonts; dev: flutter_lints). Proyecto
> Flutter creado con org `com.va360labs`, plataformas android+ios. Pendiente:
> `supabase/` con migraciones (UC-002).
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="auto" id="tracking_backend" auto_sync_on="set_auth_token" -->
## 2. Tracking backend

- **Tipo:** freeform
- **Path absoluto:** `d:\aa_projects\gorditos\doc\tracking`
- **Reporting externo:** no — producto propio VA360, sin board público.
- **MCP del engine cableado en este proyecto:** **no** (tools `set_auth_token` /
  `setup_board` / `list_us` no registradas en esta sesión). `setup_board`
  emulado por escritura directa de `config.json` + `items.json` + `labels.json`
  mientras no se cablee el MCP.

> Esta zona la mantiene el engine. Si el usuario cambia el backend, llamar
> `/app-init --refresh` o esperar al evento set_auth_token.
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="manual" id="brand_visual" -->
## 3. Brand & Visual

- **Design system canónico (2026-06-10):** `doc/design/design-system/` —
  bundle de Claude Design entregado por el usuario. Identidad **"warm paper +
  growing garden"**. Skill: `.claude/skills/gorditos-design/`.
- **Paleta definitiva:** verde crecimiento `#2F9E66` (primary), apricot
  `#F2A24E` (celebración/secondary), sky `#57B0CF` (calma/tertiary), crema
  papel `#FBF4E9` (fondo), berry/clay como acentos. **Sin rojo de error duro**
  — el negativo más fuerte es clay suave. Colores por hábito (agua/ejercicio/
  comida/sueño/calma/pasos).
- **Tipografía:** Baloo 2 (display, voz de Gordi) + Nunito (UI/body) + DM Mono
  (acento "OS", chips de stats). Sustituciones de Google Fonts, pendiente
  binarios licenciados.
- **Radius:** cards 20px, controles 14px, botones/chips píldora. **Sombras:**
  cálidas tintadas de marrón, nunca grises. **Motion:** springy suave
  (overshoot 140/240/420ms), press scale 0.96.
- **Iconografía:** emoji como sistema primario (decisión de marca).
- **Mascota Gordi:** `assets/brand/gordi.svg` — ⚠️ placeholder geométrico;
  pendiente arte ilustrado final (poses resting/waving/celebrating).
- **Implementación Flutter:** tokens en `lib/core/theme/`, 14 widgets en
  `lib/core/widgets/`, galería viva en `lib/main.dart`. Dark mode = derivación
  cálida propuesta (el DS es light-only).
- **Navegación:** 5 bottom tabs — ☀️ Hoy · 🥗 Cocina · 🤸 Muévete · 💬 Gordi ·
  🌱 Mi jardín.
- **Accesibilidad:** fuentes escalables, contraste AA, targets ≥44px.
- **Stitch:** no necesario para US-01/US-02 — los diseños canónicos vienen del
  bundle (`ui_kits/gorditos_app/`).
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="manual" id="conventions" -->
## 4. Convenciones del proyecto

- **Naming:** US-XX, UC-XXX, AC-XX *(estándar SpecBox)*.
- **Idiomas:** código e identificadores técnicos en **inglés**; copy del
  producto en **es-ES** (mercado España + LATAM), sujeto al glosario de
  lenguaje (PRD §9.1: prohibido peso/dieta/quemar/fallar/racha perdida…).
- **Estructura Flutter:** feature-first (`lib/features/<feature>/`), Riverpod
  para estado, theming claro/oscuro desde Sprint 0.
- **Backend:** migraciones SQL versionadas vía Supabase CLI (`supabase/
  migrations/`), RLS desde el día uno; Edge Functions en `supabase/functions/`.
- **Tests:** `flutter analyze` + `flutter test` (unit/widget) en CI básico;
  tests de políticas RLS (leer datos de otro usuario debe fallar); **test
  automatizado de copys contra la lista negra del glosario**; batería
  adversarial para el chat de Gordi.
- **Lint:** `flutter_lints` estricto.
- **Deployment:** stores móviles (iOS + Android). Sin versión web en MVP.
- **Multirepo:** no — monorepo único (app Flutter + `supabase/`).
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="auto" id="autopilot" auto_sync_on="autopilot_config_change" -->
## 5. Autopilot

- **Level:** equilibrado
- **Image budget €/feature:** 5
- **Auto-confirm overrides:** []
- **Always-ask overrides:** []
- **Queue enabled:** false

> Esta zona se sincroniza automáticamente desde `.claude/settings.local.json`.
> Para cambiar la política, edita ese archivo y `/app-sync --refresh`.
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="hybrid" id="canonical_decisions" merge="append_only" -->
## 6. Decisiones canónicas

- **Cero peso como constraint de datos (2026-06-10, PRD §3.1):** no existen
  columnas de peso, altura ni medidas corporales en ninguna tabla. No es solo
  UX: es un invariante del esquema, verificable en revisión de migraciones.
- **Cero culpa como constraint de mecánicas (PRD §3.2):** no hay rachas
  rompibles; la constancia se modela como acumulado ("días activos este mes",
  "tu mejor mes") y nunca decrece ni se señala en rojo.
- **Seguridad de la IA (PRD §6.4):** la API key de Claude vive exclusivamente
  en secrets de Supabase Edge Functions; la app móvil jamás llama a Anthropic
  directamente. System prompt de Gordi con guardarraíles obligatorios (PRD
  §9.2) y resistencia a prompt injection.
- **RLS 100 % (PRD §6.2):** toda tabla de usuario con política
  `user_id = auth.uid()`; catálogos (rutinas, recetas) read-only para
  autenticados. Testeado, no solo declarado.
- **Acceso a datos (PRD §6.4):** CRUD directo vía SDK `supabase_flutter`
  (protegido por RLS); Edge Functions solo para lógica que no puede vivir en
  cliente (gordi-chat, daily-tips, workout-recommend, comeback-message,
  shopping-list); RPC SQL para agregados (habit_garden_summary,
  unlock_achievements).
- **Notificaciones opt-in (PRD §8):** máx. 2/día, granulares, jamás de culpa,
  urgencia o FOMO.
- **No es consejo médico (PRD §3.5, §9.3):** "ideas de menús", nunca "dieta";
  disclaimers visibles en onboarding y sección de menús; derivación cariñosa a
  profesionales colegiados.
- **Backend tracking SpecBox (2026-06-10):** FreeForm bajo `doc/tracking/`,
  sin reporting externo. Trazabilidad por git.

<!-- engine-entries-below -->
{(vacío hasta que la Capa 4 detecte 3 confirmaciones consecutivas idénticas)}
<!-- @specbox:zone end -->
