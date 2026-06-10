# Plan: US-01 — Fundaciones (Sprint 0)

> Generado: 2026-06-10
> Origen: US-01 (FreeForm `ff-gorditos-mvp01`, modo emulado) · PRD: [PRD_fundaciones_tracker_habitos.md](../prd/PRD_fundaciones_tracker_habitos.md)
> Estado: En progreso — design system implementado (2026-06-10)
> **stitch_designs: MANUAL** — diseños canónicos provistos por el usuario vía
> bundle de Claude Design en `doc/design/design-system/` (tokens + 13 componentes
> + UI kit Onboarding→Hoy→Jardín→Gordi→Cocina). Stitch no es necesario para esta US.

---

## Resumen

Levantar la base del MVP: app Flutter (feature-first + Riverpod + theming cálido
claro/oscuro + shell de 5 tabs), backend Supabase con `profiles` y RLS testeado,
autenticación (email + Google/Apple) y CI con las dos guardas de producto
innegociables (anti-peso en migraciones, copy-lint del glosario).

Cubre UC-001 (8h), UC-002 (6h), UC-003 (10h), UC-004 (4h) — 28h estimadas, AC-01…AC-10.

## Análisis UI (Fase 0)

Proyecto greenfield: no existe biblioteca de widgets → se crea `lib/core/widgets/`.
Skills locales a usar: `flutter-apply-architecture-best-practices` (capas UI/Logic/Data)
y `flutter-build-responsive-layout` (adaptación de tamaños).

### Componentes Requeridos

| Requisito | Componente | Existe | Acción |
|-----------|------------|--------|--------|
| Shell con 5 tabs | `GorditosShell` (NavigationBar M3) | ❌ | CREAR |
| Pantallas placeholder por tab | `PlaceholderScreen` | ❌ | CREAR |
| Botón primario píldora | `GordiButton` | ❌ | CREAR |
| Campo de texto con validación | `GordiTextField` | ❌ | CREAR |
| Botones sociales (Google/Apple) | `SocialSignInButton` | ❌ | CREAR |
| Loading cálido | `GordiSkeleton` (shimmer crema) | ❌ | CREAR |
| Feedback transitorio | `GordiSnackBar` helper | ❌ | CREAR |

### Widgets a Crear (specs)

1. **GorditosShell** (`lib/core/widgets/navigation/gorditos_shell.dart`) — NavigationBar Material 3, 5 destinos (Hoy 🏠, Cocina 🥗, Muévete 🏃, Gordi 💬, Mi jardín 🌱), indicator píldora menta, conserva estado por tab (IndexedStack/StatefulShellRoute). Criterio: navegación primaria, uso constante (AC-01).
2. **GordiButton** (`buttons/gordi_button.dart`) — variantes primary (melocotón)/secondary (outline menta), radius píldora, altura ≥48px, estado loading embebido.
3. **GordiTextField** (`inputs/gordi_text_field.dart`) — label flotante, error inline coral SOLO en validación de forms, radius 16px.
4. **SocialSignInButton** (`buttons/social_sign_in_button.dart`) — Google/Apple según plataforma; Apple visible siempre en iOS si hay social (AC-07).
5. **GordiSkeleton** (`feedback/gordi_skeleton.dart`) — shimmer crema→blanco 1300ms.
6. **GordiSnackBar** (`feedback/gordi_snack_bar.dart`) — éxito (menta)/info; copys pasan el glosario.

---

## Visual Experience Generation

**Modo**: 1 — Uniforme · **Justificación**: 1 solo target primario (ICP-1); identidad heredada de `app_spec.md` zona `brand_visual`.

| Target/ICP | Archivo | Modo |
|------------|---------|------|
| Adulto que empieza de cero (ICP-1) | [doc/veg/fundaciones_tracker_habitos/veg-gorditos-base.md](../veg/fundaciones_tracker_habitos/veg-gorditos-base.md) | 1-Uniforme |

**VEG activo para Stitch**: el único (base del proyecto). Tokens provisionales hasta `/visual-setup`.
**Resumen compacto para sub-agentes**: ver bloque "Resumen para inyección" del VEG (≈350 tokens).
ℹ️ VEG auto-confirmado (autopilot: equilibrado, derivación canónica, score 0,9). Coste imágenes estimado: 0,04-0,38 € (2 ilustraciones placeholder) ≤ presupuesto 5 €.

---

## Fases de Implementación

### Fase 1: Bootstrap del proyecto (UC-001 parcial) — ~90 min
- [ ] `flutter create` (org `com.va360labs.gorditos`), limpiar plantilla.
- [ ] `pubspec.yaml`: flutter_riverpod, go_router, supabase_flutter, google_sign_in, sign_in_with_apple, flutter_lints (estricto), flutter_dotenv o `--dart-define` para keys públicas.
- [ ] Estructura feature-first: `lib/core/{theme,router,supabase,widgets}/`, `lib/features/{auth,home_shell,habits,garden}/` (habits/garden vacíos, llegan en US-02).
- [ ] `analysis_options.yaml` estricto → base de AC-03.

### Fase 2: Theming + Shell (UC-001) — ~3h
- [ ] `core/theme/tokens.dart` (paleta VEG provisional) + `app_theme.dart` con ThemeData light/dark cálido, radius alto, tipografía redondeada (google_fonts) → AC-02.
- [ ] `GorditosShell` + 5 placeholders + go_router con StatefulShellRoute → AC-01.
- [ ] Widget tests: navegación 5 tabs, render light+dark sin overflow → AC-01, AC-02.

