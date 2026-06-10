import React from 'react';

/**
 * Gordi's voice — a speech bubble paired with the mascot.
 * `from="gordi"` (left, mascot shown) or `from="user"` (right, green bubble).
 */
export function GordiBubble({ children, from = 'gordi', avatarSrc, ...rest }) {
  const cls = ['gds-gordi', from === 'user' ? 'gds-gordi--user' : ''].filter(Boolean).join(' ');
  return (
    <div className={cls} {...rest}>
      {from === 'gordi' ? (
        avatarSrc
          ? <img src={avatarSrc} alt="Gordi" />
          : <span className="av" aria-hidden="true">🌱</span>
      ) : null}
      <div className="bubble">{children}</div>
    </div>
  );
}
