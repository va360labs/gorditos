/// GorditOS spacing tokens. 4px base grid.
///
/// Source: doc/design/design-system/project/tokens/spacing.css
abstract final class GordiSpacing {
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16; // default gutter
  static const double s5 = 20;
  static const double s6 = 24; // card padding
  static const double s8 = 32; // section gap
  static const double s10 = 40;
  static const double s12 = 48;
  static const double s16 = 64;

  // Mobile layout
  static const double screenPad = s5; // 20px side gutters
  static const double tapTarget = 44; // min hit target (never smaller)
  static const double bottomNavHeight = 76;
  static const double contentMax = 430; // phone content width
}
