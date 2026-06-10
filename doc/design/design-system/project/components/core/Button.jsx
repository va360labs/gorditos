import React from 'react';

/**
 * GorditOS primary action button. Rounded, warm, springy press.
 * Variants: primary | secondary | soft | ghost | outline. Sizes: sm | md | lg.
 */
export function Button({
  children,
  variant = 'primary',
  size = 'md',
  block = false,
  icon = null,
  iconRight = null,
  disabled = false,
  type = 'button',
  onClick,
  ...rest
}) {
  const cls = [
    'gds-btn',
    `gds-btn--${variant}`,
    `gds-btn--${size}`,
    block ? 'gds-btn--block' : '',
  ].filter(Boolean).join(' ');

  return (
    <button className={cls} type={type} disabled={disabled} onClick={onClick} {...rest}>
      {icon ? <span className="gds-btn__icon" aria-hidden="true">{icon}</span> : null}
      {children}
      {iconRight ? <span className="gds-btn__icon" aria-hidden="true">{iconRight}</span> : null}
    </button>
  );
}
