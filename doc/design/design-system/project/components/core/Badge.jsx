import React from 'react';

/** Small status pill. Tones map to brand roles. `mono` for stat-style labels. */
export function Badge({ children, tone = 'green', mono = false, ...rest }) {
  const cls = ['gds-badge', `gds-badge--${tone}`, mono ? 'gds-badge--mono' : ''].filter(Boolean).join(' ');
  return <span className={cls} {...rest}>{children}</span>;
}
