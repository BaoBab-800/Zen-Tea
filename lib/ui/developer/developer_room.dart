import 'package:flutter/material.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';

class DeveloperRoom extends StatelessWidget {
  const DeveloperRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final service = TeaCollectionService();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint(service.dumpState());
          },

          child: Text('Print info'),
        ),
      ),
    );
  }
}