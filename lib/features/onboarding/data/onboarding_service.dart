import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/supabase/supabase_service.dart';

/// Persistencia del onboarding (UC-009, AC-23): siempre en local
/// (shared_preferences) y, si hay sesión Supabase, también en
/// profiles.preferences. Nunca contiene datos corporales — solo contexto
/// (PRD §4.1).
class OnboardingService {
  OnboardingService._();

  static final instance = OnboardingService._();

  static const _doneKey = 'onboarding_done';
  static const _prefsKey = 'onboarding_prefs';

  SharedPreferences? _sp;

  /// Escucha para el router: completar el onboarding refresca los redirects.
  final doneListenable = ValueNotifier<bool>(false);

  bool get done => doneListenable.value;

  Future<void> init() async {
    _sp = await SharedPreferences.getInstance();
    doneListenable.value = _sp!.getBool(_doneKey) ?? false;
  }

  Map<String, dynamic> get preferences {
    final raw = _sp?.getString(_prefsKey);
    if (raw == null) return const {};
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> complete(Map<String, dynamic> prefs) async {
    _sp ??= await SharedPreferences.getInstance();
    await _sp!.setString(_prefsKey, jsonEncode(prefs));
    await _sp!.setBool(_doneKey, true);
    doneListenable.value = true;

    // Volcado a Supabase si hay sesión; un fallo de red nunca bloquea
    // el onboarding (se reintentará en una sync posterior).
    if (SupabaseService.configured) {
      final user = SupabaseService.client.auth.currentUser;
      if (user != null) {
        try {
          await SupabaseService.client
              .from('profiles')
              .update({'preferences': prefs})
              .eq('id', user.id);
        } catch (_) {
          // Silencioso a propósito: el dato local es la verdad provisional.
        }
      }
    }
  }
}
