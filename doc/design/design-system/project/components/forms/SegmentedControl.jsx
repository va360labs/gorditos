import React from 'react';

/** Segmented control. `options` = [{value,label}]. Controlled via `value`. */
export function SegmentedControl({ options = [], value, onChange }) {
  return (
    <div className="gds-seg" role="tablist">
      {options.map((o) => (
        <button
          key={o.value}
          role="tab"
          aria-selected={value === o.value}
          onClick={() => onChange && onChange(o.value)}
        >
          {o.label}
        </button>
      ))}
    </div>
  );
}
