import 'package:flutter/material.dart';

import 'posts.dart';

class PostProvider extends ChangeNotifier {
  PostProvider();

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

  late List<PostsModel> _postList = [];
  List<PostsModel> get postList => _postList;
  set postList(List<PostsModel> value) {
    _postList = value;
    notifyListeners();
  }

  init() async {
    await clean();

    isLoading = true;
    postList = await PostAPI.getAllPosts();
    isLoading = false;
  }

  clean() async {
    _isLoading = false;
  }
}
