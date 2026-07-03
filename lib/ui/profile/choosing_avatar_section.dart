import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'selection_dialog_grid.dart';

class ChoosingAvatarSection extends StatelessWidget {
  const ChoosingAvatarSection({super.key});

  Future<void> showAvatarSelectionDialog(BuildContext context) async {
    final TeaType? selectedTea = await showDialog<TeaType>(
      context: context,
      builder: (context) => SelectionDialogGrid(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/teas/black_tea.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              showAvatarSelectionDialog(context);
            },

            icon: Icon(
              Icons.brush,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}