export 'recently_played/recently_played_bloc.dart';
export 'user_genre/user_genre_bloc.dart';
export 'all_genre/all_genre_bloc.dart';

import 'package:bloc/bloc.dart';

class SpotifyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
