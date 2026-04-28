import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../ui/home/home_page_builder.dart';
import '../ui/settings/settings_page_builder.dart';

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

      GoRoute(
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsPageBuilder(),
      ),
    ]
  );
}

extension Navigation on BuildContext {
  void goRoute(AppRoute route) {
    go(route.path);
  }

  void pushRoute(AppRoute route) {
    push(route.path);
  }
}