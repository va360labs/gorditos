import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorditos/core/widgets/widgets.dart';
import 'package:gorditos/features/onboarding/data/onboarding_service.dart';
import 'package:gorditos/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() async {
    // El shell se prueba con el onboarding ya completado.
    SharedPreferences.setMockInitialValues({'onboarding_done': true});
    await OnboardingService.instance.init();
  });

  Finder navTab(String label) => find.descendant(
    of: find.byType(GordiBottomNav),
    matching: find.text(label),
  );

  testWidgets(
    'AC-01: el shell arranca en Hoy y navega los 5 tabs con título correcto',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: GorditosApp()));
      await tester.pumpAndSettle();

      // Sin Supabase configurado (modo demo) aterrizamos en Hoy.
      expect(find.text('Tus hábitos de hoy'), findsOneWidget);

      await tester.tap(navTab('Cocina'));
      await tester.pumpAndSettle();
      expect(find.text('Cocina'), findsWidgets);

      await tester.tap(navTab('Muévete'));
      await tester.pumpAndSettle();
      expect(find.text('Muévete'), findsWidgets);

      await tester.tap(navTab('Gordi'));
      await tester.pumpAndSettle();
      expect(find.textContaining('charlar'), findsOneWidget);

      await tester.tap(navTab('Mi jardín'));
      await tester.pumpAndSettle();
      expect(find.byType(GardenGrid), findsOneWidget);

      await tester.tap(navTab('Hoy'));
      await tester.pumpAndSettle();
      expect(find.text('Tus hábitos de hoy'), findsOneWidget);
    },
  );

  testWidgets('AC-16/AC-17: check de hábito en 1 tap con celebración amable', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: GorditosApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Beber agua'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('Hidratación'), findsWidgets);
    await tester.pumpAndSettle();
  });
}
