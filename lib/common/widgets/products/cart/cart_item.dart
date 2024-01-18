import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/images/t_rounded_images.dart';
import 'package:zone_store/common/widgets/texts/product_title_text.dart';
import 'package:zone_store/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/constants/sizes.dart';
import 'package:zone_store/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Price & Size
        Builder(builder: (context) {
          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleWithVerifiedIcon(title: "Nike"),
                const Flexible(
                  child: TProductTitleText(
                      title: "Black Sports shoes", maxLines: 1),
                ),

                /// Attributes
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Color ",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: "Green ",
                          style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(
                          text: "Size ",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: "UK 08 ",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
