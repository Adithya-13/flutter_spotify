import 'package:flutter_spotify/data/data_providers/local/dummy_data.dart';
import 'package:flutter_spotify/data/entities/entities.dart';

class RecentlyPlayedRepository {

  Future<RecentlyPlayedEntity> getRecentlyPlayedList() async {
    RecentlyPlayedEntity entity = DummyData.getRecentlyPlayedList();
    return entity;
  }

}