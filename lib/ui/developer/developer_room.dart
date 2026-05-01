import 'package:flutter/material.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';

class DeveloperRoom extends StatelessWidget {
  const DeveloperRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final service = TeaCollectionService();
    final content = service.dumpState();

    return Scaffold(
      appBar: AppBar(title: Text('Developer room'),),

      body: Center(
        child: Text(
          content,
        ),
      ),
    );
  }
}