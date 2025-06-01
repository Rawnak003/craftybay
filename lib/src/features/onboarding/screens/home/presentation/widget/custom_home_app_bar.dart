import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/app/app_spacing.dart';
import '../../../../../../../core/constants/images.dart';
import 'app_bar_icon_button_widget.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AppImages.appBarLogoSvg,
        height: AppSpacing.screenHeight(context) * 0.033,
        width: AppSpacing.screenWidth(context) * 0.033,
      ),
      actions: [
        AppBarIconButtonWidget(
          iconData: Icons.perm_identity_outlined,
          onTap: () {},
        ),
        AppBarIconButtonWidget(
          iconData: Icons.phone_outlined,
          onTap: () {},
        ),
        AppBarIconButtonWidget(
          iconData: Icons.notifications_active_outlined,
          paddingRight: 16.0,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
