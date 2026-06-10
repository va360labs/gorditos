# GorditOS — Checklist de publicación en Play Store

> Estado a 2026-06-10. El artefacto se genera con
> `flutter build appbundle --release` → `build/app/outputs/bundle/release/app-release.aab`.

## ✅ Listo (hecho por el pipeline)

- [x] `applicationId`: `com.va360labs.gorditos` · label: **GorditOS** · permiso INTERNET.
- [x] Icono launcher (incl. adaptive) generado desde `assets/brand/app_icon.png` (logo real).
- [x] Firma de release: `android/upload-keystore.jks` + `android/key.properties`
      (alias `upload`, RSA 2048, validez 10000 días). **Ambos fuera de git.**
      ⚠️ Guarda una copia de los dos archivos en tu gestor de contraseñas — la
      contraseña está en `key.properties`. Con Play App Signing, si pierdes el
      upload key se puede rotar desde la consola, pero mejor no perderlo.
- [x] Onboarding amable (primera experiencia) + login/demo + tracker demo.
- [x] versionCode/versionName desde pubspec (`0.1.0+1`).

## 🔲 Te toca a ti (Play Console — cuenta de developer)

1. **Cuenta**: Google Play Console (25 USD una vez) con la entidad VA360 LABS S.L.
2. **Crear app** → nombre "GorditOS", idioma es-ES, app gratuita.
3. **Play App Signing**: aceptar (recomendado). Subir `app-release.aab` a un track
   de **prueba interna** primero.
4. **Ficha de la tienda**:
   - Descripción corta/larga (usar el tono del DS: "Pequeños hábitos, grandes
     cambios." — sin lenguaje del glosario prohibido).
   - Icono 512×512 (exportar de `assets/brand/app_icon.png`), feature graphic
     1024×500 (se puede montar con `logo_completo.png` sobre crema `#FBF4E9`).
   - Capturas: mínimo 2 por factor de forma (sacarlas del emulador: onboarding,
     Hoy, Mi jardín).
5. **Política de privacidad** (obligatoria): URL pública. Pendiente de redactar
   y hostear (RGPD: los datos de hábitos son categoría especial art. 9 —
   consentimiento explícito, derecho de supresión). ⚠️ No publicar a producción
   sin ella.
6. **Cuestionarios**: clasificación de contenido, seguridad de datos (declarar:
   email + preferencias de hábitos en Supabase UE; sin venta de datos), público
   objetivo (18+ recomendado por simplicidad regulatoria inicial).
7. **Supabase producción** antes de release abierto: enlazar proyecto, aplicar
   migraciones y compilar con
   `flutter build appbundle --release --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`
   (sin esto la app sube en modo demo — válido para prueba interna, no para producción).

## Comando de release

```bash
flutter build appbundle --release \
  --dart-define=SUPABASE_URL=https://<ref>.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=<publishable_key>
```
