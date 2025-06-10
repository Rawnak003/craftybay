import 'package:flutter/material.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../common_widget/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.cart, onTap: () {},),
    );
  }
}
