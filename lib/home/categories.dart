import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_niche/home/home_screen.dart';
import 'package:hack_niche/home/home_tabs.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x1A1A1A),
      floatingActionButton: FloatingActionButton(onPressed: (){},child:Image.asset("assets/illustrations/mic.png"), ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/illustrations/world.jpg",
              height: 250,
            ),
            Container(
              height: 520,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home(
                                    category: "business",
                                  ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/business.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Business',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF565656).withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset("assets/illustrations/entertainment.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Entertainment',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset("assets/illustrations/environment.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Environment',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset("assets/illustrations/food.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset("assets/illustrations/health.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Health',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset("assets/illustrations/politics.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Politics',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset("assets/illustrations/science.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Science',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset(
                          "assets/illustrations/sports.png",
                          height: 75,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sports',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset(
                          "assets/illustrations/technology.png",
                          height: 75,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Technology',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset(
                          "assets/illustrations/top.png",
                          height: 75,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Top',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Image.asset(
                          "assets/illustrations/world.png",
                          height: 75,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'World',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  
                  // Container(
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
            )
          ],
        ),
        // color: Color,
      ),
    );
  }
}
