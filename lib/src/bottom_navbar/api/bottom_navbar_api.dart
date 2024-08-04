import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/posts/model/post_model.dart';

import '../bottom_navbar.dart';

class BottomNavbarApi {
  static Future<List<PostsModel>> getUsersPost(String userId) async {
    final String api = "${AppApi.getUsers}/$userId/posts";

    try {
      var json = await ApiService().getRequest(api);
      return json.map((item) => PostsModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<TodoModel>> getUsersTodos(String userId) async {
    final String api = "${AppApi.getUsers}/$userId/todos";

    try {
      var json = await ApiService().getRequest(api);
      return json.map((item) => TodoModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<AlbumModel>> getUsersAlbums(String userId) async {
    final String api = "${AppApi.getUsers}/$userId/albums";

    try {
      var json = await ApiService().getRequest(api);
      return json.map((item) => AlbumModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
