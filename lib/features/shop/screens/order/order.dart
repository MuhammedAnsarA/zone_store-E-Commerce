import 'package:flutter/material.dart';
import 'package:zone_store/common/widgets/appbar/app_bar.dart';
import 'package:zone_store/features/shop/screens/order/widgets/order_list.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: TAppBar(
        title:
            Text("My Orders", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaltSpace),

        /// Orders
        child: TOrderListItems(),
      ),
    );
  }
}
