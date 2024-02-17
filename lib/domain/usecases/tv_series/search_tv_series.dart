import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class SearchTvSeriesUsecase {
  final TvSeriesRepository tvSeriesRepository;

  SearchTvSeriesUsecase(this.tvSeriesRepository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return tvSeriesRepository.searchSeries(query);
  }
}
