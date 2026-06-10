import * as React from 'react';

export interface SwitchProps {
  checked?: boolean;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  /** Accessible label. */
  label?: string;
}

/** Green toggle switch. */
export function Switch(props: SwitchProps): JSX.Element;
