import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:zentea/l10n/app_localizations.dart';

class L10n {
  static const defaultLocale = Locale('en');

  static const supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,

    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}