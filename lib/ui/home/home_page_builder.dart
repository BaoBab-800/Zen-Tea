import 'package:flutter/material.dart';

import 'home_app_bar_section.dart';
import 'home_feed_section.dart';
import 'home_drawer_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarSection.build(context),

      body: HomeFeedSection(),

      drawer: HomeDrawerSection(),
    );
  }
}