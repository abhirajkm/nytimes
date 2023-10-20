import 'package:nytimes/models/articles.dart';

class News {
  late String status;
  late String copyright;
  late int numResults;
  late List<Article> results;

  News.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        copyright = json['copyright'],
        numResults = json['num_results'],
        results=Article.convertToList(json["results"] ?? []);


  static List<News> convertToList(List<dynamic> list) {
    return list.map((e) => News.fromJson(e)).toList();
  }
}
