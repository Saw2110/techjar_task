import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWrapper extends StatelessWidget {
  final Widget child;
  const ProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: child,
    );
  }
}
