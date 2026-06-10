Toggleable filter chip — recipe filters ("≤30 min", "lo que tengo en la nevera"), preferences.

```jsx
<Chip selected={f==='rapido'} onClick={()=>setF('rapido')}>≤30 min</Chip>
<Chip icon="🥦">Vegetariano</Chip>
```

Controlled: pass `selected` and handle `onClick`.
