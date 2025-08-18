
import 'package:craftybay/src/features/presentation/controller/user_controllers/cart_list_controller.dart';
import 'package:craftybay/src/features/presentation/controller/user_controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/strings.dart';
import '../../common_widget/custom_app_bar.dart';
import '../../common_widget/custom_bottom_button.dart';
import '../../../../controller/user_controllers/main_bottom_nav_bar_controller.dart';
import 'widget/custom_cart_product_widget.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartListController.getCartItemList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.cart,
          onTap: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
        body: GetBuilder(
          init: _cartListController,
          builder: (_) {
            if (_cartListController.inProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (_cartListController.errorMessage != null) {
              return Center(
                child: Text(_cartListController.errorMessage!),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.pagePadding,
                    ),
                    child: ListView.separated(
                      itemCount: _cartListController.cartItemList.length,
                      itemBuilder: (context, index) {
                        return CustomCartProductWidget(cartItemModel: _cartListController.cartItemList[index],);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 4);
                      },
                    ),
                  ),
                ),
                _buildPriceAndCheckOutSection(context),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckOutSection(BuildContext context) {
    return CustomBottomButton(
      title: 'Total Price',
      subtext: '\$ ${_cartListController.totalPrice}',
      button: SizedBox(
        width: AppSpacing.screenWidth(context) * 0.3,
        child: GetBuilder<PaymentController>(
          builder: (controller) {
            return ElevatedButton(
              onPressed: () => controller.payment(),
              child: Text(AppStrings.checkout),
            );
          }
        ),
      ),
    );
  }
}
