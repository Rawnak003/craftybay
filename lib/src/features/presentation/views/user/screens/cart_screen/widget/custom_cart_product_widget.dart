import 'package:craftybay/src/core/utils/snack_bar_message.dart';
import 'package:craftybay/src/features/data/models/cart_item_model.dart';
import 'package:craftybay/src/features/presentation/controller/user_controllers/delete_cart_item_controller.dart';
import 'package:craftybay/src/features/presentation/views/user/common_widget/item_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../app/app_spacing.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../controller/user_controllers/cart_list_controller.dart';

class CustomCartProductWidget extends StatelessWidget {
  CustomCartProductWidget({
    super.key, required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  final DeleteCartItemController _deleteCartItemController = DeleteCartItemController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.verticalPadding),
        child: Row(
          children: [
            SizedBox(
              height: AppSpacing.screenWidth(context) * 0.25,
              width: AppSpacing.screenWidth(context) * 0.25,
              child: cartItemModel.productModel.photoUrls.isNotEmpty
                  ? Image.network(
                cartItemModel.productModel.photoUrls.first,
                errorBuilder: (_, __, ___) {
                  return Center(
                    child: Icon(Icons.error_outline),
                  );
                },
                fit: BoxFit.contain,
              )
                  : Center(
                child: Icon(Icons.image_not_supported, size: 32,),
              ),
            ),
            SizedBox(width: AppSpacing.screenWidth(context) * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          cartItemModel.productModel.title,
                          maxLines: 1,
                          style: Theme.of(context,).textTheme.titleMedium?.copyWith(
                            color: AppColor.darkGreyColor,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          bool isDeleted = await _deleteCartItemController.deleteCartItem(cartItemModel.id);
                          if (isDeleted) {
                            showSnackBarMessage(context, "Item deleted successfully!");
                            Get.find<CartListController>().getCartItemList();
                          } else {
                            showSnackBarMessage(context, _deleteCartItemController.errorMessage ?? "Failed to delete item");
                          }
                        },
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColor.darkGreyColor,
                        ),
                      )
                    ],
                  ),
                  if (cartItemModel.color != null && cartItemModel.size != null) Text('Color: Black, Size: L', style: Theme.of(context,).textTheme.bodyMedium?.copyWith(color: AppColor.darkGreyColor,),),
                  SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${cartItemModel.productModel.currentPrice}', style: Theme.of(context,).textTheme.titleMedium?.copyWith(fontSize: 20, color: AppColor.themeColor,),),
                      ItemCounterWidget(onChange: (value) {
                        Get.find<CartListController>().updateQuantity(
                            cartItemModel.id, value);
                      })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}