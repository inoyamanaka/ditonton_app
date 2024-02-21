import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class GetStatusWatchlistTvSeries {
  final TvSeriesRepository _repository;

  GetStatusWatchlistTvSeries(this._repository);

  Future<bool> execute(int id) async {
    return _repository.isAddedToWatchlist(id);
  }
}
