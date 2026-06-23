import 'package:flutter/material.dart';
import 'package:zentea/l10n/app_localizations.dart';

enum TeaType {
  // Common
  blackTea,
  greenTea,
  earlGreyTea,
  masalaTea,
  matchaTea,
  jasmineTea,
  hibiscusTea,
  whiteTea,
  mintTea,
  chamomileTea,
  aniseTea,
  assamTea,
  nilgiriTea,
  genmaichaTea,
  hojichaTea,
  helbaTea,
  mateTea,
  carpathianTea,

  // Rare
  oolongTea,
  rooibosTea,
  puerhTea,
  senchaTea,
  honeybushTea,
  branchTea,

  // Legendary
  darjeelingTea,
  gyokuroTea,
  tieguanyinTea,
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
  brazil,
  ukraine,
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
      // Common
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
      case TeaType.chamomileTea:
        return l10n.chamomileTea;
      case TeaType.aniseTea:
        return l10n.aniseTea;
      case TeaType.assamTea:
        return l10n.assamTea;
      case TeaType.nilgiriTea:
        return l10n.nilgiriTea;
      case TeaType.genmaichaTea:
        return l10n.genmaichaTea;
      case TeaType.hojichaTea:
        return l10n.hojichaTea;
      case TeaType.helbaTea:
        return l10n.helbaTea;
      case TeaType.mateTea:
        return l10n.mateTea;
      case TeaType.carpathianTea:
        return l10n.carpathianTea;

      // Rare
      case TeaType.oolongTea:
        return l10n.oolongTea;
      case TeaType.rooibosTea:
        return l10n.rooibosTea;
      case TeaType.puerhTea:
        return l10n.puerhTea;
      case TeaType.senchaTea:
        return l10n.senchaTea;
      case TeaType.honeybushTea:
        return l10n.honeybushTea;
      case TeaType.branchTea:
        return l10n.branchTea;

      // Legendary
      case TeaType.darjeelingTea:
        return l10n.darjeelingTea;
      case TeaType.gyokuroTea:
        return l10n.gyokuroTea;
      case TeaType.tieguanyinTea:
        return l10n.tieguanyinTea;
    }
  }
}

extension TeaStoryX on TeaType {
  String story(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (this) {
      // Common
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
      case TeaType.chamomileTea:
        return l10n.chamomileTeaStory;
      case TeaType.aniseTea:
        return l10n.aniseTeaStory;
      case TeaType.assamTea:
        return l10n.assamTeaStory;
      case TeaType.nilgiriTea:
        return l10n.nilgiriTeaStory;
      case TeaType.genmaichaTea:
        return l10n.genmaichaTeaStory;
      case TeaType.hojichaTea:
        return l10n.hojichaTeaStory;
      case TeaType.helbaTea:
        return l10n.helbaTeaStory;
      case TeaType.mateTea:
        return l10n.mateTeaStory;
      case TeaType.carpathianTea:
        return l10n.carpathianTeaStory;

      // Rare
      case TeaType.oolongTea:
        return l10n.oolongTeaStory;
      case TeaType.rooibosTea:
        return l10n.rooibosTeaStory;
      case TeaType.puerhTea:
        return l10n.puerhTeaStory;
      case TeaType.senchaTea:
        return l10n.senchaTeaStory;
      case TeaType.honeybushTea:
        return l10n.honeybushTeaStory;
      case TeaType.branchTea:
        return l10n.branchTeaStory;

      // Legendary
      case TeaType.darjeelingTea:
        return l10n.darjeelingTeaStory;
      case TeaType.gyokuroTea:
        return l10n.gyokuroTeaStory;
      case TeaType.tieguanyinTea:
        return l10n.tieguanyinTeaStory;
    }
  }
}

extension TeaTitleStoryX on TeaType {
  String titleStory(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch(this) {
      // Common
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
      case TeaType.chamomileTea:
        return l10n.chamomileTeaStoryTitle;
      case TeaType.aniseTea:
        return l10n.aniseTeaStoryTitle;
      case TeaType.assamTea:
        return l10n.assamTeaStoryTitle;
      case TeaType.nilgiriTea:
        return l10n.nilgiriTeaStoryTitle;
      case TeaType.genmaichaTea:
        return l10n.genmaichaTeaStoryTitle;
      case TeaType.hojichaTea:
        return l10n.hojichaTeaStoryTitle;
      case TeaType.helbaTea:
        return l10n.helbaTeaStoryTitle;
      case TeaType.mateTea:
        return l10n.mateTeaStoryTitle;
      case TeaType.carpathianTea:
        return l10n.carpathianTeaStoryTitle;

      // Rare
      case TeaType.oolongTea:
        return l10n.oolongTeaStoryTitle;
      case TeaType.rooibosTea:
        return l10n.rooibosTeaStoryTitle;
      case TeaType.puerhTea:
        return l10n.puerhTeaStoryTitle;
      case TeaType.senchaTea:
        return l10n.senchaTeaStoryTitle;
      case TeaType.honeybushTea:
        return l10n.honeybushTeaStoryTitle;
      case TeaType.branchTea:
        return l10n.branchTeaStoryTitle;

      // Legendary
      case TeaType.darjeelingTea:
        return l10n.darjeelingTeaStoryTitle;
      case TeaType.gyokuroTea:
        return l10n.gyokuroTeaStoryTitle;
      case TeaType.tieguanyinTea:
        return l10n.tieguanyinTeaStoryTitle;
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
      case TeaCountries.brazil:
        return l10n.brazil;
      case TeaCountries.ukraine:
        return l10n.ukraine;
    }
  }
}