import 'package:craftybay/core/app/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/strings.dart';
import '../../../../common_widget/category_item_widget.dart';
import '../../../../common_widget/custom_app_bar.dart';
import '../../../parent_screen/controller/main_bottom_nav_bar_controller.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.categories,
          onTap: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 28,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                child: CategoryItemWidget(
                  iconData: Icons.desktop_mac_sharp,
                  title: AppStrings.electronics,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
