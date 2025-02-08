import 'package:dummy_project_1/common/helper/datetimeformatter.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/modules/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article? articles = Get.arguments;
    final HomeController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          actions: [
            AnimatedScale(
              scale: controller.isBookmarked(articles!.title) ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                icon: Icon(
                  controller.isBookmarked(articles.title!)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: controller.isBookmarked(articles.title!)
                      ? Colors.red
                      : Colors.black,
                  size: 28,
                ),
                onPressed: () {
                  controller.toggleBookmarks(articles.title!);
                  HapticFeedback.lightImpact();
                  Get.defaultDialog(
                    title: articles.title!,
                    middleText: controller.isBookmarked(articles.title!)
                        ? 'Tambahkan Ke Favorite'
                        : 'Hapus Dari Favorite',
                    titleStyle: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    middleTextStyle: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          title: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'Detail News',
                style: GoogleFonts.nunito(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                DateHelper().formatDate(
                  DateTime.parse(
                    articles.publishedAt.toString(),
                  ),
                ),
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
