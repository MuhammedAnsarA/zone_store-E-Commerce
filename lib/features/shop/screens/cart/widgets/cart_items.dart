import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:zone_store/common/widgets/products/cart/cart_item.dart';
import 'package:zone_store/common/widgets/texts/product_title_text.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) {
        return Column(
          children: [
            /// Cart Item
            const TCartItem(),
            if (showAddRemoveButton)
              const SizedBox(height: TSizes.spaceBtwItems),
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// Extra Space
                      SizedBox(width: 70),

                      /// Add Remove Button
                      TProductQuantityWithAddRemove(),
                    ],
                  ),

                  /// Product Total Price
                  TProductTitleText(title: "\$256")
                ],
              ),
          ],
        );
      },
    );
  }
}
