import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelwiki/features/characters/presentation/pages/character_detail_page.dart';

void main() {
  testWidgets(
    'creates the character details page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: CharacterDetailPage())));

      expect(find.text('char details'), findsOne);
    },
  );
}
