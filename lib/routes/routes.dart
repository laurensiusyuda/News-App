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
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: _Paths.onboard,
      page: () => const OnBoardScreen(),
    ),
    GetPage(
      name: _Paths.emailverify,
      page: () => const CheckEmailVerifSceen(),
    ),
    GetPage(
      name: _Paths.forgotpassword,
      page: () => const ForgotPasswordScreen(),
    )
  ];
}
