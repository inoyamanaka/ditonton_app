import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/data/datasources/db/database_helper_tv_series.dart';


import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import 'database_helper_tv_series_test.mocks.dart';


@GenerateMocks([TvSeriesDatabaseHelper])
void main() {
  late MockTvSeriesDatabaseHelper mockTvSeriesDatabaseHelper;

  setUp(() {
    mockTvSeriesDatabaseHelper = MockTvSeriesDatabaseHelper();
  });

  group("Movie", () {
    test("Insert Watchlist", () async {
      when(mockTvSeriesDatabaseHelper.insertWatchlist(tvSeriesTable))
          .thenAnswer((_) async => tvSeriesTable.id);

      final result =
          await mockTvSeriesDatabaseHelper.insertWatchlist(tvSeriesTable);

      expect(result, tvSeriesTable.id);
    });

    test("Remove Watchlist", () async {
      when(mockTvSeriesDatabaseHelper.removeWatchlist(tvSeriesTable))
          .thenAnswer((_) async => 1);

      final result =
          await mockTvSeriesDatabaseHelper.removeWatchlist(tvSeriesTable);

      expect(result, 1);
    });

    test("get Watchlist", () async {
      when(mockTvSeriesDatabaseHelper.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesMap]);

      final result = await mockTvSeriesDatabaseHelper.getWatchlistTvSeries();

      expect(result, [testTvSeriesMap]);
    });
  });
}