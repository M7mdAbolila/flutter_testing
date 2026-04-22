import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/counter.dart';

void main() {
  group("Test counter start, increment & decrement", () {
    test('Counter value should be 0', () {
      final counter = Counter();

      // expect (actual, matcher)
      // We expect the initial counter value to be 0
      expect(counter.value, 0);
    });
    test('Counter value should be incremented by 1', () {
      final counter = Counter();
      counter.increment();

      // expect (actual, matcher)
      // We expect the counter value to be 1 after incrementing
      expect(counter.value, 1);
    });

    test('Counter value should be decremented by 1', () {
      final counter = Counter();
      counter.decrement();

      // expect (actual, matcher)
      // We expect the counter value to be -1 after decrementing
      expect(counter.value, -1);
    });
  });
}
