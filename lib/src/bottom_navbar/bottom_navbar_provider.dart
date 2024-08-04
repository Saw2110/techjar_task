import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/src/users/users.dart';

import '../posts/posts.dart';
import 'bottom_navbar.dart';

class BottomNavBarProvider extends ChangeNotifier {
  BottomNavBarProvider();

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

  init() async {
    await clean();
    await getAllNeededData();
  }

  clean() async {
    _isLoading = false;
    _currentIndex = 0;
  }

  late int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  late List<PostsModel> _postList = [];
  List<PostsModel> get postList => _postList;
  set postList(List<PostsModel> value) {
    _postList = value;
    notifyListeners();
  }

  late List<TodoModel> _todoList = [];
  List<TodoModel> get todoList => _todoList;
  set todoList(List<TodoModel> value) {
    _todoList = value;
    notifyListeners();
  }

  late List<AlbumModel> _albumList = [];
  List<AlbumModel> get albumList => _albumList;
  set albumList(List<AlbumModel> value) {
    _albumList = value;
    notifyListeners();
  }

  getAllNeededData() async {
    String userId = context.read<UserProvider>().selectedUser.id;
    isLoading = true;
    await Future.wait([
      BottomNavbarApi.getUsersPost(userId).then((value) => postList = value),
      BottomNavbarApi.getUsersTodos(userId).then((value) => todoList = value),
      BottomNavbarApi.getUsersAlbums(userId).then((value) => albumList = value),
    ]);
    isLoading = false;

    notifyListeners();
  }
}
