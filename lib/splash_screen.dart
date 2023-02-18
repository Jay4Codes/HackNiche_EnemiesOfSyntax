import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/auth/login_screen.dart';
import 'package:hack_niche/home/categories.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => getInitialRoute())))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1a1a1a),
        body: Center(
            child:
                Container(child: Image.asset("assets/illustrations/logo.png")))

        // body: Container(
        //   color: Color(0xff1a1a1a),
        //   child: SizedBox(
        //     child: Image.asset(
        //       'assets/illustrations/logo.png',
        //     ),
        //   ),
        // ),
        );
  }
}
