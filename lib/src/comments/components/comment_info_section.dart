import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

import '../comments.dart';

class CommentInfoSection extends StatelessWidget {
  final CommentModel commentInfo;
  final void Function()? onTap;
  const CommentInfoSection({super.key, required this.commentInfo, this.onTap});

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
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(commentInfo.name, style: context.kBoldSmallText),
                Text(commentInfo.email, style: context.kSmallText),
              ],
            ),
            subtitle: Text(
              commentInfo.body.removelineBreak(),
              textAlign: TextAlign.justify,
            ).paddingAll(5.0),
          ),
        ),
      ),
    );
  }
}
