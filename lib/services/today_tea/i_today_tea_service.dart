import 'package:zentea/data/teas/tea_model.dart';

abstract class ITodayTeaService {
  Future<TeaModel> getTeaOfToday(List<TeaModel> teas);

  Future<bool> shouldCountServingForToday();

  TeaModel getWeightedRandomTea(List<TeaModel> teas);
}