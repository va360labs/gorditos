import 'package:flutter/animation.dart';

/// GorditOS motion tokens — soft, springy, never abrupt.
/// No infinite looping on content; confetti only on genuine celebrations.
///
/// Source: doc/design/design-system/project/tokens/radii.css (motion block)
abstract final class GordiMotion {
  static const fast = Duration(milliseconds: 140);
  static const base = Duration(milliseconds: 240);
  static const slow = Duration(milliseconds: 420);

  /// Gentle overshoot — press & check-in.
  static const easeSoft = Cubic(0.34, 1.56, 0.64, 1);
  static const easeOut = Cubic(0.22, 1, 0.36, 1);
  static const easeInOut = Cubic(0.65, 0, 0.35, 1);

  /// Press = shrink.
  static const pressScale = 0.96;
}
