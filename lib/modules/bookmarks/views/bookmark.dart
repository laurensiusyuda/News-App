import 'package:dummy_project_1/common/helper/categorynews.dart';
import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/modules/home/widgets/card.dart';
import 'package:dummy_project_1/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final AuthController authController = Get.find<AuthController>();
    final String arguments = Get.arguments ?? 'trending_news';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: Border.all(
            width: 0.5,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            arguments == 'trending_news'
                ? "Trending Bookmarks News"
                : "Category Bookmarks News",
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () => authController.onlogout(),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: RefreshIndicator(
          onRefresh: () async {
            if (arguments == 'trending_news') {
              await controller.loadBookmarks();
            } else {
              await controller.loadBookmarksbyCategory(
                controller.selectedCategory.value.isEmpty
                    ? 'business'
                    : controller.selectedCategory.value,
              );
            }
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (arguments != 'trending_news')
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CategoryNews().categoryNews.length,
                        itemBuilder: (context, index) {
                          final category = CategoryNews().categoryNews[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ChoiceChip(
                              label: Text(category.toString()),
                              selected:
                                  controller.selectedCategory.value == category,
                              onSelected: (bool selected) {
                                if (selected) {
                                  controller.selectedCategory.value = category!;
                                  controller.loadBookmarksbyCategory(category);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                buildBookmarkList(arguments),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBookmarkList(String data) {
    final HomeController controller = Get.find<HomeController>();

    if (data == 'trending_news') {
      return Obx(() {
        if (controller.newsData.value == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final bookmarkedArticles = controller.newsData.value!.articles
                ?.where((article) =>
                    article.title != null &&
                    controller.bookmarkedArticles.contains(article.title))
                .toList() ??
            [];

        if (bookmarkedArticles.isEmpty) {
          return SizedBox(
            height: MediaQuery.of(Get.context!).size.height * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No bookmarked articles found',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookmarkedArticles.length,
          itemBuilder: (context, index) {
            final article = bookmarkedArticles[index];
            return ListCardWidgetbyTopHeadlines(
              urlImage: article.urlToImage ?? '',
              title: article.title ?? '',
              description: article.description ?? '',
            );
          },
        );
      });
    } else {
      return Obx(() {
        if (controller.newsCategoryData.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final bookmarkedArticlesByCategory = controller
                .newsCategoryData.value!.articles
                ?.where((article) =>
                    article.title != null &&
                    controller.bookmarkedArticlebyCategory
                        .contains(article.title))
                .toList() ??
            [];

        if (bookmarkedArticlesByCategory.isEmpty) {
          return SizedBox(
            height: MediaQuery.of(Get.context!).size.height * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No bookmarked articles found in this category',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookmarkedArticlesByCategory.length,
          itemBuilder: (context, index) {
            final article = bookmarkedArticlesByCategory[index];
            return ListCardWidgetbyTopHeadlines(
              urlImage: article.urlToImage ?? '',
              title: article.title ?? '',
              description: article.description ?? '',
            );
          },
        );
      });
    }
  }
}
