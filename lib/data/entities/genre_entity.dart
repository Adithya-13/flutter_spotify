import 'package:flutter_spotify/data/entities/entities.dart';

class AllGenreEntity extends BaseEntity {
  final List<GenreItemEntity> allGenreList;

  AllGenreEntity({required this.allGenreList});
}


class UserGenreEntity extends BaseEntity {
  final List<GenreItemEntity> userGenreList;

  UserGenreEntity({required this.userGenreList});
}

class GenreItemEntity extends BaseEntity {
  final String name;
  final String coverAlbum;

  GenreItemEntity({required this.name, required this.coverAlbum});
}
