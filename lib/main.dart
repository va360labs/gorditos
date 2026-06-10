import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/supabase/supabase_service.dart';
import 'core/theme/theme.dart';
import 'features/onboarding/data/onboarding_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.init();
  await OnboardingService.instance.init();
  runApp(const ProviderScope(child: GorditosApp()));
}

class GorditosApp extends StatefulWidget {
  const GorditosApp({super.key});

  @override
  State<GorditosApp> createState() => _GorditosAppState();
}

class _GorditosAppState extends State<GorditosApp> {
  late final _router = buildAppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GorditOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
