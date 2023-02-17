import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_niche/models/get_region_news.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({super.key, required this.category, required this.region});
  final String category;
  final String region;
  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  late Future<List<dynamic>?> _getNews;
  void initState() {
    // TODO: implement initState
    _getNews = GetRegionNews().getLocalNews(widget.category, widget.region);

    super.initState();
    // print(e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      // padding: EdgeInsets.all(15.0),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/illustrations/news_carousel1.png"), fit: BoxFit.cover),
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
                          'Text $i + test text for abcd efgh ijkl mnop qrst uvwx yz',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ));
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder(
              future: _getNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = (snapshot.data as List).toList();
                  print(data);
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          height: 155,
                          // padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF565656).withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data[index]['title'],
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data[index]['description'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${5 + index} hours ago',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '•',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Mumbai',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: data[index]["urlToImage"] != null
                                    ? Image.network(
                                        '${data[index]["urlToImage"]}',
                                        height: 155,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'https://resize.indiatvnews.com/en/resize/newbucket/730_-/2023/02/breaking-news-template-5-1676596130.jpg',
                                        height: 155,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
