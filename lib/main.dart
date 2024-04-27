import 'package:flutter/material.dart';
import 'package:lingua_ai/screens/Responsivescreen.dart';
import 'providers/active_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/themes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home: const Responsivness(),
    );
  }
}
