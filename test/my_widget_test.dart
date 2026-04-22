import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/my_widget.dart';

void main() {
  group("MyWidget test", () {
    testWidgets("MyWidget find title and message ", (
      WidgetTester tester,
    ) async {
      // Use the `pumpWidget` method to build the widget tree for testing
      await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

      // Use the `find` object to locate widgets in the widget tree
      final titleFinder = find.text('T');
      final messageFinder = find.text('M');

      // Verify that the title and message are present in the widget tree
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets("MyWidget test by type ", (WidgetTester tester) async {
      await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

      final centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);
    });

    testWidgets("MyWidget test by key ", (WidgetTester tester) async {
      await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

      final appBarFinder = find.byKey(const Key('appBar'));
      expect(appBarFinder, findsOneWidget);
    });

    testWidgets("MyWidget test by instance ", (WidgetTester tester) async {
      Widget icon = const Icon(Icons.star);
      await tester.pumpWidget(MyWidget(title: 'T', message: 'M', icon: icon));

      final iconFinder = find.byWidget(icon);
      expect(iconFinder, findsOneWidget);
    });
  });

  testWidgets("Find appBar with title", (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final appBarFinder = find.byKey(const Key('appBar'));
    expect(appBarFinder, findsOneWidget);

    final appBarHasTitle = find.descendant(
      of: appBarFinder,
      matching: find.text('T'),
    );

    expect(appBarHasTitle, findsOneWidget);
  });
}
