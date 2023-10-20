import 'package:flutter/cupertino.dart';
import 'package:nytimes/interfaces/news.dart';

import '../models/articles.dart';

class NewsProvider with ChangeNotifier {


  Future<List<Article>> fetchArticles() async {
    return await NewsInterface.fetchArticles();
  }
}
