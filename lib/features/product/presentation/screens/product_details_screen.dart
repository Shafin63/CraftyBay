import 'package:crafty_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/common/presentation/widget/favourite_widget.dart';
import 'package:crafty_bay/features/common/presentation/widget/rating_view.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/review/presentation/screens/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../../app/extensions/localization_extension.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Text(
                                "Happy New Year Special Deal - Save 30% Nike Air Jordan",
                                style: textTheme.titleMedium,
                              ),
                            ),
                            IncDecButton(onChange: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ReviewsScreen.name);
                              },
                              child: Text(context.localizations.reviews),
                            ),
                            FavouriteButton(),
                          ],
                        ),
                        Text(
                          context.localizations.color,
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        ColorPicker(
                          color: ["Black", "White", "Red"],
                          onChange: (selectedColor) {},
                        ),

                        const SizedBox(height: 16),

                        Text(
                          context.localizations.size,
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        SizePicker(
                          size: ["S", "M", "L", "XL", "XXL"],
                          onChange: (selectedSize) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.localizations.description,
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          textAlign: .justify,
                          style: TextStyle(
                            color: Colors.grey.shade600
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildTotalPriceAndAddToCartButtonSection(context, textTheme),
        ],
      ),
    );
  }
}

Widget buildTotalPriceAndAddToCartButtonSection(
  BuildContext context,
  TextTheme textTheme,
) {
  return Container(
    padding: .all(16),
    decoration: BoxDecoration(
      color: AppColors.themeColor.withAlpha(60),
      borderRadius: .only(topRight: .circular(16), topLeft: .circular(16)),
    ),
    child: Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              context.localizations.price,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: .w400,
                color: Colors.black54,
              ),
            ),
            Text(
              "${Constants.takaSign} 10,000",
              style: textTheme.titleLarge?.copyWith(
                fontWeight: .w900,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 125,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              backgroundColor: AppColors.themeColor,
            ),
            onPressed: () {},
            child: Text(
              context.localizations.addToCart,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
