part of 'recently_played_bloc.dart';

abstract class RecentlyPlayedEvent extends Equatable {
  const RecentlyPlayedEvent();

  @override
  List<Object?> get props => [];
}

class RecentlyPlayedRequested extends RecentlyPlayedEvent {
  const RecentlyPlayedRequested();

  @override
  List<Object?> get props => [];
}
