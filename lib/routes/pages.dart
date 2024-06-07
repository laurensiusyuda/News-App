import 'package:dummy_project_1/modules/auth/views/loginscreen.dart';
import 'package:dummy_project_1/modules/home/views/home.dart';
import 'package:dummy_project_1/modules/splash/views/splashscreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class _Paths {
  static const splashscreen = '/splashscreen';
  static const home = '/home';
  static const login = '/login';
}

class AppPages {
  static const splashscreen = _Paths.splashscreen;
  static const home = _Paths.home;
  static const login = _Paths.login;
}
