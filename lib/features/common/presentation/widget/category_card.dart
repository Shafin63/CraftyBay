import 'package:crafty_bay/features/category/data/models/category_model.dart';
import 'package:crafty_bay/features/product/presentation/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListByCategoryScreen.name);
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.themeColor.withAlpha(50),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.network(
                categoryModel.icon,
                width: 26,
                height: 26,
                errorBuilder: (_, _, _) => Icon(Icons.error, size: 26, color: Colors.grey,),
              ),
            ),
          ),
          Text(
            categoryModel.title,
            maxLines: 1,
            textAlign: .center,
            style: TextStyle(
              fontWeight: .w500,
              letterSpacing: .6,
              overflow: .ellipsis,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
