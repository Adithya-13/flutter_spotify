import 'package:flutter_spotify/data/entities/entities.dart';

class RecentlyPlayedEntity extends BaseEntity {
  final List<BaseEntity> recentlyPlayedList;

  RecentlyPlayedEntity({required this.recentlyPlayedList});
}

class PlaylistRecentlyPlayedItemEntity extends BaseEntity {
  final List<String> imageSongs;
  final String name;
  final String ownerPlaylist;

  PlaylistRecentlyPlayedItemEntity(
      {required this.imageSongs,
      required this.name,
      required this.ownerPlaylist});
}

class ArtistRecentlyPlayedItemEntity extends BaseEntity {
  final String avatarImage;
  final String name;

  ArtistRecentlyPlayedItemEntity(
      {required this.avatarImage, required this.name});
}

class SongRecentlyPlayedItemEntity extends BaseEntity {
  final String coverSongImage;
  final String name;

  SongRecentlyPlayedItemEntity({required this.coverSongImage, required this.name});
}