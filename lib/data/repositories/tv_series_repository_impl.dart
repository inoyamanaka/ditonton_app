import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  @override
  Future<Either<Failure, List<TvSeries>>> getTheAirTvSeries() {
    // TODO: implement getAiringOnTheAirTvSeries
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries() {
    // TODO: implement getAiringPopularTvSeries
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getAiringTodayTvSeries() {
    // TODO: implement getAiringTodayTvSeries
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries() {
    // TODO: implement getAiringTopRatedTvSeries
    throw UnimplementedError();
  }
}
