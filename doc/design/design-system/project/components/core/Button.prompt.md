Primary call-to-action button for GorditOS — use for the one main action on a screen; secondary/soft/ghost for lesser actions.

```jsx
<Button variant="primary" size="lg" block onClick={save}>Guardar mi ritmo</Button>
<Button variant="soft" icon="＋">Añadir hábito</Button>
<Button variant="ghost">Hoy no puedo con todo</Button>
```

Variants: `primary` (green, the one main action), `secondary` (apricot, celebratory), `soft` (tinted green, low emphasis), `ghost` (text-only), `outline`. Sizes `sm | md | lg`; `block` for full width. Never use red/destructive styling — it's against the anti-pressure ethos.
