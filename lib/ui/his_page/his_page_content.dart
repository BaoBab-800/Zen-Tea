import 'package:flutter/material.dart';

import 'package:zentea/data/his/his_chapters_list.dart';

import 'chapters_page.dart';

class HisPageContent extends StatelessWidget {
  const HisPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'His Scriptures',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 44,
      ),

      body: ListView.builder(
        itemCount: hisChaptersList.length,
        itemBuilder: (context, index) {
          final chapter = hisChaptersList[index];

          return chapterTitle(
            context,
            index,
            chapter.icon,
          );
        },
      ),
    );
  }

  Widget chapterTitle(BuildContext context, int index, IconData icon) {
    final chapter = hisChaptersList[index];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme
              .of(context)
              .dividerColor
              .withValues(alpha: 0.1),
        ),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChapterPage(chapter: chapter),
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor
                      .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  size: 20,
                ),
              ),

              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Chapter ${chapter.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}