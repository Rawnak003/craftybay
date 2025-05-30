import 'package:flutter/material.dart';
import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../widget/custom_app_bar.dart';
import '../widget/home_carousel_slider_widget.dart';
import '../widget/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              HomeCarouselSliderWidget(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              _buildSectionHeader(title: AppStrings.categories, onTap: () {}),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              _buildSectionHeader(title: AppStrings.popular, onTap: () {}),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              _buildSectionHeader(title: AppStrings.special, onTap: () {}),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.015),
              _buildSectionHeader(title: AppStrings.newArrivals, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required VoidCallback onTap}) {
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
            'See All',
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
