import 'package:flutter/material.dart';
import 'package:zentea/app/app_router.dart';

class HomeDrawerSection extends StatelessWidget {
  const HomeDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          _buildDrawerItem('Settings', Icons.settings, context),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigation(context).pushRoute(AppRoute.settings);
      },
    );
  }
}