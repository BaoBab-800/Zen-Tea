import 'package:provider/provider.dart';

import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/settings/settings_provider.dart';

final providers = [
  ChangeNotifierProvider(
    create: (_) => SettingsProvider(SettingsService()),
  ),
];