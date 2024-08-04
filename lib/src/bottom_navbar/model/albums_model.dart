class AlbumModel {
  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  final String userId;
  final String id;
  final String title;

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: (json["userId"] ?? 0).toString(),
      id: (json["id"] ?? 0).toString(),
      title: json["title"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

/*
[
	{
		"userId": 1,
		"id": 1,
		"title": "quidem molestiae enim"
	},
	{
		"userId": 1,
		"id": 2,
		"title": "sunt qui excepturi placeat culpa"
	},
	{
		"userId": 1,
		"id": 10,
		"title": "distinctio laborum qui"
	}
]*/