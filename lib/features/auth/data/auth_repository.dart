import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/supabase/supabase_service.dart';

/// Email auth over Supabase (UC-003). Social sign-in (AC-07) llega cuando
/// estén las cuentas de Google Cloud / Apple Developer configuradas.
class AuthRepository {
  const AuthRepository();

  bool get isAvailable => SupabaseService.configured;

  Session? get currentSession =>
      isAvailable ? SupabaseService.client.auth.currentSession : null;

  Stream<AuthState> get onAuthStateChange =>
      SupabaseService.client.auth.onAuthStateChange;

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign-up con display_name en metadata: el trigger `handle_new_user`
  /// (supabase/migrations/0001_profiles.sql) crea la fila en profiles (AC-06).
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? displayName,
  }) {
    return SupabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {'display_name': ?displayName},
    );
  }

  Future<void> signOut() => SupabaseService.client.auth.signOut();
}
