import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoScreen extends StatefulWidget {
  final String url;
  const VideoScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;

  void initController() async {
    controller = VideoPlayerController.network(widget.url);
    await controller.initialize();
    controller.play();
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    // if (controller.value.isInitialized) {
    //   return const CircularProgressIndicator();
    // }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
        child: SizedBox(
          height: double.infinity,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (color == Colors.white) {
                  color = Colors.red;
                } else {
                  color = Colors.white;
                }
              });
            },
            child: Icon(
              Icons.favorite,
              color: color,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.transparent,
            onPressed: () {
              Share.share(widget.url);
            },
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
