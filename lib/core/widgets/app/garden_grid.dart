import 'package:flutter/material.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';

/// Garden day states. An empty day is just soil (tierra) —
/// NEVER a wilted or dead plant (design-system invariant, AC-20).
enum GardenDayState { soil, sprout, grown, bloom }

/// The "jardín de hábitos" grid.
///
/// DS source: components/app/GardenGrid.jsx + `.gds-garden`.
class GardenGrid extends StatelessWidget {
  const GardenGrid({super.key, required this.days, this.columns = 7});

  final List<GardenDayState> days;
  final int columns;

  static const _glyphs = {
    GardenDayState.soil: '',
    GardenDayState.sprout: '🌱',
    GardenDayState.grown: '🌿',
    GardenDayState.bloom: '🌸',
  };

  static const _colors = {
    GardenDayState.soil: GordiColors.gardenSoil,
    GardenDayState.sprout: GordiColors.gardenSprout,
    GardenDayState.grown: GordiColors.gardenGrown,
    GardenDayState.bloom: GordiColors.gardenBloom,
  };

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: columns,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 7,
      crossAxisSpacing: 7,
      children: [
        for (final day in days)
          Container(
            decoration: BoxDecoration(
              color: _colors[day],
              borderRadius: GordiRadii.rSm,
            ),
            alignment: Alignment.center,
            child: Text(
              _glyphs[day]!,
              style: const TextStyle(fontSize: 15),
            ),
          ),
      ],
    );
  }
}
