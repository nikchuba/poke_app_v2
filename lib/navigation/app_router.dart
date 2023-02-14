import 'dart:math';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';
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
                  page: SeasonEpisodesView,
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
            AutoRoute(path: '', page: LocationScreen),
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

class CustomTransitionBuilders {
  // const CustomTransitionBuilders._();

  static Widget blurredPopup(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

const _popupRatio = 1.25 / 1;

class CustomRouteBuilders {
  static Route<T> popupBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    Offset? minCenter;
    Size? minSize;
    if (page.name!.toLowerCase().contains('popup')) {
      final box =
          (page.child as PopupView).context?.findRenderObject() as RenderBox?;
      final startOffset = box?.localToGlobal(Offset.zero);
      minSize = box?.size;

      if (startOffset != null && minSize != null) {
        minCenter =
            startOffset.translate(minSize.width / 2, minSize.height / 2);
      }
    }

    final clientSize = MediaQuery.of(context).size;
    final clientHeight = clientSize.height, clientWidth = clientSize.width;
    final maxCenter = Offset(clientWidth / 2, clientHeight / 2);
    final maxSize = clientWidth >= clientHeight
        ? Size(clientHeight * 0.75 / _popupRatio, clientHeight * 0.75)
        : clientWidth > 420
            ? Size(clientWidth * 0.75, clientWidth * 0.75 * _popupRatio)
            : Size(clientWidth * 0.9, clientWidth * 0.9 * _popupRatio);

    minCenter ??= Offset(clientWidth / 2, clientHeight / 2);
    minSize ??= const Size(100, 100);

    return PageRouteBuilder(
      // transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      fullscreenDialog: false,
      opaque: false,
      maintainState: false,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.4),
      settings: page,
      pageBuilder: (_, animation, ___) {
        final animationCenter = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            ),
            animationSize = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.decelerate),
            );

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final currentWidth = minSize!.width +
                (maxSize.width - minSize.width) * animationSize.value;
            final currentHeight = minSize.height +
                (maxSize.height - minSize.height) * animationSize.value;
            return Stack(
              children: [
                Positioned.fromRect(
                  rect: Rect.fromCenter(
                    center: Offset(
                      (minCenter!.dx +
                          (maxCenter.dx - minCenter.dx) *
                              animationCenter.value),
                      (minCenter.dy +
                          (maxCenter.dy - minCenter.dy) *
                              animationCenter.value),
                    ),
                    width: currentWidth,
                    height: currentHeight,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20 * animationSize.value,
                      sigmaY: 20 * animationSize.value,
                    ),
                    child: Opacity(
                      opacity: animationSize.value,
                      child: child!,
                    ),
                  ),
                ),
              ],
            );
          },
          child: child,
        );
      },
    );
  }
}
