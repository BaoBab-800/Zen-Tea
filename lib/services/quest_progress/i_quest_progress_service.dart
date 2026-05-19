import 'package:zentea/data/quest/quest_result.dart';

abstract class IQuestProgressService {
  DateTime? get lastCompletedAt;

  Future<void> init();

  Future<QuestResult> completeQuest();
}