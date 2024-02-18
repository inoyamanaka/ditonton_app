import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'database_movie_helper_test.mocks.dart';

@GenerateMocks([DatabaseHelper])
void main() {
  late MockDatabaseHelper mockDatabaseMovieHelper;

  setUp(() {
    mockDatabaseMovieHelper = MockDatabaseHelper();
  });

  group("Movie", () {
    test("Insert Watchlist", () async {
      when(mockDatabaseMovieHelper.insertWatchlist(testMovieTable))
          .thenAnswer((_) async => testMovieTable.id);

      final result =
          await mockDatabaseMovieHelper.insertWatchlist(testMovieTable);

      expect(result, testMovieTable.id);
    });

    test("Remove Watchlist", () async {
      when(mockDatabaseMovieHelper.removeWatchlist(testMovieTable))
          .thenAnswer((_) async => 1);

      final result =
          await mockDatabaseMovieHelper.removeWatchlist(testMovieTable);

      expect(result, 1);
    });

    test("get Watchlist by id", () async {
      when(mockDatabaseMovieHelper.getMovieById(1))
          .thenAnswer((_) async => testMovieTable.toJson());

      final result = await mockDatabaseMovieHelper.getMovieById(1);

      expect(result, testMovieTable.toJson());
    });

    test("get Watchlist", () async {
      when(mockDatabaseMovieHelper.getWatchlistMovies())
          .thenAnswer((_) async => [testMovieMap]);

      final result = await mockDatabaseMovieHelper.getWatchlistMovies();

      expect(result, [testMovieMap]);
    });
  });
}
