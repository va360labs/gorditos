import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/widgets.dart';

/// App shell: 5 bottom tabs sobre StatefulShellRoute (estado por tab).
/// AC-01: Hoy · Cocina · Muévete · Gordi · Mi jardín.
class HomeShellPage extends StatelessWidget {
  const HomeShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const tabs = [
    GordiNavItem(id: 'hoy', icon: '☀️', label: 'Hoy'),
    GordiNavItem(id: 'cocina', icon: '🥗', label: 'Cocina'),
    GordiNavItem(id: 'muevete', icon: '🤸', label: 'Muévete'),
    GordiNavItem(id: 'gordi', icon: '💬', label: 'Gordi'),
    GordiNavItem(id: 'jardin', icon: '🌱', label: 'Mi jardín'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: GordiBottomNav(
        items: tabs,
        current: tabs[navigationShell.currentIndex].id,
        onChanged: (id) {
          final index = tabs.indexWhere((t) => t.id == id);
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
