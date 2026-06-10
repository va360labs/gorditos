import 'package:flutter/material.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';
import '../../theme/gordi_spacing.dart';
import '../foundation/gordi_pressable.dart';

/// Variants mirror `.gds-card--*`: rounded paper on cream.
/// No colored-left-border cards (explicit DS rule).
enum GordiCardVariant { normal, raised, flat, tint }

/// Rounded paper surface.
///
/// DS source: components/core/Card.jsx + `.gds-card`.
class GordiCard extends StatelessWidget {
  const GordiCard({
    super.key,
    required this.child,
    this.variant = GordiCardVariant.normal,
    this.onTap,
    this.padding = const EdgeInsets.all(GordiSpacing.s6),
  });

  final Widget child;
  final GordiCardVariant variant;

  /// Makes the card interactive (subtle press shrink).
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final (Color bg, List<BoxShadow> shadows, BoxBorder? border) =
        switch (variant) {
          GordiCardVariant.normal => (
            GordiColors.surfaceCard,
            GordiShadows.sm,
            null,
          ),
          GordiCardVariant.raised => (
            GordiColors.surfaceCard,
            GordiShadows.md,
            null,
          ),
          GordiCardVariant.flat => (
            GordiColors.surfaceCard,
            const <BoxShadow>[],
            Border.all(color: GordiColors.borderSoft, width: 1.5),
          ),
          GordiCardVariant.tint => (
            GordiColors.surfaceSoft,
            const <BoxShadow>[],
            null,
          ),
        };

    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: GordiRadii.rLg,
        boxShadow: shadows,
        border: border,
      ),
      child: child,
    );

    if (onTap == null) return card;
    return GordiPressable(onTap: onTap, scale: 0.985, child: card);
  }
}
