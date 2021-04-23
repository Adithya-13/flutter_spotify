import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _searchContainer(),
          ],
        ),
      ),
    );
  }

  Widget _searchContainer() => SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 56,
          ),
          Text("Search", style: AppTheme.boldVeryBigWhiteText,),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(CupertinoIcons.search, color: AppTheme.black),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none
                    ),
                    hintText: "Artist, songs, or podcasts",
                    hintStyle: AppTheme.boldNormalBlackText,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  style: AppTheme.boldNormalBlackText,

                ),
              ),
              SizedBox(width: 16),
              Icon(CupertinoIcons.mic, color: Colors.white),
            ],
          ),
        ],
      ),
    ),
  );
}
