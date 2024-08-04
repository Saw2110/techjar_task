import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:techjar_task/core/routes/route_info.dart';
import 'package:techjar_task/src/posts/components/post_detail_section.dart';

import '../../src/bottom_navbar/bottom_navbar.dart';
import '../../src/index/index.dart';
import '../../src/photos/photos.dart';
import '../../src/splash/splash.dart';
import '../../src/users/users.dart';
import '../widgets/error_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splashScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const SplashScreen(),
        );

      case AppRoute.indexScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const IndexScreen(),
        );
      case AppRoute.postDetailScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const PostDetailSection(),
        );
      case AppRoute.userScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const UserScreen(),
        );
      case AppRoute.bottomNavbarScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const BottomNavbarScreen(),
        );
      case AppRoute.photoScreen:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const PhotoScreen(),
        );

      default:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const ErrorScreen(message: "Error while navigation"),
        );
    }
  }
}
