import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';

class ToDeveloperRoom extends StatelessWidget {
  const ToDeveloperRoom({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextButton(
          onPressed: () => Navigation(context).pushRoute(AppRoute.developer),

          child: Text(
            'To developer room',
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
