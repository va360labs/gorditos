# GorditOS — Supabase

Migraciones SQL versionadas (PRD §6). **RLS obligatorio en el 100% de las
tablas** y **cero columnas corporales** (guard automatizado en CI).

## Estado

- `migrations/0001_profiles.sql` — profiles + RLS + trigger `handle_new_user`. ✍️ Escrita, **pendiente de aplicar** (falta enlazar proyecto).
- `tests/rls_isolation_profiles.sql` — test de aislamiento de 2 usuarios (AC-05).

## Cómo enlazar el proyecto (pendiente)

1. Instalar la CLI: `scoop install supabase` (o `winget install Supabase.CLI`).
2. Local (necesita Docker, ya disponible): `supabase init && supabase start` → aplica migraciones y expone URL+key locales.
3. Cloud: `supabase link --project-ref <ref>` y `supabase db push`.
4. Arrancar la app con credenciales:

```bash
flutter run --dart-define=SUPABASE_URL=https://<ref>.supabase.co --dart-define=SUPABASE_ANON_KEY=<publishable_key>
```

Sin credenciales, la app arranca en **modo demo** (sin auth ni guardado).

> La API key de Claude (Sprint 4) vivirá SOLO en secrets de Edge Functions.
