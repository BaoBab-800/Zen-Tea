import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:zentea/app/app_router.dart';

import 'package:zentea/core/theme/app_theme.dart';
import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/services/profile/profile_provider.dart';
import 'package:zentea/services/url/url_service.dart';

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

            const SizedBox(height: 14),
            Text(
              context.l10n.aboutApplicationDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),
            Text(
              context.l10n.aboutWhyDoYouNeedThisApp,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 18),
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

            const SizedBox(height: 18),
            Text(context.l10n.aboutTeam),

            const SizedBox(height: 6),
            _buildLinksSection(context),

            const SizedBox(height: 10),
            VersionText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.aboutLinks,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),

        LinkText(
          text: context.l10n.aboutGithub,
          url: Uri.parse('https://github.com/BaoBab-800/Zen-tea'),
        ),
        const SizedBox(height: 2),

        LinkText(
          text: context.l10n.aboutSupport,
          url: Uri.parse('https://заглушка'),
        ),
      ],
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
  String _version = "Loading...";
  String _displayVersion = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      _version = info.version;
      _displayVersion = _version;
    });
  }

  void _onVersionTap() {
    final profileProvider = context.read<ProfileProvider>();

    final now = DateTime.now();

    if (_lastTap == null ||
        now.difference(_lastTap!) > const Duration(seconds: 3)) {
      _tapCount = 0;
    }

    _lastTap = now;
    _tapCount++;

    setState(() {
      if (_tapCount >= 3 && _tapCount < 7) {
        _displayVersion = _hidePatch(_version);
      } else if (_tapCount < 3) {
        _displayVersion = _version;
        profileProvider.updateHisPageFlag(true);
      }
    });

    if (_tapCount >= 7) {
      _tapCount = 0;
      setState(() {
        _displayVersion = _version;
      });

      Navigation(context).goRoute(AppRoute.hisPageStart);
    }
  }

  String _hidePatch(String version) {
    final parts = version.split('.');
    if (parts.length != 3) return version;

    return '${parts[0]}.${parts[1]}.x';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onVersionTap,
      child: Text(
        '${context.l10n.aboutVersion}$_displayVersion',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final Uri url;

  const LinkText({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<UrlService>().open(url),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}