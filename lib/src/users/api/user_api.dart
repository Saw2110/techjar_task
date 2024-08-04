import 'package:techjar_task/core/core.dart';

import '../model/user_model.dart';

class UserAPI {
  static Future<List<UserModel>> getAllUsers() async {
    final String api = AppApi.getUsers;

    try {
      var json = await ApiService().getRequest(api);
      return json.map((item) => UserModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
