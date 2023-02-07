import 'dart:math';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/presentation/character/screens/character_details/character_details_popup_view.dart';
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
            AutoRoute(
              path: '',
              page: CharactersScreen,
            ),
            CustomRoute(
              path: ':id',
              page: CharacterDetailsPopupView,
              name: 'CharacterDetailsPopup',
              customRouteBuilder: CustomRouteBuilders.popupBuilder,
            ),
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

class CustomTransitionBuilders {
  // const CustomTransitionBuilders._();

  static Widget blurredPopup(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0 * animation.value, 0),
          child: Container(
            width: 400,
            height: 300,
            child: child,
          ),
        );
      },
    );
  }
}

class CustomRouteBuilders {
  static Route<T> popupBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    final media = MediaQuery.of(context).size;
    final childBox = context.findRenderObject() as RenderBox;
    RenderBox? box;
    Offset? pos;
    if (page.name == 'CharacterDetailsPopup') {
      // final media = MediaQuery.of(context).padding.top;
      box = (page.arguments as CharacterDetailsPopupArgs).cardRenderBox;
      pos = box?.localToGlobal(Offset.zero);
      print(pos);
    }
    return PageRouteBuilder(
      // allowSnapshotting: ,
      fullscreenDialog: false,
      opaque: false,
      barrierDismissible: true,
      transitionsBuilder: CustomTransitionBuilders.blurredPopup,
      settings: page,
      // barrierColor: Colors.amber.withOpacity(.4),
      pageBuilder: (_, __, ___) {
        return AnimatedBuilder(
          animation: __,
          builder: (context, _) {
            return Stack(
              children: [
                Positioned(
                  top: media.height - pos!.dy > 400 ? pos.dy : null,
                  bottom: media.height - pos.dy < 400
                      ? media.height - pos.dy - box!.size.height
                      : null,
                  left: pos.dx < 100 ? pos.dx : null,
                  right: pos.dx > 100
                      ? media.width - pos.dx - box!.size.width
                      : null,
                  width: (300 * __.value).clamp(box!.size.width, 300),
                  height: (400 * __.value).clamp(box.size.height, 400),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20 * __.value,
                      sigmaY: 20 * __.value,
                    ),
                    child: FadeTransition(
                      opacity: __,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56 * pow(__.value, 2) as double)
                        ),
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
