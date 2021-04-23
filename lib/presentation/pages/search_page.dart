import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/logic/blocs/blocs.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _searchContainer(),
            SliverPersistentHeader(delegate: _SliverAppBarDelegate(collapsedHeight: 56, expandedHeight: 56), pinned: true,),
            _userGenres(),
            _allGenres(),
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
          Text(
            "Search",
            style: AppTheme.boldVeryBigWhiteText,
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );

  Widget _userGenres() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text("Your top genres", style: AppTheme.boldNormalWhiteText),
              SizedBox(height: 16),
              BlocBuilder<UserGenreBloc, UserGenreState>(
                builder: (context, state) {
                  if (state is UserGenreInitial) {
                    return Center(
                      child: Text(
                        "Initial",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is UserGenreLoadInProgress) {
                    return Center(
                      child: Text(
                        "Loading",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is UserGenreFailure) {
                    return Center(
                      child: Text(
                        "Failure",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is UserGenreSuccess &&
                      state.entity is UserGenreEntity) {
                    final entity = (state.entity as UserGenreEntity);
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.75 / 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: entity.userGenreList.length,
                      itemBuilder: (context, index) {
                        final entityItem = entity.userGenreList[index];
                        return genreGridItem(entityItem);
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      );

  Widget _allGenres() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text("Browse all", style: AppTheme.boldNormalWhiteText),
              SizedBox(height: 16),
              BlocBuilder<AllGenreBloc, AllGenreState>(
                builder: (context, state) {
                  if (state is AllGenreInitial) {
                    return Center(
                      child: Text(
                        "Initial",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is AllGenreLoadInProgress) {
                    return Center(
                      child: Text(
                        "Loading",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is AllGenreFailure) {
                    return Center(
                      child: Text(
                        "Failure",
                        style: AppTheme.boldNormalWhiteText,
                      ),
                    );
                  } else if (state is AllGenreSuccess &&
                      state.entity is AllGenreEntity) {
                    final entity = (state.entity as AllGenreEntity);
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.75 / 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: entity.allGenreList.length,
                      itemBuilder: (context, index) {
                        final entityItem = entity.allGenreList[index];
                        return genreGridItem(entityItem);
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      );

  FutureBuilder<Color> genreGridItem(GenreItemEntity entityItem) {
    return FutureBuilder<Color>(
        future: getImagePalette(NetworkImage(entityItem.coverAlbum)),
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              color: snapshot.connectionState == ConnectionState.waiting
                  ? AppTheme.nero
                  : snapshot.data,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  child: Text(entityItem.name,
                      style: AppTheme.boldNormalWhiteText),
                ),
                Positioned(
                  bottom: 0,
                  right: -28,
                  child: Transform.rotate(
                    angle: 0.45,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[2],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          entityItem.coverAlbum,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,}
      );

  final double expandedHeight;
  final double collapsedHeight;

  @override double get minExtent => collapsedHeight;
  @override double get maxExtent => max(expandedHeight, minExtent);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      color: AppTheme.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon:
                Icon(CupertinoIcons.search, color: AppTheme.black),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none),
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
    );
  }

  @override
  bool shouldRebuild( _SliverAppBarDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight
        || collapsedHeight != oldDelegate.collapsedHeight;
  }
}