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
    DefaultConversationRoute.name: (routeData) {
      final args = routeData.argsAs<DefaultConversationRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DefaultConversationLoader(
              key: args.key,
              conversationId: args.conversationId,
              conversationsBloc: args.conversationsBloc,
              showCloseButton: args.showCloseButton));
    },
    ChatMediaViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ChatMediaViewerRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ChatMediaViewerLoader(
              key: args.key,
              title: args.title,
              message: args.message,
              convoBloc: args.convoBloc));
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
        RouteConfig(ChatRoute.name, path: '/chat-page'),
        RouteConfig(DefaultConversationRoute.name,
            path: '/default-conversation-loader'),
        RouteConfig(ChatMediaViewerRoute.name,
            path: '/chat-media-viewer-loader')
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
/// [DefaultConversationLoader]
class DefaultConversationRoute
    extends PageRouteInfo<DefaultConversationRouteArgs> {
  DefaultConversationRoute(
      {Key? key,
      required String conversationId,
      ConversationsBloc? conversationsBloc,
      bool showCloseButton = true})
      : super(DefaultConversationRoute.name,
            path: '/default-conversation-loader',
            args: DefaultConversationRouteArgs(
                key: key,
                conversationId: conversationId,
                conversationsBloc: conversationsBloc,
                showCloseButton: showCloseButton));

  static const String name = 'DefaultConversationRoute';
}

class DefaultConversationRouteArgs {
  const DefaultConversationRouteArgs(
      {this.key,
      required this.conversationId,
      this.conversationsBloc,
      this.showCloseButton = true});

  final Key? key;

  final String conversationId;

  final ConversationsBloc? conversationsBloc;

  final bool showCloseButton;

  @override
  String toString() {
    return 'DefaultConversationRouteArgs{key: $key, conversationId: $conversationId, conversationsBloc: $conversationsBloc, showCloseButton: $showCloseButton}';
  }
}

/// generated route for
/// [ChatMediaViewerLoader]
class ChatMediaViewerRoute extends PageRouteInfo<ChatMediaViewerRouteArgs> {
  ChatMediaViewerRoute(
      {Key? key,
      required String title,
      required ConversationMessage message,
      required ConversationBloc convoBloc})
      : super(ChatMediaViewerRoute.name,
            path: '/chat-media-viewer-loader',
            args: ChatMediaViewerRouteArgs(
                key: key,
                title: title,
                message: message,
                convoBloc: convoBloc));

  static const String name = 'ChatMediaViewerRoute';
}

class ChatMediaViewerRouteArgs {
  const ChatMediaViewerRouteArgs(
      {this.key,
      required this.title,
      required this.message,
      required this.convoBloc});

  final Key? key;

  final String title;

  final ConversationMessage message;

  final ConversationBloc convoBloc;

  @override
  String toString() {
    return 'ChatMediaViewerRouteArgs{key: $key, title: $title, message: $message, convoBloc: $convoBloc}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home-page');

  static const String name = 'HomeRoute';
}
