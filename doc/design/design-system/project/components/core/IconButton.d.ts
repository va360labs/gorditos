import * as React from 'react';

export interface IconButtonProps {
  /** Icon glyph / svg node. */
  children: React.ReactNode;
  /** Accessible label (required — icon-only). */
  label: string;
  /** Transparent, no shadow — for toolbars. @default false */
  bare?: boolean;
  onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
}

/** Circular 44px icon button. */
export function IconButton(props: IconButtonProps): JSX.Element;
