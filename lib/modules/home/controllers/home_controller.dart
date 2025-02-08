import 'package:dummy_project_1/common/utils/utility.dart';
import 'package:dummy_project_1/modules/home/models/category_model.dart';
import 'package:dummy_project_1/modules/home/models/home_model.dart';
import 'package:dummy_project_1/modules/home/services/home_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var newsData = Rx<Progresssurvemodel?>(null);
  var newsCategoryData = Rx<CategoryModel?>(null);
  final smoothPageController = PageController();
  final currentPage = 0.obs;
  var selectedCategory = "".obs;

  final NewsRepository newsRepository = NewsRepository();

  var bookmarkedArticles = <String>[].obs;
  var bookmarkedArticlebyCategory = <String>[].obs;
  final String bookmarkkey = 'bookmarked_articles';
  final String bookmarkkeyCategory = 'bookmarked_articles_category';

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
    getDataTopHeadlines();
    getDataTopHeadlinesByCategory();
  }

  Future<void> getDataTopHeadlines() async {
    try {
      isLoading(true);
      final result = await newsRepository.getTopHeadlines();
      if (result != null) {
        newsData.value = result;
      }
      cprint(newsData.value);
    } catch (e) {
      cprint(e.toString());
      throw Exception("Failed to load news: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getDataTopHeadlinesByCategory(
      {String category = 'business'}) async {
    try {
      isLoading(true);
      final result = await newsRepository.getTopHeadlinesByCategory(category);
      if (result != null) {
        newsCategoryData.value = result;
      }
      cprint(newsData.value);
    } catch (e) {
      cprint(e.toString());
      throw Exception("Failed to load news: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  // menampilkan bookmark berita berdasarkan top headline (breaking news)
  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = prefs.getStringList(bookmarkkey) ?? [];
    bookmarkedArticles.value = bookmarks;
  }

  // menyimpan bookmark berita berdasarkan top headlines (breaking news)
  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(bookmarkkey, bookmarkedArticles);
  }

  // toggle bookmarks berita berdasarkan top headline (breaking news)
  Future<void> toggleBookmarks(String title) async {
    if (bookmarkedArticles.contains(title)) {
      bookmarkedArticles.remove(title);
    } else {
      bookmarkedArticles.add(title);
    }
    await saveBookmarks();
    await loadBookmarks();
  }

  // check apakah berita sudah di bookmark
  bool isBookmarked(String? title) {
    return bookmarkedArticles.contains(title);
  }

  // tampilkan berita berdasarkan kategori
  Future<void> loadBookmarksbyCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks =
        prefs.getStringList('${bookmarkkeyCategory}_$category') ?? [];
    bookmarkedArticlebyCategory.value = bookmarks;
  }

  // simpan berita berdasarkan kategori
  Future<void> saveBookmarksByCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        '${bookmarkkeyCategory}_$category', bookmarkedArticlebyCategory);
  }

  // togle bookmarks berdasarkan kategori

  Future<void> loadtoggleBookmarksbyCategory(
      String category, String title) async {
    if (bookmarkedArticlebyCategory.contains(title)) {
      bookmarkedArticlebyCategory.remove(title);
    } else {
      bookmarkedArticlebyCategory.add(title);
    }
    await saveBookmarksByCategory(category);
    await loadBookmarksbyCategory(category);
  }

  // check apakah sudah di bookmark atau belum
  bool isBookmarkedbyCategory(String? title) {
    return bookmarkedArticlebyCategory.contains(title);
  }

  // ! masih belum di pakai karena mempertimbangkan jika logout apakah perlu untuk clear bookmarks
  Future<void> clearBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(bookmarkkey);
    bookmarkedArticles.clear();
  }
}
