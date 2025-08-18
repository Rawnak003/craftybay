import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constants/strings.dart';
import '../../../../controller/user_controllers/category_list_controller.dart';
import '../../common_widget/category_item_widget.dart';
import '../../common_widget/custom_app_bar.dart';
import '../../../../controller/user_controllers/main_bottom_nav_bar_controller.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController =
  Get.find<CategoryListController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCategories();
    }
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
          title: AppStrings.categories,
          onTap: () => Get.find<MainBottomNavController>().backToHome(),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (controller) {
            if (controller.initialLoadingInProgress){
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.pagePadding),
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.categoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 28,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: CategoryItemWidget(
                            categoryModel: controller.categoryList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: LinearProgressIndicator(),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
