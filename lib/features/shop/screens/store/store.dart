import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/common/widgets/appbar/app_bar.dart';
import 'package:zone_store/common/widgets/appbar/tabbar.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:zone_store/common/widgets/layout/grid_layout.dart';
import 'package:zone_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:zone_store/common/widgets/brands/brand_card.dart';
import 'package:zone_store/common/widgets/texts/section_heading.dart';
import 'package:zone_store/features/shop/controllers/category_controller.dart';
import 'package:zone_store/features/shop/screens/brand/all_brands.dart';
import 'package:zone_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/sizes.dart';
import 'package:zone_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// AppBar
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            TCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaltSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Featured Brands
                      TSectionHeading(
                        title: "Feature Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBrandCard(showBorder: true);
                        },
                      )
                    ],
                  ),
                ),
                bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => TCategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
