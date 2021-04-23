import 'package:flutter/material.dart';
import 'package:flutter_spotify/presentation/pages/pages.dart';
import 'package:flutter_spotify/presentation/router/page_path.dart';

class PageRouter {
  final RouteObserver<PageRoute> routeObserver;

  PageRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case PagePath.base: return _buildRoute(settings, BasePage());
      case PagePath.home: return _buildRoute(settings, HomePage());
      case PagePath.search: return _buildRoute(settings, SearchPage());
      case PagePath.library: return _buildRoute(settings, LibraryPage());
      default:
        return _errorRoute();
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
