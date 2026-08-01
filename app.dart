import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amaanah/core/constants/app_strings.dart';
import 'package:amaanah/core/router/app_router.dart';
import 'package:amaanah/core/theme/app_theme.dart';

class AmaanahApp extends ConsumerWidget {
  const AmaanahApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
