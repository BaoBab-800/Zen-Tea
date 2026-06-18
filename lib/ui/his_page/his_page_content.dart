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
          return ListTile(
            title: Text(
              'Chapter ${hisChaptersList[index].id}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterPage(
                    chapter: hisChaptersList[index],
                  )
                ),
              );
            }
          );
        },
      ),
    );
  }
}