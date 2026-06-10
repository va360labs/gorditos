# PRD — GorditOS 🍊

> **Product Requirements Document v1.0**
> Aplicación móvil de hábitos saludables sin presión, sin ansiedad y sin báscula.

---

## 1. Visión del producto

**GorditOS** (juego de palabras: *Gorditos* + *OS, Operating System*) es una aplicación móvil de tracking de hábitos saludables diseñada para personas que quieren mejorar su salud y perder peso, pero construida sobre un principio innegociable: **motivar, nunca presionar**.

### 1.1 El problema

Las apps de salud y fitness actuales:
- Convierten el peso en el indicador central, generando ansiedad, frustración y abandono.
- Penalizan los "fallos" (rachas rotas, días sin registrar), provocando culpa.
- Usan lenguaje de rendimiento ("quema", "objetivo incumplido", "déficit") que excluye a quien empieza desde cero.
- Tienen una tasa de abandono altísima en las primeras 2-4 semanas.

### 1.2 La solución

Un "sistema operativo" personal de hábitos saludables que:
- **Nunca menciona, registra ni muestra el peso del usuario.** El peso no existe en GorditOS.
- Celebra la constancia y el progreso en hábitos, no resultados corporales.
- Usa IA para motivar con un tono cercano, humano y con humor amable.
- Hace que comer bien y moverse sea fácil, rápido y sin fricción.

### 1.3 Principio rector (North Star)

> **"Si una funcionalidad puede generar ansiedad, culpa o presión, no entra en el producto."**

Este principio prevalece sobre cualquier otra decisión de diseño o producto.

---

## 2. Usuario objetivo

| Atributo | Descripción |
|---|---|
| **Perfil** | Adultos 25-55 años que quieren mejorar su salud, han probado dietas/apps y han abandonado por presión o frustración |
| **Nivel fitness** | Principiante o sedentario. Sin acceso (o sin ganas) de gimnasio |
| **Relación con la comida** | Quieren comer mejor sin complicarse: recetas rápidas, sin ingredientes raros |
| **Motivación** | Sentirse mejor, tener más energía, ganar salud. La pérdida de peso es consecuencia, no objetivo medible en la app |
| **Idioma** | Español (mercado inicial: España y LATAM) |

### Anti-persona
- Atletas o usuarios avanzados que buscan métricas de rendimiento.
- Personas que buscan contar calorías o macros de forma estricta.

---

## 3. Principios de diseño (innegociables)

1. **Cero peso**: no existe campo de peso, IMC, % grasa ni medidas corporales en ninguna pantalla, onboarding ni base de datos.
2. **Cero culpa**: no hay rachas que se "rompen", ni notificaciones de "has fallado", ni indicadores rojos de incumplimiento. Un día sin actividad simplemente no suma; nunca resta ni se señala.
3. **Lenguaje positivo**: tono cercano, con humor amable y autodeprecación cariñosa (en línea con el nombre GorditOS), pero nunca burla ni gordofobia. Glosario de términos prohibidos y permitidos en sección 9.
4. **Progreso por hábitos, no por cuerpo**: las métricas son de comportamiento (días activos, vasos de agua, comidas caseras, paseos), nunca corporales.
5. **No es consejo médico ni dietético**: los planes de alimentación son "ideas de menús saludables", no dietas. Disclaimer visible y recomendación de acudir a profesionales cualificados (médico, dietista-nutricionista) para planes personalizados.
6. **Fricción mínima**: registrar un hábito debe costar 1 tap. Cocinar una receta, máximo 20-30 min con ingredientes de supermercado normal.

---

## 4. Funcionalidades — MVP

### 4.1 Onboarding amable (sin peso, sin báscula)

- Preguntas de contexto, no de medición:
  - "¿Cómo te quieres sentir dentro de 3 meses?" (más energía / dormir mejor / moverme más / comer mejor / todo un poco)
  - Nivel de actividad actual (sedentario / me muevo algo / activo)
  - Tiempo disponible al día (10 / 20 / 30+ min)
  - Equipamiento en casa (nada / esterilla / bandas / mancuernas)
  - Preferencias y restricciones alimentarias (vegetariano, sin gluten, sin lactosa, alergias)
  - Hora preferida para recibir motivación
- Elección de avatar/mascota "Gordi" (mascota de la app que acompaña y celebra).
- **Prohibido**: pedir peso, altura, edad exacta para cálculos calóricos, fotos del cuerpo.

