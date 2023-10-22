import 'package:flutter/foundation.dart';
import 'package:nytimes/utils/api/keys.dart';

import '../models/articles.dart';
import '../utils/api/api_interface.dart';
import '../utils/api/api_method.dart';

class NewsInterface{
   Future<List<Article>> fetchArticles() async {
    try {
      final response = await ApiInterface.send(
        apiMethod: ApiMethod.GET,
        route: "mostviewed/all-sections/7.json?api-key=$apiKey",
      );

      return  Article.convertToList(response["results"] ?? []);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return [];
    }
  }
}