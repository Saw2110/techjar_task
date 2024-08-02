import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techjar_task/core/widgets/page_wrapper.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(
      canPop: false,
      appbarTitle: "INDEX",
      automaticallyImplyLeading: false,
      body: SizedBox.shrink(),
    );
  }
}
