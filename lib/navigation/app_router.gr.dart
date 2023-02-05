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
        child: HomePage(key: args.key),
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
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LocationPage(key: args.key),
      );
    },
    CharactersRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersRouteArgs>(
          orElse: () => const CharactersRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CharactersPage(key: args.key),
      );
    },
    CharacterCardDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CharacterCardDetailPage(),
      );
    },
    SeasonsRoute.name: (routeData) {
      final args = routeData.argsAs<SeasonsRouteArgs>(
          orElse: () => const SeasonsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SeasonsPage(key: args.key),
      );
    },
    SeasonRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeasonRouteArgs>(
          orElse: () => SeasonRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SeasonPage(
          key: args.key,
          id: args.id,
        ),
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
                  CharacterCardDetailRoute.name,
                  path: 'detail',
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
                      SeasonRoute.name,
                      path: ':id',
                      parent: SeasonsRoute.name,
                    )
                  ],
                )
              ],
            ),
            RouteConfig(
              LocationRoute.name,
              path: 'locations',
              parent: HomeRoute.name,
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
/// [HomePage]
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
/// [LocationPage]
class LocationRoute extends PageRouteInfo<LocationRouteArgs> {
  LocationRoute({Key? key})
      : super(
          LocationRoute.name,
          path: 'locations',
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

/// generated route for
/// [CharactersPage]
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
/// [CharacterCardDetailPage]
class CharacterCardDetailRoute extends PageRouteInfo<void> {
  const CharacterCardDetailRoute()
      : super(
          CharacterCardDetailRoute.name,
          path: 'detail',
        );

  static const String name = 'CharacterCardDetailRoute';
}

/// generated route for
/// [SeasonsPage]
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
/// [SeasonPage]
class SeasonRoute extends PageRouteInfo<SeasonRouteArgs> {
  SeasonRoute({
    Key? key,
    required int id,
  }) : super(
          SeasonRoute.name,
          path: ':id',
          args: SeasonRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'SeasonRoute';
}

class SeasonRouteArgs {
  const SeasonRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SeasonRouteArgs{key: $key, id: $id}';
  }
}
