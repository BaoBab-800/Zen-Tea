import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';
import 'package:zentea/core/l10n/l10n.dart';

class ToDeveloperRoom extends StatelessWidget {
  const ToDeveloperRoom({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextButton(
          onPressed: () => Navigation(context).pushRoute(AppRoute.developer),

          child: Text(
            context.l10n.aboutToDeveloperRoom,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
