import 'package:bumper_demo/shared/routes/auth_routes_factory.dart';
import 'package:bumper_demo/shared/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: _buildAuthenticationMaterial(context));
  }

  Widget _buildAuthenticationMaterial(BuildContext context) {
    final authRoutesFactory = AuthRoutesFactory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>
          authRoutesFactory.generateRoute(context, settings),
      initialRoute: Routes.welcome,
    );
  }

  Widget _buildFeaturesMaterial(BuildContext context) {
    final appRoutesFactory = AppRoutesFactory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>
          appRoutesFactory.generateRoute(context, settings),
      initialRoute: Routes.homeScreen,
    );
  }
}
