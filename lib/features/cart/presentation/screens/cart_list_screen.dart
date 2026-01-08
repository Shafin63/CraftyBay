import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/review/presentation/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/presentation/providers/main_nav_container_provider.dart';
import '../widgets/cart_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        context.read<MainNavContainerProvider>().changeToHomeScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart List"),
          leading: IconButton(
            onPressed: () {
              context.read<MainNavContainerProvider>().changeToHomeScreen();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CartItem();
                  },
                ),
              ),
            ),
            buildTotalPriceAndCheckOutButtonSection(context, textTheme),
          ],
        ),
      ),
    );
  }

  Widget buildTotalPriceAndCheckOutButtonSection(
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
                context.localizations.totalPrice,
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
            width: 120,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: .circular(5)),
                backgroundColor: AppColors.themeColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CreateReviewScreen.name);
              },
              child: Text(
                context.localizations.checkout,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
