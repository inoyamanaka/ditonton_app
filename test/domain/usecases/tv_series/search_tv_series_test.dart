import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
    final String query = 'Naruto';
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
