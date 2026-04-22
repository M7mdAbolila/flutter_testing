import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/api/fetch_album.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("Fetch Album Test", () {
    late MockClient mockClient;

    /// Use the `setUp` function to initialize shared resources before each test
    setUp(() {
      mockClient = MockClient();
    });

    /// Use the `tearDown` function to clean up resources after each test
    tearDown(() {
      // No resources to clean up in this case, but you could close streams or databases here
      log("Test completed. Cleaning up resources");
    });

    /// Use the `tearDownAll` function to clean up resources after all tests in the group have run
    tearDownAll(() {
      // No resources to clean up in this case, but you could close streams or databases here
      log("All tests in the Fetch Album Test group have completed.");
    });
    test("returns an Album if the http call completes successfully", () async {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      )
      // Use the `thenAnswer` method to provide async mock response
      .thenAnswer(
        (_) async => http.Response(
          '{"userId": 1, "id": 1, "title": "mocked title"}',
          200,
        ),
      );

      expect(
        await fetchAlbum(mockClient),
        // Use the `isA` matcher to match a specific type
        // Use the `having` method to check specific properties of the returned object
        isA<Album>()
            .having((album) => album.userId, "userId", equals(1))
            .having((album) => album.id, "id", equals(1))
            .having((album) => album.title, "title", equals("mocked title")),
      );
    });

    test(
      "throws an exception if the http call completes with an error",
      () async {
        when(
          mockClient.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          ),
        ).thenAnswer(
          (_) async => http.Response('{"errMessage": "Not Found"}', 404),
        );

        expect(fetchAlbum(mockClient), throwsException);
      },
    );

    test("called get once", () {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"userId": 1, "id": 1, "title": "mocked title"}',
          200,
        ),
      );
      fetchAlbum(mockClient);
      verify(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      )
      // Use the `called` method to verify that the method was called a specific number of times
      .called(1);
    });
  });
}
