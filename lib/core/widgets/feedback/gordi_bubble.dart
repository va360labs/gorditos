import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';

/// Who is speaking: Gordi (left, mascot shown) or the user (right, green).
enum GordiBubbleFrom { gordi, user }

/// Gordi's voice — a speech bubble paired with the mascot.
///
/// DS source: components/feedback/GordiBubble.jsx + `.gds-gordi`.
class GordiBubble extends StatelessWidget {
  const GordiBubble({
    super.key,
    required this.text,
    this.from = GordiBubbleFrom.gordi,
    this.showMascot = true,
  });

  final String text;
  final GordiBubbleFrom from;
  final bool showMascot;

  @override
  Widget build(BuildContext context) {
    final isGordi = from == GordiBubbleFrom.gordi;

    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isGordi ? GordiColors.surfaceCard : GordiColors.green500,
        border: isGordi
            ? Border.all(color: GordiColors.borderSoft)
            : null,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(GordiRadii.lg),
          topRight: const Radius.circular(GordiRadii.lg),
          bottomLeft: Radius.circular(isGordi ? 6 : GordiRadii.lg),
          bottomRight: Radius.circular(isGordi ? GordiRadii.lg : 6),
        ),
        boxShadow: isGordi ? GordiShadows.sm : const [],
      ),
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          height: 1.45,
          color: isGordi ? GordiColors.ink900 : Colors.white,
        ),
      ),
    );

    return Row(
      mainAxisAlignment:
          isGordi ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isGordi && showMascot) ...[
          SvgPicture.asset('assets/brand/gordi.svg', width: 48, height: 48),
          const SizedBox(width: 10),
        ],
        Flexible(child: bubble),
      ],
    );
  }
}
