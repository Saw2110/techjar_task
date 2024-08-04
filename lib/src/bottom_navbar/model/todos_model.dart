class TodoModel {
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  final String userId;
  final String id;
  final String title;
  final bool completed;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: (json["userId"] ?? 0).toString(),
      id: (json["id"] ?? 0).toString(),
      title: json["title"] ?? "",
      completed: json["completed"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

/*
[
	{
		"userId": 1,
		"id": 1,
		"title": "delectus aut autem",
		"completed": false
	},
	{
		"userId": 1,
		"id": 2,
		"title": "quis ut nam facilis et officia qui",
		"completed": false
	},
	{
		"userId": 1,
		"id": 3,
		"title": "fugiat veniam minus",
		"completed": false
	}
]*/