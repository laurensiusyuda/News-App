import 'package:dummy_project_1/modules/auth/views/checkemailverifyscreen.dart';
import 'package:dummy_project_1/modules/auth/views/forgotpasswordscreen.dart';
import 'package:dummy_project_1/modules/auth/views/loginscreen.dart';
import 'package:dummy_project_1/modules/auth/views/registerscreen.dart';
import 'package:dummy_project_1/modules/bookmarks/views/bookmark.dart';
import 'package:dummy_project_1/modules/detail/views/detail.dart';
import 'package:dummy_project_1/modules/home/views/home.dart';
import 'package:dummy_project_1/modules/splash/views/onboardscreen.dart';
import 'package:dummy_project_1/modules/splash/views/splashscreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class _Paths {
  static const splashScreen = '/splashscreen';
  static const homeScreen = '/home';
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  static const onboardScreen = '/onboard';
  static const emailverifyScreen = '/emailverify';
  static const forgotpasswordScreen = '/forgotpassword';
  static const bookmarkScreen = '/bookmarks';
  static const detailScreen = '/detailPage';
}

class AppPages {
  static const splashScreen = _Paths.splashScreen;
  static const homeScreen = _Paths.homeScreen;
  static const loginScreen = _Paths.loginScreen;
  static const registerScreen = _Paths.registerScreen;
  static const onboardScreen = _Paths.onboardScreen;
  static const emailverifyScreen = _Paths.emailverifyScreen;
  static const forgotpasswordScreen = _Paths.forgotpasswordScreen;
  static const bookmarkScreen = _Paths.bookmarkScreen;
  static const detailScreen = _Paths.detailScreen;
}
