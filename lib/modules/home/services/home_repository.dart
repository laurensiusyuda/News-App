import 'package:dio/dio.dart';
import 'package:dummy_project_1/common/utils/utility.dart';
import 'package:dummy_project_1/modules/home/models/home_model.dart';

class NewsRepository {
  final Dio dio = Dio();

  final String getTopHeadlinesUrl = "https://newsapi.org/v2/top-headlines";
  final String country = "us";

  Map<String, String> headers = {
    "X-Api-Key": "d28a07acee8e46679c4538ff24d9e5aa",
    'Accept': 'application/json',
  };

  Future<Progresssurvemodel?> getTopHeadlines() async {
    try {
      final response = await dio.get(
        getTopHeadlinesUrl,
        queryParameters: {
          'country': country,
        },
        options: Options(
          headers: headers,
        ),
      );
      cprint(response.data);
      return Progresssurvemodel.fromJson(response.data);
    } catch (e) {
      cprint(e.toString());
      throw Exception("Failed to load news: ${e.toString()}");
    }
  }
}
