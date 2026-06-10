import React from 'react';

/** Selectable filter chip (e.g. recipe filters). Controlled via `selected`. */
export function Chip({ children, selected = false, icon = null, onClick, ...rest }) {
  return (
    <button className="gds-chip" aria-pressed={selected} onClick={onClick} {...rest}>
      {icon ? <span aria-hidden="true">{icon}</span> : null}
      {children}
    </button>
  );
}
