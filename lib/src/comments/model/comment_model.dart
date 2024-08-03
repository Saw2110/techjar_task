class CommentModel {
  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json["postId"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      body: json["body"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

/*
[
	{
		"postId": 2,
		"id": 6,
		"name": "et fugit eligendi deleniti quidem qui sint nihil autem",
		"email": "Presley.Mueller@myrl.com",
		"body": "doloribus at sed quis culpa deserunt consectetur qui praesentium\naccusamus fugiat dicta\nvoluptatem rerum ut voluptate autem\nvoluptatem repellendus aspernatur dolorem in"
	},
	{
		"postId": 2,
		"id": 7,
		"name": "repellat consequatur praesentium vel minus molestias voluptatum",
		"email": "Dallas@ole.me",
		"body": "maiores sed dolores similique labore et inventore et\nquasi temporibus esse sunt id et\neos voluptatem aliquam\naliquid ratione corporis molestiae mollitia quia et magnam dolor"
	}
]*/