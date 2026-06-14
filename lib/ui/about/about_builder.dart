import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'about_content.dart';

class AboutBuilder extends StatelessWidget {
  const AboutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.about,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: AboutContent(),
    );
  }
}