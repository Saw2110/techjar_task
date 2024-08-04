import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/posts/posts.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      canPop: false,
      appbarTitle: "INDEX",
      automaticallyImplyLeading: false,
      body: const PostScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          NavigationService.pushNamed(AppRoute.userScreen);
        },
        icon: const Icon(Icons.group),
        label: const Text("Users Lists"),
      ),
    );
  }
}
