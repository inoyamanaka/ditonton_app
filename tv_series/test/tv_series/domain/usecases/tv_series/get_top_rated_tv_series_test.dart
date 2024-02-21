import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesTopRatedUsecase usecase;
  late MockTvSeriesRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockTvSeriesRepository();
    usecase = TvSeriesTopRatedUsecase(mockMovieRpository);
  });

  final tMovies = <TvSeries>[];

  group('Get Top Rated Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getTvSeriesTopRated())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
