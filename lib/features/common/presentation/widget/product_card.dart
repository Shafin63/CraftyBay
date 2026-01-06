import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 3,
        shadowColor: AppColors.themeColor.withAlpha(50),
        shape: RoundedRectangleBorder(borderRadius: .circular(4)),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              //shoe png design part
              height: 90,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: .only(
                  topLeft: .circular(8),
                  topRight: .circular(8),
                ),
                color: AppColors.themeColor.withAlpha(30),
                image: DecorationImage(
                  image: AssetImage(AssetPaths.dummyImagePng),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "New Arrival - Nike Air Jordan",
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "${Constants.takaSign}6000",
                        style: TextStyle(
                          fontWeight: .w600,
                          color: AppColors.themeColor,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text("4.8"),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}