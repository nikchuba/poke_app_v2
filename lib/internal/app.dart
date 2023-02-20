import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            ),
          )),
      dark: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color.fromRGBO(108, 81, 149, 1),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
          )),
      initial: widget.themeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        SystemChrome.setSystemUIOverlayStyle(
          theme.appBarTheme.systemOverlayStyle!.copyWith(
            systemNavigationBarColor: Color.alphaBlend(
              theme.colorScheme.background.withOpacity(.7),
              theme.colorScheme.primary,
            ),
          ),
        );

        return MaterialApp.router(
          scrollBehavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
          routerDelegate:
              router.delegate(navigatorObservers: () => [MyObserver()]),
          routeInformationParser: router.defaultRouteParser(),
          title: 'Rick and Morty',
          theme: theme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('Tab route visited: ${route.routeInfo.segments}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('Tab route re-visited: ${route.routeInfo.segments}');
  }
}
