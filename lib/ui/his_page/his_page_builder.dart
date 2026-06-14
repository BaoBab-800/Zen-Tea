import 'package:flutter/material.dart';

class HisPageBuilder extends StatelessWidget {
  const HisPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('His Page'),
      ),

      body: const Center(
        child: Text('His Page'),
      ),
    );
  }
}