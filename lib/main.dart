import 'package:ekrilli_app/screens/splash_screen.dart';
import 'package:ekrilli_app/themes/primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: primaryTheme,
      home: SplashScreen(),
      // defaultTransition: Transition.rightToLeft,
    );
  }
}
