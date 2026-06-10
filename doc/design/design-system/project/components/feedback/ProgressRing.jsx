import React from 'react';

/**
 * Adaptive goal ring. `value`/`max` drive the arc; center shows label + sub.
 * Color via `color` (defaults to brand green). Never frames "failure".
 */
export function ProgressRing({ value = 0, max = 100, label, sub, size = 120, stroke = 12, color = 'var(--green-500)' }) {
  const r = (size - stroke) / 2;
  const c = 2 * Math.PI * r;
  const pct = Math.max(0, Math.min(1, max ? value / max : 0));
  const off = c * (1 - pct);
  return (
    <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`} role="img" aria-label={`${label || ''} ${sub || ''}`}>
      <circle className="gds-ring__track" cx={size / 2} cy={size / 2} r={r} fill="none" strokeWidth={stroke} />
      <circle
        className="gds-ring__value"
        cx={size / 2} cy={size / 2} r={r} fill="none" strokeWidth={stroke}
        stroke={color}
        strokeDasharray={c} strokeDashoffset={off}
        transform={`rotate(-90 ${size / 2} ${size / 2})`}
      />
      {label != null ? (
        <text className="gds-ring__label" x="50%" y="48%" textAnchor="middle" dominantBaseline="middle" style={{ fontSize: size * 0.24 }}>{label}</text>
      ) : null}
      {sub != null ? (
        <text className="gds-ring__sub" x="50%" y="66%" textAnchor="middle" dominantBaseline="middle" style={{ fontSize: size * 0.11 }}>{sub}</text>
      ) : null}
    </svg>
  );
}
