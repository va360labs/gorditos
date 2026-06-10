import React from 'react';

/** Circular icon-only button. Use `bare` for toolbar/inline contexts. */
export function IconButton({ children, label, bare = false, onClick, ...rest }) {
  const cls = ['gds-iconbtn', bare ? 'gds-iconbtn--bare' : ''].filter(Boolean).join(' ');
  return (
    <button className={cls} aria-label={label} onClick={onClick} {...rest}>
      <span aria-hidden="true">{children}</span>
    </button>
  );
}
