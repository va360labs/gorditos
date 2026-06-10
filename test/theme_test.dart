import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorditos/core/theme/theme.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppTheme', () {
    testWidgets('light theme uses the warm-paper tokens', (tester) async {
      final theme = AppTheme.light;
      expect(theme.colorScheme.primary, GordiColors.green500);
      expect(theme.colorScheme.secondary, GordiColors.apricot500);
      expect(theme.colorScheme.tertiary, GordiColors.sky500);
      expect(theme.scaffoldBackgroundColor, GordiColors.sand100);
      // Anti-pressure: "error" is soft clay, never a harsh red.
      expect(theme.colorScheme.error, GordiColors.clay600);

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const Scaffold(body: Text('hola')),
        ),
      );
      expect(find.text('hola'), findsOneWidget);
    });

    testWidgets('dark theme is warm (never pure black) and renders', (
      tester,
    ) async {
      final theme = AppTheme.dark;
      expect(theme.scaffoldBackgroundColor, isNot(const Color(0xFF000000)));
      expect(theme.colorScheme.brightness, Brightness.dark);

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const Scaffold(body: Text('hola')),
        ),
      );
      expect(find.text('hola'), findsOneWidget);
    });

    testWidgets('garden has no wilted/negative state — soil is warm sand', (
      tester,
    ) async {
      expect(GordiColors.gardenSoil, const Color(0xFFC9B79A));
    });
  });
}
