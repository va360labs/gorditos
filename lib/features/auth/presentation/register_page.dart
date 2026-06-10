import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthException;

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/auth_providers.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _emailError;
  String? _passwordError;
  bool _loading = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _emailError = _email.text.contains('@') ? null : 'Ese correo no parece completo';
      _passwordError =
          _password.text.length >= 6 ? null : 'Al menos 6 caracteres';
    });
    return _emailError == null && _passwordError == null;
  }

  Future<void> _submit() async {
    if (!_validate() || _loading) return;
    setState(() => _loading = true);
    try {
      final res = await ref.read(authRepositoryProvider).signUp(
            email: _email.text.trim(),
            password: _password.text,
            displayName: _name.text.trim().isEmpty ? null : _name.text.trim(),
          );
      if (!mounted) return;
      if (res.session != null) {
        context.go('/hoy');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Te hemos escrito un correo para confirmar. ¡Nos vemos dentro!'),
          ),
        );
      }
    } on AuthException {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No hemos podido crear la cuenta ahora mismo. Sin prisa, inténtalo en un momento.',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: GordiSpacing.contentMax),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(GordiSpacing.screenPad),
              children: [
                const GordiBubble(
                  text: 'Solo necesitamos un correo. Nada de básculas, te lo prometo 🌱',
                ),
                const SizedBox(height: GordiSpacing.s6),
                GordiInput(
                  label: 'Tu nombre (opcional)',
                  placeholder: '¿Cómo te llamamos?',
                  hint: 'Solo para saludarte.',
                  controller: _name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: GordiSpacing.s4),
                GordiInput(
                  label: 'Correo',
                  placeholder: 'tu@correo.com',
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  errorText: _emailError,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                ),
                const SizedBox(height: GordiSpacing.s4),
                GordiInput(
                  label: 'Contraseña',
                  placeholder: 'mínimo 6 caracteres',
                  controller: _password,
                  obscureText: true,
                  errorText: _passwordError,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                ),
                const SizedBox(height: GordiSpacing.s6),
                GordiButton(
                  label: _loading ? 'Creando…' : '¡Vamos!',
                  size: GordiButtonSize.lg,
                  block: true,
                  onPressed: _loading ? null : _submit,
                ),
                const SizedBox(height: GordiSpacing.s3),
                GordiButton(
                  label: 'Ya tengo cuenta',
                  variant: GordiButtonVariant.ghost,
                  block: true,
                  onPressed: () => context.go('/login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
