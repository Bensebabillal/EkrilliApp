import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ekrilli_app/screens/authentication_screen.dart';
import 'package:ekrilli_app/themes/primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(AuthenticationScreen());
  }

  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  final String introText = 'Ekrilli app\nRent a house now';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Get.height * 0.5,
              child: SvgPicture.asset(
                'assets/vectors/splash.svg',
              ),
            ),
            SizedBox(
              height: 80,
              width: Get.width,
              child: DefaultTextStyle(
                style: Get.theme.textTheme.headline4?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ) ??
                    const TextStyle(),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      introText,
                      speed: Duration(
                        milliseconds: 2000 ~/ introText.length,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
