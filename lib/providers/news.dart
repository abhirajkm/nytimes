import 'package:flutter/cupertino.dart';
import 'package:nytimes/interfaces/news.dart';

import '../models/articles.dart';

class NewsProvider with ChangeNotifier {
   final NewsInterface newsInterface;
   NewsProvider(this.newsInterface );


  List<Article> articles = [];

  Future<List<Article>> fetchArticles() async {
    articles = await newsInterface.fetchArticles();

    articles.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));
    notifyListeners();
    return articles;
  }
}
