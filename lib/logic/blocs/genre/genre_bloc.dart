import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/data/repositories/genre_repository.dart';

part 'genre_event.dart';

part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreRepository genreRepository;

  GenreBloc({required this.genreRepository}) : super(GenreInitial());

  @override
  Stream<GenreState> mapEventToState(
    GenreEvent event,
  ) async* {
    if (event is AllGenreRequested) {
      yield* _mapAllGenreRequestedToState(event);
    } else if (event is UserGenreRequested) {
      yield* _mapUserGenreRequestedToState(event);
    }
  }

  Stream<GenreState> _mapAllGenreRequestedToState(
      AllGenreRequested event) async* {
    yield GenreLoadInProgress();
    try {
      final AllGenreEntity entity = await genreRepository.getAllGenreList();
      yield GenreSuccess(entity: entity);
    } catch (e) {
      yield GenreFailure(message: e.toString());
    }
  }

  Stream<GenreState> _mapUserGenreRequestedToState(
      UserGenreRequested event) async* {
    yield GenreLoadInProgress();
    try {
      final UserGenreEntity entity = await genreRepository.getUserGenreList();
      yield GenreSuccess(entity: entity);
    } catch (e) {
      yield GenreFailure(message: e.toString());
    }
  }
}
