import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/data/repositories/genre_repository.dart';

part 'user_genre_event.dart';

part 'user_genre_state.dart';

class UserGenreBloc extends Bloc<UserGenreEvent, UserGenreState> {
  final GenreRepository genreRepository;

  UserGenreBloc({required this.genreRepository}) : super(UserGenreInitial());

  @override
  Stream<UserGenreState> mapEventToState(
    UserGenreEvent event,
  ) async* {
    if (event is UserGenreRequested) {
      yield* _mapUserGenreRequestedToState(event);
    }
  }

  Stream<UserGenreState> _mapUserGenreRequestedToState(
      UserGenreRequested event) async* {
    yield UserGenreLoadInProgress();
    try {
      final UserGenreEntity entity = await genreRepository.getUserGenreList();
      yield UserGenreSuccess(entity: entity);
    } catch (e) {
      yield UserGenreFailure(message: e.toString());
    }
  }
}
