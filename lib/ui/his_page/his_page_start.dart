import 'package:flutter/material.dart';

import 'package:zentea/app/app_router.dart';

class HisPageStart extends StatefulWidget {
  const HisPageStart({super.key});

  @override
  State<HisPageStart> createState() => _HisPageStartState();
}

class _HisPageStartState extends State<HisPageStart> {
  int _stage = 0;

  String get _text {
    switch (_stage) {
      case 0:
        return 'Why did you come here?';
      case 1:
        return 'Don\'t go on.';
      case 2:
        return 'ENOUGH!';
      case 3:
        return 'Enough...';
      case 4:
        return 'You won\'t like what you see there...';
      default:
        return 'You won\'t like what you see there...';
    }
  }

  void _onLongPress() {
    setState(() {
      _stage++;
    });

    if (_stage >= 5) {
      Navigation(context).goRoute(AppRoute.hisPageContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _onLongPress,
      child: Scaffold(
        body: Center(
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}