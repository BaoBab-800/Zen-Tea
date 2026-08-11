import 'package:flutter/material.dart';
import 'package:zentea/core/l10n/l10n.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.colors.surface,
                  ),

                  child: Column(
                    children: [
                      _teaImage(context),
                      const SizedBox(height: 12),

                      const Divider(),
                      _teaTitle(context),
                      const Divider(),

                      const SizedBox(height: 2),
                      _teaCountry(context),

                      const SizedBox(height: 2),
                      _textContent(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _teaImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.asset(
          currentTea.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _teaTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        currentTea.type.titleStory(context),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _teaCountry(BuildContext context) {
    return Text(
      currentTea.country.title(context),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _textContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _section(
          context,
          title: context.l10n.history,
          content: currentTea.type.story(context),
        ),
        _section(
          context,
          title: context.l10n.howToPrepare,
          content: currentTea.type.preparation(context),
        ),
        _section(
          context,
          title: context.l10n.howToDrink,
          content: currentTea.type.howToDrink(context),
        ),
        _section(
          context,
          title: context.l10n.beneficialProperties,
          content: currentTea.type.properties(context),
        ),
      ],
    );
  }

  Widget _section(
      BuildContext context, {
        required String title,
        required String content,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}