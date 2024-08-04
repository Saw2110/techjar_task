import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../posts/posts.dart';
import 'bottom_navbar.dart';

final _screens = <Widget>[
  const PostScreen(),
  const ToDosSection(),
  const AlbumSection(),
];

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BottomNavBarProvider>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = context.watch<BottomNavBarProvider>();
    return PageWrapper(
      appbarTitle: bottomNavBarProvider.currentIndex == 0
          ? "Posts"
          : bottomNavBarProvider.currentIndex == 1
              ? "ToDos"
              : "Albums",
      body: _screens[bottomNavBarProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarProvider.currentIndex,
        onTap: (index) {
          bottomNavBarProvider.currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: 'Albums',
          ),
        ],
      ),
    );
  }
}
