import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthException;

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/auth_providers.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _emailError;
  String? _passwordError;
  bool _loading = false;

  @override
  void dispose() {
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
      await ref
          .read(authRepositoryProvider)
          .signInWithPassword(email: _email.text.trim(), password: _password.text);
      if (mounted) context.go('/hoy');
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_friendlyAuthMessage(e))),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _friendlyAuthMessage(AuthException e) {
    if (e.statusCode == '400') {
      return 'Ese correo y esa contraseña no se conocen todavía. ¿Probamos de nuevo?';
    }
    return 'No hemos podido entrar ahora mismo. Sin prisa, inténtalo en un momento.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: GordiSpacing.contentMax),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(GordiSpacing.screenPad),
              children: [
                Center(
                  child: Image.asset(
                    'assets/brand/logo_completo.png',
                    width: 320,
                    semanticLabel:
                        'Gorditos — Pequeños hábitos, grandes cambios',
                  ),
                ),
                const SizedBox(height: GordiSpacing.s8),
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
                  placeholder: '••••••',
                  controller: _password,
                  obscureText: true,
                  errorText: _passwordError,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                ),
                const SizedBox(height: GordiSpacing.s6),
                GordiButton(
                  label: _loading ? 'Entrando…' : 'Entrar',
                  size: GordiButtonSize.lg,
                  block: true,
                  onPressed: _loading ? null : _submit,
                ),
                const SizedBox(height: GordiSpacing.s3),
                GordiButton(
                  label: 'Crear mi cuenta',
                  variant: GordiButtonVariant.soft,
                  block: true,
                  onPressed: () => context.go('/registro'),
                ),
                const SizedBox(height: GordiSpacing.s6),
                Text(
                  'GorditOS no sustituye el consejo de profesionales sanitarios. '
                  'Para planes de alimentación o ejercicio personalizados, consulta '
                  'con tu médico o dietista-nutricionista.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
