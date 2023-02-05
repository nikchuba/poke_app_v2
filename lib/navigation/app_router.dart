import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rick_and_morty/presentation/character/screens/characters_screen/characters_page.dart';
import 'package:rick_and_morty/presentation/character/screens/characters_screen/widgets/character_detail_card_widget.dart';
import 'package:rick_and_morty/presentation/episode/pages/episodes/seasons_page.dart';
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
        AutoRoute(
          path: 'characters',
          page: EmptyRouterScreen,
          name: 'CharactersTab',
          children: [
            AutoRoute(path: '', page: CharactersPage),
            AutoRoute(path: 'detail', page: CharacterCardDetailPage),
          ],
        ),
        AutoRoute(
          path: 'seasons',
          page: EmptyRouterScreen,
          name: 'SeasonsTab',
          children: [
            AutoRoute(path: '', page: SeasonsPage, children: [
              AutoRoute(path: ':id', page: SeasonPage),
            ]),
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

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return FadeTransition(opacity: animation, child: child);
}