### 4.2 Tracker de hábitos (núcleo de la app)

- Hábitos predefinidos sugeridos + hábitos personalizados:
  - 💧 Beber agua (vasos)
  - 🚶 Pasos diarios / paseo del día
  - 🏃 Ejercicio del día completado
  - 🥗 Comida casera / plato con verdura
  - 😴 Hora de dormir razonable
  - 🧘 Momento de calma (respiración / estiramiento)
- Registro en 1 tap (check). Sin cantidades obligatorias.
- Vista semanal y mensual con **"jardín de hábitos"**: cada día completado hace crecer una planta/flor. Un día vacío es simplemente tierra, nunca una planta marchita.
- **Sistema de constancia flexible**: en lugar de "racha de N días" (que se rompe y frustra), se usa "días activos este mes" y "tu mejor mes". La constancia se acumula, nunca se pierde.

### 4.3 Ejercicios sin gimnasio

- Biblioteca de rutinas en casa, sin equipamiento (o con el equipamiento declarado en onboarding):
  - Niveles: "Empezando" / "Cogiendo ritmo" / "En marcha" (nunca "principiante/avanzado" con connotación de juicio)
  - Duración: 5, 10, 15, 20, 30 min
  - Tipos: movilidad, fuerza con peso corporal, cardio suave, estiramientos, "ejercicio de sofá" (micro-rutinas viendo la tele)
- Cada ejercicio: nombre, descripción, animación/ilustración o vídeo, duración/repeticiones sugeridas (siempre como sugerencia: "haz las que puedas, todas cuentan").
- **Botón "Hoy no puedo con todo"**: ofrece una alternativa de 5 minutos. Hacer algo pequeño siempre es una victoria.
- Recomendación diaria de rutina por IA según historial, energía declarada y tiempo disponible.

### 4.4 Pasos diarios

- Integración con HealthKit (iOS) y Health Connect (Android) para leer pasos automáticamente.
- **Objetivo adaptativo y amable**: parte de la media real del usuario y propone mejoras pequeñas (+500 pasos), nunca el dogma de los 10.000.
- Si el usuario no llega: ningún mensaje negativo. Si llega: celebración de Gordi.
- Sugerencias contextuales: "Hace buen día, ¿un paseo de 15 min después de comer?"

### 4.5 Motivación con IA (Gordi, el copiloto)

- Asistente conversacional integrado (Claude API) con personalidad definida:
  - Cercano, optimista, con humor amable estilo "colega que te anima".
  - Nunca juzga, nunca presiona, nunca menciona peso ni cuerpo.
  - Celebra lo pequeño: "¿Un vaso de agua más? Eso es hidratación de campeonato 💧"
- Funciones:
  - Tip motivacional diario personalizado (notificación a la hora elegida).
  - Chat libre: el usuario puede contarle cómo se siente, pedir ideas, desahogarse.
  - Mensajes de "vuelta amable": si el usuario lleva días sin entrar, el mensaje es "Te echábamos de menos, aquí no se pierde nada, se retoma" — nunca "has perdido tu racha".
- **Guardarraíles del prompt de IA** (ver sección 9): prohibido dar consejo médico, prescribir dietas, mencionar calorías objetivo, peso o cuerpo.

### 4.6 Ideas de alimentación (no dietas)

- **Naming oficial dentro de la app: "Ideas de menús" / "Inspiración para comer rico y sano"**. Nunca "dieta" ni "plan nutricional".
- Menús semanales orientativos generados según preferencias (vegetariano, sin gluten, etc.), con foco en:
  - Comida real, de supermercado normal.
  - Equilibrio sencillo (plato de Harvard como guía visual, sin números).
  - Sin calorías visibles. Sin macros. Sin raciones en gramos estrictos.
- Disclaimer permanente en la sección: *"Esto son ideas generales de alimentación saludable, no una dieta personalizada. Para un plan adaptado a ti, consulta con un dietista-nutricionista colegiado."*

### 4.7 Planificador de comidas y recetas

- Recetario con filtros: tiempo (≤10 / ≤20 / ≤30 min), tipo de comida, preferencias, "lo que tengo en la nevera" (búsqueda por ingredientes).
- Cada receta: foto, ingredientes, pasos numerados, tiempo total, dificultad ("chupado" / "fácil" / "con un poco de maña").
- Planificador semanal drag & drop: arrastrar recetas a días/comidas.
- **Lista de la compra automática** generada desde el plan semanal, agrupada por secciones de supermercado, con check de comprado.
- Batch cooking: modo "cocina el domingo, come toda la semana" con recetas pensadas para ello.

