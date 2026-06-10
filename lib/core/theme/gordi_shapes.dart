import 'package:flutter/material.dart';

/// GorditOS radii & shadows — generous, friendly rounding; soft,
/// warm brown-tinted shadows (never cold/gray).
///
/// Source: doc/design/design-system/project/tokens/radii.css
abstract final class GordiRadii {
  static const double xs = 6;
  static const double sm = 10;
  static const double md = 14; // default control / chip
  static const double lg = 20; // cards
  static const double xl = 28; // sheets, big tiles
  static const double xxl = 36; // hero panels
  static const double pill = 999; // buttons, tags, Gordi bubbles

  static BorderRadius get rXs => BorderRadius.circular(xs);
  static BorderRadius get rSm => BorderRadius.circular(sm);
  static BorderRadius get rMd => BorderRadius.circular(md);
  static BorderRadius get rLg => BorderRadius.circular(lg);
  static BorderRadius get rXl => BorderRadius.circular(xl);
  static BorderRadius get rPill => BorderRadius.circular(pill);
}

abstract final class GordiShadows {
  static const _warm = Color(0xFF4A381E); // warm brown shadow base

  static List<BoxShadow> get xs => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.06),
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
  ];
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.08),
      offset: const Offset(0, 2),
      blurRadius: 6,
    ),
  ];
  static List<BoxShadow> get md => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.10),
      offset: const Offset(0, 6),
      blurRadius: 16,
    ),
  ];
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.12),
      offset: const Offset(0, 14),
      blurRadius: 30,
    ),
  ];
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.16),
      offset: const Offset(0, 24),
      blurRadius: 48,
    ),
  ];

  /// Brand glow — celebration / active states.
  static List<BoxShadow> get brand => [
    BoxShadow(
      color: const Color(0xFF2F9E66).withValues(alpha: 0.28),
      offset: const Offset(0, 8),
      blurRadius: 20,
    ),
  ];
  static List<BoxShadow> get apricot => [
    BoxShadow(
      color: const Color(0xFFF2A24E).withValues(alpha: 0.30),
      offset: const Offset(0, 8),
      blurRadius: 20,
    ),
  ];

  /// Kind focus ring (not aggressive).
  static List<BoxShadow> get focusRing => [
    BoxShadow(
      color: const Color(0xFF2F9E66).withValues(alpha: 0.35),
      spreadRadius: 3,
    ),
  ];

  /// Upward shadow for the bottom nav.
  static List<BoxShadow> get navUp => [
    BoxShadow(
      color: _warm.withValues(alpha: 0.08),
      offset: const Offset(0, -2),
      blurRadius: 16,
    ),
  ];
}
