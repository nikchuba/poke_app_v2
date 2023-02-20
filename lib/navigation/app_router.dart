import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/character_chip.dart';
import 'package:rick_and_morty/presentation/character/screens/character_details/character_details_popup_view.dart';
import 'package:rick_and_morty/presentation/character/screens/characters/characters_screen.dart';
import 'package:rick_and_morty/presentation/season/widgets/season_episodes_grid_view.dart';
import 'package:rick_and_morty/presentation/season/seasons_screen.dart';
import 'package:rick_and_morty/presentation/home/home_screen.dart';
import 'package:rick_and_morty/presentation/location/locations_screen.dart';

import 'custom_route_builders.dart';

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
            AutoRoute(
              path: '',
              page: CharactersScreen,
            ),
          ],
        ),
        AutoRoute(
          path: 'seasons',
          page: EmptyRouterScreen,
          name: 'SeasonsTab',
          children: [
            AutoRoute(
              path: '',
              page: SeasonsScreen,
              children: [
                RedirectRoute(path: '', redirectTo: '1'),
                AutoRoute(
                  path: ':id',
                  page: SeasonEpisodesGridView,
                  name: 'SeasonEpisodesTabView',
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: 'locations',
          page: EmptyRouterScreen,
          name: 'LocationsTab',
          children: [
            AutoRoute(path: '', page: LocationsScreen),
          ],
        ),
      ],
    ),
    CustomRoute(
      path: '/home/characters/:id',
      page: CharacterDetailsPopupView,
      name: 'CharacterDetailsPopup',
      customRouteBuilder: CustomRouteBuilders.popupBuilder,
    ),
    RedirectRoute(path: '', redirectTo: 'home'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter([super.navigatorKey]);
}

final router = AppRouter();
