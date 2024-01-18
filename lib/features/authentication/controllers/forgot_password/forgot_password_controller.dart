import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/data/repositories/authentication/authentication_repository.dart';
import 'package:zone_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/helpers/network_manager.dart';
import 'package:zone_store/utils/popups/full_screen_loader.dart';
import 'package:zone_store/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      // Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show Success Screen
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password".tr);

      /// Redirect
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      // Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show Success Screen
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset your Password".tr);
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
