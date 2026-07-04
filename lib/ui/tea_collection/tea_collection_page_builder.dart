import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/ui/tea_grid/tea_rarity_grid.dart';

import 'tea_card.dart';

class TeaCollectionPageBuilder extends StatelessWidget {
  const TeaCollectionPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final teas = context.watch<ITeaCollectionService>().teas;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.teaCollection,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: TeaRarityGrid(
        teas: teas,
        itemBuilder: (context, tea) => TeaCard(tea: tea),
      ),
    );
  }
}