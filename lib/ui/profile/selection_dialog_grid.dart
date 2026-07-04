import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

class SelectionDialogGrid extends StatelessWidget {
  const SelectionDialogGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final teas = context.read<ITeaCollectionService>().teas;
    final commonTeas = teas.where((tea) => tea.features == TeaFeatures.common).toList();
    final rareTeas = teas.where((tea) => tea.features == TeaFeatures.rare).toList();
    final legendaryTeas = teas.where((tea) => tea.features == TeaFeatures.legendary).toList();

    return AlertDialog(
      title: Text(context.l10n.profileChoosingAnAvatar),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 420,
          maxHeight: 500,
        ),

        child: CustomScrollView(
          slivers: [
            if (commonTeas.isNotEmpty) ...[
              _raritySeparator(context.l10n.common),
              _buildTeaGrid(context, commonTeas),
            ],

            if (rareTeas.isNotEmpty) ...[
              _raritySeparator(context.l10n.rare),
              _buildTeaGrid(context, rareTeas),
            ],

            if (legendaryTeas.isNotEmpty) ...[
              _raritySeparator(context.l10n.legendary),
              _buildTeaGrid(context, legendaryTeas),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTeaGrid(BuildContext context, List<TeaModel> teas) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) => SelectedTeaCard(
              tea: teas[index],
              onTap: (imagePath) {
                Navigator.pop(context, imagePath);
              },
            ),
        childCount: teas.length,
      ),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
    );
  }

  Widget _raritySeparator(String rarityName) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Expanded(
              child: Divider(indent: 16),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                rarityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Expanded(
              child: Divider(endIndent: 16),
            ),
          ],
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