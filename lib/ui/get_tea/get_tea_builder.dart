import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/today_tea/today_tea_service.dart';

class GetTeaBuilder extends StatelessWidget {
  const GetTeaBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = context.read<TodayTeaService>();
    final teas = context.read<List<TeaModel>>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.todayTea,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: FutureBuilder<TeaModel>(
        future: service.getTeaOfToday(teas),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final tea = snapshot.data!;

          return _buildContent(context, tea);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, TeaModel tea) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TeaCard(tea: tea),

            const SizedBox(height: 24),

            Text(
              context.l10n.newTea,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: context.colors.primary,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(context.l10n.readTheStory),
              ),
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () {},
              child: Text(context.l10n.goToWiki),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeaCard extends StatelessWidget {
  final TeaModel tea;

  const _TeaCard({required this.tea});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 220,
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
                height: 160,
                child: Image.asset(
                  tea.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              tea.type.title(context),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}