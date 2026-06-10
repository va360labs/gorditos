import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';
import '../../theme/gordi_typography.dart';

/// Tones map to brand roles, mirroring `.gds-badge--*`.
enum GordiBadgeTone { green, apricot, sky, berry, neutral }

/// Small status pill. `mono` for stat-style labels (DM Mono).
///
/// DS source: components/core/Badge.jsx + `.gds-badge`.
class GordiBadge extends StatelessWidget {
  const GordiBadge({
    super.key,
    required this.label,
    this.tone = GordiBadgeTone.green,
    this.mono = false,
    this.icon,
  });

  final String label;
  final GordiBadgeTone tone;
  final bool mono;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (tone) {
      GordiBadgeTone.green => (GordiColors.green100, GordiColors.green700),
      GordiBadgeTone.apricot => (
        GordiColors.apricot100,
        GordiColors.apricot700,
      ),
      GordiBadgeTone.sky => (GordiColors.sky100, GordiColors.sky700),
      GordiBadgeTone.berry => (GordiColors.berry100, GordiColors.berry600),
      GordiBadgeTone.neutral => (GordiColors.sand200, GordiColors.ink700),
    };

    final style = mono
        ? GordiType.monoLabel(color: fg, size: 12)
        : GoogleFonts.nunito(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: fg,
            height: 1.3,
          );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: GordiRadii.rPill),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 5)],
          Text(label, style: style),
        ],
      ),
    );
  }
}
