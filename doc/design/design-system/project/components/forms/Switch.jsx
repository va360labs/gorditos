import React from 'react';

/** Toggle switch (controlled). */
export function Switch({ checked = false, onChange, label, ...rest }) {
  return (
    <label className="gds-switch" {...rest}>
      <input type="checkbox" checked={checked} onChange={onChange} aria-label={label} />
      <span className="track" aria-hidden="true"></span>
      <span className="thumb" aria-hidden="true"></span>
    </label>
  );
}
