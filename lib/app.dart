import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zone_store/bindings/general_bindings.dart';
import 'package:zone_store/routes/app_routes.dart';
import 'package:zone_store/utils/constants/colors.dart';
import 'package:zone_store/utils/constants/text_strings.dart';
import 'package:zone_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
      // home: const OnBoardingScreen(),
    );
  }
}
