import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';
import '../foundation/gordi_pressable.dart';

/// Variants mirror the DS `.gds-btn--*` classes.
enum GordiButtonVariant { primary, secondary, soft, ghost, outline }

enum GordiButtonSize { sm, md, lg }

/// GorditOS primary action button. Rounded pill, warm, springy press.
///
/// DS source: components/core/Button.jsx + components.css `.gds-btn`.
class GordiButton extends StatelessWidget {
  const GordiButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = GordiButtonVariant.primary,
    this.size = GordiButtonSize.md,
    this.block = false,
    this.icon,
    this.iconRight,
  });

  final String label;
  final VoidCallback? onPressed;
  final GordiButtonVariant variant;
  final GordiButtonSize size;
  final bool block;
  final Widget? icon;
  final Widget? iconRight;

  bool get _disabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final (fontSize, padding, minHeight) = switch (size) {
      GordiButtonSize.sm => (
        14.0,
        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        38.0,
      ),
      GordiButtonSize.md => (
        16.0,
        const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        44.0,
      ),
      GordiButtonSize.lg => (
        18.0,
        const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        54.0,
      ),
    };

    final (Color bg, Color fg, List<BoxShadow> shadows, BoxBorder? border) =
        switch (variant) {
          GordiButtonVariant.primary => (
            GordiColors.brandPrimary,
            GordiColors.textOnBrand,
            GordiShadows.brand,
            null,
          ),
          GordiButtonVariant.secondary => (
            GordiColors.brandSecondary,
            GordiColors.ink900,
            GordiShadows.apricot,
            null,
          ),
          GordiButtonVariant.soft => (
            GordiColors.green50,
            GordiColors.green700,
            const <BoxShadow>[],
            null,
          ),
          GordiButtonVariant.ghost => (
            Colors.transparent,
            GordiColors.ink700,
            const <BoxShadow>[],
            null,
          ),
          GordiButtonVariant.outline => (
            Colors.transparent,
            GordiColors.green700,
            const <BoxShadow>[],
            Border.all(color: GordiColors.green200, width: 2),
          ),
        };

    final textStyle = GoogleFonts.baloo2(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: fg,
      height: 1,
    );

    Widget child = Container(
      constraints: BoxConstraints(minHeight: minHeight),
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: GordiRadii.rPill,
        boxShadow: _disabled ? const [] : shadows,
        border: border,
      ),
      child: Row(
        mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(color: fg, size: fontSize + 4),
              child: icon!,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(label, style: textStyle, textAlign: TextAlign.center),
          ),
          if (iconRight != null) ...[
            const SizedBox(width: 8),
            IconTheme(
              data: IconThemeData(color: fg, size: fontSize + 4),
              child: iconRight!,
            ),
          ],
        ],
      ),
    );

    if (_disabled) child = Opacity(opacity: 0.45, child: child);

    return Semantics(
      button: true,
      enabled: !_disabled,
      label: label,
      child: GordiPressable(
        onTap: onPressed,
        enabled: !_disabled,
        child: child,
      ),
    );
  }
}
