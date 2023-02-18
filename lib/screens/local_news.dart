import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/models/get_region_news.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({super.key, required this.category, required this.region});
  final String category;
  final String region;
  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  final controller = SwipableStackController();
  late Future<List<dynamic>?> _getNews;
  void initState() {
    // TODO: implement initState
    _getNews = GetRegionNews().getLocalNews(widget.category, widget.region);

    super.initState();
    // print(e);
  }

  var newsBanner = [
    "https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/02/breaking-news-template-5-1676596130.jpg",
    "https://static.abplive.com/wp-content/uploads/2018/04/21175448/quake.jpg",
    "https://i.ytimg.com/vi/Ra-UDPngU2Q/maxresdefault.jpg"
  ];

  var youtube_urls = [
    "https://www.youtube.com/watch?v=Xmm3Kr5P1Uw",
    "https://www.youtube.com/watch?v=nyd-xznCpJc",
    "https://www.youtube.com/watch?v=Nq2wYlWFucg"
  ];

  var youtube_titles = [
    "India TV Live: Aaj Ki Baat | Eknath Shinde | Uddhav Thackeray | Maharashtra | PM Modi | Shivsena",
    "ABP NEWS LIVE: 24*7 | Turkey Earthquake | Adani Case | IND vs AUS | Uddhav vs Shinde | Pak Crisis",
    "Aaj Tak LIVE: Uddhav Thackeray | Shiv Sena | Eknath Shinde | Attack in Karachi| LIVE News in Hindi"
  ];

  // ABP NEWS LIVE: 24*7 | Turkey Earthquake | Adani Case | IND vs AUS | Uddhav vs Shinde | Pak Crisis
  // Aaj Tak LIVE: Uddhav Thackeray | Shiv Sena | Eknath Shinde | Attack in Karachi| LIVE News in Hindi
  // India TV Live: Aaj Ki Baat | Eknath Shinde | Uddhav Thackeray | Maharashtra | PM Modi | Shivsena
  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 170,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: newsBanner.map((i) {
                  int idx = newsBanner.indexOf(i);
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          _launchUrl(youtube_urls[idx]);
                        },
                        child: Container(
                            // height: 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            // padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("${i}"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              child: Text(
                                youtube_titles[idx],
                                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FutureBuilder(
                  future: _getNews,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = (snapshot.data as List).toList();
                      return Container(
                        height: 650,
                        width: MediaQuery.of(context).size.width,
                        child: SwipableStack(
                          controller: controller,
                          itemCount: data.length,
                          builder: (context, properties) {
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
                                data[properties.index]["urlToImage"] != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${data[properties.index]["urlToImage"]}',
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.network(
                                        'https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/02/breaking-news-template-5-1676596130.jpg',
                                        fit: BoxFit.cover,
                                        height: 350,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 22.0, left: 15),
                                  child: Text(
                                    data[properties.index]['title'],
                                    style: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 22.0, left: 15),
                                  child: Text(
                                    data[properties.index]['description'],
                                    style: GoogleFonts.ptSans(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            // fontWeight: FontWeight.w700,
                                            letterSpacing: 1)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 22.0, left: 15),
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
                                        '${5 + properties.index} hours ago',
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
                      return Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Color(0xFFFF3232)),
                        ],
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
