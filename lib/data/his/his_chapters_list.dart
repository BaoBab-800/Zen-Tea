import 'package:flutter/material.dart';

import 'his_chapter_model.dart';
import 'chapters_content/chapter_one.dart';
import 'chapters_content/chapter_two.dart';

List<HisChapterModel> hisChaptersList = [
  HisChapterModel(
    id: 1,
    content: chapterOne,
    icon: Icons.light_mode,
  ),

  HisChapterModel(
    id: 2,
    content: chapterTwo,
    icon: Icons.directions_walk,
  ),
];