import * as React from 'react';

export interface ProgressRingProps {
  value?: number;
  max?: number;
  /** Big center value, e.g. "4.300". */
  label?: React.ReactNode;
  /** Small sub-label, e.g. "pasos hoy". */
  sub?: React.ReactNode;
  /** Pixel diameter. @default 120 */
  size?: number;
  /** Stroke width. @default 12 */
  stroke?: number;
  /** Arc color (CSS value). @default brand green */
  color?: string;
}

/** Adaptive goal ring (steps, water). Celebrates progress, never failure. */
export function ProgressRing(props: ProgressRingProps): JSX.Element;
