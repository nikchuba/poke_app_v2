import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/presentation/character/screens/characters_screen/characters_page.dart';
import 'package:rick_and_morty/presentation/episode/pages/episodes/episodes_page.dart';
import 'package:rick_and_morty/presentation/episode/pages/season/season_page.dart';
import 'package:rick_and_morty/presentation/home/home_page.dart';
import 'package:rick_and_morty/presentation/location/location_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(path: 'characters', page: CharactersPage),
        AutoRoute(
          path: 'episodes',
          page: EpisodesPage,
          children: [
            AutoRoute(path: ':id', page: SeasonPage),
          ],
        ),
        AutoRoute(path: 'locations', page: LocationPage),
      ],
    ),
    RedirectRoute(path: '', redirectTo: 'home'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter([super.navigatorKey]);
}

final router = AppRouter();
