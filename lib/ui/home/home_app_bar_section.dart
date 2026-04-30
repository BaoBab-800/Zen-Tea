import 'package:flutter/material.dart';

class HomeAppBarSection {
  static AppBar build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Zen tea',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),

            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}