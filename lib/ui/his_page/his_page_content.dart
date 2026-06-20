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
          return chapterTitle(context, index);
        },
      ),
    );
  }

  Widget chapterTitle(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChapterPage(
              chapter: hisChaptersList[index],
            ),
          ),
        );
      },

      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'Chapter ${hisChaptersList[index].id}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}