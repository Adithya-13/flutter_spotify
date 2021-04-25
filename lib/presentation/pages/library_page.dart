import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/logic/blocs/blocs.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';
import 'package:flutter_spotify/presentation/widgets/widgets.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              _libraryHeader(),
              _listMode(),
              _recentlyPlayedList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _libraryHeader() => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[1],
            color: AppTheme.black,
          ),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Text("A", style: AppTheme.boldNormalBlackText),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: Text("Your Library",
                          style: AppTheme.boldBigWhiteText)),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 16),
                      Icon(Icons.add),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Chip(
                    label: Text(
                      "Playlist",
                      style: AppTheme.lightSmallWhiteText,
                    ),
                    backgroundColor: AppTheme.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  SizedBox(width: 16),
                  Chip(
                    label: Text(
                      "Artist",
                      style: AppTheme.lightSmallWhiteText,
                    ),
                    backgroundColor: AppTheme.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      );

  Widget _listMode() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.all(16),
          child: IconTheme(
            data: AppTheme.smallWhiteIcon,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.arrow_up_arrow_down),
                    SizedBox(width: 16),
                    Text("Recently Played",
                        style: AppTheme.lightSmallWhiteText),
                  ],
                ),
                Icon(CupertinoIcons.grid),
              ],
            ),
          ),
        ),
      );

  Widget _recentlyPlayedList() => SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<RecentlyPlayedBloc, RecentlyPlayedState>(
            builder: (context, state) {
              if (state is RecentlyPlayedLoadInProgress) {
                return Center(
                  child: Text(
                    "Loading...",
                    style: AppTheme.boldBigWhiteText,
                  ),
                );
              } else if (state is RecentlyPlayedFailure) {
                return Center(
                  child: Text(
                    "Error...",
                    style: AppTheme.boldBigWhiteText,
                  ),
                );
              } else if (state is RecentlyPlayedInitial) {
                return Center(
                  child: Text(
                    "Loading...",
                    style: AppTheme.boldBigWhiteText,
                  ),
                );
              } else if (state is RecentlyPlayedSuccess) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.entity.recentlyPlayedList.length,
                  itemBuilder: (context, index) {
                    final stateEntity = state.entity.recentlyPlayedList[index];

                    if (stateEntity is ArtistRecentlyPlayedItemEntity) {
                      return Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            FittedBox(
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(stateEntity.avatarImage),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(stateEntity.name,
                                      style: AppTheme.boldNormalWhiteText),
                                  SizedBox(height: 4),
                                  Text(
                                      "Artist",
                                      style: AppTheme.lightSmallWhiteText),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (stateEntity
                        is PlaylistRecentlyPlayedItemEntity) {
                      return Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            AlbumCoverImage(
                              images: stateEntity.imageSongs,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(stateEntity.name,
                                      style: AppTheme.boldNormalWhiteText),
                                  SizedBox(height: 4),
                                  Text(
                                      "Playlist - ${stateEntity.ownerPlaylist}",
                                      style: AppTheme.lightSmallWhiteText),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                );
              }
              return Container();
            },
          ),
        ),
      );
}
