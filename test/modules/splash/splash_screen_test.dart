import 'package:dummy_project_1/modules/splash/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group(
    'SplashScreen Tests',
    () {
      testWidgets(
        'Memastikan warna latar belakang adalah putih',
        (WidgetTester tester) async {
          // Build SplashScreen widget
          await tester.pumpWidget(
            const GetMaterialApp(
              home: SplashScreen(),
            ),
          );

          // Cari container
          final containerFinder = find.byType(Container);
          final Container containerWidget = tester.widget(containerFinder);

          // Periksa warna latar belakang
          expect(containerWidget.color, Colors.white);
        },
      );

      testWidgets(
        'Memastikan logo SVG ditampilkan',
        (WidgetTester tester) async {
          // Build SplashScreen widget
          await tester.pumpWidget(
            const GetMaterialApp(
              home: SplashScreen(),
            ),
          );

          // Periksa apakah SvgPicture ada
          final svgPictureFinder = find.byType(SvgPicture);
          expect(svgPictureFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Memastikan ukuran logo sesuai',
        (WidgetTester tester) async {
          // Build SplashScreen widget
          await tester.pumpWidget(
            const GetMaterialApp(
              home: SplashScreen(),
            ),
          );

          // Periksa ukuran logo SVG
          final svgPictureFinder = find.byType(SvgPicture);
          final SvgPicture svgWidget = tester.widget(svgPictureFinder);

          expect(svgWidget.height, 150);
        },
      );
    },
  );
}
