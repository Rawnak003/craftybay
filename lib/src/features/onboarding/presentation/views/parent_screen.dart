import 'package:craftybay/src/features/onboarding/presentation/views/cart_screen.dart';
import 'package:craftybay/src/features/onboarding/presentation/views/categories_screen.dart';
import 'package:craftybay/src/features/onboarding/presentation/views/home_screen.dart';
import 'package:craftybay/src/features/onboarding/presentation/views/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.lightGreyColor,
                offset: Offset(0, -3),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return TextStyle(color: AppColor.themeColor, fontWeight: FontWeight.bold);
                  }
                  return TextStyle(color: AppColor.darkGreyColor);
                },
              ),
            ),
            child: NavigationBar(
              elevation: 8,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: AppColor.whiteColor,
              destinations: [
                _buildNavDestination(Icons.home_outlined, AppStrings.home, 0),
                _buildNavDestination(Icons.grid_view_outlined, AppStrings.categories, 1),
                _buildNavDestination(Icons.shopping_cart_outlined, AppStrings.cart, 2),
                _buildNavDestination(Icons.bookmark_border_outlined, AppStrings.wishlist, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination _buildNavDestination(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return NavigationDestination(
      icon: Icon(
        icon,
        size: 32,
        color: isSelected ? AppColor.themeColor : AppColor.darkGreyColor,
      ),
      label: label,
    );
  }
}