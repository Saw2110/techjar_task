import 'package:flutter/material.dart';

extension ThemeDataX on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get kTitleText => const TextStyle(fontSize: 16.0);
  TextStyle get kBoldTitleText => kTitleText.copyWith(
        fontWeight: FontWeight.bold,
      );

  ///
  TextStyle get kSubTitleText => const TextStyle(fontSize: 16.0);
  TextStyle get kBoldSubTitleText => kSubTitleText.copyWith(
        fontWeight: FontWeight.bold,
      );

  ///
  TextStyle get kNormalText => const TextStyle(fontSize: 13.0);
  TextStyle get kBoldNormalText => kNormalText.copyWith(
        fontWeight: FontWeight.bold,
      );
}
