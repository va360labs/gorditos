# PRD: Fundaciones + Tracker de hábitos

> Origen: freeform (board `ff-gorditos-mvp01`) | US-01 + US-02
> Generado: 2026-06-10 por /prd (modo emulado-conversacional, MCP no cableado)
> Canon heredado: [doc/app/app_prd.md](../app/app_prd.md) · [doc/app/app_spec.md](../app/app_spec.md) · PRD producto: [docs/PRD-GorditOS.md](../../docs/PRD-GorditOS.md)

## Descripción

Primera feature del MVP de GorditOS: levantar las fundaciones técnicas (Sprint 0
del roadmap del PRD §11) y construir encima el núcleo de la app, el tracker de
hábitos (Sprint 1). Cubre scaffold Flutter con navegación y theming, backend
Supabase con RLS desde el día uno, autenticación, CI con guardas de producto
(anti-peso y glosario de lenguaje), y el ciclo completo de hábitos: modelo de
datos, gestión, check diario en 1 tap y jardín de hábitos con constancia
acumulativa.

## Objetivo

Que un usuario pueda registrarse, ver sus hábitos del día, marcarlos en 1 tap y
ver crecer su jardín — sin que exista el peso en ninguna capa del sistema.

## Usuario Objetivo

ℹ️ Heredado de `doc/app/app_prd.md` (autopilot: equilibrado) — **ICP-1: adulto
25-55 que empieza de cero**, principiante/sedentario, español (España + LATAM),
abandonó otras apps por presión.

## Alcance

### Incluye
- Scaffold Flutter feature-first + Riverpod + theming claro/oscuro + shell de 5 tabs.
- Proyecto Supabase con migraciones versionadas, tabla `profiles`, RLS testeado.
- Auth email + Google (Android) + Apple (iOS), creación automática de profile.
- CI: analyze + tests + **copy-lint contra glosario prohibido** + **guard anti-peso en migraciones**.
- Tablas `habits` / `habit_logs` con RLS, seed de 6 hábitos predefinidos.
- Gestión de hábitos (crear personalizado, renombrar, desactivar, eliminar).
- Pantalla "Hoy" con check 1 tap idempotente y microcelebración.
- Jardín de hábitos semanal/mensual (RPC `habit_garden_summary`) + constancia acumulativa.

### No incluye
- Onboarding completo con preguntas y elección de Gordi (Sprint 5).
- Ejercicios, pasos/HealthKit, recetas, chat Gordi, notificaciones, logros (Sprints 2-5).
- Hábito de pasos con lectura automática — el hábito existe como check manual; la integración `health` llega en Sprint 2.
- Cualquier campo o pantalla de peso/medidas (out of scope permanente).

---

## User Stories y Use Cases

### US-01: Fundaciones (Sprint 0) `[Infra]`

> Como equipo de producto, quiero una base Flutter+Supabase con RLS, auth y CI
> con guardas de producto, para construir todas las features del MVP sin deuda
> de seguridad ni de lenguaje.

**Horas estimadas**: 28h · **Pantallas**: Shell (5 tabs), Login, Registro

#### UC-001: Scaffold Flutter, navegación y theming
- **Actor**: Equipo / Usuario final (shell visible)
- **Horas estimadas**: 8h
- **Pantallas**: Shell con bottom tabs Hoy · Cocina · Muévete · Gordi · Mi jardín

**Acceptance Criteria:**
- [ ] **AC-01**: La app compila y arranca en Android e iOS mostrando el shell con los 5 bottom tabs (Hoy, Cocina, Muévete, Gordi, Mi jardín); cada tab navega a su pantalla placeholder con el título correcto, verificado por widget test de navegación.
- [ ] **AC-02**: Los temas claro y oscuro están definidos como `ThemeData` centrales con tokens de la paleta (naranja melocotón, verde menta, crema) y radius alto; la app sigue el ajuste del sistema y un widget test verifica que ambos temas renderizan el shell sin overflow.
- [ ] **AC-03**: La estructura es feature-first (`lib/core/`, `lib/features/<feature>/`) y `flutter analyze` con `flutter_lints` devuelve 0 errores y 0 warnings.

#### UC-002: Backend Supabase, profiles y RLS
- **Actor**: Sistema
- **Horas estimadas**: 6h
- **Pantallas**: —

**Acceptance Criteria:**
- [ ] **AC-04**: Una migración SQL versionada (`supabase/migrations/`) crea `profiles` (id FK a auth.users, display_name, avatar_config jsonb, preferences jsonb, created_at); ninguna migración contiene columnas del glosario corporal (weight/peso/height/altura/bmi/imc/body_fat/measurement) — verificado por script de CI que escanea `supabase/migrations/**` y falla listando archivo y línea si hay match.
- [ ] **AC-05**: RLS está habilitado en `profiles` con políticas select/insert/update restringidas a `auth.uid() = id`; un test de integración con 2 usuarios verifica que el usuario B obtiene 0 filas al consultar el profile de A y recibe error al intentar actualizarlo.

