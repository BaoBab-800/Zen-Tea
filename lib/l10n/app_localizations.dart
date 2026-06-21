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

  /// No description provided for @resetAllValues.
  ///
  /// In en, this message translates to:
  /// **'Reset all values'**
  String get resetAllValues;

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
  /// **'Series: '**
  String get series;

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

  /// No description provided for @blackTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Black Tea - \"The Tea That Accidentally Became a Legend\"'**
  String get blackTeaStoryTitle;

  /// No description provided for @blackTeaStory.
  ///
  /// In en, this message translates to:
  /// **'They say black tea didn\'t appear because someone intended it that way, but because green tea was forgotten one day.\n\nIn China, tea leaves were typically processed quickly to preserve their freshness and green color. But one day, a batch of leaves was left over and began to oxidize. The leaves darkened, the aroma changed, and instead of the usual herbal flavor, a rich, deep aroma emerged.\n\nAnd instead of throwing it away, people tried it. And they liked it.\n\nThus, a new type of tea was born, which later became known as black tea.'**
  String get blackTeaStory;

  /// No description provided for @greenTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Green tea - \"the tea that didn\'t let itself change\"'**
  String get greenTeaStoryTitle;

  /// No description provided for @greenTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Green tea is a tea that has almost \'escaped\' transformation.\n\nIts history is believed to have begun in China over 4,000 years ago, and for a long time, it was the \'purest\' way to drink tea: the leaves were simply heated briefly to halt any changes.\n\nUnlike black tea, green tea allows the leaves to barely age. It seems to preserve the moment—the freshness, the herbal aroma, the slight bitterness, and the vibrant energy of the plant.'**
  String get greenTeaStory;

  /// No description provided for @earlGreyTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey - \"tea with the aroma of chance and aristocracy\"'**
  String get earlGreyTeaStoryTitle;

  /// No description provided for @earlGreyTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Earl Grey is a black tea that once encountered bergamot, it was never the same again.\n\nAccording to one of the most famous stories, this tea was named after the British Earl Charles Grey. Legend has it that he was given tea flavored with bergamot oil to soften the taste of water while traveling. The Earl liked it so much that it began to be served at court.\n\nWhether this is true or a beautiful invention, no one knows for sure. But the name has remained.'**
  String get earlGreyTeaStory;

  /// No description provided for @masalaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Masala chai - \"tea that can\'t be quiet\"'**
  String get masalaTeaStoryTitle;

  /// No description provided for @masalaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Masala chai was born not as a sophisticated drink, but as a street energy.\n\nTea arrived in India relatively late – it was brought by the British in the 19th century. But locals found it too boring. So, they did what they do best: they started experimenting.\n\nSo, they added milk, sugar, and a whole spice blend called \'masala\' to ordinary black tea. And tea ceased to be just a drink. It became an event.'**
  String get masalaTeaStory;

  /// No description provided for @matchaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Matcha is \"tea that is not brewed, but lived\"'**
  String get matchaTeaStoryTitle;

  /// No description provided for @matchaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Matcha isn\'t just tea. It\'s tea you drink whole.\n\nIts history begins in China, but it took its true form in Japan, where it became part of the tea ceremony, almost like the art of slowing down time.\n\nSeveral weeks before harvesting, the tea bushes are deliberately shaded from the sun. The plant \'thinks\' it\'s the forest\'s shade and begins to produce more chlorophyll and amino acids. This is why matcha is so bright green and rich in flavor.'**
  String get matchaTeaStory;

  /// No description provided for @jasmineTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea is \"a tea that is remembered not for its taste, but for its aroma\"'**
  String get jasmineTeaStoryTitle;

  /// No description provided for @jasmineTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Jasmine tea is not just about tea, but also about flowers.\n\nIts base is almost always green tea, but the real action happens not in the leaves, but around them. Fresh jasmine flowers open at night and release their aroma. The tea leaves absorb this scent, as if \'inhaling\' it.\n\nThen the flowers are harvested, but the aroma remains.'**
  String get jasmineTeaStory;

  /// No description provided for @hibiscusTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus tea - \"tea that doesn\'t pretend to be mild\"'**
  String get hibiscusTeaStoryTitle;

  /// No description provided for @hibiscusTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Hibiscus is not a leaf or a tea bush. These are dried flower petals.\n\nEgo was brewed in different parts of the world: in Africa, in the Middle East, in Latin America. And everywhere it was about the same - bright, sour and refreshing.\n\nHe is not trying to be \'cozy\'. He immediately declares himself.'**
  String get hibiscusTeaStory;

  /// No description provided for @whiteTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'White tea - \"tea that has hardly been touched\"'**
  String get whiteTeaStoryTitle;

  /// No description provided for @whiteTeaStory.
  ///
  /// In en, this message translates to:
  /// **'White tea is the most \'pristine\' of all teas.\n\nEgo is made from young buds and leaves that are hardly processed: they are simply collected and carefully dried. Without strong heating, without twisting, without trying to change something.\n\nAs if the main idea is not to interfere.'**
  String get whiteTeaStory;

  /// No description provided for @mintTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Mint tea - \"The Tea That Can Stop Noise\"'**
  String get mintTeaStoryTitle;

  /// No description provided for @mintTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Mint tea doesn\'t try to invigorate like coffee, nor does it attempt to impress with a complex flavor.\n\nIt does something different – ​​it seems to purify the space around you.\n\nMint was brewed in ancient cultures: in Egypt, Greece, and the Middle East. It was prized not only for its flavor but also for the feeling of freshness it provided, even in the heat.\n\nOver time, mint tea became a drink for a break – something you drink not on the run, but to take a breather.'**
  String get mintTeaStory;

  /// No description provided for @aniseTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Anise Tea: \"The Drink of Pharaohs and Travelers\"'**
  String get aniseTeaStoryTitle;

  /// No description provided for @aniseTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Long before modern Egypt existed, anise seeds were already valued along the Nile. Archaeologists discovered anise among the treasures of ancient tombs, suggesting that it was known and appreciated thousands of years ago.\n\nAccording to local stories, travelers crossing the desert often carried anise because it was easy to store and could be brewed wherever water was available. A warm cup of anise tea became a comforting companion during cold desert nights.\n\nOver the centuries, the drink remained popular in Egyptian homes. Families served it to guests, shared it during conversations, and passed the tradition from generation to generation.\n\nToday, anise tea is still enjoyed throughout Egypt, connecting modern tea drinkers with a tradition that stretches back to the age of the pharaohs.'**
  String get aniseTeaStory;

  /// No description provided for @assamTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Assam - \"The Strong Tea of River Valleys\"'**
  String get assamTeaStoryTitle;

  /// No description provided for @assamTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Assam tea comes from northeastern India, from warm lowlands around the Brahmaputra River.\n\nIts character is bold, malty, and full-bodied, the kind of tea that wakes up the morning without asking twice. It became one of the foundations of many breakfast blends because it has enough strength to stand with milk and still keep its voice.'**
  String get assamTeaStory;

  /// No description provided for @nilgiriTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri - \"Tea from the Blue Mountains\"'**
  String get nilgiriTeaStoryTitle;

  /// No description provided for @nilgiriTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Nilgiri tea is grown in the Blue Mountains of southern India, where tea gardens sit among cool winds and fragrant hills.\n\nIt is often bright, aromatic, and clean on the palate. Nilgiri does not try to overpower the cup; it brings freshness and clarity, like a mountain breeze moving through tea leaves.'**
  String get nilgiriTeaStory;

  /// No description provided for @genmaichaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha - \"The Tea with Toasted Rice\"'**
  String get genmaichaTeaStoryTitle;

  /// No description provided for @genmaichaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Genmaicha began as a humble Japanese tea where green tea met toasted rice.\n\nThe rice adds a warm, nutty aroma and softens the grassy brightness of the leaves. It feels friendly and grounded, like a simple meal turned into a cup of comfort.'**
  String get genmaichaTeaStory;

  /// No description provided for @hojichaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Hojicha - \"The Roasted Green Tea\"'**
  String get hojichaTeaStoryTitle;

  /// No description provided for @hojichaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Hojicha is green tea transformed by roasting. The leaves lose much of their sharp greenness and gain warm notes of wood, caramel, and toasted grain.\n\nBecause of its mellow character, hojicha feels like evening tea: gentle, low-key, and comforting without needing to prove anything.'**
  String get hojichaTeaStory;

  /// No description provided for @helbaTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Helba - \"The Golden Fenugreek Cup\"'**
  String get helbaTeaStoryTitle;

  /// No description provided for @helbaTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Helba is an Egyptian drink made from fenugreek seeds, brewed into a golden, aromatic infusion.\n\nIts flavor is warm, slightly nutty, and unmistakable. In many homes it belongs to the world of everyday remedies and hospitality, a cup that feels both practical and ancient.'**
  String get helbaTeaStory;

  /// No description provided for @oolongTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Oolong - \"the tea that didn\'t choose a side\"'**
  String get oolongTeaStoryTitle;

  /// No description provided for @oolongTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Oolong is a tea that exists between worlds.\n\nIts leaves are partially oxidized: not as much as black tea, and not as lightly as green tea. Therefore, it is neither one nor the other, and simultaneously both.\n\nThis is not a technological failure, but an art of balance.'**
  String get oolongTeaStory;

  /// No description provided for @rooibosTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Rooibos - \"tea that wasn\'t tea\"'**
  String get rooibosTeaStoryTitle;

  /// No description provided for @rooibosTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Rooibos originated far from the traditional tea regions, in South Africa.\n\nIt\'s not the leaves of the tea bush, but the needle-like branches of a plant that grew wild. Locals brewed it long before the rest of the world discovered it.\n\nWhen Europeans tried rooibos, they realized it wasn\'t tea, but it behaved like it. So they decided—let it be.'**
  String get rooibosTeaStory;

  /// No description provided for @puerhTeaStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Pu-erh – \"tea that can wait\"'**
  String get puerhTeaStoryTitle;

  /// No description provided for @puerhTeaStory.
  ///
  /// In en, this message translates to:
  /// **'Pu-erh is a tea that stands the test of time.\n\nWhile other teas strive to preserve their freshness, pu-erh is the opposite: it\'s allowed to evolve. After processing, the tea continues to \'live,\' gradually changing its flavor, aroma, and character.\n\nSome pu-erhs are aged for years. Sometimes, for decades.'**
  String get puerhTeaStory;

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

  /// No description provided for @tGetRareTeaAchievement.
  ///
  /// In en, this message translates to:
  /// **'A rare find'**
  String get tGetRareTeaAchievement;

  /// No description provided for @dGetRareTeaAchievement.
  ///
  /// In en, this message translates to:
  /// **'Get a rare tea'**
  String get dGetRareTeaAchievement;

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
