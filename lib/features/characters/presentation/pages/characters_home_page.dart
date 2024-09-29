import 'package:flutter/material.dart';

class CharactersHomePage extends StatefulWidget {
  const CharactersHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CharactersHomePageState();
}

class _CharactersHomePageState extends State<CharactersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          child: Text('Get All'),
          onPressed: () async {},
        ),
      ),
    );
  }
}
