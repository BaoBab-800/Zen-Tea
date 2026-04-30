import 'package:flutter/material.dart';

import 'tea_collection_app_bar.dart';

class TeaCollectionPageBuilder extends StatelessWidget {

  const TeaCollectionPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeaCollectionAppBar(title: 'Tea collection'),


    );
  }
}