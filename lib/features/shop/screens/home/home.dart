import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:zone_store/common/widgets/layout/grid_layout.dart';
import 'package:zone_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:zone_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:zone_store/common/widgets/texts/section_heading.dart';
import 'package:zone_store/features/shop/controllers/product_controller.dart';
import 'package:zone_store/features/shop/screens/all_products/all_products.dart';
import 'package:zone_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:zone_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:zone_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Searchbar
                  TSearchContainer(
                    text: "Search in Store",
                    onTap: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Categories
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.defaltSpace),
                    child: Column(
                      children: [
                        /// Heading
                        TSectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaltSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Heading
                  TSectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Popular Products
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const TVerticalProductShimmer();
                      }

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                          child: Text(
                            "No Data Found!",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }
                      return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                            product: controller.featuredProducts[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
