import 'package:craftybay/src/features/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../controller/user_controllers/product_list_by_category_controller.dart';
import '../../common_widget/custom_app_bar.dart';
import '../../common_widget/product_item_card_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListByCategoryController _productListByCategoryController =
  ProductListByCategoryController();

  @override
  void initState() {
    super.initState();
    _productListByCategoryController.getProductList(
      widget.category.id,
    );
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<ProductListByCategoryController>().getProductList(
        widget.category.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.category.title, onTap: () {
        Get.back();
      },),
      body: SafeArea(
        child: GetBuilder(
            init: _productListByCategoryController,
            builder: (controller) {
              if (controller.initialLoadingInProgress) {
                return Center(child: CircularProgressIndicator(),);
              }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
                    child: GridView.builder(
                      itemCount: controller.productModelList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(child: ProductItemCardWidget(
                          productModel: controller.productModelList[index],
                        ));
                      },
                    ),
                  ),
                ),
                Visibility(visible: controller.inProgress, child: LinearProgressIndicator()),
              ],
            );
          }
        ),
      ),
    );
  }
}
