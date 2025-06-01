import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/parent_screen/controller/main_bottom_nav_bar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 22),
            onPressed: () => Get.find<MainBottomNavController>().backToHome(),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
