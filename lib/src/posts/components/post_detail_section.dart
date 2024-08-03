import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../core/utils/network_check.dart';
import '../../comments/comments.dart';
import '../posts.dart';

class PostDetailSection extends StatelessWidget {
  const PostDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return PageWrapper(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          showProfileBottomSheet(
            context: context,
            title: 'Add Comments',
          );
        },
        icon: const Icon(Icons.comment),
        label: const Text("Add Comments"),
      ),
      body: Column(
        children: [
          PostInfoSection(postInfo: postProvider.selectedPost),
          10.xGap,
          Expanded(child: const CommentScreen().paddingHorizontal(10.0)),
        ],
      ),
    );
  }
}

class AddCommentSection extends StatefulWidget {
  const AddCommentSection({super.key});

  @override
  State<AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends State<AddCommentSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: "");
  final _emailController = TextEditingController(text: "");
  final _commentController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.watch<CommentProvider>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            title: "Name",
            textEditingController: _nameController,
            validator: (value) => AppValidator.emptyValidation(value),
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
          ),
          AppTextFormField(
            title: "Email",
            textEditingController: _emailController,
            validator: (value) => AppValidator.emptyValidation(value),
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
          ),
          AppTextFormField(
            title: "Comment",
            maxLines: 4,
            textEditingController: _commentController,
            validator: (value) => AppValidator.emptyValidation(value),
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
          ),
          10.xGap,
          AppButton(
            label: "Confirm",
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await NetworkConnection.check(
                  isAvailable: () async {
                    NavigationService.pop();
                    await commentProvider.postCommentToRemote(
                      name: _nameController.text,
                      email: _emailController.text,
                      detail: _commentController.text,
                    );
                  },
                  noConnection: () {
                    "No internet Connection".errorToast();
                  },
                );
              }
            },
          ),
          20.xGap,
        ],
      ),
    );
  }
}

showProfileBottomSheet({
  required BuildContext context,
  required String title,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
    ),
    builder: (context) {
      return BottomSheetWrapper(
        title: title,
        child: const AddCommentSection(),
      );
    },
  );
}
