import 'package:zentea/data/achievements/abstract_achievement.dart';

import 'achievements_list/serve_ten_teas_achievement.dart';
import 'achievements_list/first_steps_achievement.dart';
import 'achievements_list/get_rare_teas.dart';
import 'achievements_list/legendary_tea_achievement.dart';
import 'achievements_list/collect_all_the_teas_achievement.dart';

final List<Achievement> allAchievements = [
  FirstStepsAchievement(),
  ServeTenTeasAchievement(),
  GetRareTeasAchievement(),
  LegendaryTeaAchievement(),
  CollectAllTheTeasAchievement(),
];