import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/services/profile/profile_provider.dart';

import 'choosing_avatar_section.dart';
import 'statistics_section.dart';
import 'to_his_page.dart';
import 'to_developer_room.dart';

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final profileStatsProvder =
        context.read<ProfileProvider>().profileStats;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.profile,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(4, 6),
              ),
            ],
          ),

          child: Column(
            children: [
              ChoosingAvatarSection(),
              StatisticsSection(),
              if (profileStatsProvder.isHisPageFound) ToHisPage(),
              if (profileStatsProvder.isDeveloperRoomFound) ToDeveloperRoom(),
            ],
          ),
        ),
      ),
    );
  }
}