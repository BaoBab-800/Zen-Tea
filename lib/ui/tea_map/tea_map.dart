import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_theme.dart';

class TeaMap extends StatelessWidget {
  const TeaMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tea Map',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(4, 6),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/tea_map.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}