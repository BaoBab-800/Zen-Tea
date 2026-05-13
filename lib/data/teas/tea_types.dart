import 'package:flutter/material.dart';
import 'package:zentea/l10n/app_localizations.dart';

enum TeaType {
  blackTea,
  greenTea,
  earlGreyTea,
  masalaTea,
  matchaTea,
  jasmineTea,
  hibiscusTea,
  whiteTea,
  mintTea,
  oolongTea,
  rooibosTea,
  puerhTea,
}

enum TeaFeatures {
  common,
  rare,
  legendary,
}

enum TeaCountries {
  china,
  unitedKingdom,
  india,
  japan,
  egypt,
  morocco,
  southAfrica,
}

int getWeight(TeaFeatures feature) {
  switch (feature) {
    case TeaFeatures.common:
      return 70;
    case TeaFeatures.rare:
      return 20;
    case TeaFeatures.legendary:
      return 10;
  }
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
      case TeaType.hibiscusTea:
        return l10n.hibiscusTea;
      case TeaType.whiteTea:
        return l10n.whiteTea;
      case TeaType.mintTea:
        return l10n.mintTea;
      case TeaType.oolongTea:
        return l10n.oolongTea;
      case TeaType.rooibosTea:
        return l10n.rooibosTea;
      case TeaType.puerhTea:
        return l10n.puerhTea;
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
      case TeaType.hibiscusTea:
        return l10n.hibiscusTeaStory;
      case TeaType.whiteTea:
        return l10n.whiteTeaStory;
      case TeaType.mintTea:
        return l10n.mintTeaStory;
      case TeaType.oolongTea:
        return l10n.oolongTeaStory;
      case TeaType.rooibosTea:
        return l10n.rooibosTeaStory;
      case TeaType.puerhTea:
        return l10n.puerhTeaStory;
    }
  }
}

extension TeaTitleStoryX on TeaType {
  String titleStory(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch(this) {
      case TeaType.blackTea:
        return l10n.blackTeaStoryTitle;
      case TeaType.greenTea:
        return l10n.greenTeaStoryTitle;
      case TeaType.earlGreyTea:
        return l10n.earlGreyTeaStoryTitle;
      case TeaType.masalaTea:
        return l10n.masalaTeaStoryTitle;
      case TeaType.matchaTea:
        return l10n.matchaTeaStoryTitle;
      case TeaType.jasmineTea:
        return l10n.jasmineTeaStoryTitle;
      case TeaType.hibiscusTea:
        return l10n.hibiscusTeaStoryTitle;
      case TeaType.whiteTea:
        return l10n.whiteTeaStoryTitle;
      case TeaType.mintTea:
        return l10n.mintTeaStoryTitle;
      case TeaType.oolongTea:
        return l10n.oolongTeaStoryTitle;
      case TeaType.rooibosTea:
        return l10n.rooibosTeaStoryTitle;
      case TeaType.puerhTea:
        return l10n.puerhTeaStoryTitle;
    }
  }
}

extension TeaCountriesX on TeaCountries {
  String title(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      case TeaCountries.china:
        return l10n.china;
      case TeaCountries.unitedKingdom:
        return l10n.unitedKingdom;
      case TeaCountries.india:
        return l10n.india;
      case TeaCountries.japan:
        return l10n.japan;
      case TeaCountries.egypt:
        return l10n.egypt;
      case TeaCountries.morocco:
        return l10n.morocco;
      case TeaCountries.southAfrica:
        return l10n.southAfrica;
    }
  }
}