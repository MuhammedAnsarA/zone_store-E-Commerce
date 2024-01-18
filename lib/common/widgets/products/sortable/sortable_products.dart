import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zone_store/common/widgets/layout/grid_layout.dart';
import 'package:zone_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:zone_store/features/shop/controllers/product_controller.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items: const [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Products
        TGridLayout(
          itemCount: 6,
          itemBuilder: (_, index) =>
              TProductCardVertical(product: controller.featuredProducts[index]),
        )
      ],
    );
  }
}
