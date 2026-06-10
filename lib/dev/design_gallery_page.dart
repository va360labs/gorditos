import 'package:flutter/material.dart';

import '../core/theme/theme.dart';
import '../core/widgets/widgets.dart';

/// Living showcase of the GorditOS design system (dev-only, route /galeria).
/// Doubles as a visual smoke test of every component.
class DesignGalleryPage extends StatefulWidget {
  const DesignGalleryPage({super.key});

  @override
  State<DesignGalleryPage> createState() => _DesignGalleryPageState();
}

class _DesignGalleryPageState extends State<DesignGalleryPage> {
  String _period = 'semana';
  bool _reminders = true;
  bool _filterRapido = true;
  final Map<String, bool> _habits = {'agua': true, 'comida': false};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Design system Gordit',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'OS',
              style: GordiType.osAccent(color: GordiColors.green600, size: 18),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(GordiSpacing.screenPad),
        children: [
          const GordiBubble(
            text: '¿Un vaso de agua más? Eso es hidratación de campeonato 💧',
          ),
          const SizedBox(height: GordiSpacing.s4),
          const GordiBubble(
            text: '¡Hecho! Hoy también cuenta.',
            from: GordiBubbleFrom.user,
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Hábitos (1 tap)'),
          HabitTile(
            icon: '💧',
            name: 'Beber agua',
            meta: 'Hidratación de campeonato',
            color: GordiColors.habitAgua,
            done: _habits['agua']!,
            onToggle: () => setState(() => _habits['agua'] = !_habits['agua']!),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '🥗',
            name: 'Comida casera',
            meta: 'Plato con verdura',
            color: GordiColors.habitComida,
            done: _habits['comida']!,
            onToggle: () =>
                setState(() => _habits['comida'] = !_habits['comida']!),
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Jardín'),
          GordiCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GordiBadge(label: '12 días activos', mono: true),
                    GordiSegmentedControl<String>(
                      options: const [
                        GordiSegmentOption(value: 'semana', label: 'Semana'),
                        GordiSegmentOption(value: 'mes', label: 'Mes'),
                      ],
                      value: _period,
                      onChanged: (v) => setState(() => _period = v),
                    ),
                  ],
                ),
                const SizedBox(height: GordiSpacing.s4),
                const GardenGrid(
                  days: [
                    GardenDayState.grown,
                    GardenDayState.bloom,
                    GardenDayState.soil,
                    GardenDayState.sprout,
                    GardenDayState.grown,
                    GardenDayState.soil,
                    GardenDayState.sprout,
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Pasos (objetivo amable)'),
          const Center(
            child: GordiProgressRing(
              value: 4700,
              max: 6000,
              label: '4.700',
              sub: 'pasos hoy',
            ),
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Botones'),
          Wrap(
            spacing: GordiSpacing.s3,
            runSpacing: GordiSpacing.s3,
            children: [
              GordiButton(label: '¡Vamos!', onPressed: () {}),
              GordiButton(
                label: 'Celebrar',
                variant: GordiButtonVariant.secondary,
                onPressed: () {},
              ),
              GordiButton(
                label: 'Hoy no puedo con todo',
                variant: GordiButtonVariant.soft,
                onPressed: () {},
              ),
              GordiButton(
                label: 'Más tarde',
                variant: GordiButtonVariant.ghost,
                onPressed: () {},
              ),
              GordiButton(
                label: 'Ver recetas',
                variant: GordiButtonVariant.outline,
                onPressed: () {},
              ),
              const GordiButton(label: 'Sin prisa', onPressed: null),
            ],
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Filtros, badges y avatar'),
          Wrap(
            spacing: GordiSpacing.s2,
            runSpacing: GordiSpacing.s2,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              GordiChip(
                label: '≤ 10 min',
                icon: '⏱️',
                selected: _filterRapido,
                onTap: () => setState(() => _filterRapido = !_filterRapido),
              ),
              const GordiChip(label: 'Vegetariano', icon: '🥦'),
              const GordiBadge(label: 'tu mejor mes', tone: GordiBadgeTone.apricot),
              const GordiBadge(label: 'calma', tone: GordiBadgeTone.sky),
              const GordiAvatar(initials: 'V'),
            ],
          ),
          const SizedBox(height: GordiSpacing.s8),
          _section(context, 'Formularios'),
          GordiCard(
            variant: GordiCardVariant.flat,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tip diario de Gordi',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GordiSwitch(
                  value: _reminders,
                  label: 'Tip diario de Gordi',
                  onChanged: (v) => setState(() => _reminders = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: GordiSpacing.s4),
          const GordiInput(
            label: 'Tu nombre',
            placeholder: '¿Cómo te llamamos?',
            hint: 'Solo para saludarte. Nada de números.',
          ),
          const SizedBox(height: GordiSpacing.s16),
        ],
      ),
    );
  }

  Widget _section(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.only(bottom: GordiSpacing.s3),
    child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
  );
}
