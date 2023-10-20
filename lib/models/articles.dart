import 'media.dart';
import 'package:date_format/date_format.dart' as DF;



class Article {
  late String uri;
  late String url;
  late int id;
  late int assetId;
  late String source;
  late String _publishedDate;
  late String updated;
  late String section;
  late String subsection;
  late String nytdsection;
  late String adxKeywords;
  late String byline;
  late String type;
  late String title;
  late String abstract;
  late List<String> desFacet;
  late List<String> orgFacet;
  late List<String> perFacet;
  late List<String> geoFacet;
  late List<Media> media;
  late int etaId;

  String get publishedDate {
    try {
      return formatDate(_publishedDate);
    } catch (err) {
      return "";
    }
  }

  Article.fromJson(Map<String, dynamic> json)
      : uri = json['uri'],
        url = json['url'],
        id = json['id'],
        assetId = json['asset_id'],
        source = json['source'],
        _publishedDate = json['published_date'],
        updated = json['updated'],
        section = json['section'],
        subsection = json['subsection'],
        nytdsection = json['nytdsection'],
        adxKeywords = json['adx_keywords'],
        byline = json['byline'],
        type = json['type'],
        title = json['title'],
        abstract = json['abstract'],
        desFacet = json['des_facet'].cast<String>(),
        orgFacet = json['org_facet'].cast<String>(),
        perFacet = json['per_facet'].cast<String>(),
        geoFacet = json['geo_facet'].cast<String>(),
        media=Media.convertToList(json["media"]??[]),
        etaId = json['eta_id'];

  static List<Article> convertToList(List<dynamic> list) {
    return list.map((e) => Article.fromJson(e)).toList();
  }
}


String formatDate(String dt) {
  try {

    if (dt.isEmpty) throw Error();
    final date = DateTime.parse(dt).toLocal();

    return DF.formatDate(date, [DF.yyyy, "/", DF.mm, "/", DF.dd]);
  } catch (err) {
    return "";
  }
}
