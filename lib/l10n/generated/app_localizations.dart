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
/// import 'generated/app_localizations.dart';
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

  /// No description provided for @aboutApplicationDescription.
  ///
  /// In en, this message translates to:
  /// **'Is an app for tea lovers where you can learn about different varieties, their properties, and their history.'**
  String get aboutApplicationDescription;

  /// No description provided for @aboutWhyDoYouNeedThisApp.
  ///
  /// In en, this message translates to:
  /// **'I created this app to make the world of tea closer and more understandable: from simple everyday teas to rare varieties.'**
  String get aboutWhyDoYouNeedThisApp;

  /// No description provided for @aboutPhilosophy.
  ///
  /// In en, this message translates to:
  /// **'Tea is a world that everyone sees in their own way.'**
  String get aboutPhilosophy;

  /// No description provided for @aboutTeam.
  ///
  /// In en, this message translates to:
  /// **'Developed by a Flutter developer enthusiast.'**
  String get aboutTeam;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version '**
  String get aboutVersion;

  /// No description provided for @aboutLinks.
  ///
  /// In en, this message translates to:
  /// **'Links:'**
  String get aboutLinks;

  /// No description provided for @aboutGithub.
  ///
  /// In en, this message translates to:
  /// **'Project GitHub'**
  String get aboutGithub;

  /// No description provided for @aboutSupport.
  ///
  /// In en, this message translates to:
  /// **'A penny for tea'**
  String get aboutSupport;

  /// No description provided for @aboutToHisPage.
  ///
  /// In en, this message translates to:
  /// **'Go to His Page'**
  String get aboutToHisPage;

  /// No description provided for @aboutToDeveloperRoom.
  ///
  /// In en, this message translates to:
  /// **'Go to the developer room'**
  String get aboutToDeveloperRoom;

  /// No description provided for @tServeTenTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'Just 10 times'**
  String get tServeTenTeasAchievement;

  /// No description provided for @dServeTenTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'Hold on your 10-day streak'**
  String get dServeTenTeasAchievement;

  /// No description provided for @tFirstStepsAchievement.
  ///
  /// In en, this message translates to:
  /// **'First Steps'**
  String get tFirstStepsAchievement;

  /// No description provided for @dFirstStepsAchievement.
  ///
  /// In en, this message translates to:
  /// **'Open 3 different teas'**
  String get dFirstStepsAchievement;

  /// No description provided for @tGetRareTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'A rare find'**
  String get tGetRareTeasAchievement;

  /// No description provided for @dGetRareTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'Get 3 Rare Teas'**
  String get dGetRareTeasAchievement;

  /// No description provided for @tLegendaryTeaAchievement.
  ///
  /// In en, this message translates to:
  /// **'Sounds like a legend'**
  String get tLegendaryTeaAchievement;

  /// No description provided for @dLegendaryTeaAchievement.
  ///
  /// In en, this message translates to:
  /// **'Find the legendary tea'**
  String get dLegendaryTeaAchievement;

  /// No description provided for @tCollectAllTheTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'A true collector'**
  String get tCollectAllTheTeasAchievement;

  /// No description provided for @dCollectAllTheTeasAchievement.
  ///
  /// In en, this message translates to:
  /// **'Find all teas'**
  String get dCollectAllTheTeasAchievement;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @noActivityRecorded.
  ///
  /// In en, this message translates to:
  /// **'No activity recorded'**
  String get noActivityRecorded;

  /// No description provided for @activityRecorded.
  ///
  /// In en, this message translates to:
  /// **'Activity recorded'**
  String get activityRecorded;

  /// Shows the selected tea for the day
  ///
  /// In en, this message translates to:
  /// **'Tea of the day: {tea}'**
  String teaOfTheDay(String tea);

  /// No description provided for @china.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get china;

  /// No description provided for @unitedKingdom.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get unitedKingdom;

  /// No description provided for @india.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get india;

  /// No description provided for @japan.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get japan;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @morocco.
  ///
  /// In en, this message translates to:
  /// **'Morocco'**
  String get morocco;

  /// No description provided for @southAfrica.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get southAfrica;

  /// No description provided for @brazil.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get brazil;

  /// No description provided for @ukraine.
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get ukraine;

  /// No description provided for @canada.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get canada;

  /// No description provided for @russia.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get russia;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @common.
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get common;

  /// No description provided for @rare.
  ///
  /// In en, this message translates to:
  /// **'Rare'**
  String get rare;

  /// No description provided for @legendary.
  ///
  /// In en, this message translates to:
  /// **'Legendary'**
  String get legendary;

  /// No description provided for @currentTeaSeries.
  ///
  /// In en, this message translates to:
  /// **'Tea Series: '**
  String get currentTeaSeries;

  /// No description provided for @getTeaForToday.
  ///
  /// In en, this message translates to:
  /// **'Get tea for today'**
  String get getTeaForToday;

  /// No description provided for @teaMap.
  ///
  /// In en, this message translates to:
  /// **'Tea map'**
  String get teaMap;

  /// No description provided for @teaCollection.
  ///
  /// In en, this message translates to:
  /// **'Tea Collection'**
  String get teaCollection;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Tea calendar'**
  String get calendar;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @totalTeasOpened.
  ///
  /// In en, this message translates to:
  /// **'Total teas opened'**
  String get totalTeasOpened;

  /// No description provided for @totalTeasDrunk.
  ///
  /// In en, this message translates to:
  /// **'Total teas received'**
  String get totalTeasDrunk;

  /// No description provided for @maximumSeries.
  ///
  /// In en, this message translates to:
  /// **'Maximum series'**
  String get maximumSeries;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @newAchievement.
  ///
  /// In en, this message translates to:
  /// **'New achievement'**
  String get newAchievement;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About application'**
  String get about;

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

  /// No description provided for @profileChoosingAnAvatar.
  ///
  /// In en, this message translates to:
  /// **'Choose tea for your avatar'**
  String get profileChoosingAnAvatar;

  /// No description provided for @profileGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get profileGeneral;

  /// No description provided for @profileByRarity.
  ///
  /// In en, this message translates to:
  /// **'By rarity'**
  String get profileByRarity;

  /// No description provided for @profileActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get profileActivity;

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

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @howToPrepare.
  ///
  /// In en, this message translates to:
  /// **'How to prepare'**
  String get howToPrepare;

  /// No description provided for @howToDrink.
  ///
  /// In en, this message translates to:
  /// **'How to drink'**
  String get howToDrink;

  /// No description provided for @beneficialProperties.
  ///
  /// In en, this message translates to:
  /// **'Beneficial properties'**
  String get beneficialProperties;

  /// No description provided for @goToDeveloperRoom.
  ///
  /// In en, this message translates to:
  /// **'Go to developer room'**
  String get goToDeveloperRoom;

  /// No description provided for @developerRoom.
  ///
  /// In en, this message translates to:
  /// **'Developer room'**
  String get developerRoom;

  /// No description provided for @resetAllStats.
  ///
  /// In en, this message translates to:
  /// **'Reset all stats'**
  String get resetAllStats;

  /// No description provided for @unlockAll.
  ///
  /// In en, this message translates to:
  /// **'Unlock all'**
  String get unlockAll;

  /// No description provided for @blockAll.
  ///
  /// In en, this message translates to:
  /// **'Block all'**
  String get blockAll;

  /// No description provided for @nextDay.
  ///
  /// In en, this message translates to:
  /// **'Next day'**
  String get nextDay;

  /// No description provided for @unlockAllAchievements.
  ///
  /// In en, this message translates to:
  /// **'Unlock all achievements'**
  String get unlockAllAchievements;

  /// No description provided for @lockAllAchievements.
  ///
  /// In en, this message translates to:
  /// **'Lock all achievements'**
  String get lockAllAchievements;

  /// No description provided for @setRandomStreak.
  ///
  /// In en, this message translates to:
  /// **'Set random streak (0-99)'**
  String get setRandomStreak;

  /// No description provided for @resetStreak.
  ///
  /// In en, this message translates to:
  /// **'Reset streak'**
  String get resetStreak;

  /// No description provided for @changeDeveloperRoomFlag.
  ///
  /// In en, this message translates to:
  /// **'Change developer room flag'**
  String get changeDeveloperRoomFlag;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning!'**
  String get warning;

  /// No description provided for @warningContent.
  ///
  /// In en, this message translates to:
  /// **'You can do anything with your stats in the developer\'s room.\nUse at your own risk.'**
  String get warningContent;

  /// No description provided for @todayTea.
  ///
  /// In en, this message translates to:
  /// **'Today tea'**
  String get todayTea;

  /// No description provided for @aboutQuiz.
  ///
  /// In en, this message translates to:
  /// **'About quiz'**
  String get aboutQuiz;

  /// No description provided for @getTeaWarning.
  ///
  /// In en, this message translates to:
  /// **'Every day, you will receive a new tea. After drinking the tea, you can click the «Quest Completed» button and your streak will increase. You won\'t be competing with others here, and no one will check your progress. At least be honest with yourself.'**
  String get getTeaWarning;

  /// No description provided for @newTea.
  ///
  /// In en, this message translates to:
  /// **'New tea!'**
  String get newTea;

  /// No description provided for @teaServedTimes.
  ///
  /// In en, this message translates to:
  /// **'Served {count} times'**
  String teaServedTimes(Object count);

  /// No description provided for @questCompleted.
  ///
  /// In en, this message translates to:
  /// **'Quest completed'**
  String get questCompleted;

  /// No description provided for @series.
  ///
  /// In en, this message translates to:
  /// **'Series: {days}'**
  String series(int days);

  /// No description provided for @completedQuestSeries.
  ///
  /// In en, this message translates to:
  /// **'You\'ve already completed the quest.'**
  String get completedQuestSeries;

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

  /// No description provided for @hibiscusTea.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus tea'**
  String get hibiscusTea;

  /// No description provided for @whiteTea.
  ///
  /// In en, this message translates to:
  /// **'White tea'**
  String get whiteTea;

  /// No description provided for @mintTea.
  ///
  /// In en, this message translates to:
  /// **'Mint tea'**
  String get mintTea;

  /// No description provided for @chamomileTea.
  ///
  /// In en, this message translates to:
  /// **'Chamomile tea'**
  String get chamomileTea;

  /// No description provided for @aniseTea.
  ///
  /// In en, this message translates to:
  /// **'Anise Tea'**
  String get aniseTea;

  /// No description provided for @assamTea.
  ///
  /// In en, this message translates to:
  /// **'Assam tea'**
  String get assamTea;

  /// No description provided for @nilgiriTea.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri tea'**
  String get nilgiriTea;

  /// No description provided for @genmaichaTea.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha tea'**
  String get genmaichaTea;

  /// No description provided for @hojichaTea.
  ///
  /// In en, this message translates to:
  /// **'Hojicha tea'**
  String get hojichaTea;

  /// No description provided for @helbaTea.
  ///
  /// In en, this message translates to:
  /// **'Helba tea'**
  String get helbaTea;

  /// No description provided for @mateTea.
  ///
  /// In en, this message translates to:
  /// **'Mate tea'**
  String get mateTea;

  /// No description provided for @carpathianTea.
  ///
  /// In en, this message translates to:
  /// **'Carpathian tea'**
  String get carpathianTea;

  /// No description provided for @labradorTea.
  ///
  /// In en, this message translates to:
  /// **'Labrador tea'**
  String get labradorTea;

  /// No description provided for @ivanTea.
  ///
  /// In en, this message translates to:
  /// **'Ivan-tea'**
  String get ivanTea;

  /// No description provided for @oolongTea.
  ///
  /// In en, this message translates to:
  /// **'Oolong tea'**
  String get oolongTea;

  /// No description provided for @rooibosTea.
  ///
  /// In en, this message translates to:
  /// **'Rooibos tea'**
  String get rooibosTea;

  /// No description provided for @puerhTea.
  ///
  /// In en, this message translates to:
  /// **'Pu-erh tea'**
  String get puerhTea;

  /// No description provided for @senchaTea.
  ///
  /// In en, this message translates to:
  /// **'Sencha tea'**
  String get senchaTea;

  /// No description provided for @honeybushTea.
  ///
  /// In en, this message translates to:
  /// **'Honeybush tea'**
  String get honeybushTea;

  /// No description provided for @branchTea.
  ///
  /// In en, this message translates to:
  /// **'Branch tea'**
  String get branchTea;

  /// No description provided for @darjeelingTea.
  ///
  /// In en, this message translates to:
  /// **'Darjeeling tea'**
  String get darjeelingTea;

  /// No description provided for @gyokuroTea.
  ///
  /// In en, this message translates to:
  /// **'Gyokuro tea'**
  String get gyokuroTea;

  /// No description provided for @tieguanyinTea.
  ///
  /// In en, this message translates to:
  /// **'Tieguanyin tea'**
  String get tieguanyinTea;

  /// No description provided for @manoominTea.
  ///
  /// In en, this message translates to:
  /// **'Manoomin tea'**
  String get manoominTea;

  /// No description provided for @blackTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Black Tea – «The Tea That Accidentally Became a Legend»'**
  String get blackTeaStoryTitle;

  /// No description provided for @blackTeaStory.
  ///
  /// In en, this message translates to:
  /// **'They say black tea was not created on purpose, but rather discovered by accident when a batch of green tea was left forgotten.\n\nIn China, tea leaves were usually processed soon after being picked to preserve their fresh character and green color. But one day, a batch of leaves was left unattended and began to oxidize. The leaves slowly darkened, their aroma changed, and something new began to emerge – a deeper, richer character than anyone had expected.\n\nInstead of throwing the leaves away, people decided to give them a try. And they liked what they tasted.\n\nAnd so, almost by accident, a new kind of tea was discovered – one that would later become known as black tea.'**
  String get blackTeaStory;

  /// No description provided for @blackTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare black tea, use water heated to around 90-95°C. Pour it over the tea leaves and let them slowly release their flavor for 3-5 minutes. A longer steep will usually bring out a deeper and stronger taste.'**
  String get blackTeaPreparation;

  /// No description provided for @blackTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Black tea is often enjoyed hot, allowing its rich aroma and flavor to unfold with every sip. It can be enjoyed on its own, but a little milk, lemon, or honey can give it a completely different character.'**
  String get blackTeaHowToDrink;

  /// No description provided for @blackTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Black tea naturally contains caffeine, making it a pleasant companion when you want to stay alert or simply need a little extra energy. It also contains polyphenols and other naturally occurring compounds found in tea leaves.'**
  String get blackTeaProperties;

  /// No description provided for @greenTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Green Tea – «The Whisper of the Ancient Emperor»'**
  String get greenTeaStoryTitle;

  /// No description provided for @greenTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Legend has it that thousands of years ago, the Chinese Emperor Shennong was resting under a wild tea tree while his servants boiled drinking water. A gentle breeze blew a few leaves directly into the steaming pot.\n\nFascinated by the inviting aroma and the delicate green tint the water took on, the curious emperor decided to taste the brew. He found it remarkably refreshing and invigorating.\n\nAccording to legend, this was the moment that marked the beginning of the history of tea, opening a quiet tradition of harmony and mindfulness that has endured for centuries.'**
  String get greenTeaStory;

  /// No description provided for @greenTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare green tea, heat water to around 70-80°C to avoid scalding the delicate leaves. Pour over the leaves and steep for 1-3 minutes. Shorter steeping preserves its smooth, sweet undertones, while a bit longer brings out a light, crisp character.'**
  String get greenTeaPreparation;

  /// No description provided for @greenTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Green tea is best enjoyed pure and fresh, without added sweeteners or milk. Take slow sips from a thin ceramic or glass cup to fully appreciate its clean, earthy, and floral notes.'**
  String get greenTeaHowToDrink;

  /// No description provided for @greenTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Green tea is rich in antioxidant polyphenols, including catechins, the most notable of which is EGCG. It also contains L-theanine and caffeine, the combination of which may promote alertness, concentration, and clarity of thought.'**
  String get greenTeaProperties;

  /// No description provided for @earlGreyTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey – «Tea with the aroma of chance and aristocracy»'**
  String get earlGreyTeaStoryTitle;

  /// No description provided for @earlGreyTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey is a black tea transformed by the bright, unmistakable aroma of bergamot.\n\nThe tea is traditionally associated with Charles Grey, the 2nd Earl Grey, a British statesman who served as Prime Minister in the 1830s. According to one popular legend, Grey received a shipment of tea flavored with bergamot oil and enjoyed the unusual combination so much that it became associated with his name.\n\nBut the true origin of Earl Grey remains uncertain. Several stories surround its creation, and there is no definitive evidence proving exactly how the blend came to be. Whatever the truth may be, bergamot and black tea became a classic combination – and the name Earl Grey has endured ever since.'**
  String get earlGreyTeaStory;

  /// No description provided for @earlGreyTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Earl Grey, heat water to around 90-95°C. Pour it over the tea leaves or tea bag and let it steep for 3-5 minutes. A shorter steep keeps the citrus aroma bright and delicate, while a longer one brings out more of the strength of the black tea base.'**
  String get earlGreyTeaPreparation;

  /// No description provided for @earlGreyTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey is traditionally enjoyed hot, either plain or with a slice of lemon that complements the citrusy bergamot aroma. For a richer drink, add a splash of milk and a little vanilla to make a London Fog.'**
  String get earlGreyTeaHowToDrink;

  /// No description provided for @earlGreyTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey contains caffeine from its black tea base, which can help increase alertness and reduce feelings of fatigue. Its characteristic aroma comes from bergamot oil, which gives the tea its distinctive fresh citrus character.'**
  String get earlGreyTeaProperties;

  /// No description provided for @masalaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Masala Chai – «Spiced Heritage in Every Cup»'**
  String get masalaTeaStoryTitle;

  /// No description provided for @masalaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Before tea was widely consumed in India, traditional spiced decoctions called \'kadha\' were used in Ayurvedic medicine for centuries. These herbal brews blended spices like ginger, cardamom, and black pepper for their restorative properties.\n\nIn the 19th century, the British East India Company established commercial tea plantations in Assam to break China\'s monopoly on tea. To encourage domestic consumption, the Indian Tea Association began promoting tea breaks for local workers in the early 20th century.\n\nIndian street vendors, known as chaiwalas, adapted the drink by combining black tea leaves with milk, sugar, and traditional kadha spices to make it richer and more affordable. This created the classic spiced beverage known today around the world.'**
  String get masalaTeaStory;

  /// No description provided for @masalaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To make Masala chai, simmer equal parts water and milk in a saucepan. Add strong black tea (traditionally CTC Assam tea) along with freshly crushed spices such as cardamom, ginger, cloves, and cinnamon, and let it gently boil for 3-5 minutes before straining.'**
  String get masalaTeaPreparation;

  /// No description provided for @masalaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Masala chai is served hot, traditionally sweetened with sugar or unrefined cane sugar (jaggery) to balance the sharp spices. It is best enjoyed fresh from a cup or clay kulhar.'**
  String get masalaTeaHowToDrink;

  /// No description provided for @masalaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Masala chai contains caffeine from black tea, along with aromatic compounds found in spices such as ginger, cardamom, cinnamon, and cloves. Together, they give the drink its characteristic warming aroma, rich flavor, and gentle boost of alertness.'**
  String get masalaTeaProperties;

  /// No description provided for @matchaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Matcha – «Tea That Is Not Brewed, but Lived»'**
  String get matchaTeaStoryTitle;

  /// No description provided for @matchaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Matcha traces its origins to Song Dynasty China, where steaming, drying, and grinding tea leaves into a fine powder was a common preparation method. In the late 12th century, the Japanese Zen monk Eisai brought tea seeds and knowledge of powdered tea preparation to Japan.\n\nOver the following centuries, Japanese tea masters refined the process, developing the practice of shading tea plants for several weeks before harvest. Shading reduces photosynthesis, causing the leaves to produce higher levels of chlorophyll and L-theanine. The leaves are then steamed, dried without rolling to make tencha, and ground into fine powder on stone mills.'**
  String get matchaTeaStory;

  /// No description provided for @matchaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'Sift 1-2 grams of matcha powder into a bowl to prevent clumping. Add 60-70 ml of water heated to 70-80°C, and whisk vigorously in a \'W\' or \'M\' motion using a bamboo whisk (chasen) until a fine layer of foam forms.'**
  String get matchaTeaPreparation;

  /// No description provided for @matchaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Matcha is traditionally consumed directly from the bowl without additives, drinking it in a few slow sips while warm. Modern variations include whisking it with steamed milk to prepare a matcha latte.'**
  String get matchaTeaHowToDrink;

  /// No description provided for @matchaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Since the entire leaf is consumed, matcha provides a concentrated source of tea polyphenols, particularly catechins such as epigallocatechin gallate (EGCG). It also contains L-theanine and caffeine, a combination that is associated with alertness and focused attention.'**
  String get matchaTeaProperties;

  /// No description provided for @jasmineTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Jasmine Tea – «Tea Remembered Not for Its Taste, but for Its Aroma»'**
  String get jasmineTeaStoryTitle;

  /// No description provided for @jasmineTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea originated in China during the Song Dynasty and reached widespread popularity during the Ming Dynasty, when scented teas became highly valued. Traditionally produced in Fujian province, it uses a green tea base harvested in spring that is held until mid-summer when jasmine blossoms bloom.\n\nFreshly picked jasmine blossoms open at night, releasing their volatile aromatic oils. The tea leaves are layered with the fresh flowers overnight to naturally absorb the fragrance. This scenting process is often repeated multiple times using new batches of flowers, after which the blossoms are meticulously removed to preserve the delicate flavor of the tea.'**
  String get jasmineTeaStory;

  /// No description provided for @jasmineTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare jasmine tea, heat water to around 75-80°C to keep the green tea base from becoming bitter. Pour over the leaves and steep for 2-3 minutes to allow the floral notes to unfold gently.'**
  String get jasmineTeaPreparation;

  /// No description provided for @jasmineTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea is best enjoyed hot and plain, served in a porcelain gaiwan or a glass cup to highlight its pale, golden color and aromatic profile. It pairs exceptionally well with mild, savory dishes.'**
  String get jasmineTeaHowToDrink;

  /// No description provided for @jasmineTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea retains many of the naturally occurring compounds found in its green tea base, including tea polyphenols such as EGCG. Jasmine flowers contribute aromatic compounds such as linalool, giving the tea its characteristic floral fragrance.'**
  String get jasmineTeaProperties;

  /// No description provided for @hibiscusTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus Tea – «Tea That Refuses to Be Mild»'**
  String get hibiscusTeaStoryTitle;

  /// No description provided for @hibiscusTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus tea, known botanically as \"Hibiscus sabdariffa\", is made from the dried calyces (the protective structures surrounding the flower bud) rather than tea leaves. Originating in West Africa, it spread along trade routes across the Middle East, the Caribbean, and Latin America, becoming known under regional names like karkadeh, flor de jamaica, and zobo.\n\nHistorically, the vibrant red brew was valued both for daily hydration in warm climates and for traditional medicine. In Egypt, karkadeh became deeply rooted in local culture and remains a popular drink today.'**
  String get hibiscusTeaStory;

  /// No description provided for @hibiscusTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare hibiscus tea, steep 1-2 tablespoons of dried calyces in boiling water (95-100°C) for 5-10 minutes. Because it contains no tea leaves, it does not become bitter with longer steeping, only developing a deeper ruby color and stronger tart flavor.'**
  String get hibiscusTeaPreparation;

  /// No description provided for @hibiscusTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus tea can be enjoyed piping hot or chilled over ice. Due to its natural cranberry-like tartness, it is frequently sweetened with honey, sugar, or agave, and often garnished with fresh mint or citrus slices.'**
  String get hibiscusTeaHowToDrink;

  /// No description provided for @hibiscusTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, hibiscus tea contains anthocyanins and other polyphenolic compounds that give the infusion its deep ruby color. Its refreshing tartness comes from naturally occurring organic acids.'**
  String get hibiscusTeaProperties;

  /// No description provided for @whiteTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'White Tea – «Tea That Has Hardly Been Touched»'**
  String get whiteTeaStoryTitle;

  /// No description provided for @whiteTeaStory.
  ///
  /// In en, this message translates to:
  /// **'White tea has deep roots in Fujian province, China, where varieties such as Da Bai (Big White) became closely associated with its production. Historical records describe delicate tea buds being presented as imperial tributes during the Song Dynasty, while the white tea styles known today developed much later.\n\nUnlike green or black tea, white tea undergoes minimal processing. Fresh spring buds and young leaves – often covered in fine white hairs called trichomes – are harvested, withered under controlled conditions, and slowly dried. Because the leaves are neither rolled nor subjected to high heat to stop oxidation, they undergo gentle natural oxidation before drying, preserving their delicate character.'**
  String get whiteTeaStory;

  /// No description provided for @whiteTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare white tea, use water heated to around 75-80°C. Steep for 4-5 minutes, allowing the delicate leaves and buds to release their subtle, naturally sweet flavors.'**
  String get whiteTeaPreparation;

  /// No description provided for @whiteTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'White tea is best served plain in a light porcelain or clear glass cup. Its gentle profile features subtle floral, melon, and hay-like notes, making it ideal for quiet, contemplative drinking.'**
  String get whiteTeaHowToDrink;

  /// No description provided for @whiteTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Because white tea undergoes minimal processing, it retains naturally occurring polyphenols, including catechins. It also contains caffeine and L-theanine, contributing to its characteristic gentle and refreshing character.'**
  String get whiteTeaProperties;

  /// No description provided for @mintTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Mint Tea – «The Tea That Can Stop Noise»'**
  String get mintTeaStoryTitle;

  /// No description provided for @mintTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Mint has been cultivated and used in herbal infusions for thousands of years, with evidence of its use in ancient Egypt dating back to around 1000 BCE. In ancient Greece and Rome, mint was valued for its aromatic qualities, culinary uses, and traditional applications.\n\nIn North Africa and the Middle East, particularly in Morocco, mint tea became a cornerstone of hospitality during the 19th century. British traders helped popularize gunpowder green tea in the region, and local traditions gradually combined it with fresh spearmint and generous amounts of sugar. The result became the iconic Maghrebi mint tea, served daily as a symbol of welcome and community.'**
  String get mintTeaStory;

  /// No description provided for @mintTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare mint tea, pour boiling water (90-95°C) over fresh spearmint or peppermint leaves, optionally adding a green tea base like gunpowder tea. Let it steep for 3-5 minutes to release the essential oils without extracting excessive bitterness.'**
  String get mintTeaPreparation;

  /// No description provided for @mintTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Mint tea is traditionally served hot, often poured from a height to create a light foam on top. It can be sweetened to taste with sugar or honey and is equally refreshing served chilled over ice on warm days.'**
  String get mintTeaHowToDrink;

  /// No description provided for @mintTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free when prepared from mint leaves alone, mint tea contains aromatic compounds such as menthol, which give it its characteristic cool, refreshing sensation. Its fresh aroma and cooling character make it a soothing and invigorating herbal infusion.'**
  String get mintTeaProperties;

  /// No description provided for @aniseTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Anise Tea – «The Drink of Pharaohs and Travelers»'**
  String get aniseTeaStoryTitle;

  /// No description provided for @aniseTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Anise is one of the oldest cultivated spice plants, with origins in the eastern Mediterranean and Southwest Asia. Its seeds were known and used in ancient Egypt, Greece, and Rome, where anise was valued for its distinctive sweet aroma and used in both cooking and traditional preparations.\n\nOver the centuries, anise spread across the Mediterranean, the Middle East, and North Africa. Its naturally sweet, licorice-like flavor made anise infusions a familiar herbal drink in many cultures, where they were often enjoyed after meals.'**
  String get aniseTeaStory;

  /// No description provided for @aniseTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare anise tea, lightly crush 1-2 teaspoons of dried anise seeds to release their volatile oils. Pour boiling water (95-100°C) over the seeds, cover the cup, and let it steep for 5-10 minutes before straining.'**
  String get aniseTeaPreparation;

  /// No description provided for @aniseTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Anise tea is best enjoyed hot, offering a naturally sweet, licorice-like aroma. It can be consumed plain or sweetened with a spoonful of honey, making it an ideal drink after meals.'**
  String get aniseTeaHowToDrink;

  /// No description provided for @aniseTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, anise tea contains aromatic compounds such as anethole, which gives the infusion its characteristic sweet, licorice-like aroma. These aromatic compounds are responsible for much of the distinctive character of anise tea.'**
  String get aniseTeaProperties;

  /// No description provided for @assamTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Assam Tea – «Strong Tea of the River Valleys»'**
  String get assamTeaStoryTitle;

  /// No description provided for @assamTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Assam tea originates from the tropical lowlands of northeastern India, along the floodplains of the Brahmaputra River. Unlike many traditional Chinese tea varieties, Assam tea comes from a distinct variety of the tea plant, commonly known as \"Camellia sinensis var. assamica\". The wild tea growing in the region was documented by Scottish adventurer Robert Bruce in 1823, although local communities had known and used the plant long before.\n\nRecognizing its commercial potential, the British East India Company established extensive plantations across Assam in the 1830s. The region\'s rich alluvial soil, high humidity, and heavy rainfall helped produce a bold, full-bodied black tea with distinctive malty notes. Its robust flavor later made Assam an important component of many breakfast tea blends.'**
  String get assamTeaStory;

  /// No description provided for @assamTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Assam tea, use water heated to around 90-95°C. Pour over the tea leaves and let them steep for 3-5 minutes to bring out its full strength without excessive astringency.'**
  String get assamTeaPreparation;

  /// No description provided for @assamTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Assam tea is traditionally served hot and is strong enough to take a splash of milk and sugar, which balances its natural maltiness. It is a staple choice for breakfast and morning tea pairings.'**
  String get assamTeaHowToDrink;

  /// No description provided for @assamTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Assam tea is known for its robust caffeine content and naturally occurring flavonoids and polyphenols, including theaflavins. Its combination of caffeine and rich, malty character makes it a particularly invigorating black tea.'**
  String get assamTeaProperties;

  /// No description provided for @nilgiriTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri Tea – «Tea from the Blue Mountains»'**
  String get nilgiriTeaStoryTitle;

  /// No description provided for @nilgiriTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri tea comes from the Nilgiri Hills—part of the Western Ghats range in southern India—where high altitudes, abundant rainfall, and subtropical breezes create unique growing conditions. Commercial tea cultivation was introduced to the region in the 1830s by British officers, who imported *Camellia sinensis* seeds from China.\n\nHarvested year-round across high-altitude estates, Nilgiri tea is known for producing a clear, fragrant, and smooth cup with low astringency. Unlike many other black teas, high-grade Nilgiri teas do not easily cloud when chilled, making them historically significant as a preferred base for iced tea in North America.'**
  String get nilgiriTeaStory;

  /// No description provided for @nilgiriTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Nilgiri tea, heat fresh water to around 90-95°C. Pour over the leaves and steep for 3-4 minutes to unlock its bright, aromatic flavor profile.'**
  String get nilgiriTeaPreparation;

  /// No description provided for @nilgiriTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri tea can be enjoyed hot or poured over ice. Its crisp profile and resistance to clouding make it an exceptional choice for freshly brewed iced tea, served plain or with a light slice of lemon.'**
  String get nilgiriTeaHowToDrink;

  /// No description provided for @nilgiriTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri tea naturally contains caffeine along with polyphenols and flavonoids inherent to black tea, offering a balanced and refreshing option throughout the day.'**
  String get nilgiriTeaProperties;

  /// No description provided for @genmaichaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha Tea – «The Tea with Toasted Rice»'**
  String get genmaichaTeaStoryTitle;

  /// No description provided for @genmaichaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha is a traditional Japanese tea made by blending green tea – typically bancha or sencha – with roasted and sometimes popped brown rice. The combination was valued for its distinctive flavor and made the tea more affordable by extending the amount of rice-free tea leaves in each serving.\n\nOver time, what was once a simple and practical combination became a distinct beverage valued for its unique character. The green tea leaves and toasted brown rice create a golden-hued brew with a distinctive balance of fresh, grassy notes and a warm, nutty roasted aroma.'**
  String get genmaichaTeaStory;

  /// No description provided for @genmaichaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Genmaicha, heat water to around 80-85°C. Pour over the tea mixture and let it steep for 1-2 minutes. Using cooler water prevents the green tea base from turning bitter while preserving the toasted flavor of the rice.'**
  String get genmaichaTeaPreparation;

  /// No description provided for @genmaichaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha is traditionally served hot without sweetening or milk. Its savory, nutty profile makes it a popular pairing alongside meals or as a comforting drink on quiet afternoons.'**
  String get genmaichaTeaHowToDrink;

  /// No description provided for @genmaichaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Because Genmaicha is partially composed of toasted rice, it generally contains less caffeine per cup than standard green teas. It also retains the natural polyphenols and catechins found in green tea leaves.'**
  String get genmaichaTeaProperties;

  /// No description provided for @hojichaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Hojicha Tea – «The Roasted Green Tea»'**
  String get hojichaTeaStoryTitle;

  /// No description provided for @hojichaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Hojicha was developed in Kyoto, Japan, in the 1920s as a creative way to reduce food waste. Local tea merchants began roasting remaining green tea leaves, stems, and stalks over high heat in porcelain pots, giving the tea a warm, reddish-brown color.\n\nThe intense roasting process removes the grassy astringency typical of Japanese green teas, replacing it with a smooth flavor profile featuring notes of toasted grain, caramel, and wood. This distinct transformation made hojicha a widely popular daily tea across Japan.'**
  String get hojichaTeaStory;

  /// No description provided for @hojichaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare hojicha, pour boiling water (90-95°C) over the roasted leaves and stems. Steep for 30-60 seconds. Unlike unroasted green teas, hojicha handles higher water temperatures well without developing bitterness.'**
  String get hojichaTeaPreparation;

  /// No description provided for @hojichaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Hojicha is traditionally served hot, plain, and without milk. Its naturally low astringency also makes it a great candidate for iced tea or modern steamed hojicha lattes.'**
  String get hojichaTeaHowToDrink;

  /// No description provided for @hojichaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'The high-heat roasting process breaks down a significant portion of the tea\'s natural caffeine, making hojicha much lower in caffeine than standard green teas. It naturally contains remaining polyphenols and L-theanine from the green tea leaves.'**
  String get hojichaTeaProperties;

  /// No description provided for @helbaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Helba Tea – «The Golden Fenugreek Cup»'**
  String get helbaTeaStoryTitle;

  /// No description provided for @helbaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Helba is a traditional Middle Eastern and North African hot beverage made from the seeds of yellow fenugreek (Trigonella foenum-graecum). Cultivated since antiquity across the Mediterranean and Nile Delta, fenugreek seeds were documented in early Egyptian papyri for their culinary and restorative uses.\n\nUnlike traditional leaf-based teas, helba is prepared by decocting whole fenugreek seeds in boiling water until they release their bright golden color and distinct, maple-nutty aroma. In Egyptian culture, helba has long served as a staple household beverage offered to guests and brewed for everyday warmth.'**
  String get helbaTeaStory;

  /// No description provided for @helbaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare helba, rinse 1-2 teaspoons of whole fenugreek seeds, then add them to a small pot of water. Simmer on low heat for 5-10 minutes to extract the full flavor, then strain into a cup.'**
  String get helbaTeaPreparation;

  /// No description provided for @helbaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Helba is served piping hot and is commonly sweetened with sugar or honey to complement its naturally rich, slightly bitter flavor. The softened seeds left at the bottom of the cup are often eaten after finishing the drink.'**
  String get helbaTeaHowToDrink;

  /// No description provided for @helbaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, helba is made from fenugreek seeds, which naturally contain soluble fiber, mucilage, and saponins. It is traditionally enjoyed as a warming, comforting infusion after meals.'**
  String get helbaTeaProperties;

  /// No description provided for @mateTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Mate - «The Energy of the Earth Shared in a Circle»'**
  String get mateTeaStoryTitle;

  /// No description provided for @mateTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Yerba mate originates from the subtropical rainforests of South America, where the indigenous Guaraní and Tupi peoples first harvested and consumed the leaves of the Ilex paraguariensis tree. They viewed the plant as a natural source of vitality, using dried leaves to prepare infusions served in dried calabash gourds.\n\nIn the 17th century, Jesuit missionaries standardized the cultivation and trade of yerba mate across the region. Over centuries, the beverage became a defining cultural tradition in countries like Argentina, Uruguay, Paraguay, and southern Brazil, where sharing mate from a shared gourd (mate) using a metal straw (bombilla) remains an essential social ritual.'**
  String get mateTeaStory;

  /// No description provided for @mateTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare mate traditionally, fill a calabash gourd or cup two-thirds full with dried yerba mate leaves. Tilt the gourd to one side, pour in a little cool water to soak the leaves, insert the metal straw (bombilla), and then pour in warm water heated to 70-80°C (never boiling). Re-infuse the same leaves multiple times.'**
  String get mateTeaPreparation;

  /// No description provided for @mateTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Mate is traditionally served hot and shared among a group, where one person (the cebador) pours the water and passes the gourd around. It is drunk plain through the bombilla straw, though some prefer adding sugar, honey, or fresh herbs.'**
  String get mateTeaHowToDrink;

  /// No description provided for @mateTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Yerba mate naturally contains caffeine along with related xanthines like theobromine. It also contains polyphenols, vitamins, and minerals, providing a steady sense of energy and mental alertness.'**
  String get mateTeaProperties;

  /// No description provided for @carpathianTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Carpathian tea - «The Breath of the Wild Mountains»'**
  String get carpathianTeaStoryTitle;

  /// No description provided for @carpathianTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Herbal infusions have a long history in the Carpathian Mountains of western Ukraine, where local highland communities (such as the Hutsuls) traditionally gathered wild mountain herbs, berries, and flora for daily hot drinks. Known locally as polonynskyi chai, these blends were harvested directly from high-altitude meadows (polonynas).\n\nRather than relying on the imported tea plant (Camellia sinensis), local gathering traditions relied on wild species like thyme, mint, Saint John\'s wort, willowherb, and dried mountain berries. Hand-harvested and sun-dried during the peak summer months, these wild herbal mixtures became an integral part of Ukrainian mountain hospitality and cold-climate living.'**
  String get carpathianTeaStory;

  /// No description provided for @carpathianTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare a Carpathian herbal blend, place 1-2 teaspoons of dried herbs into a teapot and pour boiling water (95-100°C) over them. Cover and allow to steep for 7-10 minutes so the wild herbs and roots can fully release their aromas.'**
  String get carpathianTeaPreparation;

  /// No description provided for @carpathianTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Carpathian herbal tea is best enjoyed hot, served plain or sweetened with natural mountain honey. It makes a naturally comforting, aromatic drink for cold evenings or after outdoor activities.'**
  String get carpathianTeaHowToDrink;

  /// No description provided for @carpathianTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, wild herbal mountain blends contain essential oils, organic acids, and plant flavonoids from herbs such as thyme, mint, and oregano, offering a gentle, soothing experience.'**
  String get carpathianTeaProperties;

  /// No description provided for @labradorTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Labrador Tea - «The Ancient Warmth of the Tundra»'**
  String get labradorTeaStoryTitle;

  /// No description provided for @labradorTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Labrador tea refers to herbal infusions made from evergreen shrubs of the genus Rhododendron (formerly Ledum), native to the boreal forests and tundra regions of North America. Indigenous peoples, including the Athabaskan, Inuit, and Cree, traditionally harvested these low-growing wild shrubs to prepare hot infusions long before European arrival.\n\nDuring the 18th century, European fur traders and settlers adopted the practice as a substitute for imported black tea, particularly in remote northern outposts. The leaves-harvested from peat bogs and cold wetlands-were dried and steeped into a distinct, resinous brew with subtle aromatic notes of pine and citrus.'**
  String get labradorTeaStory;

  /// No description provided for @labradorTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Labrador tea, steep 1 teaspoon of dried leaves in hot water (85-90°C) for 5-8 minutes. Boiling for extended periods or using excessive leaves should be avoided to prevent extracting high concentrations of natural plant compounds.'**
  String get labradorTeaPreparation;

  /// No description provided for @labradorTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Labrador tea is served hot and plain to appreciate its unique herbal, pine-like aroma. It can also be sweetened with a bit of honey or maple syrup to complement its earthy flavor.'**
  String get labradorTeaHowToDrink;

  /// No description provided for @labradorTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, Labrador tea contains essential oils, polyphenols, and Vitamin C. Due to naturally occurring compounds like grayanotoxins inherent to the *Rhododendron* family, it is traditionally consumed in mild, moderate quantities.'**
  String get labradorTeaProperties;

  /// No description provided for @ivanTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Ivan-Tea - «The Flame That Restores the Scorched Earth»'**
  String get ivanTeaStoryTitle;

  /// No description provided for @ivanTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Ivan-tea, traditionally made from fireweed (Chamaenerion angustifolium), has a long history across Northern and Eastern Europe. Known as Koporye tea, it gained widespread recognition in 19th-century trade as a popular herbal alternative to imported Chinese black tea, with the town of Koporje becoming a major center for its production.\n\nFireweed is a pioneer plant that naturally thrives on disturbed forest soils and burned lands, helping prevent soil erosion. To make Ivan-tea, the hand-harvested leaves undergo a traditional process of rolling and oxidation (fermentation) before drying, which gives the final brew a deep amber color and a smooth, full-bodied flavor with subtle floral and fruity notes.'**
  String get ivanTeaStory;

  /// No description provided for @ivanTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare Ivan-tea, pour boiling water (90-95°C) over 1-2 teaspoons of fermented leaves. Let it steep for 5-10 minutes. Unlike traditional tea leaves, fermented fireweed can be re-infused multiple times without becoming bitter.'**
  String get ivanTeaPreparation;

  /// No description provided for @ivanTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Ivan-tea is best enjoyed hot and plain, or sweetened with a spoonful of honey. Its naturally smooth, non-astringent profile also makes it a pleasant beverage served chilled on warmer days.'**
  String get ivanTeaHowToDrink;

  /// No description provided for @ivanTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free, fermented Ivan-tea contains organic acids, flavonoids, and Vitamin C. Because it contains no caffeine or tannins, it provides a gentle, soothing drink suitable for any time of day.'**
  String get ivanTeaProperties;

  /// No description provided for @oolongTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Oolong Tea - «The Tea That Didn\'t Choose a Side»'**
  String get oolongTeaStoryTitle;

  /// No description provided for @oolongTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Oolong tea is closely associated with the Wuyi Mountains of Fujian province, China, where some of its earliest documented forms were developed. Over time, intricate processing techniques gave oolong its unique place between lightly oxidized green teas and fully oxidized black teas. The name oolong, often translated as \"Black Dragon\", adds to the mystery surrounding this remarkable style of tea.\n\nCrafting oolong requires careful control of time and temperature. Fresh leaves undergo withering, bruising, partial oxidation, and often roasting. Depending on the region and style – from the dark, mineral-rich cliff teas of Wuyi to the tightly rolled, floral High Mountain oolongs of Taiwan – the degree of oxidation varies widely, creating an extraordinary spectrum of aromas and flavors.'**
  String get oolongTeaStory;

  /// No description provided for @oolongTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare oolong tea, use water heated to around 85-95°C depending on the roast level. Steep for 2-3 minutes, ideally using multiple short infusions in a gongfu teapot or gaiwan to watch the tightly rolled leaves unfurl.'**
  String get oolongTeaPreparation;

  /// No description provided for @oolongTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Oolong tea is best enjoyed plain in small porcelain cups to fully appreciate its evolving taste notes-ranging from orchid and honey to toasted wood and stone fruit-across several re-steeps.'**
  String get oolongTeaHowToDrink;

  /// No description provided for @oolongTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Oolong tea naturally contains a moderate amount of caffeine alongside L-theanine. It is rich in complex tea polyphenols, particularly polymerized polyphenols (theasinensins) formed during partial oxidation.'**
  String get oolongTeaProperties;

  /// No description provided for @rooibosTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Rooibos - «The Tea That Was Never Tea»'**
  String get rooibosTeaStoryTitle;

  /// No description provided for @rooibosTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Rooibos meaning \"red bush\" in Afrikaans, grows exclusively in the Cederberg mountain region of South Africa. For centuries, the indigenous Khoisan people harvested the wild shrub\'s needle-like leaves, bruising and fermenting them in the sun to produce a naturally sweet, mahogany-red infusion.\n\nIn the early 20th century, European settlers and merchants popularized rooibos as an accessible alternative to imported black tea. Russian immigrant Benjamin Ginsberg standardized its commercial processing, and later agricultural breakthroughs allowed the wild mountain plant to be cultivated systematically while preserving its distinctive, honeyed, woodsy character.'**
  String get rooibosTeaStory;

  /// No description provided for @rooibosTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **'To prepare rooibos, pour boiling water (95-100°C) over 1-2 teaspoons of dried leaves. Let it steep for 5-7 minutes. Because rooibos contains virtually no tannins, it will not turn bitter even with long steeping times.'**
  String get rooibosTeaPreparation;

  /// No description provided for @rooibosTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **'Rooibos can be enjoyed hot or chilled as an iced tea. Its naturally sweet, nutty profile pairs well with a splash of milk and honey or a slice of fresh lemon.'**
  String get rooibosTeaHowToDrink;

  /// No description provided for @rooibosTeaProperties.
  ///
  /// In en, this message translates to:
  /// **'Naturally caffeine-free and low in tannins, rooibos naturally contains unique plant polyphenols such as aspalathin and nothofagin, making it a mild, comforting drink for any time of day.'**
  String get rooibosTeaProperties;

  /// No description provided for @puerhTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Pu-erh – \"Tea that can wait\"'**
  String get puerhTeaStoryTitle;

  /// No description provided for @puerhTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Pu-erh is a tea that stands the test of time.\n\nWhile other teas strive to preserve their freshness, pu-erh is the opposite: it\'s allowed to evolve. After processing, the tea continues to \'live,\' gradually changing its flavor, aroma, and character.\n\nSome pu-erhs are aged for years. Sometimes, for decades.'**
  String get puerhTeaStory;

  /// No description provided for @puerhTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get puerhTeaPreparation;

  /// No description provided for @puerhTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get puerhTeaHowToDrink;

  /// No description provided for @puerhTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get puerhTeaProperties;

  /// No description provided for @chamomileTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Chamomile Tea - \"The Flower That Turned Into Calm\"'**
  String get chamomileTeaStoryTitle;

  /// No description provided for @chamomileTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Chamomile tea comes from Ancient Egypt, where the small white flowers were valued as a sacred and healing plant.\n\nIt was often associated with the sun and used in traditional remedies to calm the body and restore balance. People did not treat it as a luxury drink, but as something natural that helps when life feels heavy.\n\nOver time, chamomile spread across the world and became known as the tea of rest, the one you drink when everything slows down and the day finally lets you breathe.'**
  String get chamomileTeaStory;

  /// No description provided for @chamomileTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get chamomileTeaPreparation;

  /// No description provided for @chamomileTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get chamomileTeaHowToDrink;

  /// No description provided for @chamomileTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get chamomileTeaProperties;

  /// No description provided for @senchaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Sencha - \"The Everyday Tea of Calm Precision\"'**
  String get senchaTeaStoryTitle;

  /// No description provided for @senchaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Sencha comes from Japan, where tea is not just a drink but part of daily life and balance.\n\nIt is made by steaming fresh tea leaves right after harvest, which helps preserve their bright green color and clean, grassy taste. Unlike ceremonial matcha, sencha is the tea of everyday moments - simple, honest, and deeply rooted in routine.\n\nFor many people in Japan, sencha is the first cup in the morning and a quiet pause during the day, bringing clarity without overwhelming energy.'**
  String get senchaTeaStory;

  /// No description provided for @senchaTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get senchaTeaPreparation;

  /// No description provided for @senchaTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get senchaTeaHowToDrink;

  /// No description provided for @senchaTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get senchaTeaProperties;

  /// No description provided for @honeybushTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Honeybush - \"The Sweet Bush of the Cape\"'**
  String get honeybushTeaStoryTitle;

  /// No description provided for @honeybushTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Honeybush comes from South Africa, from a plant related in spirit to rooibos but naturally sweeter in aroma.\n\nIt is caffeine-free, gentle, and rounded, with a honeyed scent that explains its name before the first sip. Honeybush feels like sunlight held in a herbal cup.'**
  String get honeybushTeaStory;

  /// No description provided for @honeybushTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get honeybushTeaPreparation;

  /// No description provided for @honeybushTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get honeybushTeaHowToDrink;

  /// No description provided for @honeybushTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get honeybushTeaProperties;

  /// No description provided for @branchTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Branch Tea - \"the hidden pulse of the winter garden\"'**
  String get branchTeaStoryTitle;

  /// No description provided for @branchTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Branch tea is the art of finding life where everything seems asleep.\n\nWhile traditional tea relies on fragile leaves, this ancient Ukrainian drink is born from the young twigs of cherry, currant, and raspberry trees. It is a slow, patient brew that coaxes deep, wooden, and berry aromas from the very bones of the plant.\n\nIt is proof that even in the coldest winter, the essence of spring is already hiding within the wood.'**
  String get branchTeaStory;

  /// No description provided for @branchTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get branchTeaPreparation;

  /// No description provided for @branchTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get branchTeaHowToDrink;

  /// No description provided for @branchTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get branchTeaProperties;

  /// No description provided for @darjeelingTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Darjeeling - \"The Champagne of Tea\"'**
  String get darjeelingTeaStoryTitle;

  /// No description provided for @darjeelingTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Darjeeling grows high in the foothills of the Himalayas, where mist, cool air, and mountain soil shape its delicate character.\n\nIt is prized for a light body and a floral, muscatel aroma that can change from harvest to harvest. A cup of Darjeeling feels less like a heavy black tea and more like a quiet mountain view captured in leaves.'**
  String get darjeelingTeaStory;

  /// No description provided for @darjeelingTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get darjeelingTeaPreparation;

  /// No description provided for @darjeelingTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get darjeelingTeaHowToDrink;

  /// No description provided for @darjeelingTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get darjeelingTeaProperties;

  /// No description provided for @gyokuroTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Gyokuro - \"The Jade Dew\"'**
  String get gyokuroTeaStoryTitle;

  /// No description provided for @gyokuroTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Gyokuro is one of Japan\'s most treasured green teas. Before harvest, the bushes are shaded, encouraging deep sweetness, umami, and a silky texture.\n\nIt is not a tea for rushing. Gyokuro asks for cooler water, patience, and attention, rewarding the drinker with a concentrated, almost glowing calm.'**
  String get gyokuroTeaStory;

  /// No description provided for @gyokuroTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get gyokuroTeaPreparation;

  /// No description provided for @gyokuroTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get gyokuroTeaHowToDrink;

  /// No description provided for @gyokuroTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get gyokuroTeaProperties;

  /// No description provided for @tieguanyinTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Tieguanyin - \"The Iron Goddess of Mercy\"'**
  String get tieguanyinTeaStoryTitle;

  /// No description provided for @tieguanyinTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Tieguanyin is a celebrated Chinese oolong whose name carries the legend of the Iron Goddess of Mercy.\n\nDepending on how it is made, it can be floral and bright or deeper and roasted. What stays constant is its elegance: a tea that opens slowly, steep after steep, revealing more than it says at first.'**
  String get tieguanyinTeaStory;

  /// No description provided for @tieguanyinTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get tieguanyinTeaPreparation;

  /// No description provided for @tieguanyinTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get tieguanyinTeaHowToDrink;

  /// No description provided for @tieguanyinTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get tieguanyinTeaProperties;

  /// No description provided for @manoominTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Manoomin - \"where the sacred lake meets the roasting fire\"'**
  String get manoominTeaStoryTitle;

  /// No description provided for @manoominTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Manoomin tea is a sacred dialogue between two distant shores.\n\nIt brings together the roasting art of traditional tea and the ancient wild rice hand-harvested from Canadian lakes by Indigenous peoples. It is not just a blend, but a harmony of earth and water, born from canoes guiding through lake mists.\n\nEvery cup offers a comforting, deeply grounding warmth, rich with toasted nuttiness, popcorn aromas, and the spirit of the northern wilderness.'**
  String get manoominTeaStory;

  /// No description provided for @manoominTeaPreparation.
  ///
  /// In en, this message translates to:
  /// **''**
  String get manoominTeaPreparation;

  /// No description provided for @manoominTeaHowToDrink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get manoominTeaHowToDrink;

  /// No description provided for @manoominTeaProperties.
  ///
  /// In en, this message translates to:
  /// **''**
  String get manoominTeaProperties;
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