#### UC-003: Autenticación y creación de perfil
- **Actor**: Usuario final
- **Horas estimadas**: 10h
- **Pantallas**: Login, Registro

**Acceptance Criteria:**
- [ ] **AC-06**: El registro y login con email+contraseña funcionan end-to-end; tras el primer login se crea automáticamente la fila en `profiles` (trigger sobre auth.users) y el usuario aterriza en la pantalla Hoy en menos de 3s tras autenticar.
- [ ] **AC-07**: El login con Google (Android) y con Apple (iOS) funciona en build de desarrollo; en iOS el botón de Apple Sign-In se muestra siempre que se ofrezca cualquier login social (requisito App Store), verificado por widget test condicional por plataforma.
- [ ] **AC-08**: Cerrar sesión limpia la sesión local: al reabrir la app se muestra el login y ninguna petición posterior reutiliza el token (test de integración que verifica 401/redirect tras logout).

#### UC-004: CI con guardas de producto
- **Actor**: Sistema (CI)
- **Horas estimadas**: 4h
- **Pantallas**: —

**Acceptance Criteria:**
- [ ] **AC-09**: Un workflow de CI ejecuta `flutter analyze` y `flutter test` en cada push/PR y el pipeline falla si hay cualquier issue de análisis o test roto.
- [ ] **AC-10**: El CI incluye un paso copy-lint que escanea los strings de UI (l10n/constantes de copy) contra la lista negra del glosario (peso, kilos, adelgazar, IMC, grasa, dieta, déficit, quemar calorías, has fallado, racha perdida, objetivo incumplido) y falla listando archivo y línea de cada match.

---

### US-02: Tracker de hábitos (Sprint 1)

> Como usuario que empieza de cero, quiero registrar mis hábitos del día en un
> solo tap y ver mi constancia crecer como un jardín, para sentirme acompañado
> sin presión ni miedo a "romper" nada.

**Horas estimadas**: 35h · **Pantallas**: Hoy, Mi jardín, Nuevo hábito (modal), Gestión de hábitos

#### UC-005: Modelo de datos de hábitos + seed
- **Actor**: Sistema
- **Horas estimadas**: 5h
- **Pantallas**: —

**Acceptance Criteria:**
- [ ] **AC-11**: Una migración crea `habits` (type water|steps|exercise|meal|sleep|calm|custom, name, icon, target_soft int null, active bool) y `habit_logs` (habit_id, user_id, date, completed, note null) con constraint UNIQUE(habit_id, date) y RLS `user_id = auth.uid()` en ambas; el test de aislamiento de 2 usuarios pasa en ambas tablas.
- [ ] **AC-12**: Al crearse un profile se siembran automáticamente los 6 hábitos predefinidos (💧 agua, 🚶 pasos, 🏃 ejercicio, 🥗 comida casera, 😴 dormir, 🧘 calma) activos; un test SQL verifica que tras el alta existen exactamente 6 hábitos con los tipos correctos.

#### UC-006: Gestión de hábitos
- **Actor**: Usuario final
- **Horas estimadas**: 8h
- **Pantallas**: Gestión de hábitos, Nuevo hábito (modal)

**Acceptance Criteria:**
- [ ] **AC-13**: El usuario crea un hábito personalizado (nombre obligatorio 1-40 caracteres, icono elegido de un picker, tipo custom) y aparece en la lista de Hoy sin reiniciar la app (<1s, propagado vía estado Riverpod).
- [ ] **AC-14**: El usuario puede renombrar y desactivar/reactivar cualquier hábito; un hábito desactivado desaparece de Hoy pero sus `habit_logs` históricos siguen contando en el jardín (test de integración).
- [ ] **AC-15**: Eliminar un hábito personalizado requiere confirmación explícita y borra hábito y logs; los 6 hábitos predefinidos no muestran opción de eliminar, solo desactivar (widget test).

#### UC-007: Pantalla Hoy — check en 1 tap
- **Actor**: Usuario final
- **Horas estimadas**: 10h
- **Pantallas**: Hoy

**Acceptance Criteria:**
- [ ] **AC-16**: Marcar un hábito cuesta exactamente 1 tap desde Hoy; el tap hace upsert idempotente sobre `habit_logs` (apoyado en UNIQUE habit_id+date): un segundo tap desmarca y nunca se generan filas duplicadas, verificado por test de integración con doble tap rápido.
- [ ] **AC-17**: Al completar un hábito se muestra una microcelebración (animación ≤1,5s); los hábitos pendientes se renderizan en estado neutro — sin color rojo, sin icono de advertencia, sin texto negativo (widget test que inspecciona el estado pendiente).
- [ ] **AC-18**: La pantalla Hoy muestra los hábitos activos del día en <2s en 4G simulada con skeleton durante la carga, y con 0 hábitos activos muestra un estado vacío amable con ilustración de Gordi y CTA "añade tu primer hábito".

