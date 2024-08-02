import 'package:flutter/material.dart';
import 'package:techjar_task/core/routes/navigation_service.dart';
import 'package:techjar_task/core/routes/route_info.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      NavigationService.pushNamed(AppRoute.indexScreen);
    });
    return const Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
