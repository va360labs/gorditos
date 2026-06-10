import React from 'react';

/** Bottom tab bar. `items` = [{id,icon,label}]. Controlled via `current`. */
export function BottomNav({ items = [], current, onChange }) {
  return (
    <nav className="gds-bottomnav">
      {items.map((it) => (
        <button
          key={it.id}
          aria-current={current === it.id ? 'page' : undefined}
          onClick={() => onChange && onChange(it.id)}
        >
          <span className="ico" aria-hidden="true">{it.icon}</span>
          {it.label}
        </button>
      ))}
    </nav>
  );
}
