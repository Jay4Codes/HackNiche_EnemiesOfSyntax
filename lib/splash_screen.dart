import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/auth/login_screen.dart';
import 'package:hack_niche/home/home_screen.dart';
import 'package:hack_niche/screens/videos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget getInitialRoute() {
    if (GetStorage().read('token') == null) {
      return LoginScreen();
    }
    return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Container(
            margin: EdgeInsets.only(left: 25, top: 25),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Hack',
                    style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.blue, fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 1))),
                TextSpan(
                    text: 'niche',
                    style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 1)))
              ]),
            )),
        nextScreen: getInitialRoute());
  }
}
