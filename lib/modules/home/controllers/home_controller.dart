import 'package:dummy_project_1/common/utils/utility.dart';
import 'package:dummy_project_1/modules/home/models/home_model.dart';
import 'package:dummy_project_1/modules/home/services/home_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var newsData = Rx<Progresssurvemodel?>(null);
  var bookmarkedArticles = <String>[].obs;

  final NewsRepository newsRepository = NewsRepository();
  final String bookmarkkey = 'bookmarked_articles';

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
    getDataTopHeadlines();
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

  // menampilkan bookmark berita
  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = prefs.getStringList(bookmarkkey) ?? [];
    bookmarkedArticles.value = bookmarks;
  }

  // menyimpan bookmark berita
  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(bookmarkkey, bookmarkedArticles);
  }

  // toggle bookmarks berita
  Future<void> toggleBookmarks(String title) async {
    if (bookmarkedArticles.contains(title)) {
      bookmarkedArticles.remove(title);
    } else {
      bookmarkedArticles.add(title);
    }
    await saveBookmarks();
    await loadBookmarks();
  }

  bool isBookmarked(String title) {
    return bookmarkedArticles.contains(title);
  }

  // ! masih belum di pakai karena mempertimbangkan jika logout apakah perlu untuk clear bookmarks
  Future<void> clearBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(bookmarkkey);
    bookmarkedArticles.clear();
  }
}
