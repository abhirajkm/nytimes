class MediaMetadata {
  late String url;
  late String format;
  late int height;
  late int width;
  MediaMetadata.fromJson(Map<String, dynamic> json) :
    url = json['url'] ?? "",
    format = json['format'] ?? "",
    height = json['height'] ?? 0,
    width = json['width'] ?? 0;

  static List<MediaMetadata> convertToList(List<dynamic> list) {
    return list.map((e) => MediaMetadata.fromJson(e)).toList();
  }
  
}