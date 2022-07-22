import 'package:auto_route/auto_route.dart';
import 'package:example/main.dart';
import 'package:example/pages/chat_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Loader|Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: AppLoader,
      initial: true,
      children: [
        AutoRoute(page: HomePage),
      ],
    ),
    AutoRoute(page: ChatPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
