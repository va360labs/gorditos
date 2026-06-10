import 'package:flutter/material.dart';

/// GorditOS color tokens — "warm paper + growing garden".
///
/// Source of truth: doc/design/design-system/project/tokens/colors.css
/// No harsh error reds (anti-pressure ethos): the strongest negative is a
/// soft clay used only for gentle attention.
abstract final class GordiColors {
  // ---- Warm neutrals (sand / paper / ink) ----
  static const sand50 = Color(0xFFFDFAF4);
  static const sand100 = Color(0xFFFBF4E9); // app page background
  static const sand200 = Color(0xFFF4EADB);
  static const sand300 = Color(0xFFE9DAC4);
  static const sand400 = Color(0xFFD6C2A4);
  static const sand500 = Color(0xFFBBA47F);

  static const paper = Color(0xFFFFFDF9); // card / sheet surface
  static const white = Color(0xFFFFFFFF);

  static const ink900 = Color(0xFF2B2722); // primary text — warm near-black
  static const ink700 = Color(0xFF4E473D); // strong secondary text
  static const ink500 = Color(0xFF7C7264); // muted text / captions
  static const ink400 = Color(0xFF9E9384); // placeholder / disabled text
  static const ink300 = Color(0xFFC3B9A8); // hairline on sand

  // ---- Primary — Verde (growth / leaf / the habit garden) ----
  static const green50 = Color(0xFFE9F6EE);
  static const green100 = Color(0xFFCFEBDA);
  static const green200 = Color(0xFFA6DBBC);
  static const green300 = Color(0xFF79C99C);
  static const green400 = Color(0xFF4FB37E);
  static const green500 = Color(0xFF2F9E66); // PRIMARY
  static const green600 = Color(0xFF248555); // hover
  static const green700 = Color(0xFF1B6A43); // pressed / text-on-light
  static const green800 = Color(0xFF134E32);

  // ---- Apricot — celebration / food / joy (secondary) ----
  static const apricot50 = Color(0xFFFDF1E5);
  static const apricot100 = Color(0xFFFBE0C7);
  static const apricot300 = Color(0xFFF8C28C);
  static const apricot500 = Color(0xFFF2A24E); // SECONDARY
  static const apricot600 = Color(0xFFE2872B); // hover
  static const apricot700 = Color(0xFFBC6C1C);

  // ---- Sky — calma / sueño / hidratación (tertiary) ----
  static const sky50 = Color(0xFFE7F3F8);
  static const sky100 = Color(0xFFC9E5EF);
  static const sky300 = Color(0xFF93CFE2);
  static const sky500 = Color(0xFF57B0CF); // TERTIARY
  static const sky600 = Color(0xFF3A93B4);
  static const sky700 = Color(0xFF2A7191);

  // ---- Berry — accent for variety, badges, confetti (use sparingly) ----
  static const berry100 = Color(0xFFF7DBE5);
  static const berry500 = Color(0xFFD86A8E);
  static const berry600 = Color(0xFFC24E74);

  // ---- Clay — the ONLY "attention" hue. Soft, never alarming ----
  static const clay100 = Color(0xFFF8E2D4);
  static const clay500 = Color(0xFFE08A5D);
  static const clay600 = Color(0xFFC76E40);

  // ============================================================
  // SEMANTIC ALIASES — author against these, not raw scales.
  // ============================================================

  // Surfaces & background
  static const bgApp = sand100;
  static const bgSunken = sand200;
  static const surfaceCard = paper;
  static const surfaceRaised = white;
  static const surfaceSoft = green50; // tinted info panels

  // Text
  static const textStrong = ink900;
  static const textBody = ink700;
  static const textMuted = ink500;
  static const textDisabled = ink400;
  static const textOnBrand = white;
  static const textLink = green700;

  // Brand roles
  static const brandPrimary = green500;
  static const brandPrimaryHover = green600;
  static const brandPrimaryPress = green700;
  static const brandSecondary = apricot500;
  static const brandTertiary = sky500;

  // Habit categories (the garden)
  static const habitAgua = sky500;
  static const habitEjercicio = apricot500;
  static const habitComida = green500;
  static const habitSueno = berry500;
  static const habitCalma = Color(0xFF8E86D6); // soft lavender
  static const habitPasos = clay500;

  // Borders & lines
  static const borderSoft = sand300;
  static const borderStrong = ink300;
  static const borderBrand = green200;

  // Feedback (kept gentle)
  static const feedbackSuccess = green500;
  static const feedbackCelebrate = apricot500;
  static const feedbackCalm = sky500;
  static const feedbackAttention = clay500;

  // Garden states — empty day = soil, never a wilted plant
  static const gardenSoil = Color(0xFFC9B79A);
  static const gardenSprout = green300;
  static const gardenGrown = green500;
  static const gardenBloom = apricot500;
}

/// Warm-dark counterparts.
///
/// ⚠️ PROPOSAL: the design system ships light-only ("warm paper"). These
/// derive a warm dark mode from the same sand/ink ramps (PRD §7.1 requires
/// light + dark). Pending validation against a future dark spec — keep all
/// dark-mode reads going through [GordiColorsDark] so a swap is one-file.
abstract final class GordiColorsDark {
  static const bgApp = Color(0xFF211D19);
  static const bgSunken = Color(0xFF1A1714);
  static const surfaceCard = Color(0xFF2B2722); // = light ink900
  static const surfaceRaised = Color(0xFF332E28);
  static const surfaceSoft = Color(0xFF1E3528); // green-tinted panel

  static const textStrong = GordiColors.sand100;
  static const textBody = GordiColors.sand300;
  static const textMuted = GordiColors.sand500;
  static const textDisabled = Color(0xFF8A8073);
  static const textLink = GordiColors.green300;

  static const brandPrimary = GordiColors.green400; // brighter for contrast
  static const brandPrimaryHover = GordiColors.green300;
  static const brandPrimaryPress = GordiColors.green500;

  static const borderSoft = Color(0xFF453E35);
  static const borderStrong = Color(0xFF5C5347);

  static const gardenSoil = Color(0xFF5C5142);
}
