import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/photos/model/photo_model.dart';

class PhotoAPI {
  static Future<List<PhotoModel>> getPhotosByAlbumId(String albumId) async {
    final String api = "${AppApi.baseUrl}/albums/$albumId/photos";

    try {
      var json = await ApiService().getRequest(api);
      return json.map((item) => PhotoModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
