import React from 'react';

/** Labelled text field with optional hint. */
export function Input({ label, hint, id, type = 'text', ...rest }) {
  const fid = id || `f-${Math.random().toString(36).slice(2, 8)}`;
  return (
    <div className="gds-field">
      {label ? <label className="gds-label" htmlFor={fid}>{label}</label> : null}
      <input id={fid} className="gds-input" type={type} {...rest} />
      {hint ? <span className="gds-hint">{hint}</span> : null}
    </div>
  );
}
