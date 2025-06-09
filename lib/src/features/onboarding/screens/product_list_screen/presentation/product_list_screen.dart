import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../common_widget/custom_app_bar.dart';
import '../../../common_widget/product_item_card_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.categoryTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding * 0.5),
        child: GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductItemCardWidget());
          },
        ),
      ),
    );
  }
}
