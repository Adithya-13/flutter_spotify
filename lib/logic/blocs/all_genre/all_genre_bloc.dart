import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_spotify/data/entities/entities.dart';
import 'package:flutter_spotify/data/repositories/repositories.dart';

part 'all_genre_event.dart';
part 'all_genre_state.dart';

class AllGenreBloc extends Bloc<AllGenreEvent, AllGenreState> {
  final GenreRepository genreRepository;
  AllGenreBloc({required this.genreRepository}) : super(AllGenreInitial());

  @override
  Stream<AllGenreState> mapEventToState(
    AllGenreEvent event,
  ) async* {
    if (event is AllGenreRequested) {
      yield* _mapAllGenreRequestedToState(event);
    }
  }


  Stream<AllGenreState> _mapAllGenreRequestedToState(
      AllGenreRequested event) async* {
    yield AllGenreLoadInProgress();
    try {
      final AllGenreEntity entity = await genreRepository.getAllGenreList();
      yield AllGenreSuccess(entity: entity);
    } catch (e) {
      yield AllGenreFailure(message: e.toString());
    }
  }
}
