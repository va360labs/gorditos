import * as React from 'react';

/**
 * Chat / coaching speech bubble in Gordi's warm voice.
 * @startingPoint section="Feedback" subtitle="Gordi & user chat speech bubbles" viewport="700x180"
 */
export interface GordiBubbleProps {
  children: React.ReactNode;
  /** Who's speaking. @default "gordi" */
  from?: 'gordi' | 'user';
  /** Mascot image URL (gordi only). */
  avatarSrc?: string;
}

/** Chat / coaching speech bubble in Gordi's warm voice. */
export function GordiBubble(props: GordiBubbleProps): JSX.Element;
