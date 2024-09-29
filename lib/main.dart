import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marvelwiki/features/characters/presentation/pages/characters_home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");
  runApp(const MarvelWikiApp());
}

class MarvelWikiApp extends StatelessWidget {
  const MarvelWikiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Wiki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const CharactersHomePage(),
    );
  }
}
