import * as React from 'react';

/**
 * Props for the GorditOS action button.
 * @startingPoint section="Core" subtitle="Primary / secondary / soft / ghost / outline buttons" viewport="700x150"
 */
export interface ButtonProps {
  children: React.ReactNode;
  /** Visual role. @default "primary" */
  variant?: 'primary' | 'secondary' | 'soft' | 'ghost' | 'outline';
  /** @default "md" */
  size?: 'sm' | 'md' | 'lg';
  /** Stretch to full container width. @default false */
  block?: boolean;
  /** Leading icon node (emoji, svg, icon font glyph). */
  icon?: React.ReactNode;
  /** Trailing icon node. */
  iconRight?: React.ReactNode;
  disabled?: boolean;
  type?: 'button' | 'submit' | 'reset';
  onClick?: (e: React.MouseEvent<HTMLButtonElement>) => void;
}

/** The GorditOS action button — rounded pill, warm, springy on press. */
export function Button(props: ButtonProps): JSX.Element;
