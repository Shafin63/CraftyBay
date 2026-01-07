import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import 'inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: AppColors.themeColor.withAlpha(50),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetPaths.dummyImagePng, height: 80, width: 80),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "New Year Special Shoe Nike Air Jordan",
                            maxLines: 1,
                            style: textTheme.bodyLarge?.copyWith(
                              overflow: .ellipsis,
                              color: Colors.black87,
                              fontWeight: .w500,
                            ),
                          ),
                          Text(
                            "Color: Red, Size: 42",
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_rounded, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "${Constants.takaSign} 3000",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: .w600,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IncDecButton(onChange: (int value) {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
