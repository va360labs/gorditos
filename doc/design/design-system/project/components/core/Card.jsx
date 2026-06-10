import React from 'react';

/** Rounded paper surface. Variants: default | raised | flat | tint. */
export function Card({ children, variant = 'default', interactive = false, className = '', ...rest }) {
  const cls = [
    'gds-card',
    variant !== 'default' ? `gds-card--${variant}` : '',
    interactive ? 'gds-card--interactive' : '',
    className,
  ].filter(Boolean).join(' ');
  return <div className={cls} {...rest}>{children}</div>;
}
