import 'package:flutter/material.dart';

import '../core/core.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TechJAR",
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: AppRoute.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
