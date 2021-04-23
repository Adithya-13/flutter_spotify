import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nero,
      height: 56,
      child: SafeArea(
        bottom: true,
        child: Container(
          child: IconTheme(
            data: AppTheme.bigWhiteIcon.copyWith(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                    color: selectedIndex == 0 ? Colors.white : AppTheme.darkGrey,
                  ),
                  onTap: () => onItemTapped(0),
                ),
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.search,
                    color: selectedIndex == 1 ? Colors.white : AppTheme.darkGrey,
                  ),
                  onTap: () => onItemTapped(1),
                ),
                GestureDetector(
                  child: Icon(
                    selectedIndex == 2 ? Icons.library_books : Icons.library_books_outlined,
                    color: selectedIndex == 2 ? Colors.white : AppTheme.darkGrey,
                  ),
                  onTap: () => onItemTapped(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
