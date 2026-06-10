import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase bootstrap. Credentials arrive via --dart-define (never hardcoded;
/// the publishable/anon key is public by design, the service/Claude keys
/// NEVER touch the app — PRD §6.4).
///
/// Without credentials the app boots in **demo mode**: no auth gate, local
/// demo data, and a visible banner. This keeps the app runnable before the
/// Supabase project is linked (UC-002/UC-003 e2e pending that link).
abstract final class SupabaseService {
  static const url = String.fromEnvironment('SUPABASE_URL');
  static const publishableKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static bool get configured => url.isNotEmpty && publishableKey.isNotEmpty;

  static Future<void> init() async {
    if (!configured) return;
    await Supabase.initialize(url: url, publishableKey: publishableKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
