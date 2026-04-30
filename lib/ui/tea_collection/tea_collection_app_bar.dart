import 'package:flutter/material.dart';

class TeaCollectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TeaCollectionAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // TODO: сделать красиво
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}