# GorditOS App — UI kit

Interactive recreation of the GorditOS mobile app, inside an iPhone frame.
Composes the design-system primitives from `_ds_bundle.js`
(`window.GorditOSDesignSystem_613d73`) — it does **not** re-implement them.

## Run
Open `index.html`. It loads React + Babel + the DS bundle, then mounts the app.

## Flow (interactive)
1. **Onboarding** — 3 kind steps ("¿cómo te quieres sentir?", nivel sin gimnasio,
   "te presento a Gordi"). No weight/height/age, ever. *Saltar* or finish to enter.
2. **Hoy** — greeting, Gordi's daily tip, **1-tap habit tiles** (tap to check),
   adaptive steps ring, "Hablar con Gordi" / "Hoy no puedo con todo".
3. **Jardín** — constancy stats ("días activos", "tu mejor mes") + the habit
   garden grid. Empty days are soil, never wilted.
4. **Gordi** — motivation chat. Type and send; Gordi replies in his warm voice.
5. **Cocina** — recipe ideas with filter chips (≤30 min, "lo que tengo"), plus the
   permanent no-diet disclaimer.

Tap the avatar on **Hoy** to revisit onboarding.

## Files
- `index.html` — entry (loads bundle + scripts).
- `ios-frame.jsx` — iPhone device frame (starter component; raw scaffold).
- `screens.jsx` — the five screens (Onboarding, Hoy, Jardín, Gordi, Cocina).
- `app.jsx` — shell: device frame, routing, bottom nav.

## Notes
- Bottom-nav routing and all checks are local React state (no backend).
- All copy follows the anti-pressure voice rules in the root `readme.md`.
