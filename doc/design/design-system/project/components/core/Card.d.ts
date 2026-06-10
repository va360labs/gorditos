import * as React from 'react';

/**
 * The base surface — rounded paper card on cream.
 * @startingPoint section="Core" subtitle="Rounded paper surfaces: default / raised / flat / tint" viewport="700x200"
 */
export interface CardProps {
  children: React.ReactNode;
  /** @default "default" */
  variant?: 'default' | 'raised' | 'flat' | 'tint';
  /** Lift + shadow on hover. @default false */
  interactive?: boolean;
  className?: string;
}

/** Rounded paper card surface. */
export function Card(props: CardProps): JSX.Element;
