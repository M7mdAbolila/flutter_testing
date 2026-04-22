import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/counter_page.dart';

void main() {
  group("CounterPage test", () {
    testWidgets("CounterPage increment press test ", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));

      final findZero = find.text('0');
      final findBotton = find.byType(ElevatedButton);

      expect(findZero, findsOneWidget);
      expect(findBotton, findsOneWidget);

      // Tap the Increment Button and trigger a frame.
      await tester.tap(findBotton);

      // Rebuild the widget after the state has changed.
      await tester.pumpAndSettle();

      final findOne = find.text('1');

      expect(findOne, findsOneWidget);
      expect(findZero, findsNothing);
    });
  });
}
