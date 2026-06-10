import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';

/// Round avatar: image if [image] is set, else [initials] on a tinted circle.
///
/// DS source: components/core/Avatar.jsx + `.gds-avatar`.
class GordiAvatar extends StatelessWidget {
  const GordiAvatar({super.key, this.image, this.initials = '', this.size = 40});

  final ImageProvider? image;
  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: GordiColors.green100,
        shape: BoxShape.circle,
        image: image != null
            ? DecorationImage(image: image!, fit: BoxFit.cover)
            : null,
      ),
      alignment: Alignment.center,
      child: image == null
          ? Text(
              initials,
              style: GoogleFonts.baloo2(
                fontSize: size * 0.42,
                fontWeight: FontWeight.w700,
                color: GordiColors.green700,
              ),
            )
          : null,
    );
  }
}
