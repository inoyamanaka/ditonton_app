import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_detail_tv_series.dart';

import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesDetailUsecase usecase;
  late MockTvSeriesRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockTvSeriesRepository();
    usecase = TvSeriesDetailUsecase(mockMovieRpository);
  });

  group('Get Detail Tests', () {
    const int tTvId = 1;
    group('execute', () {
      test(
          'should get detail of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getTvSeriesDetail(tTvId))
            .thenAnswer((_) async => Right(tTvSeriesDetailModel));
        // act
        final result = await usecase.execute(tTvId);
        // assert
        expect(result, Right(tTvSeriesDetailModel));
      });
    });
  });
}
