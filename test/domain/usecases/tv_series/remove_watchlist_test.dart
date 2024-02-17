import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = RemoveWatchlistTvSeries(mockTvSeriesRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.removeWatchlist(tTvSeriesDetailModel))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(tTvSeriesDetailModel);
    // assert
    verify(mockTvSeriesRepository.removeWatchlist(tTvSeriesDetailModel));
    expect(result, Right('Added to Watchlist'));
  });
}