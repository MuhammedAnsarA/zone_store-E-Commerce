import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/appbar/app_bar.dart';
import 'package:zone_store/common/widgets/brands/brand_card.dart';
import 'package:zone_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaltSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
