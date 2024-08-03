import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/comments/comments.dart';
import '../src/posts/posts.dart';

class ProviderWrapper extends StatelessWidget {
  final Widget child;
  const ProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => CommentProvider()),
      ],
      child: child,
    );
  }
}
