import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tv_series_.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesOnTheAirUsecase usecase;
  late MockTvSeriesRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockTvSeriesRepository();
    usecase = TvSeriesOnTheAirUsecase(mockMovieRpository);
  });

  final tMovies = <TvSeries>[];

  group('Get On The Air Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getOnTheAirTvSeries())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
