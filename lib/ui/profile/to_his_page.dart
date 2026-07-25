import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';
import 'package:zentea/core/l10n/l10n.dart';

class ToHisPage extends StatelessWidget {
  const ToHisPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextButton(
          onPressed: () => Navigation(context).pushRoute(AppRoute.hisPageContent),

          child: Text(
            context.l10n.aboutToHisPage,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}