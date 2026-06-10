import * as React from 'react';

export type GardenDayState = 'soil' | 'sprout' | 'grown' | 'bloom';

/**
 * The habit garden — the emotional core. Growth only, no decay.
 * @startingPoint section="App" subtitle="The 'jardín de hábitos' month grid" viewport="700x220"
 */
export interface GardenGridProps {
  /** One entry per day. Empty days are 'soil' (tierra), never wilted. */
  days: GardenDayState[];
  /** Days per row. @default 7 */
  columns?: number;
}

/** The habit garden — the emotional core. Growth only, no decay. */
export function GardenGrid(props: GardenGridProps): JSX.Element;
