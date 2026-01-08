import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key});

  static const String name = '/product-list-by-category';

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.electronics)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 30,
          keyboardDismissBehavior: .onDrag,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductCard());
          },
        ),
      ),
    );
  }
}
