import 'package:flutter/material.dart';
import 'package:techjar_task/core/utils/network_check.dart';

import 'db/post_db.dart';
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

  late PostsModel _selectedPost = PostsModel.fromJson({});
  PostsModel get selectedPost => _selectedPost;
  set selectedPost(PostsModel value) {
    _selectedPost = value;
    notifyListeners();
  }

  init() async {
    await clean();
    isLoading = true;

    await NetworkConnection.check(
      isAvailable: getPostListFromRemote,
      noConnection: getPostListFromDB,
    );

    isLoading = false;
  }

  clean() async {
    _isLoading = false;

    _postList.clear();
    _selectedPost = PostsModel.fromJson({});
  }

  getPostListFromRemote() async {
    await PostAPI.getAllPosts().then((list) async {
      await insertIntoDatabase(list);
    });
    notifyListeners();
  }

  insertIntoDatabase(List<PostsModel> list) async {
    await PostsDatabase.instance.deleteData();
    for (var index in list) {
      await PostsDatabase.instance.insertData(index);
    }
    await getPostListFromDB();
    notifyListeners();
  }

  getPostListFromDB() async {
    postList = await PostsDatabase.instance.getPostList();
    notifyListeners();
  }
}
