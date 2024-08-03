import 'package:techjar_task/core/core.dart';

import '../posts.dart';

class PostAPI {
  static Future<List<PostsModel>> getAllPosts() async {
    final String api = AppApi.getAllPost;

    try {
      var json = await ApiService().getRequest(api);

      return json.map((item) => PostsModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
