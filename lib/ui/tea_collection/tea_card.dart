import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/url/url_service.dart';

import 'package:zentea/ui/history_of_teas/history_builder.dart';

class TeaCard extends StatelessWidget {
  final TeaModel tea;
  final UrlService urlService = UrlService();

  TeaCard({super.key, required this.tea});

  void showTeaDialog(BuildContext context, TeaModel tea, UrlService urlService) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          backgroundColor: context.colors.onPrimary.withValues(alpha: 0.9),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 2, bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        tea.imagePath,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),

                    const SizedBox(height: 6),
                    Text(
                      context.l10n.teaServedTimes(tea.timesServed),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HistoryBuilder(currentTea: tea),
                          ),
                        );
                      },
                      child: Text(
                        context.l10n.readTheStory,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),

                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        urlService.open(tea.url);
                      },
                      child: Text(
                        context.l10n.goToWiki,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          if (!tea.isUnlocked) return;

          showTeaDialog(
            context,
            tea,
            urlService,
          );
        },

        child: Container(
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
        ),
      ),
    );
  }
}
