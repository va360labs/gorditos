import * as React from 'react';

export interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  hint?: string;
}

/** Labelled text input with focus ring + optional hint. */
export function Input(props: InputProps): JSX.Element;
