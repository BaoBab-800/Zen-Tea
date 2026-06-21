import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_theme.dart';

class HisAppBar extends StatelessWidget implements PreferredSizeWidget {

  const HisAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return Container(
      decoration: BoxDecoration(
        color: context.colors.primary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),

      child: SafeArea(
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              if (canPop)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),

              Expanded(
                child: Center(
                  child: Text(
                    'His Scriptures',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              if (canPop)
                const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }
}

// Later replace with the current build
/*
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.primary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),

      child: SafeArea(
        child: SizedBox(
          height: 44,
          child: Center(
            child: Text(
              'His Scriptures',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
 */