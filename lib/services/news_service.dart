import 'package:dio/dio.dart';
import 'package:newsapp/models/articles_model.dart';

class NewsService {
  final Dio dio = Dio();
  NewsService();
  Future<List<ArticleModel>> getTopHeadLines({required String q}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/everything?q=$q&apiKey=69851ef306c249e3a13869aa71be3724');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
