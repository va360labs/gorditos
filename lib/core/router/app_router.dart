import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../dev/design_gallery_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/register_page.dart';
import '../../features/home_shell/presentation/home_shell_page.dart';
import '../../features/home_shell/presentation/placeholder_screen.dart';
import '../../features/hoy/presentation/hoy_page.dart';
import '../../features/jardin/presentation/jardin_page.dart';
import '../../features/onboarding/data/onboarding_service.dart';
import '../../features/onboarding/presentation/onboarding_page.dart';
import '../supabase/supabase_service.dart';

/// Router de la app. Guards:
/// - Auth (AC-06/AC-08): con Supabase configurado, sin sesión solo /login y
///   /registro; con sesión, esas rutas redirigen a /hoy. En demo no hay gate.
/// - Onboarding (AC-23): hasta completarlo, todo redirige a /onboarding
///   (tras el login si hay auth).
GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: '/hoy',
    refreshListenable: Listenable.merge([
      OnboardingService.instance.doneListenable,
      if (SupabaseService.configured)
        _StreamListenable(SupabaseService.client.auth.onAuthStateChange),
    ]),
    redirect: (context, state) {
      final location = state.matchedLocation;
      final onAuthRoute = location == '/login' || location == '/registro';

      if (SupabaseService.configured) {
        final loggedIn = SupabaseService.client.auth.currentSession != null;
        if (!loggedIn && !onAuthRoute) return '/login';
        if (loggedIn && onAuthRoute) return '/hoy';
        if (!loggedIn) return null; // en /login o /registro, sin sesión
      }

      final done = OnboardingService.instance.done;
      final onOnboarding = location == '/onboarding';
      if (!done && !onOnboarding) return '/onboarding';
      if (done && onOnboarding) return '/hoy';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
      GoRoute(path: '/registro', builder: (_, _) => const RegisterPage()),
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingPage()),
      GoRoute(path: '/galeria', builder: (_, _) => const DesignGalleryPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) =>
            HomeShellPage(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/hoy', builder: (_, _) => const HoyPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cocina',
                builder: (_, _) => const PlaceholderScreen(
                  title: 'Cocina',
                  emoji: '🥗',
                  gordiSays:
                      'Recetas ricas, rápidas y de supermercado normal. '
                      'Las estoy cocinando para el Sprint 3 🍳',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/muevete',
                builder: (_, _) => const PlaceholderScreen(
                  title: 'Muévete',
                  emoji: '🤸',
                  gordiSays:
                      'Rutinas en casa, sin gimnasio y a tu ritmo. '
                      'Llegan en el Sprint 2. Mientras, ¿un paseíto?',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gordi',
                builder: (_, _) => const PlaceholderScreen(
                  title: 'Gordi',
                  emoji: '💬',
                  gordiSays:
                      '¡Pronto podremos charlar aquí! Estoy aprendiendo a '
                      'escucharte mejor (Sprint 4) 💚',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/jardin', builder: (_, _) => const JardinPage()),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Adapta un Stream a Listenable para refrescar el router en cambios de auth.
class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    unawaited(_sub.cancel());
    super.dispose();
  }
}
