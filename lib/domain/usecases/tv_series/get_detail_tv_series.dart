import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class TvSeriesDetailUsecase {
  final TvSeriesRepository tvSeriesRepository;

  TvSeriesDetailUsecase(this.tvSeriesRepository);

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return tvSeriesRepository.getTvSeriesDetail(id);
  }
}
