import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class TvSeriesTopRatedUsecase {
  final TvSeriesRepository tvSeriesRepository;

  TvSeriesTopRatedUsecase(this.tvSeriesRepository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return tvSeriesRepository.getTvSeriesTopRated();
  }
}
