import 'package:flutter/material.dart';
import 'package:zone_store/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:zone_store/utils/constants/sizes.dart';
import 'package:zone_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaltSpace,
      child: TextButton(
        onPressed: () {
          controller.skipPage();
        },
        child: const Text("Skip"),
      ),
    );
  }
}
