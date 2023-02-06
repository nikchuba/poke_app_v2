import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rick_and_morty/presentation/character/screens/characters/characters_screen.dart';
import 'package:rick_and_morty/presentation/season/screens/season_episodes/season_episodes_view.dart';
import 'package:rick_and_morty/presentation/season/screens/seasons/seasons_screen.dart';
import 'package:rick_and_morty/presentation/home/home_screen.dart';
import 'package:rick_and_morty/presentation/location/location_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomeScreen,
      initial: true,
      children: [
        AutoRoute(
          path: 'characters',
          page: EmptyRouterScreen,
          name: 'CharactersTab',
          children: [
            AutoRoute(path: '', page: CharactersScreen),
          ],
        ),
        AutoRoute(
          path: 'seasons',
          page: EmptyRouterScreen,
          name: 'SeasonsTab',
          children: [
            AutoRoute(path: '', page: SeasonsScreen, children: [
              AutoRoute(
                  path: ':id',
                  page: SeasonEpisodesView,
                  name: 'SeasonEpisodesTabView'),
            ]),
          ],
        ),
        AutoRoute(
          path: 'locations',
          page: EmptyRouterScreen,
          name: 'LocationsTab',
          children: [
            AutoRoute(path: '', page: LocationScreen),
          ],
        ),
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

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return FadeTransition(opacity: animation, child: child);
}
