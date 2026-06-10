# App PRD — gorditos

**Última actualización:** 2026-06-10T00:00:00Z
**Versión del documento:** 1
**Mantenido por:** /app-init (idempotente) y eventos del pipeline

> Documento canónico derivado del PRD original [docs/PRD-GorditOS.md](../../docs/PRD-GorditOS.md) (v1.0).
> Fuente de verdad consultable por `/discovery`, `/prd <feature>` y `/plan <feature>`.

---

<!-- @specbox:zone start kind="manual" id="vision" -->
## 1. Visión

**GorditOS** (*Gorditos* + *OS*) es una aplicación móvil de tracking de hábitos
saludables para personas que quieren mejorar su salud y perder peso, construida
sobre un principio innegociable: **motivar, nunca presionar**.

- **El problema:** las apps de salud actuales convierten el peso en el indicador
  central, penalizan los "fallos" (rachas rotas), usan lenguaje de rendimiento y
  tienen abandono altísimo en las primeras 2-4 semanas.
- **La solución:** un "sistema operativo" personal de hábitos que **nunca
  menciona, registra ni muestra el peso** (el peso no existe en GorditOS),
  celebra la constancia en hábitos (no resultados corporales), motiva con IA de
  tono cercano y humor amable (mascota/copiloto **Gordi**, Claude API), y hace
  que comer bien y moverse sea fácil y sin fricción (1 tap por hábito, recetas
  ≤30 min de supermercado normal).

### North Star (principio rector)

> **"Si una funcionalidad puede generar ansiedad, culpa o presión, no entra en
> el producto."** Prevalece sobre cualquier otra decisión de diseño o producto.
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="manual" id="audience" -->
## 2. Audiencia + JTBD

### Targets / ICPs

