import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_motion.dart';

/// Adaptive goal ring. Never frames "failure" — it only ever fills up.
///
/// DS source: components/feedback/ProgressRing.jsx + `.gds-ring__*`.
class GordiProgressRing extends StatelessWidget {
  const GordiProgressRing({
    super.key,
    required this.value,
    required this.max,
    this.label,
    this.sub,
    this.size = 120,
    this.strokeWidth = 12,
    this.color = GordiColors.green500,
  });

  final double value;
  final double max;

  /// Center headline (e.g. "4.700").
  final String? label;

  /// Center subline (e.g. "pasos hoy").
  final String? sub;
  final double size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final pct = max <= 0 ? 0.0 : (value / max).clamp(0.0, 1.0);

    return Semantics(
      label: '${label ?? ''} ${sub ?? ''}'.trim(),
      value: '${(pct * 100).round()}%',
      child: SizedBox(
        width: size,
        height: size,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: pct),
          duration: GordiMotion.slow,
          curve: GordiMotion.easeOut,
          builder: (context, animated, _) => CustomPaint(
            painter: _RingPainter(
              progress: animated,
              strokeWidth: strokeWidth,
              color: color,
              trackColor: GordiColors.sand200,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (label != null)
                    Text(
                      label!,
                      style: GoogleFonts.baloo2(
                        fontSize: size * 0.24,
                        fontWeight: FontWeight.w800,
                        height: 1,
                        color: GordiColors.ink900,
                      ),
                    ),
                  if (sub != null)
                    Text(
                      sub!,
                      style: GoogleFonts.nunito(
                        fontSize: size * 0.11,
                        fontWeight: FontWeight.w600,
                        color: GordiColors.ink500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
    required this.trackColor,
  });

  final double progress;
  final double strokeWidth;
  final Color color;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = trackColor;
    canvas.drawCircle(center, radius, track);

    if (progress > 0) {
      final arc = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        arc,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.color != color;
}
