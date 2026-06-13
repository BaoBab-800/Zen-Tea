import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

class AboutBuilder extends StatelessWidget {
  const AboutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.about,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
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
              Text(
                context.l10n.aboutVersion,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}