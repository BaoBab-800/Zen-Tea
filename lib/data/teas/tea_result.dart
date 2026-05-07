import 'tea_model.dart';

class TeaResult {
  final TeaModel tea;
  final bool isNew;
  final bool shouldCountServing;

  TeaResult({
    required this.tea,
    required this.isNew,
    required this.shouldCountServing,
  });
}