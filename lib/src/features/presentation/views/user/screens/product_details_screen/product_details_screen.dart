import 'package:craftybay/src/core/routes/app_route_names.dart';
import 'package:craftybay/src/core/utils/snack_bar_message.dart';
import 'package:craftybay/src/features/data/models/product_model.dart';
import 'package:craftybay/src/features/presentation/controller/authentication_controllers/auth_controller.dart';
import 'package:craftybay/src/features/presentation/controller/user_controllers/add_to_cart_controller.dart';
import 'package:craftybay/src/features/presentation/controller/user_controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../controller/user_controllers/product_screen_controller.dart';
import '../../common_widget/custom_bottom_button.dart';
import '../../../../controller/user_controllers/main_bottom_nav_bar_controller.dart';
import 'widgets/color_picker_widget.dart';
import 'widgets/custom_header_widget.dart';
import 'widgets/product_preview_widget.dart';
import 'widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final MainBottomNavController _mainBottomNavController =
      Get.find<MainBottomNavController>();
  final ProductScreenController _productScreenController =
      Get.find<ProductScreenController>();
  final AddToCartController _addToCartController =
      Get.find<AddToCartController>();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  Future<void> _onTapAddToCart() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      print(await Get.find<AuthController>().isUserLoggedIn());
      final bool result = await _addToCartController.addToCart(
        widget.productId,
      );
      if (result) {
        showSnackBarMessage(context, 'Added to Cart');
      } else {
        showSnackBarMessage(context, _addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, AppRoutesName.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: _productDetailsController,
          builder: (_) {
            if (_productDetailsController.inProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (_productDetailsController.errorMessage != null) {
              return Center(
                child: Text(_productDetailsController.errorMessage!),
              );
            }
            final ProductModel product =
                _productDetailsController.productDetails;
            return Column(
              children: [
                ProductPreviewWidget(
                  currentSlider: _currentSlider,
                  images: product.photoUrls,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.pagePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomHeaderWidget(product: product),
                          SizedBox(
                            height: AppSpacing.screenHeight(context) * 0.01,
                          ),
                          Visibility(
                            visible: product.colors.isNotEmpty,
                            child: Column(
                              children: [
                                Text(
                                  AppStrings.color,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      AppSpacing.screenHeight(context) * 0.01,
                                ),
                                ColorPickerWidget(),
                                SizedBox(
                                  height:
                                      AppSpacing.screenHeight(context) * 0.01,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: product.sizes.isNotEmpty,
                            child: Column(
                              children: [
                                Text(
                                  AppStrings.size,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      AppSpacing.screenHeight(context) * 0.01,
                                ),
                                SizePickerWidget(),
                                SizedBox(
                                  height:
                                      AppSpacing.screenHeight(context) * 0.01,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            AppStrings.description,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: AppSpacing.screenHeight(context) * 0.01,
                          ),
                          Text(
                            product.description,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildPriceAndAddToCartSection(context, product),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(
    BuildContext context,
    ProductModel product,
  ) {
    return GetBuilder(
      init: _addToCartController,
      builder: (_) {
        return CustomBottomButton(
          title: 'Price',
          subtext: '\$ ${product.currentPrice}',
          button: SizedBox(
            width: AppSpacing.screenWidth(context) * 0.3,
            child: Visibility(
              visible: _addToCartController.inProgress == false,
              replacement: Center(child: CircularProgressIndicator()),
              child: ElevatedButton(
                onPressed: _onTapAddToCart,
                child: Text(AppStrings.addToCart),
              ),
            ),
          ),
        );
      },
    );
  }
}
