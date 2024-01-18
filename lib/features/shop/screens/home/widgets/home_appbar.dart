import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/common/widgets/appbar/app_bar.dart';
import 'package:zone_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:zone_store/features/personalization/controllers/user_controller.dart';
import 'package:zone_store/common/widgets/shimmers/shimmer.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                /// Display Shimmer loader while user profile is being loaded
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: const [
        TCartCounterIcon(
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
