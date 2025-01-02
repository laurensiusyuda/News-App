import 'package:dummy_project_1/modules/splash/controller/splashscreen_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SplashScreenController controller;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    Get.testMode = true;
    controller = SplashScreenController();
  });

  tearDown(() {
    Get.reset();
  });

  group('SplashScreenController Tests -', () {
    test('seenOnboard bernilai null atau false, navigasi ke onboard', () async {
      // Arrange
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seenOnboard', false);

      // Act
      await controller.setOnBoard();
    });

    test('seenOnboard bernilai true, navigasi ke login setelah delay',
        () async {
      // Arrange
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('seenOnboard', true);

      // Act
      await controller.setOnBoard();
      await Future.delayed(const Duration(seconds: 3));
    });

    test('completeOnBoard mengatur seenOnboard menjadi true', () async {
      // Act
      await controller.completeOnBoard();

      // Assert
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('seenOnboard'), true);
    });

    test('onInit memanggil setOnBoard', () async {
      // Act
      controller.onInit();
      await Future.delayed(const Duration(milliseconds: 100));
    });
  });
}
