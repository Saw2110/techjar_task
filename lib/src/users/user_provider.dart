import 'package:flutter/material.dart';

import 'users.dart';

class UserProvider extends ChangeNotifier {
  UserProvider();

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

    isLoading = true;
    userList = await UserAPI.getAllUsers();
    isLoading = false;
  }

  clean() async {
    _isLoading = false;

    _userList.clear();
  }

  late List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;
  set userList(List<UserModel> value) {
    _userList = value;
    notifyListeners();
  }
}
