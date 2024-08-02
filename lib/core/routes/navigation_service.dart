import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static void pop<T extends Object?>([T? result]) {
    navigatorKey!.currentState!.pop(result);
  }

  static void pushNamed<T extends Object?>(String name, {Object? arguments}) {
    navigatorKey!.currentState!.pushNamed(name, arguments: arguments);
  }

  static void pushNamedReplacement(String name, {Object? arguments}) {
    navigatorKey!.currentState!.pushReplacementNamed(
      name,
      arguments: arguments,
    );
  }
}
