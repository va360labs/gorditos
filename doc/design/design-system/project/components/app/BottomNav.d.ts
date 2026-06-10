import * as React from 'react';

export interface NavItem {
  id: string;
  icon: React.ReactNode;
  label: React.ReactNode;
}

export interface BottomNavProps {
  items: NavItem[];
  current: string;
  onChange?: (id: string) => void;
}

/** App bottom tab bar. */
export function BottomNav(props: BottomNavProps): JSX.Element;
