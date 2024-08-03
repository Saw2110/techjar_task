import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/src/comments/comments.dart';
import 'package:techjar_task/src/posts/posts.dart';

class CommentProvider extends ChangeNotifier {
  CommentProvider();

  late BuildContext _context;
  BuildContext get context => _context;
  late final NavigatorState navigator = Navigator.of(_context);
  set context(BuildContext value) {
    _context = value;

    ///
    init();
  }

  late bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  late List<CommentModel> _commentList = [];
  List<CommentModel> get commentList => _commentList;
  set commentList(List<CommentModel> value) {
    _commentList = value;
    notifyListeners();
  }

  late final PostProvider postProvider;
  initProvider() {
    postProvider = context.read<PostProvider>();
  }

  init() async {
    await initProvider();

    await clean();

    isLoading = true;
    commentList = await CommentAPI.getCommentAccordingToPost(
      postId: "${postProvider.selectedPost.id}",
    );
    isLoading = false;
  }

  clean() async {
    _isLoading = false;

    _commentList.clear();
  }

  postComment({
    required String name,
    required String email,
    required String detail,
  }) async {
    await CommentAPI.postCommentAccordingToPost(
      postId: "${postProvider.selectedPost.id}",
      name: name,
      email: email,
      detail: detail,
    );

    commentList = await CommentAPI.getCommentAccordingToPost(
      postId: "${postProvider.selectedPost.id}",
    );
  }
}
