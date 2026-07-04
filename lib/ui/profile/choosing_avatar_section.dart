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
        alignment: Alignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.primary,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  context.colors.primary.withValues(alpha: 0.7),
                  context.colors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: SizedBox(
              width: 153,
              height: 153,
            ),
          ),

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

          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () {
                showAvatarSelectionDialog(context);
              },

              icon: Icon(
                Icons.brush,
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}