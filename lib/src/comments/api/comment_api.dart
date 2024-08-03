import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

import '../../../core/utils/snack_bar.dart';
import '../comments.dart';

class CommentAPI {
  static Future<List<CommentModel>> getCommentAccordingToPost({
    required String postId,
  }) async {
    final String api = "${AppApi.getAllPost}/$postId/${AppApi.getComments}";

    try {
      var json = await ApiService().getRequest(api);

      return json.map((item) => CommentModel.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> postCommentAccordingToPost({
    required String postId,
    required String name,
    required String email,
    required String detail,
  }) async {
    final String api = "${AppApi.getAllPost}/${AppApi.getComments}";
    var body = jsonEncode({
      "postId": postId,
      "name": name,
      "email": email,
      "body": detail,
    });

    try {
      var json = await ApiService().postRequest(api, body);
      debugPrint("JSON $json");

      ShowSnackbar.successSnack("Post Successfully");

      // return json.map((item) => CommentModel.fromJson(item)).toList();
    } catch (e) {
      // return [];
      ShowSnackbar.failureSnack("$e");
      debugPrint("ERROR $e");
    }
  }
}
