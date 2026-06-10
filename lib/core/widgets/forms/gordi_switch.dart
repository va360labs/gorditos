import 'package:flutter/material.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_motion.dart';
import '../../theme/gordi_shapes.dart';

/// Toggle switch — 52×30 track, 24px thumb, springy travel.
///
/// DS source: components/forms/Switch.jsx + `.gds-switch`.
class GordiSwitch extends StatelessWidget {
  const GordiSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  /// Accessibility label.
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      toggled: value,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: SizedBox(
          width: 52,
          height: 30,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: GordiMotion.base,
                curve: GordiMotion.easeOut,
                decoration: BoxDecoration(
                  color: value ? GordiColors.green500 : GordiColors.sand300,
                  borderRadius: GordiRadii.rPill,
                ),
              ),
              AnimatedAlign(
                duration: GordiMotion.base,
                curve: GordiMotion.easeSoft,
                alignment:
                    value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: GordiShadows.sm,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
