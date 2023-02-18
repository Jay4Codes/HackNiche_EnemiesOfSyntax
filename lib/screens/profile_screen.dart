import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/home/home_tabs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff1a1a1a),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 40),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/illustrations/images.jpg',
                        fit: BoxFit.fill,
                      ),
                      clipBehavior: Clip.hardEdge,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 100),
                      child: Column(
                        children: [
                          Text(
                            'Yash Joshi',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '3 posts',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 700,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(
                            "https://img.etimg.com/thumb/msid-96531380,width-650,height-488,imgsize-39050,,resizemode-75/sushant-singh-rajput-was-found-hanging-in-his-flat-in-suburban-bandra-on-june-14-2020-.jpg",
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sushant Singh Rajput didn\'t die by suicide',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 1)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(
                            "https://img.etimg.com/thumb/msid-94411950,width-300,height-225,imgsize-133708,,resizemode-75/heavy-rain-lashes-mumbai-disrupts-traffic-movement-no-relief-in-sight.jpg",
                            fit: BoxFit.fill,
                            width: 350,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              'Mumbai witnesses heavy showers',
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(
                            "https://img.etimg.com/thumb/msid-97991084,width-300,height-225,imgsize-101780,,resizemode-75/hospital-new.jpg",
                            fit: BoxFit.fill,
                            width: 350,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              'Max, Princeton interested in SevenHills Hospital',
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //   padding: const EdgeInsets.all(8),
                    //   color: Color(0xFF565656),
                    //   child: Image.asset("assets/illustrations/business.png"),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   color: Color(0xFF565656),
                    //   child: const Text('Sound of screams but the'),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   color: Color(0xFF565656),
                    //   child: const Text('Who scream'),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   color: Color(0xFF565656),
                    //   child: const Text('Revolution is coming...'),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   color: Color(0xFF565656),
                    //   child: const Text('Revolution, they...'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
