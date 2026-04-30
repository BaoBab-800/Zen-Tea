import 'package:provider/provider.dart';

import 'package:zentea/services/settings/settings_service.dart';

final providers = [
  ChangeNotifierProvider(
    create: (_) => SettingsService(),
  ),
];