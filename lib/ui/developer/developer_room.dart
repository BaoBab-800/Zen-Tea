import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';

class DeveloperRoom extends StatelessWidget {
  const DeveloperRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final quest = context.watch<QuestProgressService>();
    final service = context.watch<TeaCollectionService>();
    final content = service.dumpState();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.developerRoom,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 12),
          Center(child: Text(content)),

          const SizedBox(height: 6),
          TextButton(
            onPressed: () {
              for(var tea in listOfTeas) {
                service.setServedCount(tea, 0);
              }
            },

            child: Text(context.l10n.resetAllValues),
          ),

          const SizedBox(height: 6),
          TextButton(
            onPressed: () {
              for(var tea in listOfTeas) {
                service.setUnlocked(tea, true);
              }
            },

            child: Text(context.l10n.unlockAll),
          ),

          const SizedBox(height: 6),
          TextButton(
            onPressed: () {
              for(var tea in listOfTeas) {
                service.setUnlocked(tea, false);
              }
            },

            child: Text(context.l10n.blockAll),
          ),

          const SizedBox(height: 6),
          TextButton(
            onPressed: () async  {
              await quest.setStreak(Random().nextInt(100));
            },

            child: Text(context.l10n.setRandomStreak),
          ),

          const SizedBox(height: 6),
          TextButton(
            onPressed: () async  {
              await quest.resetStreak();
            },

            child: Text(context.l10n.resetStreak),
          )
        ],
      ),
    );
  }
}