import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zone_store/data/repositories/authentication/authentication_repository.dart';
import 'package:zone_store/features/personalization/controllers/user_controller.dart';
import 'package:zone_store/utils/constants/image_strings.dart';
import 'package:zone_store/utils/helpers/network_manager.dart';
import 'package:zone_store/utils/popups/full_screen_loader.dart';
import 'package:zone_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variable
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // @override
  // void onInit() {
  //   email.text = localStorage.read("REMEMBER_ME_EMAIL");
  //   // password.text = localStorage.read("REMEMBER_ME_PASSWORD");
  //   super.onInit();
  // }

  /// [EmailAndPassword] - Sign In
  Future<void> emailAndPasswordSignIn() async {
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
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // /// Remember Me Check
      // if (rememberMe.value) {
      //   localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
      //   // localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      // }

      /// login user using Email & Password Authentication
      // final userCredential =
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// [GoogleAuthentication] - Sign In
  Future<void> googleSignIn() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Logging you in", TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      /// Save user record
      await userController.saveUserRecord(userCredentials);

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      /// Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
