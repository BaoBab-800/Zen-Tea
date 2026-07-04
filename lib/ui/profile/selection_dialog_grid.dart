import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/ui/tea_grid/tea_rarity_grid.dart';

class SelectionDialogGrid extends StatelessWidget {
  const SelectionDialogGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final teas = context.read<ITeaCollectionService>().teas;

    return AlertDialog(
      title: Text(context.l10n.profileChoosingAnAvatar),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 420,
          maxHeight: 500,
        ),

        child: TeaRarityGrid(
          teas: teas,
          hideEmptyGroups: true,
          itemBuilder: (context, tea) => SelectedTeaCard(
            tea: tea,
            onTap: (imagePath) {
              Navigator.pop(context, imagePath);
            },
          ),
        ),
      ),
    );
  }
}

class SelectedTeaCard extends StatelessWidget {
  final TeaModel tea;
  final ValueChanged<String>? onTap;

  const SelectedTeaCard({
    super.key,
    required this.tea,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tea.isUnlocked) {
          onTap?.call(tea.imagePath);
        }
      },

      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.onPrimary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),

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
    );
  }
}