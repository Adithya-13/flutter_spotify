import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/pages/home_page.dart';
import 'package:flutter_spotify/presentation/pages/pages.dart';
import 'package:flutter_spotify/presentation/widgets/widgets.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetPage = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetPage[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
