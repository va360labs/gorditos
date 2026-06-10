import * as React from 'react';

/**
 * One-tap habit row — the core interaction of GorditOS.
 * @startingPoint section="App" subtitle="One-tap habit row for the Hoy screen" viewport="700x120"
 */
export interface HabitTileProps {
  /** Icon glyph (emoji / svg). */
  icon: React.ReactNode;
  name: React.ReactNode;
  /** Secondary line, e.g. "≤30 min" or "6/8 vasos". */
  meta?: React.ReactNode;
  /** Completed today. @default false */
  done?: boolean;
  /** Category color (CSS value). @default comida green */
  color?: string;
  onToggle?: () => void;
}

/** One-tap habit row — the core interaction of GorditOS. */
export function HabitTile(props: HabitTileProps): JSX.Element;
