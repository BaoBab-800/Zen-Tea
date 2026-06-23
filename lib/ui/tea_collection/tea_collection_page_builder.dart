import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'tea_card.dart';

class TeaCollectionPageBuilder extends StatelessWidget {
  const TeaCollectionPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final teas = context.watch<ITeaCollectionService>().teas;
    final commonTeas = teas.where((tea) => tea.features == TeaFeatures.common).toList();
    final rareTeas = teas.where((tea) => tea.features == TeaFeatures.rare).toList();
    final legendaryTeas = teas.where((tea) => tea.features == TeaFeatures.legendary).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.teaCollection,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: CustomScrollView(
          slivers: [
            _raritySeparator(context.l10n.common),
            _teaGridView(context, commonTeas),

            _raritySeparator(context.l10n.rare),
            _teaGridView(context, rareTeas),

            _raritySeparator(context.l10n.legendary),
            _teaGridView(context, legendaryTeas),
          ],
        ),
      ),
    );
  }

  Widget _teaGridView(BuildContext context, List<TeaModel> teas) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) => TeaCard(tea: teas[index]),
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