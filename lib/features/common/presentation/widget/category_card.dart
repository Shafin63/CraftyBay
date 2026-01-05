import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.themeColor.withAlpha(50),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Icon(Icons.computer, size: 30, color: AppColors.themeColor),
          ),
        ),
        Text(
          context.localizations.computer,
          style: TextStyle(
            fontWeight: .w500,
            letterSpacing: .6,
            color: AppColors.themeColor,
          ),
        ),
      ],
    );
  }
}