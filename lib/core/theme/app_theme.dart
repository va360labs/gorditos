import 'package:flutter/material.dart';

import 'gordi_colors.dart';
import 'gordi_shapes.dart';
import 'gordi_spacing.dart';
import 'gordi_typography.dart';

/// GorditOS ThemeData — wires the design tokens into Material 3.
///
/// Light is the canonical "warm paper" theme from the design system.
/// Dark is a warm-dark derivation (see [GordiColorsDark] caveat).
abstract final class AppTheme {
  static ThemeData get light {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: GordiColors.brandPrimary,
      onPrimary: GordiColors.textOnBrand,
      primaryContainer: GordiColors.green100,
      onPrimaryContainer: GordiColors.green800,
      secondary: GordiColors.brandSecondary,
      onSecondary: GordiColors.ink900,
      secondaryContainer: GordiColors.apricot100,
      onSecondaryContainer: GordiColors.apricot700,
      tertiary: GordiColors.brandTertiary,
      onTertiary: GordiColors.white,
      tertiaryContainer: GordiColors.sky100,
      onTertiaryContainer: GordiColors.sky700,
      // "Error" stays gentle: clay, never alarming red (anti-pressure).
      error: GordiColors.clay600,
      onError: GordiColors.white,
      errorContainer: GordiColors.clay100,
      onErrorContainer: GordiColors.clay600,
      surface: GordiColors.surfaceCard,
      onSurface: GordiColors.textStrong,
      surfaceContainerLowest: GordiColors.white,
      surfaceContainerLow: GordiColors.sand50,
      surfaceContainer: GordiColors.sand100,
      surfaceContainerHigh: GordiColors.sand200,
      surfaceContainerHighest: GordiColors.sand300,
      onSurfaceVariant: GordiColors.textBody,
      outline: GordiColors.borderSoft,
      outlineVariant: GordiColors.borderStrong,
      shadow: Color(0xFF4A381E),
      scrim: Color(0x804A381E),
      inverseSurface: GordiColors.ink900,
      onInverseSurface: GordiColors.sand100,
      inversePrimary: GordiColors.green200,
    );

    return _base(
      scheme: scheme,
      scaffoldBg: GordiColors.bgApp,
      textTheme: GordiType.textTheme(
        strong: GordiColors.textStrong,
        body: GordiColors.textBody,
        muted: GordiColors.textMuted,
      ),
      navUnselected: GordiColors.ink400,
      navSelected: GordiColors.green600,
      indicator: GordiColors.green100,
      inputFill: GordiColors.surfaceCard,
      inputBorder: GordiColors.borderSoft,
      inputFocus: GordiColors.green400,
      hint: GordiColors.textDisabled,
      switchTrackOff: GordiColors.sand300,
    );
  }

  static ThemeData get dark {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: GordiColorsDark.brandPrimary,
      onPrimary: GordiColors.ink900,
      primaryContainer: GordiColors.green800,
      onPrimaryContainer: GordiColors.green100,
      secondary: GordiColors.apricot500,
      onSecondary: GordiColors.ink900,
      secondaryContainer: GordiColors.apricot700,
      onSecondaryContainer: GordiColors.apricot100,
      tertiary: GordiColors.sky500,
      onTertiary: GordiColors.ink900,
      tertiaryContainer: GordiColors.sky700,
      onTertiaryContainer: GordiColors.sky100,
      error: GordiColors.clay500,
      onError: GordiColors.ink900,
      errorContainer: GordiColors.clay600,
      onErrorContainer: GordiColors.clay100,
      surface: GordiColorsDark.surfaceCard,
      onSurface: GordiColorsDark.textStrong,
      surfaceContainerLowest: GordiColorsDark.bgSunken,
      surfaceContainerLow: GordiColorsDark.bgApp,
      surfaceContainer: GordiColorsDark.surfaceCard,
      surfaceContainerHigh: GordiColorsDark.surfaceRaised,
      surfaceContainerHighest: Color(0xFF3D3730),
      onSurfaceVariant: GordiColorsDark.textBody,
      outline: GordiColorsDark.borderSoft,
      outlineVariant: GordiColorsDark.borderStrong,
      shadow: Color(0xFF000000),
      scrim: Color(0x80000000),
      inverseSurface: GordiColors.sand100,
      onInverseSurface: GordiColors.ink900,
      inversePrimary: GordiColors.green700,
    );

    return _base(
      scheme: scheme,
      scaffoldBg: GordiColorsDark.bgApp,
      textTheme: GordiType.textTheme(
        strong: GordiColorsDark.textStrong,
        body: GordiColorsDark.textBody,
        muted: GordiColorsDark.textMuted,
      ),
      navUnselected: GordiColorsDark.textMuted,
      navSelected: GordiColorsDark.brandPrimaryHover,
      indicator: GordiColors.green800,
      inputFill: GordiColorsDark.surfaceCard,
      inputBorder: GordiColorsDark.borderSoft,
      inputFocus: GordiColorsDark.brandPrimary,
      hint: GordiColorsDark.textDisabled,
      switchTrackOff: GordiColorsDark.borderStrong,
    );
  }

  static ThemeData _base({
    required ColorScheme scheme,
    required Color scaffoldBg,
    required TextTheme textTheme,
    required Color navUnselected,
    required Color navSelected,
    required Color indicator,
    required Color inputFill,
    required Color inputBorder,
    required Color inputFocus,
    required Color hint,
    required Color switchTrackOff,
  }) {
    OutlineInputBorder border(Color c, [double w = 1.5]) =>
        OutlineInputBorder(
          borderRadius: GordiRadii.rMd,
          borderSide: BorderSide(color: c, width: w),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBg,
      textTheme: textTheme,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBg,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: GordiRadii.rLg),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: GordiSpacing.bottomNavHeight,
        backgroundColor: scheme.surface,
        indicatorColor: indicator,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => textTheme.labelSmall!.copyWith(
            color: states.contains(WidgetState.selected)
                ? navSelected
                : navUnselected,
            letterSpacing: 0,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? navSelected
                : navUnselected,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        hintStyle: textTheme.bodyMedium!.copyWith(color: hint),
        labelStyle: textTheme.labelMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        enabledBorder: border(inputBorder),
        focusedBorder: border(inputFocus, 2),
        errorBorder: border(scheme.error),
        focusedErrorBorder: border(scheme.error, 2),
      ),
      switchTheme: SwitchThemeData(
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        thumbColor: const WidgetStatePropertyAll(Colors.white),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? scheme.primary
              : switchTrackOff,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium!.copyWith(
          color: scheme.onInverseSurface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: GordiRadii.rMd),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(borderRadius: GordiRadii.rXl),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
