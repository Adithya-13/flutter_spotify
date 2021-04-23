part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoadInProgress extends GenreState {}

class GenreSuccess extends GenreState {
  final BaseEntity entity;

  GenreSuccess({required this.entity});

  @override
  List<Object> get props => [entity];
}

class GenreFailure extends GenreState {
  final String message;

  GenreFailure({required this.message});

  @override
  List<Object> get props => [message];
}
