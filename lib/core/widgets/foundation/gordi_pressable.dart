import 'package:flutter/material.dart';

import '../../theme/gordi_motion.dart';

/// Springy press feedback shared by GorditOS tappables: press = shrink,
/// release = gentle overshoot back ([GordiMotion.easeSoft]).
class GordiPressable extends StatefulWidget {
  const GordiPressable({
    super.key,
    required this.child,
    this.onTap,
    this.scale = GordiMotion.pressScale,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  final bool enabled;

  @override
  State<GordiPressable> createState() => _GordiPressableState();
}

class _GordiPressableState extends State<GordiPressable> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final interactive = widget.enabled && widget.onTap != null;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: interactive ? widget.onTap : null,
      onTapDown: interactive ? (_) => _setPressed(true) : null,
      onTapUp: interactive ? (_) => _setPressed(false) : null,
      onTapCancel: interactive ? () => _setPressed(false) : null,
      child: AnimatedScale(
        scale: _pressed ? widget.scale : 1,
        duration: GordiMotion.fast,
        curve: GordiMotion.easeSoft,
        child: widget.child,
      ),
    );
  }
}
