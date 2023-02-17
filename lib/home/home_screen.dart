import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1,
                ),
                Icon(
                  Icons.home,
                  size: 12,
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'Home',
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
