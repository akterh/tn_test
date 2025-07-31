import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tn_test/features/screens/home/view/home.dart';
import 'package:tn_test/features/screens/map/view/map_screen.dart';

import '../../core/constants/app_strings.dart';
import '../screens/splash/view/splash_screen.dart';

class Routes {
  // global routes
  static const String splash = "/";
  static const String home = "/home";
  static const String map = "/map";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // global routes start
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: routeSettings,
        );
      case Routes.home:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );
      case Routes.map:
        return CupertinoPageRoute(
          builder: (_) => const MapScreen(),
          settings: routeSettings,
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noPageFound.tr()),
        ),
        body: Center(
          child: Text(AppStrings.noPageFound.tr()),
        ),
      ),
    );
  }
}
