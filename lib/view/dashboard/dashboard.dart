import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/view/screen_home/homscreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;

  void _onltemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _widgets = [
    HomeScreen(),
    Text(''),
    Text(''),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_selectedindex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: blulight,
        animationDuration: const Duration(microseconds: 300),
        height: 60,
        items: const [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.speaker,
            color: Colors.black,
          ),
          Icon(
            Icons.earbuds_sharp,
            color: Colors.black,
          ),
          Icon(
            Icons.cable_rounded,
            color: Colors.black,
          ),
        ],
        index: _selectedindex,
        onTap: _onltemTapped,
      ),
    );
  }
}
