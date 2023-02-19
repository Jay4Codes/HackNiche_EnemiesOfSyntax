import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_niche/screens/video_player.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  // var _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    List<Widget> reel = [
      VideoScreen(url: "https://storage.googleapis.com/hackniche/news3.mp4"),
      VideoScreen(url: "https://storage.googleapis.com/hackniche/news50.mp4"),
      VideoScreen(url: "https://storage.googleapis.com/hackniche/news5.mp4"),
      VideoScreen(url: "https://storage.googleapis.com/hackniche/news6.mp4"),
      VideoScreen(url: "https://storage.googleapis.com/hackniche/news4.mp4"),
    ];
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: reel,
    );
  }
}
