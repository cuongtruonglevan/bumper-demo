import 'package:bumper_demo/app/home/home_screen.dart';
import 'package:bumper_demo/auth/features/profile_complete.dart';
import 'package:bumper_demo/auth/features/welcome_screen.dart';
import 'package:bumper_demo/shared/routes/routes.dart';
import 'package:flutter/material.dart';

class AuthRoutesFactory {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => WelcomeScreen());
      case Routes.profileComplete:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => ProfileComplete());
      default:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const SizedBox());
    }
  }
}

class AppRoutesFactory {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen());
      default:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const SizedBox());
    }
  }
}
