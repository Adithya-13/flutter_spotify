import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/logic/blocs/blocs.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';
import 'package:flutter_spotify/presentation/widgets/album_cover_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _topBarHome(),
            _recentlyPlayedGrid(),
          ],
        ),
      ),
    );
  }

  Widget _topBarHome() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(16).copyWith(top: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Good afternoon",
                style: AppTheme.boldBigWhiteText,
              ),
            ),
            IconTheme(
              data: AppTheme.normalWhiteIcon,
              child: Row(
                children: [
                  Icon(Icons.flash_on_outlined),
                  SizedBox(width: 16),
                  Icon(Icons.history),
                  SizedBox(width: 16),
                  Icon(Icons.inbox_outlined),
                  SizedBox(width: 16),
                  Icon(Icons.settings_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentlyPlayedGrid() {
    return SliverToBoxAdapter(
      child: Container(
        child: BlocBuilder<RecentlyPlayedBloc, RecentlyPlayedState>(
          builder: (context, state) {
            if (state is RecentlyPlayedLoadInProgress) {
              return Center(
                child: Text(
                  "Loading...",
                  style: AppTheme.boldBigWhiteText,
                ),
              );
            } else if (state is RecentlyPlayedSuccess) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.25 / 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final stateEntity = state.entity.recentlyPlayedList[index];

                  if (stateEntity is ArtistRecentlyPlayedItemEntity) {
                    return Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(4)),
                            child: CachedNetworkImage(
                              imageUrl: stateEntity.avatarImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              stateEntity.name,
                              style: AppTheme.boldSmallWhiteText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.nero,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  } else if (stateEntity is PlaylistRecentlyPlayedItemEntity) {
                    return Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(4)),
                            child: AlbumCoverImage(images: stateEntity.imageSongs),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              stateEntity.name,
                              style: AppTheme.boldSmallWhiteText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.nero,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  } else if (stateEntity is SongRecentlyPlayedItemEntity) {
                    return Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(4)),
                            child: CachedNetworkImage(
                              imageUrl: stateEntity.coverSongImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              stateEntity.name,
                              style: AppTheme.boldSmallWhiteText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.nero,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
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
            } else {
              print("other " + state.toString());
              return Container();
            }
          },
        ),
      ),
    );
  }
}