### 4.8 Celebraciones y gamificación amable

- Gordi (mascota) evoluciona y se pone contento con la constancia.
- Logros por comportamiento: "Primera semana con 3 días activos", "10 recetas cocinadas", "Mes hidratado".
- **Nunca** logros corporales ni comparativas con otros usuarios. Sin rankings, sin leaderboards.
- Confeti y animaciones al completar hábitos. La dopamina buena.

---

## 5. Funcionalidades — Fase 2 (post-MVP)

- Modo "GorditOS en compañía": retos colaborativos (no competitivos) con amigos — "entre todos sumamos 100 paseos este mes".
- Integración con wearables (Garmin, Fitbit, Apple Watch).
- Recetas con vídeo corto.
- Widget de pantalla de inicio (hábitos del día en 1 tap).
- Modo offline completo.
- Audio-paseos: contenido motivacional/podcast de Gordi para escuchar mientras caminas.

---

## 6. Arquitectura técnica propuesta

### 6.1 Stack

| Capa | Tecnología | Justificación |
|---|---|---|
| **App móvil** | Flutter (Dart, última stable) | Un código para iOS y Android, rendimiento nativo, UI expresiva ideal para animaciones de Gordi |
| **Gestión de estado** | Riverpod | Estándar moderno, testeable, buena integración con streams de Supabase |
| **Backend (BaaS)** | Supabase | PostgreSQL gestionado, Auth, Realtime, Storage y Edge Functions en una sola plataforma |
| **Base de datos** | PostgreSQL (Supabase) con Row Level Security (RLS) | Cada usuario solo accede a sus datos; RLS obligatorio en todas las tablas |
| **Lógica de servidor** | Supabase Edge Functions (Deno/TypeScript) | Llamadas a Claude API (la API key nunca viaja a la app), generación de tips, lógica sensible |
| **Jobs programados** | Supabase Cron (pg_cron) + Edge Functions | Tip diario, mensajes de vuelta amable |
| **IA** | Claude API (claude-sonnet-4-6 para chat, claude-haiku-4-5 para tips diarios batch) vía Edge Functions | Calidad conversacional en español, control de tono vía system prompt |
| **Auth** | Supabase Auth (email + Apple/Google Sign-In) | Apple Sign-In obligatorio en iOS si hay login social |
| **Notificaciones** | Firebase Cloud Messaging (FCM) + flutter_local_notifications | FCM cubre iOS (vía APNs) y Android; notificaciones locales para las horas elegidas por el usuario |
| **Salud** | Paquete `health` (pub.dev) | Acceso unificado a HealthKit (iOS) y Health Connect (Android) para pasos |
| **Analítica** | PostHog (SDK Flutter, self-hosted opcional) | Privacy-friendly |
| **Storage** | Supabase Storage | Fotos de recetas, assets de Gordi |

### 6.2 Modelo de datos (tablas Supabase / PostgreSQL)

> Todas las tablas con **RLS activado**: política `user_id = auth.uid()` para lectura/escritura. Las tablas de catálogo (rutinas, recetas) son de solo lectura pública para usuarios autenticados.

```
profiles (id → auth.users, display_name, avatar_config jsonb,
          preferences jsonb {dietary, equipment, available_time, motivation_hour},
          created_at)
  ⚠️ SIN columnas de peso, altura ni medidas corporales. Constraint de diseño.

habits (id, user_id, type [water|steps|exercise|meal|sleep|calm|custom],
        name, icon, target_soft int?, active bool)

habit_logs (id, habit_id, user_id, date, completed bool, note text?)
  — UNIQUE(habit_id, date) para idempotencia del check diario

workout_routines (id, level, duration_min, type, equipment text[], exercises jsonb)
exercises (id, name, description, media_url, suggested_reps text?)

recipes (id, title, photo_url, time_min, difficulty, meal_type,
         tags text[], ingredients jsonb, steps jsonb)
meal_plans (id, user_id, week_start date,
            entries jsonb [{date, meal_type, recipe_id}])
shopping_lists (id, meal_plan_id, user_id,
                items jsonb [{ingredient, qty, section, checked}])

ai_conversations (id, user_id, messages jsonb, created_at)
daily_tips (id, user_id, date, content, delivered_at)

achievements (id, user_id, type, unlocked_at)
push_tokens (id, user_id, fcm_token, platform, updated_at)
```

