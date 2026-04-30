import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

List<SingleChildWidget> buildProviders(SharedPreferences prefs) => [
  Provider<SharedPreferences>.value(value: prefs),

  ChangeNotifierProvider(
    create: (context) => TeaCollectionService(
      context.read<SharedPreferences>(),
    ),
  ),

  ChangeNotifierProvider(
    create: (_) => SettingsService(),
  ),

  Provider<TodayTeaService>(
    create: (context) => TodayTeaServiceImpl(
      context.read<SharedPreferences>(),
    ),
  ),
];