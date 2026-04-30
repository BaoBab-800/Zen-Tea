import 'package:flutter/material.dart';
import 'package:zentea/core/l10n/l10n.dart';

class AchievementsBuilder extends StatelessWidget {
  const AchievementsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.achievements,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
