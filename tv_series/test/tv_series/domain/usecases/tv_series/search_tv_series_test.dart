import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvSeriesUsecase usecase;
  late MockTvSeriesRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockTvSeriesRepository();
    usecase = SearchTvSeriesUsecase(mockMovieRpository);
  });

  final tTvSeries = <TvSeriesModel>[];

  group('Search Tv Series Tests', () {
    const String query = 'Naruto';
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.searchSeries(query))
            .thenAnswer((_) async => Right(tTvSeries));
        // act
        final result = await usecase.execute(query);
        // assert
        expect(result, Right(tTvSeries));
      });
    });
  });
}
