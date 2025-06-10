import 'package:dio/dio.dart';
import 'package:news_app/Data/article_data.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleData>> getTopHeadline({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=c253462d09f84bcc8dbe8c8f3e2772f8&country=us&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleData> articleList = [];

      for (var article in articles) {
        ArticleData articleData = ArticleData.fromJson(article);
        articleList.add(articleData);
        //print(articleList);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
