import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

List<SingleChildWidget> buildProviders() => [
  ChangeNotifierProvider(
    create: (context) => TeaCollectionService(),
  ),

  ChangeNotifierProvider(
    create: (_) => SettingsService(),
  ),

  Provider<TodayTeaService>(
    create: (context) => TodayTeaServiceImpl(),
  ),
];