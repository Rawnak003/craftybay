import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app/app_spacing.dart';
import '../../../../core/constants/images.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, this.height, this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.splashImage,
      height: height ?? AppSpacing.screenHeight(context) * 0.15,
      width: width ?? AppSpacing.screenWidth(context) * 0.15,
    );
  }
}