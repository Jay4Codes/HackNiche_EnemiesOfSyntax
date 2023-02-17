import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hack_niche/home/categories.dart';
import 'package:hack_niche/home/home_tabs.dart';
import 'package:hack_niche/screens/post_screen.dart';
import 'package:hack_niche/map_screen.dart';
import 'package:hack_niche/screens/profile_screen.dart';
import 'package:hack_niche/screens/videos.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? activeIndex;
  double? latitude;
  double? longitude;
  void initializeLocation() async {
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    LocationData _locationData = await _location.getLocation();
    LatLng currentLatLng =
        LatLng(_locationData.latitude!, _locationData.latitude!);

    latitude = currentLatLng.latitude;
    longitude = currentLatLng.longitude;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeIndex = 0;
    });
    initializeLocation();
  }

  Widget getTab() {
    if (activeIndex == 0) return Categories();
    if (activeIndex == 1) return Videos();
    if (activeIndex == 2)
      return MapScreen(
        latitude: latitude!,
        longitude: longitude!,
      );
    if (activeIndex == 3) return PostScreen();

    return ProfileScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.black,
          backgroundColor: Color(0xffff3232),
          items: const [
            Icon(
              Icons.home,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.earthAfrica,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box,
              size: 24,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: Container(
          child: getTab(),
        ));
  }
}
