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
    CharactersRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersRouteArgs>(
          orElse: () => const CharactersRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CharactersPage(key: args.key),
      );
    },
    EpisodesRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodesRouteArgs>(
          orElse: () => const EpisodesRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EpisodesPage(key: args.key),
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
              CharactersRoute.name,
              path: 'characters',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              EpisodesRoute.name,
              path: 'episodes',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  SeasonRoute.name,
                  path: ':id',
                  parent: EpisodesRoute.name,
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
/// [CharactersPage]
class CharactersRoute extends PageRouteInfo<CharactersRouteArgs> {
  CharactersRoute({Key? key})
      : super(
          CharactersRoute.name,
          path: 'characters',
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
/// [EpisodesPage]
class EpisodesRoute extends PageRouteInfo<EpisodesRouteArgs> {
  EpisodesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EpisodesRoute.name,
          path: 'episodes',
          args: EpisodesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EpisodesRoute';
}

class EpisodesRouteArgs {
  const EpisodesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EpisodesRouteArgs{key: $key}';
  }
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
