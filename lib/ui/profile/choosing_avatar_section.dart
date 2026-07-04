import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/services/profile/profile_provider.dart';
import 'selection_dialog_grid.dart';

class ChoosingAvatarSection extends StatelessWidget {
  const ChoosingAvatarSection({super.key});

  Future<void> showAvatarSelectionDialog(BuildContext context) async {
    final String? selectedAvatar = await showDialog<String>(
      context: context,
      builder: (context) => SelectionDialogGrid(),
    );

    if (selectedAvatar != null) {
      await context.read<ProfileProvider>().updateAvatar(selectedAvatar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarPath =
        context.watch<ProfileProvider>().profileStats.avatarImagePath;

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
                avatarPath,
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