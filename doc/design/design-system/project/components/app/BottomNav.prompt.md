Fixed bottom tab bar for the app shell. Active tab turns green.

```jsx
<BottomNav current={tab} onChange={setTab} items={[
  {id:'hoy', icon:'☀️', label:'Hoy'},
  {id:'jardin', icon:'🌱', label:'Jardín'},
  {id:'gordi', icon:'💬', label:'Gordi'},
  {id:'cocina', icon:'🥗', label:'Cocina'},
]} />
```
