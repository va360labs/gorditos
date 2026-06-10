The signature interaction: register a habit in exactly one tap. Tapping anywhere on the tile toggles `done` (celebratory green fill + check).

```jsx
<HabitTile icon="💧" name="Beber agua" meta="6/8 vasos" color="var(--habit-agua)"
  done={d.agua} onToggle={()=>toggle('agua')} />
<HabitTile icon="🥗" name="Comida casera" color="var(--habit-comida)" done onToggle={...} />
```

Use the per-habit color tokens (`--habit-agua`, `--habit-ejercicio`, …). Never show an "undone/failed" red state — absence is just neutral.
