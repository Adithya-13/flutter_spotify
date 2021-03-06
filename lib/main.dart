import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/data/exceptions/api_exception.dart';
import 'package:flutter_spotify/data/repositories/repositories.dart';
import 'package:flutter_spotify/logic/blocs/blocs.dart';
import 'package:flutter_spotify/presentation/router/page_router.dart';
import 'package:flutter_spotify/presentation/utils/app_theme.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SpotifyBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RecentlyPlayedRepository>(
          create: (context) => RecentlyPlayedRepository(),
        ),
        RepositoryProvider<GenreRepository>(
          create: (context) => GenreRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RecentlyPlayedBloc>(
            create: (context) => RecentlyPlayedBloc(
              recentlyPlayedRepository:
                  context.read<RecentlyPlayedRepository>(),
            )..add(RecentlyPlayedRequested()),
          ),
          BlocProvider<AllGenreBloc>(
            create: (context) => AllGenreBloc(
              genreRepository: context.read<GenreRepository>(),
            )..add(AllGenreRequested()),
          ),
          BlocProvider<UserGenreBloc>(
            create: (context) => UserGenreBloc(
              genreRepository: context.read<GenreRepository>(),
            )..add(UserGenreRequested()),
          ),
        ],
        child: SpotifyApp(),
      ),
    ),
  );
}

class SpotifyApp extends StatelessWidget {
  late final PageRouter _router;

  SpotifyApp() : _router = PageRouter() {
    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gotham',
        primaryColor: AppTheme.black,
        accentColor: AppTheme.black,
        scaffoldBackgroundColor: AppTheme.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.dark(primary: AppTheme.darkGrey),
      ),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }

  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      String m = e is APIException ? e.message : e.toString();
      print(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info("Logger initialized.");
  }
}