- **ICP-1 — Adulto que empieza de cero (primario).** 25-55 años, principiante o
  sedentario, sin acceso (o sin ganas) de gimnasio. Ha probado dietas/apps y ha
  abandonado por presión o frustración. Quiere comer mejor sin complicarse
  (recetas rápidas, ingredientes normales). Su motivación es sentirse mejor,
  tener más energía y ganar salud — la pérdida de peso es consecuencia, no
  objetivo medible en la app. Idioma: español (España y LATAM).
  - JR: registrar hábitos saludables sin fricción (1 tap) y ver su constancia
    crecer sin miedo a "romper" nada.
  - JR: encontrar qué cocinar hoy/esta semana con lo que hay en una nevera
    normal, y moverse en casa sin equipamiento.
  - JE: sentirse acompañado y celebrado, nunca juzgado ni medido.
  - JE: volver tras días de ausencia sin culpa ("aquí no se pierde nada, se
    retoma").

### Anti-persona (no-ICP)

- Atletas o usuarios avanzados que buscan métricas de rendimiento.
- Personas que buscan contar calorías o macros de forma estricta.
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="manual" id="scope" -->
## 3. Perímetro

### MVP (in scope) — PRD §4

1. **Onboarding amable** — preguntas de contexto (cómo quieres sentirte, nivel
   de actividad, tiempo disponible, equipamiento, preferencias alimentarias,
   hora de motivación), elección de mascota Gordi. **Prohibido** pedir peso,
   altura, edad para cálculos calóricos o fotos del cuerpo.
2. **Tracker de hábitos (núcleo)** — hábitos predefinidos (agua, pasos,
   ejercicio, comida casera, sueño, calma) + personalizados; check en 1 tap;
   "jardín de hábitos" semanal/mensual (día vacío = tierra, nunca planta
   marchita); constancia flexible ("días activos este mes" / "tu mejor mes",
   nunca rachas que se rompen).
3. **Ejercicios sin gimnasio** — rutinas en casa por nivel ("Empezando" /
   "Cogiendo ritmo" / "En marcha"), duración 5-30 min, tipos suaves; botón
   "Hoy no puedo con todo" (alternativa de 5 min); recomendación diaria por IA.
4. **Pasos diarios** — HealthKit / Health Connect (solo lectura de STEPS);
   objetivo adaptativo desde la media real (+500), nunca el dogma de 10.000;
   sin mensajes negativos al no llegar.
5. **Motivación con IA (Gordi)** — chat libre + tip diario personalizado +
   mensajes de "vuelta amable"; guardarraíles estrictos (PRD §9).
6. **Ideas de alimentación (no dietas)** — menús semanales orientativos según
   preferencias; sin calorías, sin macros, sin gramos estrictos; disclaimer
   permanente derivando a dietista-nutricionista.
7. **Planificador de comidas y recetas** — recetario con filtros (tiempo, tipo,
   "lo que tengo en la nevera"), planificador semanal drag & drop, lista de la
   compra automática agrupada por secciones, modo batch cooking.
8. **Celebraciones y gamificación amable** — Gordi evoluciona; logros por
   comportamiento; confeti; sin rankings ni comparativas.

### Fase 2 (post-MVP) — PRD §5

- Retos colaborativos no competitivos ("GorditOS en compañía"), wearables
  (Garmin/Fitbit/Apple Watch), recetas con vídeo, widget de pantalla de inicio,
  modo offline completo, audio-paseos.

### Nunca (out of scope permanente) — PRD §12 + §3

- Contador de calorías o macros.
- Registro de peso, IMC, medidas o fotos de progreso corporal — **ni en
  pantallas ni en base de datos** (constraint de diseño).
- Comparativas o rankings entre usuarios.
- Diagnósticos o recomendaciones médicas; planes de dieta personalizados
  (territorio de profesionales colegiados).
- Notificaciones de culpa/urgencia/FOMO, recordatorios de "no has hecho X",
  rachas en peligro, >2 notificaciones/día (política anti-ansiedad, PRD §8).
- Versión web (solo móvil en MVP).
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="hybrid" id="success_metrics" merge="append_only" -->
## 4. Métricas de éxito

> Métricas **del producto, no del usuario** (PRD §10). ⚠️ Nunca se medirá ni
> pedirá al usuario su pérdida de peso como métrica de éxito.

- Retención D7 ≥ 40 % · Retención D30 ≥ 25 %.
- Días activos/usuario/semana ≥ 3.
- Hábitos completados/usuario/semana ≥ 8.
- NPS ≥ 50.
- % usuarios que reportan "la app no me genera presión" (encuesta in-app) ≥ 90 %.

<!-- engine-entries-below -->
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="auto" id="roadmap" auto_sync_on="complete_uc,move_uc,add_uc,delete_uc,mark_ac_batch" -->
## 5. Roadmap de US

{Esta zona la mantiene el engine. NO EDITES MANUALMENTE — los cambios serán sobrescritos en la próxima sincronización tras eventos del pipeline.}

| US | Título | Estado | UCs | Última actualización |
|----|--------|--------|-----|----------------------|
| US-01 | Fundaciones (Sprint 0) | in_progress | UC-001 done · UC-002/003/004 review | 2026-06-10 |
| US-02 | Tracker de hábitos (Sprint 1) | user_stories | UC-005…UC-008 (backlog) | 2026-06-10 |
| US-03 | Onboarding amable + release Android | review | UC-009 done · UC-010 done | 2026-06-10 |

> Orden sugerido por el roadmap del PRD §11: Sprint 0 fundaciones → S1 tracker
> de hábitos → S2 ejercicio y pasos → S3 cocina → S4 Gordi (IA) → S5 pulido y
> gamificación.
<!-- @specbox:zone end -->

<!-- @specbox:zone start kind="manual" id="stakeholders" -->
## 6. Stakeholders

- **Producto propio** de VA360 LABS S.L. (valen@va360labs.com) — sin cliente
  externo en esta fase.
- **Product owner:** Valen (VA360).
- **Reporting externo:** **no** — FreeForm interno (sin API de PM externo).
- **Restricciones transversales innegociables** (criterios de aceptación
  globales, PRD §11):
  - Ninguna tabla, pantalla ni función maneja peso o medidas corporales.
  - RLS activado en el 100 % de las tablas Supabase, con políticas testeadas.
  - La API key de Claude jamás en el código Flutter; solo en secrets de Edge
    Functions.
  - Test automatizado de copys contra el glosario prohibido (PRD §9.1).
  - El chat de IA pasa batería de tests adversariales dentro de guardarraíles.
  - Registrar un hábito cuesta exactamente 1 tap desde la pantalla "Hoy".
  - Disclaimers legales visibles en onboarding y sección de menús (RGPD: datos
    de hábitos = categoría especial art. 9 → consentimiento explícito, cifrado,
    derecho de supresión completo).
<!-- @specbox:zone end -->
