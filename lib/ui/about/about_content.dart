import 'package:flutter/material.dart';

import 'package:zentea/app/app_router.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/core/l10n/l10n.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(16.0),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'ZenTea',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 6),
                Container(
                  width: 60,
                  height: 1,
                  color: context.colors.primary,
                ),
              ],
            ),

            const SizedBox(height: 14.0),
            Text(
              context.l10n.aboutApplicationDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12.0),
            Text(
              context.l10n.aboutWhyDoYouNeedThisApp,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 18.0),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Text(
                context.l10n.aboutPhilosophy,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 18.0),
            Text(context.l10n.aboutTeam),

            const SizedBox(height: 12.0),
            VersionText(),
          ],
        ),
      ),
    );
  }
}

class VersionText extends StatefulWidget {
  const VersionText({super.key});

  @override
  State<VersionText> createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  int _tapCount = 0;
  DateTime? _lastTap;

  void _onVersionTap() {
    final now = DateTime.now();

    if (_lastTap == null ||
        now.difference(_lastTap!) > const Duration(seconds: 1)) {
      _tapCount = 0;
    }

    _lastTap = now;
    _tapCount++;

    if (_tapCount == 3){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'He is watching you.',
            style: TextStyle(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          backgroundColor: context.colors.surface,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          duration: const Duration(seconds: 2),
        ),

        snackBarAnimationStyle: const AnimationStyle(
          duration: Duration(milliseconds: 800),
          reverseDuration: Duration(milliseconds: 800),
        ),
      );
    }

    if (_tapCount >= 7) {
      _tapCount = 0;

      Navigation(context).goRoute(AppRoute.hisPageStart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onVersionTap,
      child: Text(
        context.l10n.aboutVersion,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}