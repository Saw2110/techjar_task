class PhotoModel {
  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json["albumId"] ?? 0,
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      url: json["url"] ?? "",
      thumbnailUrl: json["thumbnailUrl"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
