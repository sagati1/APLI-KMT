import 'package:bus_schedule_app/Screens/busses_page.dart';
import 'package:bus_schedule_app/Screens/home_screen.dart';
import 'package:bus_schedule_app/Screens/profile_screen.dart';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  static final something = {
    "id": 1,
    "name": "8th School",
    "location": "Downtown",
    "isFavorite": false
  };
  final List<Widget> _pages = [
    // const BusStopDetails(),
    const HomeScreen(),
    // Container(),
    const BussesPage(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.projectBg,
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: height * 0.06,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.travel_explore, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
