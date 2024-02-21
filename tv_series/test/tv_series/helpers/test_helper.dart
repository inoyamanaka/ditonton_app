import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tv_series/data/datasources/db/database_helper_tv_series.dart';
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';
import 'package:tv_series/domain/usecases/get_detail_tv_series.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tv_series_.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_status_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendation.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  TvSeriesDatabaseHelper,

  //usecase tv series
  TvSeriesOnTheAirUsecase,
  TvSeriesDetailUsecase,
  TvSeriesPopularUsecase,
  GetStatusWatchlistTvSeries,
  TvSeriesTopRatedUsecase,
  GettvSeriesRecommendations,
  GetWatchlistTvSeries,
  RemoveWatchlistTvSeries,
  SaveWatchlistTvSeries,
  SearchTvSeriesUsecase
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
