import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

List<SingleChildWidget> buildProviders(SharedPreferences prefs) => [
  Provider<SharedPreferences>.value(value: prefs),

  Provider<List<TeaModel>>(
    create: (_) => listOfTeas,
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