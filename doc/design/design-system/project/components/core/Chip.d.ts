import * as React from 'react';

export interface ChipProps {
  children: React.ReactNode;
  /** Selected state (filled green). @default false */
  selected?: boolean;
  icon?: React.ReactNode;
  onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
}

/** Toggle / filter chip. */
export function Chip(props: ChipProps): JSX.Element;
