import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';

class ToHisPage extends StatelessWidget {
  const ToHisPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextButton(
          onPressed: () => Navigation(context).pushRoute(AppRoute.hisPageContent),

          child: Text(
            'To His page',
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}