import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:apk/home.dart';
import 'package:apk/tikus.dart';
import 'package:apk/debu.dart';

class NavbarPage extends StatefulWidget {
  @override
  _NavbarPageState createState() => new _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Home(), Tikus(), Debu()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(223, 0, 255, 60),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.mouse_outlined, size: 30),
          Icon(Icons.air, size: 30),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
        //Handle button tap
      ),
    );
  }
}
