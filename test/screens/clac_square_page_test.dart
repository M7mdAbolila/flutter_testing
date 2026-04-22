import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/clac_square_page.dart';

void main() {
  group("ClacSquarePage test", () {
    testWidgets("ClacSquarePage calculate square test ", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: ClacSquarePage()));

      final findZero = find.text('0');
      final findBotton = find.byType(ElevatedButton);
      final findTextField = find.byType(TextField);

      expect(findZero, findsOneWidget);
      expect(findBotton, findsOneWidget);
      expect(findTextField, findsOneWidget);

      num number = 5;
      await tester.enterText(findTextField, '$number');

      // Tap the Increment Button and trigger a frame.
      await tester.tap(findBotton);

      // Rebuild the widget after the state has changed.
      await tester.pumpAndSettle();
      num expectedResult = number * number;
      final findResult = find.text('$expectedResult');

      expect(findResult, findsOneWidget);
      expect(findZero, findsNothing);
    });
  });
}