### 6.3 Integraciones de salud

- Paquete **`health`** de pub.dev como capa unificada:
  - **iOS**: HealthKit → lectura de pasos (solo lectura, solo `STEPS`; no leer peso aunque exista en HealthKit).
  - **Android**: Health Connect → ídem.
- Permisos solicitados de forma explicada y opcional ("Si quieres, podemos contar tus pasos automáticamente").

### 6.4 Acceso a datos y Edge Functions

**Patrón general**: la app Flutter usa el SDK `supabase_flutter` directamente contra las tablas (protegidas por RLS) para todo el CRUD. Las **Edge Functions** se reservan para lógica que no puede vivir en el cliente:

```
Acceso directo vía SDK (RLS):
  - CRUD de hábitos y checks diarios (upsert sobre habit_logs)
  - Lectura de rutinas, recetas (catálogo público autenticado)
  - Planificador semanal y lista de la compra
  - Resumen del jardín de hábitos (vista SQL o RPC: habit_garden_summary)

Edge Functions (Deno):
  POST /functions/v1/gordi-chat        — chat con Gordi (proxy a Claude API,
                                          streaming SSE, guardarraíles en system prompt,
                                          API key solo en secrets del servidor)
  POST /functions/v1/daily-tips        — generación batch de tips (invocada por pg_cron)
  POST /functions/v1/workout-recommend — rutina del día (reglas + IA)
  POST /functions/v1/comeback-message  — mensaje de vuelta amable (pg_cron semanal)
  POST /functions/v1/shopping-list     — generación de lista desde meal_plan

Postgres RPC (funciones SQL):
  habit_garden_summary(period)         — agregado semanal/mensual para el jardín
  unlock_achievements()                — trigger/función que evalúa logros al insertar logs
```

> ⚠️ La API key de Claude vive exclusivamente en los secrets de Supabase Edge Functions. La app móvil jamás llama a la API de Anthropic directamente.

---

## 7. Diseño y UX

### 7.1 Identidad visual

- **Tono visual**: cálido, redondeado, ilustrado. Nada de estética "fitness agresivo" (negro/neón/músculos).
- Paleta sugerida: tonos cálidos y amables (naranja melocotón, verde menta, crema). Bordes redondeados generosos (radius alto), tipografía redondeada y legible.
- Mascota **Gordi**: personaje redondito, simpático y expresivo. Presente en onboarding, celebraciones, estados vacíos y chat.
- Modo claro y oscuro.

### 7.2 Navegación (bottom tabs)

1. 🏠 **Hoy** — hábitos del día, rutina recomendada, tip de Gordi, pasos.
2. 🥗 **Cocina** — recetas, planificador, lista de la compra.
3. 🏃 **Muévete** — biblioteca de ejercicios y rutinas.
4. 💬 **Gordi** — chat con la IA.
5. 🌱 **Mi jardín** — progreso de hábitos, logros, ajustes.

### 7.3 Accesibilidad

- Tamaños de fuente escalables, contraste AA mínimo, etiquetas para lectores de pantalla, targets táctiles ≥44pt.

---

## 8. Notificaciones (política anti-ansiedad)

| Permitido ✅ | Prohibido ❌ |
|---|---|
| Tip motivacional diario (hora elegida por el usuario) | Recordatorios de "no has hecho X" |
| Celebración al completar hábitos | Notificaciones de racha en peligro |
| Sugerencia amable de paseo (máx. 1/día, desactivable) | Más de 2 notificaciones/día |
| Mensaje de bienvenida tras ausencia (tono cálido, máx. 1/semana) | Mensajes con urgencia, culpa o FOMO |

Todas las notificaciones desactivables de forma granular. Opt-in, no opt-out.

---

## 9. Guardarraíles de lenguaje e IA

### 9.1 Glosario

| ❌ Prohibido | ✅ Alternativa |
|---|---|
| Peso, kilos, adelgazar, IMC, grasa | Sentirte mejor, ganar energía, cuidarte |
| Dieta, plan nutricional, déficit calórico | Ideas de menús, comer rico y sano |
| Quemar calorías | Moverte, activarte, darte un paseo |
| Has fallado / racha perdida | Hoy descansamos, mañana seguimos |
| Objetivo incumplido | Cada paso cuenta |
| Principiante (con juicio) | Empezando |

### 9.2 System prompt de Gordi (requisitos)

