class MediaMetadata {
  late String url;
  late String format;
  late int height;
  late int width;
  MediaMetadata.fromJson(Map<String, dynamic> json) :
    url = json['url'] ?? "https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D",
    format = json['format'] ?? "",
    height = json['height'] ?? 0,
    width = json['width'] ?? 0;

  static List<MediaMetadata> convertToList(List<dynamic> list) {
    return list.map((e) => MediaMetadata.fromJson(e)).toList();
  }
  
}