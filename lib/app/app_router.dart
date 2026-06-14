import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:zentea/services/url/url_service.dart';

import '../ui/home/home_page_builder.dart';
import '../ui/get_tea/get_tea_builder.dart';
import '../ui/tea_map/tea_map_builder.dart';
import '../ui/tea_collection/tea_collection_page_builder.dart';
import '../ui/achievements/achievements_builder.dart';
import '../ui/settings/settings_page_builder.dart';
import '../ui/developer/developer_room.dart';
import '../ui/about/about_builder.dart';
import '../ui/his_page/his_page_start.dart';
import '../ui/his_page/his_page_content.dart';

enum AppRoute {
  home(name: 'home', path: '/'),
  getTeaForToday(name: 'getTeaForToday', path: '/get-tea-for-today'),
  teaMap(name: 'teaMap', path: '/tea-map'),
  teaCollection(name: 'teaCollection', path: '/tea-collection'),
  achievements(name: 'achievements', path: '/achievements'),
  settings(name: 'settings', path: '/settings'),
  developer(name: 'developer', path: '/developer'),
  about(name: 'about', path: '/about'),
  hisPageStart(name: 'hisPageStart', path: '/his-page-start'),
  hisPageContent(name: 'hisPageContent', path: '/his-page-content');

  final String name;
  final String path;

  const AppRoute({
    required this.name,
    required this.path,
  });
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        name: AppRoute.getTeaForToday.name,
        path: AppRoute.getTeaForToday.path,
        builder: (context, state) => GetTeaBuilder(urlService: UrlService()),
      ),

      GoRoute(
        name: AppRoute.teaMap.name,
        path: AppRoute.teaMap.path,
        builder: (context, state) => TeaMapBuilder(),
      ),

      GoRoute(
        name: AppRoute.teaCollection.name,
        path: AppRoute.teaCollection.path,
        builder: (context, state) => const TeaCollectionPageBuilder(),
      ),

      GoRoute(
        name: AppRoute.achievements.name,
        path: AppRoute.achievements.path,
        builder: (context, state) => const AchievementsBuilder(),
      ),

      GoRoute(
        name: AppRoute.settings.name,
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsPageBuilder(),
      ),

      GoRoute(
        name: AppRoute.developer.name,
        path: AppRoute.developer.path,
        builder: (context, state) => const DeveloperRoom(),
      ),

      GoRoute(
        name: AppRoute.about.name,
        path: AppRoute.about.path,
        builder: (context, state) => const AboutBuilder(),
      ),

      GoRoute(
        name: AppRoute.hisPageStart.name,
        path: AppRoute.hisPageStart.path,
        builder: (context, state) => const HisPageStart(),
      ),

      GoRoute(
        name: AppRoute.hisPageContent.name,
        path: AppRoute.hisPageContent.path,
        builder: (context, state) => const HisPageContent(),
      ),
    ],
  );
}

extension Navigation on BuildContext {
  void goRoute(AppRoute route) => go(route.path);

  void pushRoute(AppRoute route) => push(route.path);
}