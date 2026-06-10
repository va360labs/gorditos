import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';

/// Estado "en camino" amable para los tabs cuyas features llegan en
/// sprints posteriores. Nunca un vacío frío: Gordi siempre acompaña.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.emoji,
    required this.gordiSays,
  });

  final String title;
  final String emoji;
  final String gordiSays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: GordiSpacing.contentMax),
          child: Padding(
            padding: const EdgeInsets.all(GordiSpacing.screenPad),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  emoji,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 64),
                ),
                const SizedBox(height: GordiSpacing.s6),
                GordiBubble(text: gordiSays),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
