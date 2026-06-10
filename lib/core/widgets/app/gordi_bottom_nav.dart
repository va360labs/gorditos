import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';
import '../../theme/gordi_shapes.dart';
import '../../theme/gordi_spacing.dart';

class GordiNavItem {
  const GordiNavItem({required this.id, required this.icon, required this.label});

  final String id;

  /// Emoji icon (DS iconography).
  final String icon;
  final String label;
}

/// Bottom tab bar — 5 tabs, paper surface, soft upward shadow.
///
/// DS source: components/app/BottomNav.jsx + `.gds-bottomnav`.
class GordiBottomNav extends StatelessWidget {
  const GordiBottomNav({
    super.key,
    required this.items,
    required this.current,
    this.onChanged,
  });

  final List<GordiNavItem> items;
  final String current;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    // El alto de 76px es del CONTENIDO; el inset del sistema (gesture bar,
    // home indicator) se añade por fuera vía SafeArea para no robarle sitio.
    return Container(
      decoration: BoxDecoration(
        color: GordiColors.surfaceCard,
        boxShadow: GordiShadows.navUp,
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: GordiSpacing.bottomNavHeight,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Row(
            children: [
              for (final item in items)
                Expanded(
                  child: _NavButton(
                    item: item,
                    selected: item.id == current,
                    onTap: onChanged == null
                        ? null
                        : () => onChanged!(item.id),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.selected, this.onTap});

  final GordiNavItem item;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: InkWell(
        onTap: onTap,
        borderRadius: GordiRadii.rMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.icon, style: const TextStyle(fontSize: 22, height: 1)),
            const SizedBox(height: 3),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: selected ? GordiColors.green600 : GordiColors.ink400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
