import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/app/app_router.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/services/profile/profile_provider.dart';

class SettingsDevButton extends StatefulWidget {
  const SettingsDevButton({super.key});

  @override
  State<SettingsDevButton> createState() => _SettingsDevButtonState();
}

class _SettingsDevButtonState extends State<SettingsDevButton> {
  int _tapCount = 0;
  DateTime? _lastTap;

  @override
  void initState() {
    super.initState();
  }

  void _onWidgetTap() {
    final now = DateTime.now();
    final profileProvider = context.read<ProfileProvider>();

    if (_lastTap == null ||
        now.difference(_lastTap!) > const Duration(seconds: 1)) {
      _tapCount = 0;
    }

    _lastTap = now;
    _tapCount++;

    if (_tapCount >= 7) {
      profileProvider.updateDeveloperRoomFlag(true);
      Navigation(context).pushRoute(AppRoute.developer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _onWidgetTap,

        child: Text(
          '7',
          style: TextStyle(
            color: context.colors.primary.withValues(alpha: 0.1),
          ),
        ),
      ),
    );
  }
}