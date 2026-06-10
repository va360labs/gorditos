import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorditos/features/onboarding/data/onboarding_service.dart';
import 'package:gorditos/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> tapContinue(WidgetTester tester, String label) async {
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  Future<void> selectOption(WidgetTester tester, String label) async {
    final finder = find.text(label);
    await tester.dragUntilVisible(
      finder,
      find.byType(ListView).first,
      const Offset(0, -150),
    );
    await tester.tap(finder);
    await tester.pump();
  }

  testWidgets(
    'AC-22/23/24: el onboarding pregunta contexto (nunca cuerpo), muestra el '
    'disclaimer, persiste y aterriza en Hoy sin volver a aparecer',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      await OnboardingService.instance.init();

      await tester.pumpWidget(const ProviderScope(child: GorditosApp()));
      await tester.pumpAndSettle();

      // Aterriza en el onboarding, con Gordi y el disclaimer (AC-24).
      expect(find.text('¡Hola! Soy Gordi 🌱'), findsOneWidget);
      await tester.dragUntilVisible(
        find.textContaining('no sustituye el consejo de profesionales'),
        find.byType(ListView).first,
        const Offset(0, -200),
      );
      expect(
        find.textContaining('no sustituye el consejo de profesionales'),
        findsOneWidget,
      );

      await tapContinue(tester, '¡Empezamos!');

      // Paso 1 — cómo quieres sentirte (AC-22): no continúa sin elegir.
      expect(
        find.text('¿Cómo te quieres sentir dentro de 3 meses?'),
        findsOneWidget,
      );
      await tapContinue(tester, 'Continuar'); // disabled: sigue en el paso 1
      expect(
        find.text('¿Cómo te quieres sentir dentro de 3 meses?'),
        findsOneWidget,
      );
      await selectOption(tester, '🌱 Todo un poco');
      await tapContinue(tester, 'Continuar');

      // Paso 2 — nivel de actividad.
      await selectOption(tester, '🚶 Me muevo algo');
      await tapContinue(tester, 'Continuar');

      // Paso 3 — tiempo disponible.
      await selectOption(tester, '⏱️ Unos 20 minutos');
      await tapContinue(tester, 'Continuar');

      // Paso 4 — equipamiento (opcional: "Nada, y no pasa nada").
      await tester.dragUntilVisible(
        find.text('Nada, y no pasa nada ✓'),
        find.byType(ListView).first,
        const Offset(0, -150),
      );
      expect(find.text('Nada, y no pasa nada ✓'), findsOneWidget);
      await tapContinue(tester, 'Continuar');

      // Paso 5 — preferencias alimentarias (opcional).
      await selectOption(tester, '🥦 Vegetariano');
      await tapContinue(tester, 'Continuar');

      // Paso 6 — hora de motivación (default mañana).
      await tapContinue(tester, 'Continuar');

      // Paso 7 — elegir a Gordi (default Brote).
      expect(find.text('Elige a tu Gordi'), findsOneWidget);
      await tapContinue(tester, 'Continuar');

      // Paso 8 — celebración y entrada a la app.
      expect(find.text('¡Listo! Tu jardín te espera'), findsOneWidget);
      await tapContinue(tester, '¡Vamos a mi jardín!');

      expect(find.text('Tus hábitos de hoy'), findsOneWidget);
      expect(OnboardingService.instance.done, isTrue);
      expect(
        OnboardingService.instance.preferences['dietary'],
        contains('vegetariano'),
      );
      // Ningún dato corporal en lo persistido (AC-22).
      expect(
        OnboardingService.instance.preferences.keys,
        isNot(
          anyElement(
            anyOf(contains('weight'), contains('height'), contains('body')),
          ),
        ),
      );
    },
  );

  testWidgets('con onboarding completado se arranca directo en Hoy', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({'onboarding_done': true});
    await OnboardingService.instance.init();

    await tester.pumpWidget(const ProviderScope(child: GorditosApp()));
    await tester.pumpAndSettle();

    expect(find.text('Tus hábitos de hoy'), findsOneWidget);
    expect(find.text('¡Hola! Soy Gordi 🌱'), findsNothing);
  });
}
