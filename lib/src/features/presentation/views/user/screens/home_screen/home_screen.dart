import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../common_widget/category_item_widget.dart';
import '../../common_widget/product_item_card_widget.dart';
import '../../../../controller/user_controllers/main_bottom_nav_bar_controller.dart';
import '../../../../controller/user_controllers/home_nav_controller.dart';
import 'widget/custom_home_app_bar.dart';
import 'widget/home_carousel_slider_widget.dart';
import 'widget/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainBottomNavController mainBottomNavController = Get.find<MainBottomNavController>();
  final HomeNavController homeNavController = Get.find<HomeNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding, vertical: AppSpacing.verticalPadding),
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              HomeCarouselSliderWidget(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              _buildSectionHeader(title: AppStrings.categories, onTap: () {mainBottomNavController.moveToCategory();}),
              _buildCategoryDisplay(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
              _buildSectionHeader(title: AppStrings.popular, onTap: () {homeNavController.gotoPopular();}),
              _buildProductDisplay(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
              _buildSectionHeader(title: AppStrings.special, onTap: () {homeNavController.gotoSpecial();}),
              _buildProductDisplay(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
              _buildSectionHeader(title: AppStrings.newArrivals, onTap: () {homeNavController.gotoNewArrivals();}),
              _buildProductDisplay(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.01),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDisplay() {
    return SizedBox(
      height: AppSpacing.screenHeight(context) * 0.18,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItemCardWidget();
        },
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.screenWidth(context) * 0.02),
      ),
    );
  }

  Widget _buildCategoryDisplay() {
    return SizedBox(
      height: AppSpacing.screenHeight(context) * 0.15,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            title: AppStrings.electronics,
            iconData: Icons.desktop_mac_sharp,
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.screenWidth(context) * 0.04),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            AppStrings.seeAll,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColor.themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}