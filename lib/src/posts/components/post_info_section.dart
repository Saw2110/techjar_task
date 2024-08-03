import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

import '../posts.dart';

class PostInfoSection extends StatelessWidget {
  final PostsModel postInfo;
  final void Function()? onTap;
  const PostInfoSection({super.key, required this.postInfo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(postInfo.title, style: context.kBoldSubTitleText),
            subtitle: Text(postInfo.body.removelineBreak()),
          ),
        ),
      ),
    );
  }
}
