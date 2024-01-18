// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'package:zone_store/common/widgets/texts/section_heading.dart';
import 'package:zone_store/features/shop/models/product_model.dart';
import 'package:zone_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:zone_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:zone_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:zone_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:zone_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:zone_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const TProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaltSpace,
                left: TSizes.defaltSpace,
                bottom: TSizes.defaltSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share
                  const TRatingAndShare(),

                  /// Price , Title , Stack, & Brand
                  const TProductMetaData(),

                  /// Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Checkout"),
                    ),
                  ),

                  /// Reviews
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const TSectionHeading(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    "This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am not intrested",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
