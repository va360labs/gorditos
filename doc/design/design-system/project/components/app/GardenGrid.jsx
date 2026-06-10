import React from 'react';

const STATE_STYLE = {
  soil:   { background: 'var(--garden-soil)' },
  sprout: { background: 'var(--garden-sprout)' },
  grown:  { background: 'var(--garden-grown)' },
  bloom:  { background: 'var(--garden-bloom)' },
};
const STATE_GLYPH = { soil: '', sprout: '🌱', grown: '🌿', bloom: '🌸' };

/**
 * The "jardín de hábitos". `days` is an array of states
 * ('soil' | 'sprout' | 'grown' | 'bloom'). Empty day = soil, never a wilted plant.
 */
export function GardenGrid({ days = [], columns = 7 }) {
  return (
    <div className="gds-garden" style={{ gridTemplateColumns: `repeat(${columns}, 1fr)` }}>
      {days.map((s, i) => (
        <div key={i} className="gds-garden__day" style={STATE_STYLE[s] || STATE_STYLE.soil} title={s}>
          <span aria-hidden="true">{STATE_GLYPH[s] || ''}</span>
        </div>
      ))}
    </div>
  );
}
