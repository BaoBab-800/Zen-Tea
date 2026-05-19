class QuestResult {
  final QuestCompletionStatus status;

  QuestResult({
    required this.status,
  });
}

enum QuestCompletionStatus {
  completed,
  alreadyDoneToday,
}