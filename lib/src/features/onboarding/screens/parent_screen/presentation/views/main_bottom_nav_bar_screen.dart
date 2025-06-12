import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../cart_screen/presentation/views/cart_screen.dart';
import '../../../category_screen/presentation/views/categories_screen.dart';
import '../../../home_screen/presentation/views/home_screen.dart';
import '../../../wishlist_screen/presentation/views/wishlist_screen.dart';
import '../../controller/main_bottom_nav_bar_controller.dart';


class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return SafeArea(
          child: Scaffold(
            body: _screens[navController.selectedIndex],
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
                    blurRadius: 1,
                    spreadRadius: 1.5,
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
                  selectedIndex: navController.selectedIndex,
                  onDestinationSelected: navController.changeIndex,
                  backgroundColor: AppColor.whiteColor,
                  destinations: [
                    _buildNavDestination(Icons.home_outlined, AppStrings.home, 0, navController.selectedIndex),
                    _buildNavDestination(Icons.grid_view_outlined, AppStrings.categories, 1, navController.selectedIndex),
                    _buildNavDestination(Icons.shopping_cart_outlined, AppStrings.cart, 2, navController.selectedIndex),
                    _buildNavDestination(Icons.bookmark_border_outlined, AppStrings.wishlist, 3, navController.selectedIndex),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  NavigationDestination _buildNavDestination(IconData icon, String label, int index, int selectedIndex) {
    final isSelected = selectedIndex == index;
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