import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../ui/home/home_page.dart';

enum AppRoute {
  home,
  settings,
  about,
}

extension AppRoutePath on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.about:
        return '/about';
    }
  }
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
      ),
    ]
  );
}

extension Navigation on BuildContext {
  void goRoute(AppRoute route) {
    go(route.path);
  }
}