import 'package:dummy_project_1/common/constant/directory_assest.dart';
import 'package:dummy_project_1/modules/splash/controller/splashscreen_controller.dart';
import 'package:dummy_project_1/routes/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  @override
  State<OnBoardScreen> createState() => _OnBoardScrennState();
}

class _OnBoardScrennState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    SplashScreenController splashController = Get.put(SplashScreenController());
    return IntroductionScreen(
      key: GlobalKey<IntroductionScreenState>(),
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "Berita Terkini",
          body: "Dapatkan berita terbaru dan terupdate dari seluruh dunia.",
          image: SvgPicture.asset(
            height: 150,
            DirectoryAssets.splashlogo,
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: TextStyle(fontSize: 16.0),
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Kategori Berita",
          body:
              "Pilih kategori favorit Anda untuk mendapatkan berita yang paling relevan.",
          image: SvgPicture.asset(
            height: 150,
            DirectoryAssets.splashlogo,
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: TextStyle(fontSize: 16.0),
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
        ),
      ],
      onDone: () => {
        splashController.completeOnBoard(),
        Get.toNamed(AppPages.login),
      },
      onSkip: () => Get.toNamed(AppPages.login),
      showSkipButton: true,
      showBackButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Lewati',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      next: const Icon(
        color: Colors.black,
        Icons.arrow_forward,
      ),
      done: const Text(
        'Selesai',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        activeColor: Colors.black,
        size: Size(
          10.0,
          10.0,
        ),
        color: Colors.grey,
        activeSize: Size(
          22.0,
          10.0,
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
