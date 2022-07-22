// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppLoader());
    },
    ChatRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ChatPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(AppRoute.name, path: '/', children: [
          RouteConfig(HomeRoute.name, path: 'home-page', parent: AppRoute.name)
        ]),
        RouteConfig(ChatRoute.name, path: '/chat-page')
      ];
}

/// generated route for
/// [AppLoader]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(AppRoute.name, path: '/', initialChildren: children);

  static const String name = 'AppRoute';
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute() : super(ChatRoute.name, path: '/chat-page');

  static const String name = 'ChatRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home-page');

  static const String name = 'HomeRoute';
}
