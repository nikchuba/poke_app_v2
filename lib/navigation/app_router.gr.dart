// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(key: args.key),
      );
    },
    CharactersTab.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    SeasonsTab.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    LocationsTab.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    CharactersRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersRouteArgs>(
          orElse: () => const CharactersRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CharactersScreen(key: args.key),
      );
    },
    CharacterDetailsPopup.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CharacterDetailsPopupArgs>(
          orElse: () => CharacterDetailsPopupArgs(id: pathParams.getInt('id')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: CharacterDetailsPopupView(
          key: args.key,
          context: args.context,
          id: args.id,
          card: args.card,
        ),
        customRouteBuilder: CustomRouteBuilders.popupBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SeasonsRoute.name: (routeData) {
      final args = routeData.argsAs<SeasonsRouteArgs>(
          orElse: () => const SeasonsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SeasonsScreen(key: args.key),
      );
    },
    SeasonEpisodesTabView.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeasonEpisodesTabViewArgs>(
          orElse: () =>
              SeasonEpisodesTabViewArgs(seasonId: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SeasonEpisodesView(
          key: args.key,
          seasonId: args.seasonId,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LocationScreen(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
          children: [
            RouteConfig(
              CharactersTab.name,
              path: 'characters',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  CharactersRoute.name,
                  path: '',
                  parent: CharactersTab.name,
                ),
                RouteConfig(
                  CharacterDetailsPopup.name,
                  path: ':id',
                  parent: CharactersTab.name,
                ),
              ],
            ),
            RouteConfig(
              SeasonsTab.name,
              path: 'seasons',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  SeasonsRoute.name,
                  path: '',
                  parent: SeasonsTab.name,
                  children: [
                    RouteConfig(
                      SeasonEpisodesTabView.name,
                      path: ':id',
                      parent: SeasonsRoute.name,
                    )
                  ],
                ),
                RouteConfig(
                  CharacterDetailsPopup.name,
                  path: ':id',
                  parent: SeasonsTab.name,
                ),
              ],
            ),
            RouteConfig(
              LocationsTab.name,
              path: 'locations',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  LocationRoute.name,
                  path: '',
                  parent: LocationsTab.name,
                )
              ],
            ),
          ],
        ),
        RouteConfig(
          '#redirect',
          path: '',
          redirectTo: 'home',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EmptyRouterScreen]
class CharactersTab extends PageRouteInfo<void> {
  const CharactersTab({List<PageRouteInfo>? children})
      : super(
          CharactersTab.name,
          path: 'characters',
          initialChildren: children,
        );

  static const String name = 'CharactersTab';
}

/// generated route for
/// [EmptyRouterScreen]
class SeasonsTab extends PageRouteInfo<void> {
  const SeasonsTab({List<PageRouteInfo>? children})
      : super(
          SeasonsTab.name,
          path: 'seasons',
          initialChildren: children,
        );

  static const String name = 'SeasonsTab';
}

/// generated route for
/// [EmptyRouterScreen]
class LocationsTab extends PageRouteInfo<void> {
  const LocationsTab({List<PageRouteInfo>? children})
      : super(
          LocationsTab.name,
          path: 'locations',
          initialChildren: children,
        );

  static const String name = 'LocationsTab';
}

/// generated route for
/// [CharactersScreen]
class CharactersRoute extends PageRouteInfo<CharactersRouteArgs> {
  CharactersRoute({Key? key})
      : super(
          CharactersRoute.name,
          path: '',
          args: CharactersRouteArgs(key: key),
        );

  static const String name = 'CharactersRoute';
}

class CharactersRouteArgs {
  const CharactersRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CharactersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CharacterDetailsPopupView]
class CharacterDetailsPopup extends PageRouteInfo<CharacterDetailsPopupArgs> {
  CharacterDetailsPopup({
    Key? key,
    BuildContext? context,
    required int id,
    CharacterCard? card,
  }) : super(
          CharacterDetailsPopup.name,
          path: ':id',
          args: CharacterDetailsPopupArgs(
            key: key,
            context: context,
            id: id,
            card: card,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'CharacterDetailsPopup';
}

class CharacterDetailsPopupArgs {
  const CharacterDetailsPopupArgs({
    this.key,
    this.context,
    required this.id,
    this.card,
  });

  final Key? key;

  final BuildContext? context;

  final int id;

  final CharacterCard? card;

  @override
  String toString() {
    return 'CharacterDetailsPopupArgs{key: $key, context: $context, id: $id, card: $card}';
  }
}

/// generated route for
/// [SeasonsScreen]
class SeasonsRoute extends PageRouteInfo<SeasonsRouteArgs> {
  SeasonsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SeasonsRoute.name,
          path: '',
          args: SeasonsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SeasonsRoute';
}

class SeasonsRouteArgs {
  const SeasonsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SeasonsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SeasonEpisodesView]
class SeasonEpisodesTabView extends PageRouteInfo<SeasonEpisodesTabViewArgs> {
  SeasonEpisodesTabView({
    Key? key,
    required int seasonId,
  }) : super(
          SeasonEpisodesTabView.name,
          path: ':id',
          args: SeasonEpisodesTabViewArgs(
            key: key,
            seasonId: seasonId,
          ),
          rawPathParams: {'id': seasonId},
        );

  static const String name = 'SeasonEpisodesTabView';
}

class SeasonEpisodesTabViewArgs {
  const SeasonEpisodesTabViewArgs({
    this.key,
    required this.seasonId,
  });

  final Key? key;

  final int seasonId;

  @override
  String toString() {
    return 'SeasonEpisodesTabViewArgs{key: $key, seasonId: $seasonId}';
  }
}

/// generated route for
/// [LocationScreen]
class LocationRoute extends PageRouteInfo<LocationRouteArgs> {
  LocationRoute({Key? key})
      : super(
          LocationRoute.name,
          path: '',
          args: LocationRouteArgs(key: key),
        );

  static const String name = 'LocationRoute';
}

class LocationRouteArgs {
  const LocationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key}';
  }
}
