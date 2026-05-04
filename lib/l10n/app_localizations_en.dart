// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get currentTeaSeries => 'Current Tea Series: ';

  @override
  String get getTeaForToday => 'Get tea for today';

  @override
  String get teaCollection => 'Tea Collection';

  @override
  String get whatKindOfTeaAreYouQuiz => 'What kind of tea are you? Quiz';

  @override
  String get achievements => 'Achievements';

  @override
  String get ok => 'Ok';

  @override
  String get menu => 'Menu';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get goToDeveloperRoom => 'Go to developer room';

  @override
  String get developerRoom => 'Developer room';

  @override
  String get resetAllValues => 'Reset all values';

  @override
  String get unlockAll => 'Unlock all';

  @override
  String get blockAll => 'Block all';

  @override
  String get setRandomStreak => 'Set random streak (0-99)';

  @override
  String get resetStreak => 'Reset streak';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get todayTea => 'Today tea';

  @override
  String get aboutQuiz => 'About quiz';

  @override
  String get getTeaWarning =>
      'Every day, you will receive a new tea. After drinking the tea, you can click the «Quest Completed» button and your streak will increase. You won\'t be competing with others here, and no one will check your progress. At least be honest with yourself.';

  @override
  String get newTea => 'New tea!';

  @override
  String teaServedTimes(Object count) {
    return 'Served $count times';
  }

  @override
  String get questCompleted => 'Quest completed';

  @override
  String get series => 'Series: ';

  @override
  String get completedQuestSeries =>
      'You\'ve already completed the quest. Your series: ';

  @override
  String get readTheStory => 'Read the story';

  @override
  String get goToWiki => 'Go to Wikipedia';

  @override
  String get teaQuiz => 'Tea quiz';

  @override
  String get locked => 'Locked';

  @override
  String get blackTea => 'Black tea';

  @override
  String get greenTea => 'Green tea';

  @override
  String get earlGreyTea => 'Earl grey tea';

  @override
  String get masalaTea => 'Masala tea';

  @override
  String get matchaTea => 'Matcha tea';

  @override
  String get jasmineTea => 'Jasmine tea';

  @override
  String get blackTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get greenTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get earlGreyTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get masalaTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get matchaTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get jasmineTeaStory => 'Let\'s pretend this is an interesting story.';

  @override
  String get tServeTenTeasAchievement => 'Just 10 times';

  @override
  String get dServeTenTeasAchievement => 'Hold on your 10-day streak';
}
