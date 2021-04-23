part of 'user_genre_bloc.dart';

abstract class UserGenreEvent extends Equatable {
  const UserGenreEvent();

  @override
  List<Object?> get props => [];
}

class UserGenreRequested extends UserGenreEvent {}
