import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 14,
        width: 14,
        margin: const EdgeInsets.only(left: 8),
        child: const CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