### Fase 3: Backend Supabase (UC-002) — ~2h 30m
- [ ] `supabase init` + proyecto cloud + `supabase/migrations/0001_profiles.sql`: tabla, RLS (`auth.uid() = id`), trigger `handle_new_user` → AC-04, AC-06 (parte servidor).
- [ ] Script `tool/schema_guard.{ps1,sh}`: escanea migraciones contra lista negra corporal (word-boundaries) → AC-04.
- [ ] Test de aislamiento RLS (2 usuarios, vía supabase test o script dart de integración) → AC-05.

### Fase 4: Autenticación (UC-003) — ~4h
- [ ] `auth_repository` + providers Riverpod (authStateProvider) sobre supabase_flutter.
- [ ] Pantallas Login/Registro con `GordiTextField`/`GordiButton`/`SocialSignInButton`, validación inline, copys es-ES del glosario → AC-06.
- [ ] Google Sign-In (Android) + Apple Sign-In (iOS) + widget test condicional de visibilidad del botón Apple → AC-07.
- [ ] Redirect guards en router (sin sesión → login; con sesión → Hoy) + logout que limpia sesión → AC-06, AC-08.
- [ ] Tests: integración login/logout (mock/supabase local), widget tests de validación.

### Fase 5: CI con guardas (UC-004) — ~1h 30m
- [ ] `.github/workflows/ci.yml`: `flutter analyze` + `flutter test` bloqueantes → AC-09.
- [ ] Paso `copy-lint`: script que escanea `lib/**` strings/l10n contra glosario prohibido (word-boundaries + whitelist versionada) → AC-10.
- [ ] Paso `schema-guard` (Fase 3) integrado al workflow → AC-04.

### Fase 6: QA y cierre — ~1h
- [ ] `dart fix --apply && flutter analyze` (0 issues) → AC-03.
- [ ] `flutter test --coverage` ≥85% en repositories/providers.
- [ ] Verificación AC-01…AC-10 + actualizar estado de UCs en tracking.

---

## Comandos Finales

```bash
dart fix --apply && flutter analyze
flutter test --coverage
supabase db reset   # aplica migraciones + seed en local
```

---

## Alternativas y Tradeoffs

| Decisión | Opción elegida | Alternativa descartada | Razón |
|----------|---------------|----------------------|-------|
| Navegación | go_router (StatefulShellRoute) | Navigator 2 manual / auto_route | Estándar actual, deep links futuros, shell con estado por tab |
| Estado | Riverpod (manual, sin codegen aún) | BLoC | Decisión canónica de app_spec; codegen se evalúa en US-02 |
| Auth social en dev | Email primero, social en paralelo | Bloquear por cuentas de stores | AC-06 no depende de AC-07; evita bloqueo por Apple Developer |
| Entorno Supabase | CLI local (`supabase start`) + cloud | Solo cloud | Tests RLS reproducibles y gratis en CI |
| Copy-lint | Script propio con word-boundaries | Lint package externo | No existe paquete para glosario es-ES custom; control de falsos positivos |

---

## Archivos a Crear/Modificar

```
lib/
├── core/
│   ├── theme/{tokens.dart, app_theme.dart}
│   ├── router/app_router.dart
│   ├── supabase/supabase_client.dart
│   └── widgets/{navigation/gorditos_shell.dart, buttons/gordi_button.dart,
│       buttons/social_sign_in_button.dart, inputs/gordi_text_field.dart,
│       feedback/gordi_skeleton.dart, feedback/gordi_snack_bar.dart}
├── features/
│   ├── auth/{data/auth_repository.dart, providers/auth_providers.dart,
│   │   presentation/{login_page.dart, register_page.dart}}
│   └── home_shell/presentation/{home_shell_page.dart, placeholder_screen.dart}
supabase/migrations/0001_profiles.sql
tool/{schema_guard, copy_lint}
.github/workflows/ci.yml
test/ (widget + unit + integración RLS)
```

---

## Diseños Stitch

**stitch_designs: PENDING** — config de Stitch en camino (usuario). Al recibirla:
1. Registrar `stitch.projectId` en `.claude/settings.local.json`.
2. Ejecutar pre-check (DESIGN.md ausente → avisar; recomendado `/visual-setup` para brand kit + DESIGN.md).
3. Generar 3 pantallas MOBILE light-mode con prompts enriquecidos por el VEG: Shell-Hoy placeholder, Login, Registro.
4. Guardar HTML en `doc/design/fundaciones_tracker_habitos/` + prompts en `fundaciones_tracker_habitos_stitch_prompts.md`.

| Pantalla | Screen ID | Estado | VEG aplicado |
|----------|-----------|--------|--------------|
| Shell — Hoy (placeholder) | — | PENDING | Sí |
| Login | — | PENDING | Sí |
| Registro | — | PENDING | Sí |

---

## Referencias

- PRD: `doc/prd/PRD_fundaciones_tracker_habitos.md` (US-01, AC-01…AC-10)
- VEG: `doc/veg/fundaciones_tracker_habitos/veg-gorditos-base.md`
- Canon: `doc/app/app_prd.md` · `doc/app/app_spec.md`
- Skills locales: `.claude/skills/flutter-apply-architecture-best-practices`, `.claude/skills/flutter-build-responsive-layout`
