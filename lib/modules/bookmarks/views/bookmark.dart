import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/widget/card.dart';
import 'package:dummy_project_1/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Bookmarks",
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: Obx(
          () {
            if (controller.newsData.value?.articles == null) {
              return const Center();
            }

            final bookmarkedArticles = controller.newsData.value!.articles!
                .where((article) =>
                    controller.bookmarkedArticles.contains(article.title))
                .toList();

            return ListView.builder(
              itemCount: bookmarkedArticles.length,
              itemBuilder: (context, index) {
                final article = bookmarkedArticles[index];
                return ListCardWidget(
                  urlImage: '${article.urlToImage}',
                  title: '${article.title}',
                  description: '${article.description}',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
