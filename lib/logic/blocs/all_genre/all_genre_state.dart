part of 'all_genre_bloc.dart';

abstract class AllGenreState extends Equatable {
  const AllGenreState();

  @override
  List<Object> get props => [];
}

class AllGenreInitial extends AllGenreState {}

class AllGenreLoadInProgress extends AllGenreState {}

class AllGenreSuccess extends AllGenreState {
  final BaseEntity entity;

  AllGenreSuccess({required this.entity});

  @override
  List<Object> get props => [entity];
}

class AllGenreFailure extends AllGenreState {
  final String message;

  AllGenreFailure({required this.message});

  @override
  List<Object> get props => [message];
}
