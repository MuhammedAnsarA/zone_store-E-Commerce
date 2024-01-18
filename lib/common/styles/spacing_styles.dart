import 'package:flutter/material.dart';
import 'package:zone_store/utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaltSpace,
    bottom: TSizes.defaltSpace,
    right: TSizes.defaltSpace,
  );
}
