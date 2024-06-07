part of 'pages.dart';

class AppRoutes {
  static const initial = AppPages.splashscreen;

  static final pages = [
    GetPage(
      name: _Paths.splashscreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
    ),
  ];
}
