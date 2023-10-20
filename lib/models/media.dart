import 'media_metadata.dart';

class Media {
  late String type;
  late String subtype;
  late String caption;
  late String copyright;
  late int approvedForSyndication;
  late List<MediaMetadata> mediaMetadata;

  Media.fromJson(Map<String, dynamic> json):
        type = json['type'] ?? "",
  subtype = json['subtype'] ?? "",
  caption = json['caption'] ?? "",
  copyright = json['copyright'] ?? "",
  approvedForSyndication = json['approved_for_syndication']??0,
  mediaMetadata=MediaMetadata.convertToList(json["media-metadata"]??[]);

  static List<Media> convertToList(List<dynamic> list) {
    return list.map((e) => Media.fromJson(e)).toList();
  }
}