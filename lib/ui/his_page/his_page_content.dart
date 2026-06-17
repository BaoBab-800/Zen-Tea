import 'package:flutter/material.dart';

import 'package:zentea/data/his/his_quotes.dart';

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
        toolbarHeight: 40,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: ListView.builder(
          itemCount: hisQuotes.length,
          itemBuilder: (context, index) {
            return HisQuoteCard(quote: hisQuotes[index]!, index: index);
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
    final archiveId = (index + 1);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Poem $archiveId',
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