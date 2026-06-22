import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/his/his_chapter_model.dart';

class ChapterPage extends StatefulWidget {
  final HisChapterModel chapter;

  const ChapterPage({
    super.key,
    required this.chapter,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  void initState() {
    super.initState();

    if (widget.chapter.hasUnknownSymbolsError) showError(context);
  }

  void showError(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: Unknown characters have been replaced with �',
            style: TextStyle(
              color: context.colors.onError,
              fontWeight: FontWeight.w600,
            ),
          ),

          backgroundColor: context.colors.error,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chapter ${widget.chapter.id}',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: ListView.builder(
          itemCount: widget.chapter.content.length,
          itemBuilder: (context, index) {
            return PoemCard(
              quote: widget.chapter.content[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class PoemCard extends StatelessWidget {
  final String quote;
  final int index;

  const PoemCard({
    super.key,
    required this.quote,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final poemId = (index + 1);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Poem $poemId',
              style: const TextStyle(
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              quote,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}