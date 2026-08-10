import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:zentea/l10n/generated/app_localizations.dart';

class L10n {
  static const defaultLocale = Locale('en');

  static const supportedLocales = [
    Locale('en'),
    Locale('uk'),
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,

    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}