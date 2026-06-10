import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_motion.dart';
import '../../theme/gordi_shapes.dart';

class GordiSegmentOption<T> {
  const GordiSegmentOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Segmented control on a sunken sand track (e.g. semana / mes).
///
/// DS source: components/forms/SegmentedControl.jsx + `.gds-seg`.
class GordiSegmentedControl<T> extends StatelessWidget {
  const GordiSegmentedControl({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List<GordiSegmentOption<T>> options;
  final T value;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: GordiColors.sand200,
        borderRadius: GordiRadii.rPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (i, o) in options.indexed) ...[
            if (i > 0) const SizedBox(width: 2),
            _Segment<T>(
              option: o,
              selected: o.value == value,
              onTap: onChanged == null ? null : () => onChanged!(o.value),
            ),
          ],
        ],
      ),
    );
  }
}

class _Segment<T> extends StatelessWidget {
  const _Segment({required this.option, required this.selected, this.onTap});

  final GordiSegmentOption<T> option;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: GordiMotion.fast,
          curve: GordiMotion.easeOut,
          constraints: const BoxConstraints(minHeight: 38),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? GordiColors.surfaceCard : Colors.transparent,
            borderRadius: GordiRadii.rPill,
            boxShadow: selected ? GordiShadows.sm : const [],
          ),
          alignment: Alignment.center,
          child: Text(
            option.label,
            style: GoogleFonts.baloo2(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selected ? GordiColors.green700 : GordiColors.ink500,
            ),
          ),
        ),
      ),
    );
  }
}
