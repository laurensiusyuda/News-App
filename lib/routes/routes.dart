part of 'pages.dart';

class AppRoutes {
  static const initial = AppPages.splashScreen;

  static final pages = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: _Paths.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: _Paths.registerScreen,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: _Paths.onboardScreen,
      page: () => const OnBoardScreen(),
    ),
    GetPage(
      name: _Paths.emailverifyScreen,
      page: () => const CheckEmailVerifSceen(),
    ),
    GetPage(
      name: _Paths.forgotpasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: _Paths.bookmarkScreen,
      page: () => const BookMarksScreen(),
    ),
    GetPage(
      name: _Paths.detailScreen,
      page: () => const DetailScreen(),
    )
  ];
}
