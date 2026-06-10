import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/supabase/supabase_service.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../../auth/providers/auth_providers.dart';

/// Pantalla Hoy. Hasta que llegue US-02 (tracker real sobre Supabase),
/// muestra hábitos de demostración con estado local — la interacción
/// 1-tap y la celebración ya son las definitivas.
class HoyPage extends ConsumerStatefulWidget {
  const HoyPage({super.key});

  @override
  ConsumerState<HoyPage> createState() => _HoyPageState();
}

class _HoyPageState extends ConsumerState<HoyPage> {
  final Map<String, bool> _demo = {
    'agua': false,
    'pasos': false,
    'ejercicio': false,
    'comida': false,
    'sueno': false,
    'calma': false,
  };

  int get _done => _demo.values.where((v) => v).length;

  void _toggle(String id) {
    final wasDone = _demo[id]!;
    setState(() => _demo[id] = !wasDone);
    if (!wasDone) {
      // Microcelebración ≤1,5s (AC-17): snack amable, nunca intrusivo.
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(_celebration(id)),
            duration: const Duration(milliseconds: 1400),
          ),
        );
    }
  }

  String _celebration(String id) => switch (id) {
    'agua' => '💧 ¡Hidratación de campeonato!',
    'pasos' => '🚶 Cada paso cuenta. ¡Y hoy cuentan todos!',
    'ejercicio' => '🤸 ¡Tu jardín acaba de crecer un poquito!',
    'comida' => '🥗 Comida casera: a Gordi le encanta',
    'sueno' => '😴 Descansar también es cuidarse',
    _ => '🧘 Un momento de calma vale oro',
  };

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider).value;
    final greetName = session?.user.userMetadata?['display_name'] as String?;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('Gordit', style: Theme.of(context).textTheme.headlineSmall),
            Text(
              'OS',
              style: GordiType.osAccent(color: GordiColors.green600, size: 18),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: GordiSpacing.screenPad),
            child: GordiBadge(
              label: '$_done/6 hoy',
              mono: true,
              tone: _done > 0 ? GordiBadgeTone.green : GordiBadgeTone.neutral,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(GordiSpacing.screenPad),
        children: [
          if (!SupabaseService.configured) ...[
            const GordiCard(
              variant: GordiCardVariant.tint,
              padding: EdgeInsets.all(GordiSpacing.s4),
              child: Text(
                'Modo demo: aún sin conexión al servidor. Tus checks de hoy '
                'no se guardan todavía.',
              ),
            ),
            const SizedBox(height: GordiSpacing.s4),
          ],
          GordiBubble(
            text: switch (_done) {
              0 =>
                greetName == null
                    ? '¿Empezamos suave hoy? Lo pequeño también cuenta.'
                    : '¡Hola, $greetName! ¿Empezamos suave hoy?',
              >= 4 => '¡$_done hábitos! Hoy tu jardín está de fiesta 🌸',
              _ => '$_done ya. Aquí no hay prisa, hay constancia 🌱',
            },
          ),
          const SizedBox(height: GordiSpacing.s6),
          Text('Tus hábitos de hoy',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '💧',
            name: 'Beber agua',
            meta: 'Un vaso ya es un sí',
            color: GordiColors.habitAgua,
            done: _demo['agua']!,
            onToggle: () => _toggle('agua'),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '🚶',
            name: 'Paseo del día',
            meta: 'Con buen tiempo apetece más',
            color: GordiColors.habitPasos,
            done: _demo['pasos']!,
            onToggle: () => _toggle('pasos'),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '🤸',
            name: 'Ejercicio del día',
            meta: 'Haz las que puedas, todas cuentan',
            color: GordiColors.habitEjercicio,
            done: _demo['ejercicio']!,
            onToggle: () => _toggle('ejercicio'),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '🥗',
            name: 'Comida casera',
            meta: 'Plato con verdura',
            color: GordiColors.habitComida,
            done: _demo['comida']!,
            onToggle: () => _toggle('comida'),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '😴',
            name: 'Dormir a buena hora',
            meta: 'Mañana te lo agradeces',
            color: GordiColors.habitSueno,
            done: _demo['sueno']!,
            onToggle: () => _toggle('sueno'),
          ),
          const SizedBox(height: GordiSpacing.s3),
          HabitTile(
            icon: '🧘',
            name: 'Momento de calma',
            meta: 'Respira, sin prisa',
            color: GordiColors.habitCalma,
            done: _demo['calma']!,
            onToggle: () => _toggle('calma'),
          ),
          const SizedBox(height: GordiSpacing.s8),
          GordiButton(
            label: 'Ver la galería del design system',
            variant: GordiButtonVariant.outline,
            block: true,
            onPressed: () => context.push('/galeria'),
          ),
          const SizedBox(height: GordiSpacing.s16),
        ],
      ),
    );
  }
}
