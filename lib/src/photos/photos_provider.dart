import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/src/bottom_navbar/bottom_navbar_provider.dart';

import 'photos.dart';

class PhotosProvider extends ChangeNotifier {
  PhotosProvider();

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

  late List<PhotoModel> _photoList = [];
  List<PhotoModel> get photoList => _photoList;
  set photoList(List<PhotoModel> value) {
    _photoList = value;
    notifyListeners();
  }

  init() async {
    String albumId = context.read<BottomNavBarProvider>().selectedAlbum.id;
    await clean();
    isLoading = true;
    photoList = await PhotoAPI.getPhotosByAlbumId(albumId);
    isLoading = false;
  }

  clean() async {
    _isLoading = false;
  }
}
