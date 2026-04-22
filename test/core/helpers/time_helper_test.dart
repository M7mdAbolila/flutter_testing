import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/helpers/time_helper.dart';

void main() {
  group("TimeHelper.getTimeOfTheDay test", () {
    test("should return Morning", () {
      final time = DateTime(2026, 1, 1, 6); // 6 AM
      final result = TimeHelper.getTimeOfTheDay(time: time);
      expect(result, 'Morning');
    });

    test("should return Afternoon", () {
      final time = DateTime(2026, 1, 1, 12); // 12 PM
      final result = TimeHelper.getTimeOfTheDay(time: time);
      expect(result, 'Afternoon');
    });

    test("should return Evening", () {
      final time = DateTime(2026, 1, 1, 18); // 6 PM
      final result = TimeHelper.getTimeOfTheDay(time: time);
      expect(result, 'Evening');
    });

    test("should return Night", () {
      final time = DateTime(2026, 1, 1, 22); // 10 PM
      final result = TimeHelper.getTimeOfTheDay(time: time);
      expect(result, 'Night');
    });
  });
}
