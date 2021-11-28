import 'package:bumper_demo/shared/app_color.dart';
import 'package:bumper_demo/shared/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: Hero(
            tag: 'splash',
            child: Image.asset(
              AppImage.imgSplash,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
