import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  runApp(
    const ProviderWrapper(
      child: MainApp(),
    ),
  );
}
