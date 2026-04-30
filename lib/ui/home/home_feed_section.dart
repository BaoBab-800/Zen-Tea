import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';
import 'package:zentea/core/l10n/l10n.dart';

class HomeFeedSection extends StatelessWidget {
  const HomeFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // A widget displaying the current series
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),

          child: Row(
            children: [
              Icon(Icons.local_fire_department),
              Text(
                context.l10n.currentTeaSeries,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),

        _buildCard(context.l10n.getTeaForToday, context, AppRoute.getTeaForToday),

        _buildCard(context.l10n.teaCollection, context, AppRoute.teaCollection),

        _buildCard(context.l10n.whatKindOfTeaAreYouQuiz, context, AppRoute.whatKindOfTeaAreYouQuiz),

        _buildCard(context.l10n.achievements, context, AppRoute.achievements),
      ],
    );
  }

  Widget _buildCard(String content, BuildContext context, AppRoute route) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: ListTile(
        title: Text(
          content,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        onTap: () {
          context.pushRoute(route);
        },
      ),
    );
  }
}