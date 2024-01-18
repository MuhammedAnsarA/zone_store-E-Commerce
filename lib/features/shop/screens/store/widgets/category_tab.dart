import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/brands/brand_show_case.dart';
import 'package:zone_store/common/widgets/layout/grid_layout.dart';
import 'package:zone_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:zone_store/common/widgets/texts/section_heading.dart';
import 'package:zone_store/features/shop/models/category_model.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaltSpace),
          child: Column(
            children: [
              /// Brands
              const TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage8,
                ],
              ),
              const TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage8,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              TSectionHeading(
                title: "You might like",
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
