import 'package:dummy_project_1/common/utils/utility.dart';
import 'package:dummy_project_1/modules/home/models/home_model.dart';
import 'package:dummy_project_1/modules/home/services/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var newsData = Rx<Progresssurvemodel?>(null);

  final NewsRepository newsRepository = NewsRepository();

  @override
  void onInit() {
    super.onInit();
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
}
