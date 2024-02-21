import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository _repository;

  RemoveWatchlistTvSeries(this._repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail series) {
    return _repository.removeWatchlist(series);
  }
}
