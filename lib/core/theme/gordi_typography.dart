import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// GorditOS typography tokens.
///
/// Source: doc/design/design-system/project/tokens/typography.css
/// Display: Baloo 2 (rounded, warm — Gordi's voice & headings)
/// UI/Body: Nunito (rounded humanist sans, excellent Spanish legibility)
/// Mono:    DM Mono (the "OS" / system labels, stat chips)
///
/// ⚠️ Google Fonts substitutions per the DS readme — replace with licensed
/// binaries when available.
abstract final class GordiType {
  static const double display = 40; // onboarding hero, celebrations
  static const double h1 = 32; // screen titles
  static const double h2 = 24; // section titles
  static const double h3 = 20; // card titles
  static const double lg = 18; // lead / Gordi speech
  static const double base = 16; // body
  static const double sm = 14; // secondary
  static const double xs = 12; // captions, labels
  static const double monoSm = 13; // mono chips/labels

  static const double lhTight = 1.1;
  static const double lhSnug = 1.25;
  static const double lhNormal = 1.5;
  static const double lhRelaxed = 1.65;

  /// letter-spacing tokens (em → logical px at given size in styles below)
  static const double lsLabelEm = 0.04;
  static const double lsWideEm = 0.12;

  static TextStyle display2(Color color) => GoogleFonts.baloo2(color: color);
  static TextStyle nunito(Color color) => GoogleFonts.nunito(color: color);
  static TextStyle dmMono(Color color) => GoogleFonts.dmMono(color: color);

  /// Mono label style — stat chips, the "OS" accent, system labels.
  static TextStyle monoLabel({required Color color, double size = monoSm}) =>
      GoogleFonts.dmMono(
        fontSize: size,
        fontWeight: FontWeight.w500,
        letterSpacing: size * lsLabelEm,
        color: color,
      );

  /// The tracked-out uppercase "OS" wordmark accent.
  static TextStyle osAccent({required Color color, double size = base}) =>
      GoogleFonts.dmMono(
        fontSize: size,
        fontWeight: FontWeight.w500,
        letterSpacing: size * lsWideEm,
        color: color,
      );

  /// Builds the app [TextTheme]: Baloo 2 for display/headline/title,
  /// Nunito for body/label. Colors: strong for headings, body for prose.
  static TextTheme textTheme({
    required Color strong,
    required Color body,
    required Color muted,
  }) {
    TextStyle baloo(double size, FontWeight w, Color c, double lh) =>
        GoogleFonts.baloo2(
          fontSize: size,
          fontWeight: w,
          color: c,
          height: lh,
        );
    TextStyle nunito(double size, FontWeight w, Color c, double lh) =>
        GoogleFonts.nunito(
          fontSize: size,
          fontWeight: w,
          color: c,
          height: lh,
        );

    return TextTheme(
      displayLarge: baloo(display, FontWeight.w800, strong, lhTight),
      displayMedium: baloo(h1, FontWeight.w700, strong, lhTight),
      headlineLarge: baloo(h1, FontWeight.w700, strong, lhSnug),
      headlineMedium: baloo(h2, FontWeight.w700, strong, lhSnug),
      headlineSmall: baloo(h3, FontWeight.w700, strong, lhSnug),
      titleLarge: baloo(h3, FontWeight.w600, strong, lhSnug),
      titleMedium: baloo(base, FontWeight.w600, strong, lhSnug),
      titleSmall: nunito(sm, FontWeight.w700, strong, lhSnug),
      bodyLarge: nunito(lg, FontWeight.w600, body, lhNormal),
      bodyMedium: nunito(base, FontWeight.w500, body, lhNormal),
      bodySmall: nunito(sm, FontWeight.w500, muted, lhNormal),
      labelLarge: nunito(base, FontWeight.w700, strong, lhSnug),
      labelMedium: nunito(sm, FontWeight.w700, body, lhSnug),
      labelSmall: nunito(
        xs,
        FontWeight.w700,
        muted,
        lhSnug,
      ).copyWith(letterSpacing: xs * lsLabelEm),
    );
  }
}
