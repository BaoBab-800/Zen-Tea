import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

typedef TeaCardBuilder = Widget Function(BuildContext context, TeaModel tea);

class TeaRarityGrid extends StatelessWidget {
  final List<TeaModel> teas;
  final TeaCardBuilder itemBuilder;
  final bool hideEmptyGroups;
  final EdgeInsetsGeometry? padding;

  const TeaRarityGrid({
    super.key,
    required this.teas,
    required this.itemBuilder,
    this.hideEmptyGroups = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];

    for (final group in _buildGroups(context)) {
      if (hideEmptyGroups && group.teas.isEmpty) {
        continue;
      }

      slivers
        ..add(_RaritySeparator(group.title))
        ..add(_TeaGridView(teas: group.teas, itemBuilder: itemBuilder));
    }

    final scrollView = CustomScrollView(slivers: slivers);

    if (padding == null) {
      return scrollView;
    }

    return Padding(
      padding: padding!,
      child: scrollView,
    );
  }

  List<_TeaRarityGroup> _buildGroups(BuildContext context) {
    return [
      _TeaRarityGroup(
        title: context.l10n.common,
        teas: _teasByFeature(TeaFeatures.common),
      ),

      _TeaRarityGroup(
        title: context.l10n.rare,
        teas: _teasByFeature(TeaFeatures.rare),
      ),

      _TeaRarityGroup(
        title: context.l10n.legendary,
        teas: _teasByFeature(TeaFeatures.legendary),
      ),
    ];
  }

  List<TeaModel> _teasByFeature(TeaFeatures feature) {
    return teas.where((tea) => tea.features == feature).toList();
  }
}

class _TeaGridView extends StatelessWidget {
  final List<TeaModel> teas;
  final TeaCardBuilder itemBuilder;

  const _TeaGridView({required this.teas, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) => itemBuilder(context, teas[index]),
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
}

class _RaritySeparator extends StatelessWidget {
  final String rarityName;

  const _RaritySeparator(this.rarityName);

  @override
  Widget build(BuildContext context) {
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

class _TeaRarityGroup {
  final String title;
  final List<TeaModel> teas;

  const _TeaRarityGroup({required this.title, required this.teas});
}