#### UC-008: Jardín de hábitos y constancia acumulativa
- **Actor**: Usuario final
- **Horas estimadas**: 12h
- **Pantallas**: Mi jardín

**Acceptance Criteria:**
- [ ] **AC-19**: La RPC `habit_garden_summary(period)` (week|month) devuelve por día el nº de hábitos completados y el total de días activos del periodo; tests SQL cubren una semana con 3 días activos y un mes sin actividad (devuelve 0 sin error).
- [ ] **AC-20**: Mi jardín renderiza por cada día activo una planta con 3 niveles según hábitos completados (brote=1, planta=2-3, flor=4+) y tierra neutra para días vacíos; no existe ningún asset ni estado visual "marchito" o rojo (widget test + inventario de assets).
- [ ] **AC-21**: El jardín muestra los contadores "Días activos este mes" y "Tu mejor mes", acumulativos: añadir días vacíos al periodo nunca reduce su valor (unit test del cálculo con secuencia actividad→vacío).

---

## Interacciones UI

> Esta sección alimenta el análisis de componentes en /plan

### Visualización de datos
| Dato | Volumen | Atributos visibles | Acciones por item |
|------|---------|-------------------|-------------------|
| Hábitos del día (Hoy) | 3-10 | icono, nombre, estado check | marcar/desmarcar (1 tap) |
| Jardín semanal | 7 días | planta por nivel / tierra | ver detalle del día |
| Jardín mensual | 28-31 días | planta por nivel / tierra | cambiar periodo |
| Lista de hábitos (gestión) | 6-15 | icono, nombre, activo | renombrar, desactivar, eliminar (custom) |

### Acciones del usuario
| Acción | UC asociado | Frecuencia | Criticidad | Requiere confirmación |
|--------|-------------|------------|------------|----------------------|
| Marcar/desmarcar hábito | UC-007 | Diaria (varias/día) | Baja (reversible 1 tap) | No |
| Crear hábito personalizado | UC-006 | Rara | Baja | No |
| Desactivar hábito | UC-006 | Rara | Baja (reversible) | No |
| Eliminar hábito custom | UC-006 | Rara | Media (borra histórico) | Sí |
| Login/registro | UC-003 | Una vez | Media | No |
| Cambiar periodo jardín | UC-008 | Ocasional | Baja | No |

### Selecciones/Filtros
| Filtro | Opciones | Selección | Frecuencia |
|--------|----------|-----------|------------|
| Periodo del jardín | semana / mes | Única | Ocasional |
| Icono de hábito (picker) | 12-24 | Única | Rara |

### Formularios
| Formulario | UC asociado | Campos | Contexto |
|------------|-------------|--------|----------|
| Registro / Login | UC-003 | 2-3 | Página dedicada |
| Nuevo hábito | UC-006 | 2 (nombre, icono) | Modal/bottom sheet |
| Renombrar hábito | UC-006 | 1 | Inline/bottom sheet |

---

## Audiencia (alimenta VEG)

ℹ️ Heredada de `doc/app/app_prd.md` zona `audience` (autopilot: equilibrado).

### Targets de la aplicación
Un único target primario — app consumer cálida, modo VEG **uniforme**.

### Target 1: Adulto que empieza de cero (ICP-1)
- **Perfil**: 25-55 años, principiante o sedentario, sin gimnasio, español (ES/LATAM), nivel técnico medio-bajo.
- **Contexto de uso**: móvil personal, varias veces al día en momentos muertos (marcar hábitos), sesiones <1 min.
- **JTBD Racional**: registrar hábitos sin fricción y encontrar qué cocinar/cómo moverse sin complicarse.
- **JTBD Emocional**: sentirse acompañado y celebrado, nunca juzgado ni medido; volver tras ausencias sin culpa.
- **Referentes**: apps cálidas tipo Finch, Duolingo (sin la presión de rachas), Yuka.
- **Expectativa visual**: cálido, redondeado, ilustrado, mascota expresiva; nada de fitness agresivo.

---

## Requisitos No Funcionales (NFRs)

| NFR | Criterio | Medición |
|-----|----------|----------|
| Rendimiento | Pantalla Hoy interactiva < 2s en 4G | DevTools / integration test con red simulada |
| Seguridad | RLS en 100% de tablas; aislamiento entre usuarios | Tests de integración de políticas (2 usuarios) |
| Privacidad por diseño | 0 columnas corporales en todo el esquema | Guard de CI sobre migraciones (AC-04) |
| Lenguaje | 0 términos del glosario prohibido en copys | Copy-lint en CI (AC-10) |
| Accesibilidad | Contraste AA, targets ≥44pt, etiquetas semánticas | flutter_test semantics + revisión axe-like |
| Fricción | Registrar hábito = exactamente 1 tap | Widget test (AC-16) |

