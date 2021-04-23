import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/pages/home_page.dart';
import 'package:flutter_spotify/presentation/pages/pages.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';
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
      body: Column(
        children: [
          Expanded(child: _widgetPage[_selectedIndex]),
          _currentPlayingSong(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Container _currentPlayingSong() {
    return Container(
      height: 64,
      color: Colors.brown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 0.5,
            color: Colors.white,
          ),
          Expanded(
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: dummyImage,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To the Bone - Pamungkas",
                          style: AppTheme.boldSmallWhiteText,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Pamungkas",
                          style: AppTheme.lightSmallWhiteText,
                        ),
                      ],
                    ),
                  ),
                ),
                IconTheme(
                  data: AppTheme.normalWhiteIcon,
                  child: Row(
                    children: [
                      Icon(Icons.laptop),
                      SizedBox(width: 16),
                      Icon(Icons.favorite_border_rounded),
                      SizedBox(width: 16),
                      Icon(Icons.pause),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
