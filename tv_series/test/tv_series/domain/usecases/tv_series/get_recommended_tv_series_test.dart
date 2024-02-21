import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendation.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GettvSeriesRecommendations usecase;
  late MockTvSeriesRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockTvSeriesRepository();
    usecase = GettvSeriesRecommendations(mockMovieRpository);
  });

  final tSeries = <TvSeries>[];

  group('Recommended Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getTvSeriesRecommendations(0))
            .thenAnswer((_) async => Right(tSeries));
        // act
        final result = await usecase.execute(0);
        // assert
        expect(result, Right(tSeries));
      });
    });
  });
}
