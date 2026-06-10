Pill segmented control for 2–3 mutually exclusive options — exercise level, time-of-day.

```jsx
<SegmentedControl
  value={nivel}
  onChange={setNivel}
  options={[
    {value:'empezando', label:'Empezando'},
    {value:'ritmo', label:'Cogiendo ritmo'},
    {value:'marcha', label:'En marcha'},
  ]}
/>
```

Use the product's kind level names — never "beginner/advanced" framed as judgement.