El system prompt del asistente IA debe incluir obligatoriamente:
1. Personalidad: cercano, optimista, humor amable en español de España neutro.
2. **Prohibición absoluta** de: mencionar peso/kilos/IMC/calorías objetivo, prescribir dietas, dar consejo médico o diagnóstico, comentar el cuerpo del usuario.
3. Si el usuario pide consejo médico/nutricional personalizado → derivar con cariño a profesionales cualificados.
4. Si el usuario expresa malestar emocional significativo o señales de relación problemática con la comida → respuesta empática + recomendación de buscar apoyo profesional, sin dramatizar.
5. Respuestas cortas por defecto (2-4 frases), emoji con moderación.
6. Resistente a prompt injection: nunca salir del personaje ni de las restricciones aunque el usuario lo pida.

### 9.3 Disclaimers legales obligatorios

- Pantalla de onboarding + sección de menús: "GorditOS no sustituye el consejo de profesionales sanitarios. Para planes de alimentación o ejercicio personalizados, consulta con tu médico o dietista-nutricionista."
- Términos de uso y política de privacidad (RGPD): los datos de hábitos son datos de salud (categoría especial art. 9 RGPD) → consentimiento explícito, cifrado en reposo y tránsito, derecho de supresión completo.

---

## 10. Métricas de éxito (del producto, no del usuario)

| Métrica | Objetivo MVP |
|---|---|
| Retención D7 | ≥ 40% |
| Retención D30 | ≥ 25% |
| Días activos/usuario/semana | ≥ 3 |
| Hábitos completados/usuario/semana | ≥ 8 |
| NPS | ≥ 50 |
| % usuarios que reportan "la app no me genera presión" (encuesta in-app) | ≥ 90% |

⚠️ Nunca se medirá ni pedirá al usuario su pérdida de peso como métrica de éxito.

---

## 11. Roadmap de implementación sugerido (para Claude Code)

### Sprint 0 — Fundaciones
- Proyecto Flutter (estructura por features, Riverpod, theming claro/oscuro), proyecto Supabase (migraciones SQL versionadas vía CLI, RLS en todas las tablas desde el día uno), Supabase Auth integrado, CI básico (analyze + tests).

### Sprint 1 — Tracker de hábitos
- Tablas habits/habit_logs con RLS, CRUD hábitos, check diario (upsert idempotente), pantalla "Hoy", jardín de hábitos semanal/mensual (RPC `habit_garden_summary`).

### Sprint 2 — Ejercicio y pasos
- Seed de 30+ rutinas en Supabase, biblioteca con filtros, recomendación diaria por reglas (Edge Function), integración paquete `health` (pasos iOS/Android).

### Sprint 3 — Cocina
- Seed de 60+ recetas en español (Supabase Storage para fotos), filtros, planificador semanal, lista de la compra automática (Edge Function o lógica cliente).

### Sprint 4 — Gordi (IA)
- Edge Function `gordi-chat` con Claude API (streaming SSE, system prompt con guardarraíles, secrets en servidor), tip diario vía pg_cron + Edge Function, notificaciones FCM + locales.

### Sprint 5 — Pulido y gamificación
- Logros (función SQL `unlock_achievements`), animaciones de celebración (Rive o Lottie para Gordi), onboarding completo, modo oscuro, QA y accesibilidad.

### Criterios de aceptación transversales
- [ ] Ninguna tabla, pantalla ni función maneja peso o medidas corporales.
- [ ] **RLS activado en el 100% de las tablas** con políticas testeadas (intentar leer datos de otro usuario debe fallar).
- [ ] La API key de Claude nunca está en el código de la app Flutter; solo en secrets de Edge Functions.
- [ ] Ninguna notificación ni copy usa lenguaje del glosario prohibido (test automatizado de copys contra lista negra).
- [ ] El chat de IA pasa una batería de tests adversariales (pedir dieta, pedir calorías, insultarse a sí mismo) respondiendo siempre dentro de los guardarraíles.
- [ ] Registrar un hábito cuesta exactamente 1 tap desde la pantalla "Hoy".
- [ ] Disclaimers visibles en onboarding y sección de menús.

---

## 12. Fuera de alcance (explícito)

- Contador de calorías o macros.
- Registro de peso, medidas o fotos de progreso corporal.
- Comparativas o rankings entre usuarios.
- Diagnósticos o recomendaciones médicas.
- Planes de dieta personalizados (territorio de profesionales colegiados).
- Versión web (solo móvil en MVP).

---

*GorditOS — El sistema operativo de tu salud, sin presión y con cariño.* 🍊
