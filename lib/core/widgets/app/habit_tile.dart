import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_motion.dart';
import '../../theme/gordi_shapes.dart';
import '../foundation/gordi_pressable.dart';

/// One-tap habit row for the "Hoy" screen. The WHOLE tile is the tap target
/// (AC-16: marking a habit costs exactly 1 tap). The pending state is neutral
/// — no red, no warnings, no negative copy (AC-17).
///
/// DS source: components/app/HabitTile.jsx + `.gds-habit`.
class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.icon,
    required this.name,
    this.meta,
    this.done = false,
    this.color = GordiColors.habitComida,
    this.onToggle,
  });

  /// Emoji icon — the DS uses emoji as primary iconography.
  final String icon;
  final String name;
  final String? meta;
  final bool done;

  /// Habit category color (see GordiColors.habit*).
  final Color color;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: done,
      label: name,
      child: GordiPressable(
        onTap: onToggle,
        scale: 0.985,
        child: AnimatedContainer(
          duration: GordiMotion.base,
          curve: GordiMotion.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: done ? GordiColors.green50 : GordiColors.surfaceCard,
            borderRadius: GordiRadii.rLg,
            boxShadow: GordiShadows.sm,
          ),
          child: Row(
            children: [
              // Icon chip tinted with the habit color (~16% on white).
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Color.alphaBlend(
                    color.withValues(alpha: 0.16),
                    Colors.white,
                  ),
                  borderRadius: GordiRadii.rMd,
                ),
                alignment: Alignment.center,
                child: Text(icon, style: const TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.baloo2(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: GordiColors.ink900,
                      ),
                    ),
                    if (meta != null)
                      Text(
                        meta!,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: GordiColors.ink500,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              AnimatedScale(
                scale: done ? 1.05 : 1,
                duration: GordiMotion.base,
                curve: GordiMotion.easeSoft,
                child: AnimatedContainer(
                  duration: GordiMotion.base,
                  curve: GordiMotion.easeSoft,
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: done ? color : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: done ? color : GordiColors.sand300,
                      width: 2.5,
                    ),
                  ),
                  child: done
                      ? const Icon(Icons.check, size: 18, color: Colors.white)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
