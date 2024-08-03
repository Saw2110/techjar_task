import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import 'posts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return Visibility(
      visible: postProvider.isLoading,
      replacement: const PostView(),
      child: const LoadingWidget(),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();
    return ListView.builder(
      itemCount: postProvider.postList.length,
      itemBuilder: (BuildContext context, int index) {
        final postInfo = postProvider.postList[index];
        return PostInfoSection(postInfo: postInfo);
      },
    );
  }
}
