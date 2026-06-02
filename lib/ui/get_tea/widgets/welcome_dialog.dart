import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (_) => const WelcomeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.aboutQuiz),
      content: Text(context.l10n.getTeaWarning),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(context.l10n.ok),
        ),
      ],
    );
  }
}
