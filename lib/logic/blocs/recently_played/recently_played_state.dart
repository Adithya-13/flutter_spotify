part of 'recently_played_bloc.dart';

abstract class RecentlyPlayedState extends Equatable {
  const RecentlyPlayedState();

  @override
  List<Object> get props => [];
}

class RecentlyPlayedInitial extends RecentlyPlayedState {}

class RecentlyPlayedLoadInProgress extends RecentlyPlayedState {}

class RecentlyPlayedSuccess extends RecentlyPlayedState {
  final RecentlyPlayedEntity entity;

  RecentlyPlayedSuccess({required this.entity});

  @override
  List<Object> get props => [entity];
}

class RecentlyPlayedFailure extends RecentlyPlayedState {
  final String message;

  RecentlyPlayedFailure({required this.message});

  @override
  List<Object> get props => [message];
}
