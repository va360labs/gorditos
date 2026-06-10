import * as React from 'react';

export interface BadgeProps {
  children: React.ReactNode;
  /** @default "green" */
  tone?: 'green' | 'apricot' | 'sky' | 'berry' | 'neutral';
  /** Monospace, tracked-out — for counts/stats. @default false */
  mono?: boolean;
}

/** Small status / count pill. */
export function Badge(props: BadgeProps): JSX.Element;
