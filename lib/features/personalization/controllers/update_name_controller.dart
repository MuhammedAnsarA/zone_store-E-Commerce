import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone_store/data/repositories/user/user_repository.dart';
import 'package:zone_store/features/personalization/controllers/user_controller.dart';
import 'package:zone_store/features/personalization/screens/profile/profile.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/helpers/network_manager.dart';
import 'package:zone_store/utils/popups/full_screen_loader.dart';
import 'package:zone_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variable
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User Record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are updating your information...", TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first and last name in the firbase firestore
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      /// Update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show Successs message
      TLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated.");

      /// Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
