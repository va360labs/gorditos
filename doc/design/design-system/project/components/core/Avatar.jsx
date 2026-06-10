import React from 'react';

/** Round avatar. Pass `src` for image, else `initials` on a tinted circle. */
export function Avatar({ src, initials = '', size = 40, alt = '', ...rest }) {
  const style = { width: size, height: size, fontSize: Math.round(size * 0.42) };
  return (
    <span className="gds-avatar" style={style} {...rest}>
      {src ? <img src={src} alt={alt} style={{ width: '100%', height: '100%', objectFit: 'cover' }} /> : initials}
    </span>
  );
}
