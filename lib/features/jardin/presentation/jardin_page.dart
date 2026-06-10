import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/supabase/supabase_service.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../../auth/providers/auth_providers.dart';

/// Mi jardín — placeholder con datos de muestra hasta US-02 (UC-008:
/// RPC habit_garden_summary). Incluye los ajustes mínimos (cerrar sesión).
class JardinPage extends ConsumerWidget {
  const JardinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi jardín'),
        actions: [
          if (session != null)
            Padding(
              padding: const EdgeInsets.only(right: GordiSpacing.screenPad),
              child: GordiIconButton(
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: 'Cerrar sesión',
                bare: true,
                onPressed: () async {
                  await ref.read(authRepositoryProvider).signOut();
                  if (context.mounted) context.go('/login');
                },
              ),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(GordiSpacing.screenPad),
        children: [
          GordiCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    GordiBadge(label: 'datos de muestra', tone: GordiBadgeTone.neutral, mono: true),
                  ],
                ),
                const SizedBox(height: GordiSpacing.s4),
                const GardenGrid(
                  days: [
                    GardenDayState.sprout,
                    GardenDayState.grown,
                    GardenDayState.soil,
                    GardenDayState.bloom,
                    GardenDayState.grown,
                    GardenDayState.soil,
                    GardenDayState.sprout,
                  ],
                ),
                const SizedBox(height: GordiSpacing.s4),
                Text(
                  'Un día sin actividad es solo tierra. Aquí nada se marchita.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: GordiSpacing.s6),
          const GordiBubble(
            text: 'Tu jardín de verdad florece en el próximo sprint. '
                'Lo que ya hagas hoy, cuenta igual 🌱',
          ),
          if (!SupabaseService.configured) ...[
            const SizedBox(height: GordiSpacing.s6),
            GordiCard(
              variant: GordiCardVariant.flat,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Modo demo',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: GordiSpacing.s2),
                  Text(
                    'Conecta el proyecto Supabase (--dart-define) para activar '
                    'cuentas y guardado real.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
