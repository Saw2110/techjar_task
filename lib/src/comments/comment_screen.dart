import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/src/comments/comments.dart';

import '../../core/core.dart';
import 'components/comment_info_section.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommentProvider>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.watch<CommentProvider>();

    return Visibility(
      visible: commentProvider.isLoading,
      replacement: Column(
        children: [
          if (commentProvider.commentList.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Replies", style: context.kBoldTitleText),
                _textWithIcon(
                  context,
                  lable: "View Activity",
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ).paddingHorizontal(10.0),
          5.xGap,
          const Flexible(child: CommentView()),
        ],
      ),
      child: const LoadingWidget(),
    );
  }

  Widget _textWithIcon(
    BuildContext context, {
    required String lable,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "View Activity",
          style: context.kNormalText.copyWith(
            color: AppColors.midGrey,
          ),
        ),
        Icon(
          icon,
          size: 15.0,
          color: AppColors.midGrey.withOpacity(.5),
        ),
      ],
    );
  }
}

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.watch<CommentProvider>();
    return commentProvider.commentList.isNotEmpty
        ? ListView.builder(
            itemCount: commentProvider.commentList.length,
            itemBuilder: (BuildContext context, int index) {
              final commentInfo = commentProvider.commentList[index];
              return CommentInfoSection(
                onTap: () async {
                  await CommentAPI.postCommentAccordingToPost(
                    postId: "1",
                    name: "name",
                    email: "email",
                    detail: "detail",
                  );
                },
                commentInfo: commentInfo,
              );
            },
          )
        : const Text("No comment on this post");
  }
}
