import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

class TeaCollectionPageBuilder extends StatelessWidget {
  const TeaCollectionPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final teas = context.watch<List<TeaModel>>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.teaCollection,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 14),
        child: Expanded(
          child: GridView.builder(
            itemCount: teas.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),

            itemBuilder: (context, index) {
              return TeaCard(tea: teas[index]);
            }
          ),
        ),
      ),
    );
  }
}

class TeaCard extends StatelessWidget {
  final TeaModel tea;

  const TeaCard({super.key, required this.tea});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.onPrimary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: tea.isUnlocked
                    ? Image.asset(
                  tea.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ) : const Center(child: Icon(Icons.lock)),
              ),
            ),
          ),

          Text(
            tea.isUnlocked ? tea.type.title(context) : context.l10n.locked,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}