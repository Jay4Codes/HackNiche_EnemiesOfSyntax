import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_niche/models/get_region_news.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({super.key, required this.category});
  final String category;
  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  late Future<List<dynamic>?> _getNews;
  void initState() {
    // TODO: implement initState
    _getNews = GetRegionNews().getLocalNews(widget.category, "local");

    super.initState();
    // print(e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x1A1A1A),
      body: FutureBuilder(
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
                  return Container();
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
