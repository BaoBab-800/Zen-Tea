import 'package:flutter/material.dart';
import 'package:zentea/l10n/app_localizations.dart';

enum TeaType {
  blackTea,
  greenTea,
  earlGreyTea,
  masalaTea,
  matchaTea,
  jasmineTea,
}

extension TeaTypeX on TeaType {
  String title(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case TeaType.blackTea:
        return l10n.blackTea;
      case TeaType.greenTea:
        return l10n.greenTea;
      case TeaType.earlGreyTea:
        return l10n.earlGreyTea;
      case TeaType.masalaTea:
        return l10n.masalaTea;
      case TeaType.matchaTea:
        return l10n.matchaTea;
      case TeaType.jasmineTea:
        return l10n.jasmineTea;
    }
  }
}