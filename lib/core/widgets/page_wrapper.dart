import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final String appbarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool automaticallyImplyLeading;
  final bool canPop;
  final void Function(bool)? onPopInvoked;
  const PageWrapper({
    super.key,
    required this.appbarTitle,
    this.actions,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.automaticallyImplyLeading = true,
    this.canPop = true,
    this.onPopInvoked,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(appbarTitle),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
      ),
    );
  }
}
