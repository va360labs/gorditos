import * as React from 'react';

export interface AvatarProps {
  /** Image URL. If omitted, shows initials. */
  src?: string;
  initials?: string;
  /** Pixel diameter. @default 40 */
  size?: number;
  alt?: string;
}

/** Round avatar (image or initials). */
export function Avatar(props: AvatarProps): JSX.Element;
