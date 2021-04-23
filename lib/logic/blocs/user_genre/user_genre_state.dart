part of 'user_genre_bloc.dart';

abstract class UserGenreState extends Equatable {
  const UserGenreState();

  @override
  List<Object> get props => [];
}

class UserGenreInitial extends UserGenreState {}

class UserGenreLoadInProgress extends UserGenreState {}

class UserGenreSuccess extends UserGenreState {
  final BaseEntity entity;

  UserGenreSuccess({required this.entity});

  @override
  List<Object> get props => [entity];
}

class UserGenreFailure extends UserGenreState {
  final String message;

  UserGenreFailure({required this.message});

  @override
  List<Object> get props => [message];
}
