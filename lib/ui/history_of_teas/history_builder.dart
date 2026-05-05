import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/data/teas/tea_model.dart';

class HistoryBuilder extends StatelessWidget {
  final TeaModel currentTea;

  const HistoryBuilder({
    super.key,
    required this.currentTea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentTea.type.title(context),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.colors.surface,
                      ),

                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: double.infinity,
                              height: 260,
                              child: Image.asset(
                                currentTea.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            currentTea.type.titleStory(context),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),
                          Text(currentTea.type.story(context)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 200),
                  Text('Пасхалка'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}