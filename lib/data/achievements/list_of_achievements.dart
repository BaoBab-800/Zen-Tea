import 'package:zentea/data/achievements/abstract_achievement.dart';

import 'achievements_list/serve_ten_teas_achievement.dart';
import 'achievements_list/get_rare_tea.dart';
import 'achievements_list/first_steps_achievement.dart';

final List<Achievement> allAchievements = [
  FirstStepsAchievement(),
  ServeTenTeasAchievement(),
  GetRareTeaAchievement(),
];