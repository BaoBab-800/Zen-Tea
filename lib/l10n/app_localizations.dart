import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// No description provided for @currentTeaSeries.
  ///
  /// In en, this message translates to:
  /// **'Current Tea Series: '**
  String get currentTeaSeries;

  /// No description provided for @getTeaForToday.
  ///
  /// In en, this message translates to:
  /// **'Get tea for today'**
  String get getTeaForToday;

  /// No description provided for @teaCollection.
  ///
  /// In en, this message translates to:
  /// **'Tea Collection'**
  String get teaCollection;

  /// No description provided for @whatKindOfTeaAreYouQuiz.
  ///
  /// In en, this message translates to:
  /// **'What kind of tea are you? Quiz'**
  String get whatKindOfTeaAreYouQuiz;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @todayTea.
  ///
  /// In en, this message translates to:
  /// **'Today tea'**
  String get todayTea;

  /// No description provided for @newTea.
  ///
  /// In en, this message translates to:
  /// **'New tea!'**
  String get newTea;

  /// No description provided for @readTheStory.
  ///
  /// In en, this message translates to:
  /// **'Read the story'**
  String get readTheStory;

  /// No description provided for @goToWiki.
  ///
  /// In en, this message translates to:
  /// **'Go to Wikipedia'**
  String get goToWiki;

  /// No description provided for @teaQuiz.
  ///
  /// In en, this message translates to:
  /// **'Tea quiz'**
  String get teaQuiz;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @blackTea.
  ///
  /// In en, this message translates to:
  /// **'Black tea'**
  String get blackTea;

  /// No description provided for @greenTea.
  ///
  /// In en, this message translates to:
  /// **'Green tea'**
  String get greenTea;

  /// No description provided for @earlGreyTea.
  ///
  /// In en, this message translates to:
  /// **'Earl grey tea'**
  String get earlGreyTea;

  /// No description provided for @masalaTea.
  ///
  /// In en, this message translates to:
  /// **'Masala tea'**
  String get masalaTea;

  /// No description provided for @matchaTea.
  ///
  /// In en, this message translates to:
  /// **'Matcha tea'**
  String get matchaTea;

  /// No description provided for @jasmineTea.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea'**
  String get jasmineTea;

  /// No description provided for @blackTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get blackTeaStory;

  /// No description provided for @greenTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get greenTeaStory;

  /// No description provided for @earlGreyTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get earlGreyTeaStory;

  /// No description provided for @masalaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get masalaTeaStory;

  /// No description provided for @matchaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get matchaTeaStory;

  /// No description provided for @jasmineTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Let\'s pretend this is an interesting story.'**
  String get jasmineTeaStory;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
