import React from 'react';

/**
 * One-tap habit row for the "Hoy" screen. The whole tile is the tap target.
 * `done` toggles the celebratory checked state; `color` tints the icon chip.
 */
export function HabitTile({ icon, name, meta, done = false, color = 'var(--habit-comida)', onToggle, ...rest }) {
  return (
    <button className="gds-habit" data-done={done ? 'true' : 'false'} onClick={onToggle} {...rest}>
      <span className="gds-habit__icon" style={{ background: `color-mix(in srgb, ${color} 16%, white)`, color }} aria-hidden="true">{icon}</span>
      <span className="gds-habit__body">
        <span className="gds-habit__name">{name}</span>
        {meta ? <span className="gds-habit__meta">{meta}</span> : null}
      </span>
      <span className="gds-habit__check" style={done ? { background: color, borderColor: color } : null} aria-hidden="true">{done ? '✓' : ''}</span>
    </button>
  );
}
