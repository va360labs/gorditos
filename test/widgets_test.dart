import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorditos/core/theme/theme.dart';
import 'package:gorditos/core/widgets/widgets.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(body: Center(child: child)),
);

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('GordiButton', () {
    testWidgets('renders label and fires onPressed', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(GordiButton(label: '¡Vamos!', onPressed: () => taps++)),
      );
      expect(find.text('¡Vamos!'), findsOneWidget);
      await tester.tap(find.text('¡Vamos!'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('disabled button does not fire', (tester) async {
      await tester.pumpWidget(
        _wrap(const GordiButton(label: 'Sin prisa', onPressed: null)),
      );
      await tester.tap(find.text('Sin prisa'), warnIfMissed: false);
      await tester.pumpAndSettle();
      // No exception + still renders = pass; opacity marks the state.
      expect(find.byType(Opacity), findsOneWidget);
    });

    testWidgets('all variants render', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Column(
            children: [
              for (final v in GordiButtonVariant.values)
                GordiButton(label: v.name, variant: v, onPressed: () {}),
            ],
          ),
        ),
      );
      for (final v in GordiButtonVariant.values) {
        expect(find.text(v.name), findsOneWidget);
      }
    });
  });

  group('HabitTile', () {
    testWidgets('whole tile is one tap target and toggles', (tester) async {
      var toggles = 0;
      await tester.pumpWidget(
        _wrap(
          HabitTile(
            icon: '💧',
            name: 'Beber agua',
            onToggle: () => toggles++,
          ),
        ),
      );
      // 1 tap anywhere on the tile registers the habit (AC-16 fricción mínima).
      await tester.tap(find.text('Beber agua'));
      await tester.pumpAndSettle();
      expect(toggles, 1);
    });

    testWidgets('done state shows the check, pending stays neutral', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const Column(
            children: [
              HabitTile(icon: '💧', name: 'Hecho', done: true),
              HabitTile(icon: '🥗', name: 'Pendiente'),
            ],
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsOneWidget);
      // Neutral pending: no warning/error iconography whatsoever (AC-17).
      expect(find.byIcon(Icons.warning), findsNothing);
      expect(find.byIcon(Icons.error), findsNothing);
      expect(find.byIcon(Icons.close), findsNothing);
    });
  });

  group('GardenGrid', () {
    testWidgets('renders one cell per day with garden glyphs', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 350,
            child: GardenGrid(
              days: [
                GardenDayState.soil,
                GardenDayState.sprout,
                GardenDayState.grown,
                GardenDayState.bloom,
              ],
            ),
          ),
        ),
      );
      expect(find.text('🌱'), findsOneWidget);
      expect(find.text('🌿'), findsOneWidget);
      expect(find.text('🌸'), findsOneWidget);
    });
  });

  group('GordiBottomNav', () {
    testWidgets('no desborda con inset inferior del sistema (gesture bar)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: MediaQuery(
            // Simula la barra de gestos de Android / home indicator de iOS.
            data: const MediaQueryData(padding: EdgeInsets.only(bottom: 24)),
            child: Scaffold(
              body: const SizedBox.expand(),
              bottomNavigationBar: GordiBottomNav(
                items: const [
                  GordiNavItem(id: 'hoy', icon: '☀️', label: 'Hoy'),
                  GordiNavItem(id: 'cocina', icon: '🥗', label: 'Cocina'),
                  GordiNavItem(id: 'muevete', icon: '🤸', label: 'Muévete'),
                  GordiNavItem(id: 'gordi', icon: '💬', label: 'Gordi'),
                  GordiNavItem(id: 'jardin', icon: '🌱', label: 'Mi jardín'),
                ],
                current: 'hoy',
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );
      // Un overflow de render se reporta como excepción del framework.
      expect(tester.takeException(), isNull);
      expect(find.text('Mi jardín'), findsOneWidget);
    });

    testWidgets('switches tabs via callback', (tester) async {
      String? selected;
      await tester.pumpWidget(
        _wrap(
          GordiBottomNav(
            items: const [
              GordiNavItem(id: 'hoy', icon: '☀️', label: 'Hoy'),
              GordiNavItem(id: 'gordi', icon: '💬', label: 'Gordi'),
            ],
            current: 'hoy',
            onChanged: (id) => selected = id,
          ),
        ),
      );
      await tester.tap(find.text('Gordi'));
      expect(selected, 'gordi');
    });
  });

  group('GordiSwitch', () {
    testWidgets('toggles via tap', (tester) async {
      var value = false;
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => GordiSwitch(
              value: value,
              label: 'Tip diario',
              onChanged: (v) => setState(() => value = v),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(GordiSwitch));
      await tester.pumpAndSettle();
      expect(value, isTrue);
    });
  });

  group('GordiSegmentedControl', () {
    testWidgets('selects option', (tester) async {
      String period = 'semana';
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => GordiSegmentedControl<String>(
              options: const [
                GordiSegmentOption(value: 'semana', label: 'Semana'),
                GordiSegmentOption(value: 'mes', label: 'Mes'),
              ],
              value: period,
              onChanged: (v) => setState(() => period = v),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Mes'));
      await tester.pumpAndSettle();
      expect(period, 'mes');
    });
  });
}
