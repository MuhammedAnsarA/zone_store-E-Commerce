import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:zone_store/common/widgets/images/t_rounded_images.dart';
import 'package:zone_store/common/widgets/shimmers/shimmer.dart';
import 'package:zone_store/features/shop/controllers/banner_controller.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TShimmerEffect(width: double.infinity, height: 210);
        }
        if (controller.banners.isEmpty) {
          return Center(
              child: Text(
            "No Data Found!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ));
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: controller.banners
                    .map((banner) => TRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 5,
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
