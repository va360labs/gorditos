import 'package:flutter/material.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';
import '../../theme/gordi_spacing.dart';
import '../foundation/gordi_pressable.dart';

/// Circular icon-only button (44×44 tap target). `bare` for toolbar/inline.
///
/// DS source: components/core/IconButton.jsx + `.gds-iconbtn`.
class GordiIconButton extends StatelessWidget {
  const GordiIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.bare = false,
  });

  final Widget icon;

  /// Accessibility label (the DS makes it mandatory).
  final String label;
  final VoidCallback? onPressed;
  final bool bare;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GordiPressable(
        onTap: onPressed,
        scale: 0.92,
        child: Container(
          width: GordiSpacing.tapTarget,
          height: GordiSpacing.tapTarget,
          decoration: BoxDecoration(
            color: bare ? Colors.transparent : GordiColors.surfaceCard,
            borderRadius: GordiRadii.rPill,
            boxShadow: bare ? const [] : GordiShadows.sm,
          ),
          alignment: Alignment.center,
          child: IconTheme(
            data: const IconThemeData(color: GordiColors.ink700, size: 22),
            child: icon,
          ),
        ),
      ),
    );
  }
}
