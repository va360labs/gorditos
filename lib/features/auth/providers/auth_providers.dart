import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => const AuthRepository(),
);

/// Sesión actual (null = sin sesión o modo demo).
final sessionProvider = StreamProvider<Session?>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  if (!repo.isAvailable) return Stream.value(null);
  return repo.onAuthStateChange.map((s) => s.session);
});
