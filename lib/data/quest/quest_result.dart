class QuestResult {
  final int streak;
  final bool isNewRecord;
  final QuestResultStatus status;

  QuestResult({
    required this.streak,
    required this.isNewRecord,
    required this.status,
  });
}

enum QuestResultStatus {
  completed,
  alreadyDoneToday,
}