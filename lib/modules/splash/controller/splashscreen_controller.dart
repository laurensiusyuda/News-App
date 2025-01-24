import 'package:get/get.dart';
import 'package:dummy_project_1/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setOnBoard();
  }

  //  function set onboard
  Future<void> setOnBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnBoard = prefs.getBool('seenOnboard');
    if (seenOnBoard == null || seenOnBoard == false) {
      Get.offNamed(AppPages.onboardScreen);
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.offNamed(AppPages.loginScreen);
        },
      );
    }
  }

  // controller trigger function set oboard
  Future<void> completeOnBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboard', true);
    Get.offAllNamed(AppPages.loginScreen);
  }
}