---

## Riesgos

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|-------------|---------|------------|
| Apple/Google Sign-In requiere cuentas dev y config nativa (delays) | Media | Medio | Empezar con email auth (AC-06) y paralelizar la config de stores; AC-07 puede validarse en build dev |
| Copy-lint con falsos positivos (p. ej. "pesado" contiene "pesa") | Media | Bajo | Lista negra con word-boundaries y whitelist de excepciones versionada |
| Jardín con bajo rendimiento en vista mensual (31 widgets animados) | Baja | Medio | Assets estáticos por nivel + animación solo al completar |
| Scope creep en fundaciones (meter onboarding/Gordi antes de tiempo) | Media | Medio | Alcance "No incluye" explícito; tabs placeholder hasta sus sprints |

---

## Stack Técnico (estimado)

ℹ️ Heredado de `doc/app/app_spec.md` zona `stack` (autopilot: equilibrado).

- **Modelo**: Nuevo — `profiles`, `habits`, `habit_logs` (PostgreSQL/Supabase, RLS)
- **Repository**: `habits_repository`, `auth_repository`, `profile_repository` (SDK supabase_flutter directo, sin Edge Functions en esta feature)
- **State**: Riverpod (providers por feature)
- **Páginas**: Shell (5 tabs), Login, Registro, Hoy, Mi jardín, Gestión de hábitos, Nuevo hábito (sheet)

## Archivos Principales

```
lib/
  core/ (theme, router, supabase client, widgets compartidos)
  features/
    auth/ (login, registro, auth_repository, providers)
    home_shell/ (bottom tabs)
    habits/ (hoy, gestión, habits_repository, providers)
    garden/ (mi jardín, garden_repository → RPC)
supabase/
  migrations/ (0001_profiles, 0002_habits, 0003_garden_rpc)
  tests/ (RLS isolation)
.github/workflows/ci.yml (analyze + test + copy-lint + schema-guard)
```

## Dependencias

- Proyecto Supabase cloud creado (org VA360) + Supabase CLI local.
- Cuentas Apple Developer / Google Cloud para social sign-in (AC-07; no bloquea el resto).

---

## Criterios de Aceptación (consolidado)

### Funcionales (validados por AG-09)
- [ ] **AC-01** — UC-001: shell 5 tabs navegable en Android+iOS (widget test)
- [ ] **AC-02** — UC-001: temas claro/oscuro con tokens de paleta, siguen el sistema
- [ ] **AC-03** — UC-001: estructura feature-first y analyze con 0 issues
- [ ] **AC-04** — UC-002: migración profiles sin columnas corporales + guard CI
- [ ] **AC-05** — UC-002: RLS en profiles testeado con 2 usuarios
- [ ] **AC-06** — UC-003: email auth e2e + profile automático + aterrizaje en Hoy <3s
- [ ] **AC-07** — UC-003: Google/Apple Sign-In; botón Apple obligatorio en iOS
- [ ] **AC-08** — UC-003: logout limpia sesión (test 401 tras logout)
- [ ] **AC-09** — UC-004: CI analyze+test bloqueante en push/PR
- [ ] **AC-10** — UC-004: copy-lint contra glosario prohibido bloqueante
- [ ] **AC-11** — UC-005: habits+habit_logs con UNIQUE y RLS testeado
- [ ] **AC-12** — UC-005: seed automático de 6 hábitos predefinidos
- [ ] **AC-13** — UC-006: crear hábito custom (nombre 1-40 + icono) visible en Hoy <1s
- [ ] **AC-14** — UC-006: renombrar/desactivar conservando histórico en jardín
- [ ] **AC-15** — UC-006: eliminar custom con confirmación; predefinidos no eliminables
- [ ] **AC-16** — UC-007: check 1 tap, upsert idempotente, doble tap sin duplicados
- [ ] **AC-17** — UC-007: microcelebración ≤1,5s; pendientes en estado neutro sin rojo
- [ ] **AC-18** — UC-007: Hoy <2s en 4G + skeleton + estado vacío amable
- [ ] **AC-19** — UC-008: RPC habit_garden_summary con tests SQL semana/mes
- [ ] **AC-20** — UC-008: plantas 3 niveles + tierra neutra; sin estados marchitos
- [ ] **AC-21** — UC-008: contadores acumulativos que nunca decrecen

### Técnicos (no validados por AG-09)
- [ ] Proyecto compila sin errores en Android e iOS
- [ ] Tests con 85%+ coverage en lógica de features (repositories, providers, cálculo del jardín)

---
**Prioridad**: high
**Complejidad**: Media
*Generado: 2026-06-10*
