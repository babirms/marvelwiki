import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelwiki/features/characters/presentation/pages/character_detail_page.dart';
import 'package:marvelwiki/features/characters/presentation/pages/characters_home_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/home':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const CharactersHomePage(),
        );

      case '/details':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const CharacterDetailPage(),
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
