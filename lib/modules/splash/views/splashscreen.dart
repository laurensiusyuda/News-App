import 'package:dummy_project_1/common/constant/directory_assest.dart';
import 'package:dummy_project_1/modules/splash/controller/splashscreen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: SvgPicture.asset(
            height: 150,
            DirectoryAssets.splashlogo,
          ),
        ),
      ),
    );
  }
}
