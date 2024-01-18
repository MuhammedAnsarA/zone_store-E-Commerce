import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/common/widgets/appbar/app_bar.dart';
import 'package:zone_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:zone_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:zone_store/common/widgets/success_screen/success_screen.dart';
import 'package:zone_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:zone_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:zone_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:zone_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:zone_store/navigation_menu.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/constants/sizes.dart';
import 'package:zone_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Order Reviews",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaltSpace),
          child: Column(
            children: [
              /// Items in Cart
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Coupen Text Field
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaltSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  lottieImg: TImages.lottieSuccessfulPaymentIcon,
                  title: "Payment Success",
                  subTitle: "Your item will be shipped soon!",
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text("Checkout \$1024.0")),
      ),
    );
  }
}
