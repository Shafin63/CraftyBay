import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/asset_paths.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.logoSvg,
      width: width ?? 100,
      height: height,
    );
  }
}
