import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack_niche/models/get_region_news.dart';
import 'package:hack_niche/screens/local_news.dart';
import 'package:hack_niche/map_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.category});
  final String category;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    setState(() {
      _tabController!.index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1a1a1a),
          appBar: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Color(0xff565656).withOpacity(0.2)),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        FontAwesomeIcons.indianRupeeSign,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text('Local')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        FontAwesomeIcons.earthAfrica,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text('Global')
                  ],
                ),
              )
            ],
          ),
          body: TabBarView(children: [
            LocalNews(
              category: widget.category,
              region: "local",
            ),
            LocalNews(
              category: widget.category,
              region: "global",
            ),
          ]),
        ),
      ),
    );
  }
}
