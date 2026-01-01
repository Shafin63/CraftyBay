import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appbar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/product_search_field.dart';

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
            spacing: 16,
            children: [
              ProductSearchField(),
              HomeCarouselSlider(),
            ],
          ),
        ),
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


