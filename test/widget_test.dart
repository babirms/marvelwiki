import 'package:flutter_test/flutter_test.dart';

import 'package:marvelwiki/main.dart';

void main() {
  testWidgets('app is created with a character list',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarvelWikiApp());

    expect(find.text('char list'), findsOne);
  });
}
