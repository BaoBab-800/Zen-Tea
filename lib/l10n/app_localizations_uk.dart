// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get currentTeaSeries => 'Поточна серія чаю: ';

  @override
  String get getTeaForToday => 'Отримати чай на сьогодні';

  @override
  String get teaCollection => 'Колекція чаю';

  @override
  String get whatKindOfTeaAreYouQuiz => 'Який ти чай? Тест';

  @override
  String get achievements => 'Досягнення';

  @override
  String get ok => 'Ок';

  @override
  String get menu => 'Меню';

  @override
  String get settings => 'Налаштування';

  @override
  String get theme => 'Тема';

  @override
  String get language => 'Мова';

  @override
  String get goToDeveloperRoom => 'Перейти до кімнати розробника';

  @override
  String get developerRoom => 'Кімната розробника';

  @override
  String get resetAllValues => 'Обнулити всі значення';

  @override
  String get unlockAll => 'Відкрити все';

  @override
  String get blockAll => 'Закрити все';

  @override
  String get setRandomStreak => 'Встановити випадкове значення (0-99)';

  @override
  String get resetStreak => 'Скинути серію';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get todayTea => 'Сьогоднішній чай';

  @override
  String get aboutQuiz => 'Про завдання';

  @override
  String get getTeaWarning =>
      'Щодня ви отримуватимете новий чай. Випивши чай, ви можете натиснути кнопку «Завдання виконано», і ваша серія чаю збільшиться. Ви не будете змагатися з іншими тут, і ніхто не перевірятиме ваш прогрес. Принаймні, будьте чесними з собою.';

  @override
  String get newTea => 'Новий чай!';

  @override
  String teaServedTimes(Object count) {
    return 'Випало $count разів';
  }

  @override
  String get questCompleted => 'Завдання виконано';

  @override
  String get series => 'Серія: ';

  @override
  String get readTheStory => 'Прочитати історію';

  @override
  String get goToWiki => 'Перейти до Вікіпедії';

  @override
  String get teaQuiz => 'Тест по чаю';

  @override
  String get locked => 'Заблоковано';

  @override
  String get blackTea => 'Чорний чай';

  @override
  String get greenTea => 'Зелений чай';

  @override
  String get earlGreyTea => 'Чай Ерл Грей';

  @override
  String get masalaTea => 'Чай масала';

  @override
  String get matchaTea => 'Чай матча';

  @override
  String get jasmineTea => 'Жасминовий чай';

  @override
  String get blackTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get greenTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get earlGreyTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get masalaTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get matchaTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get jasmineTeaStory => 'Зробимо вигляд, що тут цікава розповідь.';

  @override
  String get achievementTitleJustTenTimes => 'Лише 10 разів';

  @override
  String get achievementTitleAllOfThem => 'Усі вони';

  @override
  String get achievementDescriptionSaveYourTenDayStreak =>
      'Збережіть свою 10-денну серію';

  @override
  String get achievementDescriptionCollectAllTheTeas => 'Зберіть усі чаї';
}
