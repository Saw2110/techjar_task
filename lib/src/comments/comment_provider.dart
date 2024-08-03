import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/src/comments/comments.dart';
import 'package:techjar_task/src/posts/posts.dart';

import '../../core/utils/network_check.dart';
import 'db/comment_db.dart';

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

  PostProvider? _postProvider;
  PostProvider get postProvider => _postProvider!;
  set postProvider(PostProvider value) {
    _postProvider = value;
  }

  initProvider() {
    if (_postProvider == null) {
      _postProvider = Provider.of<PostProvider>(context, listen: false);
      notifyListeners();
    }
  }

  init() async {
    await initProvider();

    await clean();
    isLoading = true;

    await NetworkConnection.check(
      isAvailable: getCommentListFromRemote,
      noConnection: getCommentListFromDB,
    );

    isLoading = false;
  }

  clean() async {
    _isLoading = false;

    _commentList.clear();
  }

  getCommentListFromRemote() async {
    await CommentAPI.getCommentAccordingToPost(
      postId: postProvider.selectedPost.id,
    ).then((list) async {
      await insertIntoDatabase(list);
    });
    notifyListeners();
  }

  insertIntoDatabase(List<CommentModel> list) async {
    await CommentDatabase.instance.deleteDataAccordingToPost(
      postId: postProvider.selectedPost.id,
    );
    for (var index in list) {
      await CommentDatabase.instance.insertData(index);
    }
    await getCommentListFromDB();
    notifyListeners();
  }

  getCommentListFromDB() async {
    commentList = await CommentDatabase.instance.getCommentsAccordingToPost(
      postid: postProvider.selectedPost.id,
    );
    notifyListeners();
  }

  postCommentToRemote({
    required String name,
    required String email,
    required String detail,
  }) async {
    await CommentAPI.postCommentAccordingToPost(
      postId: postProvider.selectedPost.id,
      name: name,
      email: email,
      detail: detail,
    );
  }
}
