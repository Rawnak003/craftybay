import 'package:flutter/material.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.cart, onTap: () {},),
    );
  }
}
