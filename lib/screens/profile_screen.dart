import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/home/home_tabs.dart';
import 'package:hack_niche/models/get_post_model.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<dynamic>?> _getPosts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosts = GetPost().getUserPosts('1');
  }

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
                            '6 posts',
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
              FutureBuilder(
                  future: _getPosts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = (snapshot.data as List).toList();
                      return Container(
                        height: 650,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  // gradient: LinearGradient(
                                  //   begin: Alignment.topLeft,
                                  //   end: Alignment(0.8, 1),
                                  //   colors: <Color>[

                                  //   ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                  //   // tileMode: TileMode.mirror,
                                  // ),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [
                                // data[index]["Image"] != null
                                //     ? ClipRRect(
                                //         borderRadius: BorderRadius.circular(10),
                                //         child: Image.network(
                                //           '${data[index]["Image"]}',
                                //           height: 250,
                                //           fit: BoxFit.cover,
                                //         ),
                                //       )
                                //     :
                                Image.network(
                                  'https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/02/breaking-news-template-5-1676596130.jpg',
                                  fit: BoxFit.cover,
                                  height: 350,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 22.0, left: 15),
                                  child: Text(
                                    data[index]['title'],
                                    style: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 22.0, left: 15),
                                  child: Text(
                                    data[index]['description'],
                                    style: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            // fontWeight: FontWeight.w700,
                                            letterSpacing: 1)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 22.0, left: 15),
                                    child: Row(children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${5 + index} hours ago',
                                        style: GoogleFonts.ptSans(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                // fontWeight: FontWeight.w700,
                                                letterSpacing: 1)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '•',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Mumbai',
                                        style: GoogleFonts.ptSans(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                // fontWeight: FontWeight.w700,
                                                letterSpacing: 1)),
                                      ),
                                    ]))
                              ]),
                            );
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
