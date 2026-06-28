import 'package:flutter/material.dart';
import 'package:zentea/core/l10n/l10n.dart';

class CalendarPageBuilder extends StatelessWidget {
  const CalendarPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.calendar)),

      body: Center(child: Text('Calendar')),
    );
  }
}