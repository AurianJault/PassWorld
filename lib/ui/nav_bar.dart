import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test/Classes/account.dart';
import 'package:test/ui/home_page.dart' show HomePage;
import 'package:test/ui/settings_page.dart' show SettingsPage;

import 'generator_page.dart';
import 'health_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = [
    HomePage(),
    GeneratorPage(),
    HealthPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.deepPurple[300],
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 149, 117, 205),
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            activeColor: Colors.black,
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.015),
            gap: w * 0.012,
            iconSize: w * 0.06,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.password,
                text: 'Generator',
              ),
              GButton(
                icon: Icons.health_and_safety,
                text: 'Health',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _navigateBottomBar,
          ),
        ),
      ),
    );
  }
}
