import 'package:flutter/material.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.wishlist),
    );
  }
}
