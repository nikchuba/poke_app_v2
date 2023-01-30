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
    EpisodeRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeRouteArgs>(
          orElse: () => const EpisodeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EpisodePage(key: args.key),
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
              EpisodeRoute.name,
              path: 'episodes',
              parent: HomeRoute.name,
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
/// [EpisodePage]
class EpisodeRoute extends PageRouteInfo<EpisodeRouteArgs> {
  EpisodeRoute({Key? key})
      : super(
          EpisodeRoute.name,
          path: 'episodes',
          args: EpisodeRouteArgs(key: key),
        );

  static const String name = 'EpisodeRoute';
}

class EpisodeRouteArgs {
  const EpisodeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EpisodeRouteArgs{key: $key}';
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
