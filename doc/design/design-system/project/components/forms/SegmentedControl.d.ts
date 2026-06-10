import * as React from 'react';

export interface SegmentOption {
  value: string;
  label: React.ReactNode;
}

export interface SegmentedControlProps {
  options: SegmentOption[];
  value: string;
  onChange?: (value: string) => void;
}

/** Pill segmented control — e.g. exercise level. */
export function SegmentedControl(props: SegmentedControlProps): JSX.Element;
