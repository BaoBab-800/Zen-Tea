import 'package:zentea/data/quest/quest_result.dart';

abstract class IQuestProgressService {
  Future<QuestResult> completeQuest();
}