import 'package:bumper_demo/shared/app_color.dart';
import 'package:bumper_demo/shared/app_image.dart';
import 'package:bumper_demo/shared/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum LoginMethod { email, phoneNumber }

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final credentialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Welcome to\nBumper',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 48.0),
            ),
            Hero(
              tag: 'splash',
              child: Image.asset(
                AppImage.imgSplash,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text(
              'Log in Bumper using your',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        showLoginDialog(context, LoginMethod.email);
                      },
                      child: const Text('EMAIL')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'or',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        showLoginDialog(context, LoginMethod.phoneNumber);
                      },
                      child: const Text('PHONE')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLoginDialog(BuildContext context, LoginMethod method) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "Please enter your ${method == LoginMethod.email ? 'email address' : 'phone number'}"),
              TextField(
                controller: credentialController,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.profileComplete);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
