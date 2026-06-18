import 'package:flutter/material.dart';

import 'package:zentea/data/his/his_chapter_model.dart';

class ChapterPage extends StatelessWidget {
  final HisChapterModel chapter;

  const ChapterPage({
    super.key,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chapter ${chapter.id}',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: ListView.builder(
          itemCount: chapter.content.length,
          itemBuilder: (context, index) {
            return HisQuoteCard(
              quote: chapter.content[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class HisQuoteCard extends StatelessWidget {
  final String quote;
  final int index;

  const HisQuoteCard({
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