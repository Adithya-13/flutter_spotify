part of 'all_genre_bloc.dart';

abstract class AllGenreEvent extends Equatable {
  const AllGenreEvent();

  @override
  List<Object?> get props => [];
}

class AllGenreRequested extends AllGenreEvent {}