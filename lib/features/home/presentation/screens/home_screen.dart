import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widget/category_card.dart';
import '../widgets/appbar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_search_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 4),
              ProductSearchField(),
              SizedBox(height: 12),
              HomeCarouselSlider(),
              SectionHeader(
                title: context.localizations.categories,
                onTapSeeAll: () {
                  context
                      .read<MainNavContainerProvider>()
                      .changeToAllCategoriesList();
                },
              ),
              buildCategoryList(),
              SectionHeader(
                title: context.localizations.popular,
                onTapSeeAll: () {},
              ),
              SizedBox(
                width: 180,

                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withAlpha(30),
                          image: DecorationImage(
                            image: AssetImage(AssetPaths.dummyImagePng),
                          ),
                        ),
                      ),
                      Text("Nike Air Jordan"),
                      Row(
                        children: [
                          Text("${Constants.takaSign}100"),
                          Wrap(children: [Icon(Icons.star), Text("4.8")]),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: AppColors.themeColor,
                            child: Icon(Icons.favorite_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 6,
        children: [
          SvgPicture.asset(AssetPaths.logoNavSvg),
          Spacer(),
          AppbarIconButton(icon: Icons.person_outline_outlined, onTap: () {}),
          AppbarIconButton(icon: Icons.call, onTap: () {}),
          AppbarIconButton(icon: Icons.notifications_active, onTap: () {}),
        ],
      ),
    );
  }
}
