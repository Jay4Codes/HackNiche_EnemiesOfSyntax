import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.star_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text('Explore')
                  ],
                ),
              ),
              Tab(
                child: Row(
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
            Container(
              color: Color(0xff1a1a1a),
            ),
            Container(
              color: Color(0xff1a1a1a),
            ),
            Container(
              color: Color(0xff1a1a1a),
            ),
          ]),
        ),
      ),
    );
  }
}
