import 'package:flutter/material.dart';
import 'package:zentea/l10n/app_localizations.dart';

enum TeaType {
  blackTea,
  greenTea,
  earlGreyTea,
  masalaTea,
  matchaTea,
  jasmineTea,
  oolongTea,
}

enum TeaFeatures {
  common,
  rare,
  legendary,
  secret,
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
      case TeaType.oolongTea:
        return l10n.oolongTea;
    }
  }
}

extension TeaStoryX on TeaType {
  String story(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case TeaType.blackTea:
        return l10n.blackTeaStory;
      case TeaType.greenTea:
        return l10n.greenTeaStory;
      case TeaType.earlGreyTea:
        return l10n.earlGreyTeaStory;
      case TeaType.masalaTea:
        return l10n.masalaTeaStory;
      case TeaType.matchaTea:
        return l10n.matchaTeaStory;
      case TeaType.jasmineTea:
        return l10n.jasmineTeaStory;
      case TeaType.oolongTea:
        return l10n.oolongTeaStory;
    }
  }
}