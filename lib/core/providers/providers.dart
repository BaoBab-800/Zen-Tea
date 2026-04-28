import 'package:provider/provider.dart';

import '/services/test_provider.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => TeaProvider()),
];