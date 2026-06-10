import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../data/onboarding_service.dart';

/// Onboarding amable (UC-009, PRD §4.1): preguntas de contexto, nunca de
/// medición. Prohibido pedir peso, altura, edad para cálculos o fotos.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _step = 0;

  // Respuestas (todas de contexto, ninguna corporal).
  String? _motivation;
  String? _activity;
  String? _time;
  final Set<String> _equipment = {};
  final Set<String> _dietary = {};
  String _hour = 'manana';
  String _gordi = 'verde';

  static const _totalSteps = 9;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _canContinue => switch (_step) {
    1 => _motivation != null,
    2 => _activity != null,
    3 => _time != null,
    _ => true, // equipamiento, comida, hora y Gordi tienen default amable
  };

  void _next() {
    if (_step == _totalSteps - 1) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: GordiMotion.base,
      curve: GordiMotion.easeOut,
    );
  }

  void _back() {
    _controller.previousPage(
      duration: GordiMotion.base,
      curve: GordiMotion.easeOut,
    );
  }

  Future<void> _finish() async {
    await OnboardingService.instance.complete({
      'motivation': _motivation,
      'activity_level': _activity,
      'available_time': _time,
      'equipment': _equipment.toList(),
      'dietary': _dietary.toList(),
      'motivation_hour': _hour,
      'gordi_color': _gordi,
    });
    if (mounted) context.go('/hoy');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _step > 0 && _step < _totalSteps - 1
            ? GordiIconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 20),
                label: 'Atrás',
                bare: true,
                onPressed: _back,
              )
            : null,
        title: _step > 0 && _step < _totalSteps - 1
            ? Text(
                'Paso $_step de ${_totalSteps - 2}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            : null,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: GordiSpacing.contentMax),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) => setState(() => _step = i),
                    children: [
                      _welcome(context),
                      _singleChoice(
                        context,
                        question: '¿Cómo te quieres sentir dentro de 3 meses?',
                        gordiSays: 'No hay respuesta mala. Es tu brújula, no un examen.',
                        options: const {
                          'energia': '⚡ Con más energía',
                          'dormir': '😴 Durmiendo mejor',
                          'moverme': '🚶 Moviéndome más',
                          'comer': '🥗 Comiendo mejor',
                          'todo': '🌱 Todo un poco',
                        },
                        value: _motivation,
                        onSelect: (v) => setState(() => _motivation = v),
                      ),
                      _singleChoice(
                        context,
                        question: '¿Cómo de activo es tu día a día ahora?',
                        gordiSays: 'Empezar desde el sofá también es empezar 💚',
                        options: const {
                          'sedentario': '🛋️ Ahora mismo, tranquilo',
                          'algo': '🚶 Me muevo algo',
                          'activo': '🤸 Bastante activo',
                        },
                        value: _activity,
                        onSelect: (v) => setState(() => _activity = v),
                      ),
                      _singleChoice(
                        context,
                        question: '¿Cuánto tiempo tienes al día para ti?',
                        gordiSays: 'Con 10 minutos ya hacemos cosas bonitas.',
                        options: const {
                          '10': '⏱️ Unos 10 minutos',
                          '20': '⏱️ Unos 20 minutos',
                          '30': '⏱️ 30 o más',
                        },
                        value: _time,
                        onSelect: (v) => setState(() => _time = v),
                      ),
                      _multiChoice(
                        context,
                        question: '¿Qué tienes por casa?',
                        gordiSays: 'Sin nada también se entrena. Marca lo que haya.',
                        options: const {
                          'esterilla': '🧘 Esterilla',
                          'bandas': '🎗️ Bandas elásticas',
                          'mancuernas': '🏋️ Mancuernas',
                        },
                        selected: _equipment,
                        emptyLabel: 'Nada, y no pasa nada',
                      ),
                      _multiChoice(
                        context,
                        question: '¿Cómo comes?',
                        gordiSays: 'Para proponerte recetas que te sirvan de verdad.',
                        options: const {
                          'vegetariano': '🥦 Vegetariano',
                          'sin_gluten': '🌾 Sin gluten',
                          'sin_lactosa': '🥛 Sin lactosa',
                          'alergias': '📝 Tengo alergias (lo afinamos luego)',
                        },
                        selected: _dietary,
                        emptyLabel: 'Como de todo',
                      ),
                      _singleChoice(
                        context,
                        question: '¿Cuándo te mando el ánimo del día?',
                        gordiSays: 'Un mensajito al día, y solo si tú quieres.',
                        options: const {
                          'manana': '☀️ Por la mañana',
                          'mediodia': '🥗 A mediodía',
                          'tarde': '🌇 Por la tarde',
                          'noche': '🌙 Por la noche',
                        },
                        value: _hour,
                        onSelect: (v) => setState(() => _hour = v),
                      ),
                      _gordiPicker(context),
                      _celebration(context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(GordiSpacing.screenPad),
                  child: GordiButton(
                    label: switch (_step) {
                      0 => '¡Empezamos!',
                      const (_totalSteps - 1) => '¡Vamos a mi jardín!',
                      _ => 'Continuar',
                    },
                    size: GordiButtonSize.lg,
                    block: true,
                    onPressed: _canContinue ? _next : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _page(BuildContext context, List<Widget> children) => ListView(
    padding: const EdgeInsets.symmetric(
      horizontal: GordiSpacing.screenPad,
      vertical: GordiSpacing.s4,
    ),
    children: children,
  );

  Widget _welcome(BuildContext context) => _page(context, [
    const SizedBox(height: GordiSpacing.s8),
    Center(
      child: SvgPicture.asset('assets/brand/gordi.svg', width: 140, height: 140),
    ),
    const SizedBox(height: GordiSpacing.s6),
    Text(
      '¡Hola! Soy Gordi 🌱',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    ),
    const SizedBox(height: GordiSpacing.s4),
    Text(
      'Voy a acompañarte a cuidarte sin presión: aquí no hay básculas, '
      'ni números que duelan, ni nada que se "rompa". Solo hábitos que '
      'crecen, como un jardín.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    const SizedBox(height: GordiSpacing.s6),
    Text(
      'Te haré unas preguntitas para conocerte. Ninguna es sobre tu cuerpo.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: GordiSpacing.s8),
    GordiCard(
      variant: GordiCardVariant.flat,
      padding: const EdgeInsets.all(GordiSpacing.s4),
      child: Text(
        'GorditOS no sustituye el consejo de profesionales sanitarios. '
        'Para planes de alimentación o ejercicio personalizados, consulta '
        'con tu médico o dietista-nutricionista.',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ),
  ]);

  Widget _question(BuildContext context, String question, String gordiSays) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: GordiSpacing.s4),
          GordiBubble(text: gordiSays),
          const SizedBox(height: GordiSpacing.s6),
        ],
      );

  Widget _singleChoice(
    BuildContext context, {
    required String question,
    required String gordiSays,
    required Map<String, String> options,
    required String? value,
    required ValueChanged<String> onSelect,
  }) => _page(context, [
    _question(context, question, gordiSays),
    for (final entry in options.entries) ...[
      _OptionTile(
        label: entry.value,
        selected: value == entry.key,
        onTap: () => onSelect(entry.key),
      ),
      const SizedBox(height: GordiSpacing.s3),
    ],
  ]);

  Widget _multiChoice(
    BuildContext context, {
    required String question,
    required String gordiSays,
    required Map<String, String> options,
    required Set<String> selected,
    required String emptyLabel,
  }) => _page(context, [
    _question(context, question, gordiSays),
    for (final entry in options.entries) ...[
      _OptionTile(
        label: entry.value,
        selected: selected.contains(entry.key),
        onTap: () => setState(() {
          selected.contains(entry.key)
              ? selected.remove(entry.key)
              : selected.add(entry.key);
        }),
      ),
      const SizedBox(height: GordiSpacing.s3),
    ],
    const SizedBox(height: GordiSpacing.s2),
    Center(
      child: Text(
        selected.isEmpty ? '$emptyLabel ✓' : 'Puedes marcar varias',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ),
  ]);

  Widget _gordiPicker(BuildContext context) => _page(context, [
    _question(
      context,
      'Elige a tu Gordi',
      'Todos somos igual de majos, te lo aseguro.',
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final (key, color, name) in const [
          ('verde', GordiColors.green100, 'Brote'),
          ('apricot', GordiColors.apricot100, 'Melocotón'),
          ('sky', GordiColors.sky100, 'Cielo'),
        ])
          _GordiOption(
            tint: color,
            name: name,
            selected: _gordi == key,
            onTap: () => setState(() => _gordi = key),
          ),
      ],
    ),
  ]);

  Widget _celebration(BuildContext context) => _page(context, [
    const SizedBox(height: GordiSpacing.s10),
    const Center(child: Text('🎉', style: TextStyle(fontSize: 72))),
    const SizedBox(height: GordiSpacing.s6),
    Text(
      '¡Listo! Tu jardín te espera',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    ),
    const SizedBox(height: GordiSpacing.s4),
    Text(
      'Empezamos suave y a tu ritmo. Cada día que cuides un hábito, '
      'algo crecerá. Y los días de descanso son solo tierra esperando.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  ]);
}

/// Opción tipo card seleccionable (radio/checkbox amable).
class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GordiPressable(
        onTap: onTap,
        scale: 0.98,
        child: AnimatedContainer(
          duration: GordiMotion.fast,
          curve: GordiMotion.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: GordiSpacing.s4,
            vertical: GordiSpacing.s4,
          ),
          decoration: BoxDecoration(
            color: selected ? GordiColors.green50 : GordiColors.surfaceCard,
            borderRadius: GordiRadii.rLg,
            border: Border.all(
              color: selected ? GordiColors.green400 : GordiColors.borderSoft,
              width: 2,
            ),
            boxShadow: selected ? const [] : GordiShadows.xs,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (selected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: GordiColors.green500,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GordiOption extends StatelessWidget {
  const _GordiOption({
    required this.tint,
    required this.name,
    required this.selected,
    required this.onTap,
  });

  final Color tint;
  final String name;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: 'Gordi $name',
      child: GordiPressable(
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: GordiMotion.base,
              curve: GordiMotion.easeSoft,
              padding: const EdgeInsets.all(GordiSpacing.s3),
              decoration: BoxDecoration(
                color: tint,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? GordiColors.green500 : Colors.transparent,
                  width: 3,
                ),
                boxShadow: selected ? GordiShadows.brand : const [],
              ),
              child: SvgPicture.asset(
                'assets/brand/gordi.svg',
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(height: GordiSpacing.s2),
            Text(name, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
