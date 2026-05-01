import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:zentea/services/url/url_service.dart';

import '../ui/home/home_page_builder.dart';
import '../ui/get_tea/get_tea_builder.dart';
import '../ui/tea_collection/tea_collection_page_builder.dart';
import '../ui/tea_quiz/tea_quiz_builder.dart';
import '../ui/achievements/achievements_builder.dart';
import '../ui/settings/settings_page_builder.dart';
import '../ui/developer/developer_room.dart';

enum AppRoute {
  home,
  getTeaForToday,
  teaCollection,
  whatKindOfTeaAreYouQuiz,
  achievements,
  settings,
  about,
  developer,
}

extension AppRoutePath on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.getTeaForToday:
        return '/get-tea-for-today';
      case AppRoute.whatKindOfTeaAreYouQuiz:
        return '/what-kind-of-tea-are-you-quiz';
      case AppRoute.achievements:
        return '/achievements';
      case AppRoute.teaCollection:
        return '/tea-collection';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.about:
        return '/about';
      case AppRoute.developer:
        return '/developer';
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
        path: AppRoute.getTeaForToday.path,
        builder: (context, state) => GetTeaBuilder(urlService: UrlService()),
      ),

      GoRoute(
        path: AppRoute.teaCollection.path,
        builder: (context, state) => const TeaCollectionPageBuilder(),
      ),

      GoRoute(
        path: AppRoute.whatKindOfTeaAreYouQuiz.path,
        builder: (context, state) => const TeaQuizBuilder(),
      ),

      GoRoute(
        path: AppRoute.achievements.path,
        builder: (context, state) => const AchievementsBuilder(),
      ),

      GoRoute(
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsPageBuilder(),
      ),

      GoRoute(
        path: AppRoute.developer.path,
        builder: (context, state) => const DeveloperRoom(),
      ),
    ],
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