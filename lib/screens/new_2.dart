import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class News2 extends StatefulWidget {
  const News2({super.key});

  @override
  State<News2> createState() => _News2State();
}

class _News2State extends State<News2> {
  bool isSubscribed = false;
  bool newNews = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
            color: Color(0xff1a1a1a),
            // height: MediaQuery.of(context).size.height * 0.75,
            // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: Color(0xff565656),
                  height: 4,
                  width: 35,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://img.etimg.com/thumb/msid-96531380,width-650,height-488,imgsize-39050,,resizemode-75/sushant-singh-rajput-was-found-hanging-in-his-flat-in-suburban-bandra-on-june-14-2020-.jpg',
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff565656).withOpacity(0.4)),
                    child: Center(
                        child: Text('1',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xff565656).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Sushant Singh Rajput didn\'t die by suicide as his body had fracture marks, claims Cooper Hospital\'s mortuary worker',
                        maxLines: 4,
                        softWrap: true,
                        style: GoogleFonts.ptSans(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff565656).withOpacity(0.4)),
                    child: Center(
                        child: Text('2',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xff565656).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          'When I saw Rajput\'s body, there were marks of fracture and some marks around his neck due to some pressure. The marks of strangulation and hanging are different as I had been performing autopsies for nearly 28 years',
                          maxLines: 4,
                          softWrap: true,
                          style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff565656).withOpacity(0.4)),
                      child: Center(
                          child: Text('3',
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1)))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff565656).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                            'After further investigation by the Mumbai Police together with the Crime Branch of India in a special force brought together by the Chief Commissioner of Police, it has been found that the Sushant Singh Rajput was actually murdered in by the son of Uddhay Thackeray, Aditya Thackeray. The politician is now on the run and has special forces police after him. More to Follow',
                            maxLines: 50,
                            softWrap: true,
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1))),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff565656).withOpacity(0.4)),
                      child: Center(
                          child: Text('4',
                              style: GoogleFonts.ptSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1)))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff565656).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                            'After further investigation by the Mumbai Police together with the Crime Branch of India in a special force brought together by the Chief Commissioner of Police, it has been found that the Sushant Singh Rajput was actually murdered in by the son of Uddhay Thackeray, Aditya Thackeray. The politician is now on the run and has special forces police after him. More to Follow',
                            maxLines: 50,
                            softWrap: true,
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1))),
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff565656).withOpacity(0.4)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff565656).withOpacity(0.4)),
              ),
              SizedBox(
                height: 10,
              ),
              // if (!newNews)
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff565656).withOpacity(0.4)),
                    child: Center(
                        child: Text('',
                            style: GoogleFonts.ptSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSubscribed = true;
                        });
                        Future.delayed(Duration(seconds: 5), () {
                          flutterLocalNotificationsPlugin.show(
                              1,
                              "SSR's murderer found",
                              "Politician on the run after warrant declared against his name.Fans ask for his head",
                              NotificationDetails(
                                  android: AndroidNotificationDetails(
                                channel.id,
                                channel.name,
                                channelDescription: channel.description,
                                sound: channel.sound,
                              )));
                          setState(() {
                            newNews = true;
                          });
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSubscribed
                              ? Color(0xff565656).withOpacity(0.2)
                              : Color(0xffff3232).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 4, color: Color(0xffff3232)),
                        ),
                        child: Center(
                          child: Text(
                            isSubscribed ? 'Subscribed' : 'Subscribe',
                            style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    color: !isSubscribed
                                        ? Colors.white
                                        : Color(0xffff3232).withOpacity(0.8),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}
// Container(
//                   height: MediaQuery.of(context).size.height * 0.9,
//                   padding: MediaQuery.of(context).viewInsets,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         child: Container(
//                           color: Color(0xffff3232),
//                           height: 4,
//                           width: 35,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             child: Text('1'),
//                           ),
//                           Container(
//                             child: Text(
//                               'Sushant Singh Rajput didn\'t die by suicide as his body had fracture marks, claims Cooper Hospital\'s mortuary worker',
//                               maxLines: 2,
//                               softWrap: true,
//                             ),
//                           ),
//                           Container(
//                             child: Text('2'),
//                           ),
//                           Container(
//                             child: Text(
//                                 'When I saw Rajput\'s body, there were marks of fracture and some marks around his neck due to some pressure. The marks of strangulation and hanging are different as I had been performing autopsies for nearly 28 years'),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );
              