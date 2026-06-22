import 'package:flutter/material.dart';

import 'his_chapter_model.dart';
import 'chapters_content/chapter_one.dart';
import 'chapters_content/chapter_two.dart';
import 'chapters_content/chapter_three.dart';
import 'chapters_content/chapter_four.dart';

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

  HisChapterModel(
    id: 3,
    content: chapterThree,
    icon: Icons.warning,
    hasUnknownSymbolsError: true,
  ),

  HisChapterModel(
    id: 4,
    content: chapterFour,
    icon: Icons.terrain_outlined,
  ),
];