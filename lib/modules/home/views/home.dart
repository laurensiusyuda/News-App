import 'package:dummy_project_1/common/helper/categorynews.dart';
import 'package:dummy_project_1/common/helper/datetimeformatter.dart';
import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/routes/pages.dart';
import 'package:dummy_project_1/modules/home/widgets/card.dart';
import 'package:dummy_project_1/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controllerHome = Get.put(HomeController());
    final AuthController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: Border.all(
            width: 0.5,
            color: Colors.black,
          ),
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Today News',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${DateHelper().getFormattedDay(DateTime.now())}, ${DateHelper().formatDate(DateTime.now())}',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.onlogout();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: Obx(
          () {
            if (controllerHome.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controllerHome.newsData.value?.articles == null) {
              return Center(
                child: Text(
                  'No news available',
                  style: GoogleFonts.nunito(
                    textStyle: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                await controllerHome.getDataTopHeadlines();
                await controllerHome.getDataTopHeadlinesByCategory();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Category News Choice
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
                                selected: false,
                                onSelected: (bool selected) {
                                  if (selected) {
                                    controllerHome.selectedCategory.value =
                                        category.toString().toLowerCase();
                                    controllerHome
                                        .getDataTopHeadlinesByCategory(
                                      category:
                                          category.toString().toLowerCase(),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Category News
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PageView.builder(
                                controller: controllerHome.smoothPageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index) {
                                  controllerHome.currentPage.value = index;
                                },
                                itemCount: controllerHome
                                        .newsCategoryData.value?.articles
                                        ?.where((article) =>
                                            article.urlToImage != null &&
                                            article.description != null)
                                        .length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final filteredArticlesCategory =
                                      controllerHome
                                          .newsCategoryData.value?.articles!
                                          .where((article) =>
                                              article.urlToImage != null)
                                          .toList();

                                  if (filteredArticlesCategory == null ||
                                      filteredArticlesCategory.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  final article =
                                      filteredArticlesCategory[index];
                                  return CardWidgetbyCategory(
                                    onPressed: () {},
                                    title: '${article.title}',
                                    description: '${article.description}',
                                    publishAt: '${article.publishedAt}',
                                    urlToImage: '${article.urlToImage}',
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmoothPageIndicator(
                              controller: controllerHome.smoothPageController,
                              count: controllerHome
                                      .newsCategoryData.value?.articles
                                      ?.where((article) =>
                                          article.urlToImage != null)
                                      .length ??
                                  0,
                              effect: const JumpingDotEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                spacing: 5.0,
                                verticalOffset: 0.0,
                                dotColor: Colors.grey,
                                activeDotColor: Colors.black,
                                jumpScale: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),

                    // Dot Category News
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trending News',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'See All',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Trending News
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controllerHome.newsData.value?.articles
                              ?.where((article) => article.urlToImage != null)
                              .length ??
                          0,
                      itemBuilder: (context, index) {
                        final filteredArticlesTopHeadlines = controllerHome
                            .newsData.value?.articles!
                            .where((article) =>
                                article.urlToImage != null &&
                                article.description != null)
                            .toList();

                        if (filteredArticlesTopHeadlines == null ||
                            filteredArticlesTopHeadlines.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        final article = filteredArticlesTopHeadlines[index];

                        return SizedBox(
                          child: ListCardWidgetbyTopHeadlines(
                            onPressed: () {
                              Get.toNamed(
                                AppPages.detailScreen,
                                arguments: article,
                              );
                            },
                            urlImage: '${article.urlToImage}',
                            title: '${article.title}',
                            description: '${article.description}',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
