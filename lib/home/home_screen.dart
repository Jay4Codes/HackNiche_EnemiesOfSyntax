import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/home/home_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? activeIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeIndex = 0;
    });
  }

  Widget getTab() {
    if (activeIndex == 0) return Home();
    if (activeIndex == 1) return Container();
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Color(0xff565656),
          backgroundColor: Colors.white,
          items: const [
            Icon(
              Icons.home,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box,
              size: 24,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: Container(
          child: getTab(),
        ));
  }
}
