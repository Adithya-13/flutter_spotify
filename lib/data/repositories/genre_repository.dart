import 'package:flutter_spotify/data/data_providers/local/dummy_data.dart';
import 'package:flutter_spotify/data/entities/entities.dart';

class GenreRepository {
  Future<UserGenreEntity> getUserGenreList() async {
    final UserGenreEntity entity = DummyData.getUserGenreList();
    return entity;
  }

  Future<AllGenreEntity> getAllGenreList() async {
    final AllGenreEntity entity = DummyData.getAllGenreList();
    return entity;
  }
}
