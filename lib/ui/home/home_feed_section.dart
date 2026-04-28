import 'package:flutter/material.dart';
import 'package:zentea/core/theme/app_colors.dart';
import 'package:zentea/core/theme/app_theme.dart';

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
                'Current tea series: 7',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),

        _buildCard('Get tea for today', context, () {}),

        _buildCard('Tea collection', context, () {}),

        _buildCard('What kind of tea are you? Quiz', context, () {}),

        _buildCard('Achievements', context, () {}),
      ],
    );
  }

  Widget _buildCard(String content, BuildContext context, VoidCallback onTap) {
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

        onTap: onTap,
      ),
    );
  }
}