import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class App extends StatefulWidget {
  const App({super.key, this.themeMode});

  final AdaptiveThemeMode? themeMode;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color.fromRGBO(108, 81, 149, 1),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromRGBO(108, 81, 149, 1),
      ),
      initial: widget.themeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        title: 'Rick and Morty',
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
