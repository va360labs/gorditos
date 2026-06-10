import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorditos/core/theme/theme.dart';
import 'package:gorditos/features/auth/presentation/login_page.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('login valida correo y contraseña inline antes de enviar', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.light, home: const LoginPage()),
      ),
    );

    await tester.enterText(find.byType(TextField).first, 'sin-arroba');
    await tester.enterText(find.byType(TextField).last, '123');
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();

    expect(find.text('Ese correo no parece completo'), findsOneWidget);
    expect(find.text('Al menos 6 caracteres'), findsOneWidget);
  });

  testWidgets('login muestra el logo y el disclaimer obligatorio', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.light, home: const LoginPage()),
      ),
    );
    // Frame extra: en Flutter ≥3.44 la resolución del asset puede diferir
    // la primera materialización del subárbol de la imagen.
    await tester.pump();
    expect(find.byKey(const Key('logo_gorditos')), findsOneWidget);
    expect(
      find.textContaining('no sustituye el consejo de profesionales'),
      findsOneWidget,
    );
  });
}
