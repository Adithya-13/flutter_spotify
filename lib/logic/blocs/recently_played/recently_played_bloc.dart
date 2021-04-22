import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/data/repositories/repositories.dart';

part 'recently_played_event.dart';

part 'recently_played_state.dart';

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedEvent, RecentlyPlayedState> {
  final RecentlyPlayedRepository recentlyPlayedRepository;

  RecentlyPlayedBloc({required this.recentlyPlayedRepository})
      : super(RecentlyPlayedInitial());

  @override
  Stream<RecentlyPlayedState> mapEventToState(
    RecentlyPlayedEvent event,
  ) async* {
    if (event is RecentlyPlayedRequested) {
      yield* _mapRecentlyPlayedRequestedToState(event);
    }
  }

  Stream<RecentlyPlayedState> _mapRecentlyPlayedRequestedToState(
      RecentlyPlayedRequested event) async* {
    yield RecentlyPlayedLoadInProgress();
    try {
      final entity = await recentlyPlayedRepository.getRecentlyPlayedList();
      yield RecentlyPlayedSuccess(entity: entity);
    } catch (e) {
      yield RecentlyPlayedFailure(message: e.toString());
    }
  }
}
