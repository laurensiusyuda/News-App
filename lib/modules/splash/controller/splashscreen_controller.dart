import 'package:dummy_project_1/modules/splash/views/onboardscreen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.off(
          const OnBoardScreen(),
        );
      },
    );
  }
}
