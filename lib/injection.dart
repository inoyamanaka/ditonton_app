import 'package:core/common/http_certificate.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/data/datasources/db/database_helper.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import 'package:movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:movies/domain/usecases/search_movies.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:tv_series/data/datasources/db/database_helper_tv_series.dart';
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:tv_series/data/repositories/tv_series_repository_impl.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';
// import 'package:tv_series/domain/repositories/tv_series_repository.dart';
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
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => OnTheAirMovieBloc(GetNowPlayingMovies(locator())),
  );
  locator.registerFactory(
    () => PopularMovieBloc(GetPopularMovies(locator())),
  );
  locator.registerFactory(
    () => MovieTopRatedBloc(GetTopRatedMovies(locator())),
  );
  locator.registerFactory(
    () => DetailMovieBloc(GetMovieDetail(locator())),
  );
  locator.registerFactory(
    () => RecommendationMovieBloc(GetMovieRecommendations(locator())),
  );
  locator.registerFactory(
    () => SearchMovieBloc(SearchMovies(locator())),
  );
  locator.registerFactory(
    () => MovieStatusWatchListBloc(GetWatchListStatus(locator())),
  );
  locator.registerFactory(
    () => InsertWatchListMovieBloc(SaveWatchlist(locator())),
  );
  locator.registerFactory(
    () => GetWatchListMovieBloc(GetWatchlistMovies(locator())),
  );
  locator.registerFactory(
    () => RemoveWatchListMovieBloc(RemoveWatchlist(locator())),
  );

  // -----------------------
  locator.registerFactory(
    () => OnTheAirTvSeriesBloc(TvSeriesOnTheAirUsecase(locator())),
  );

  locator.registerFactory(() => PopularTvSeriesBloc(
        TvSeriesPopularUsecase(locator()),
      ));
  locator.registerFactory(() => TvSeriesTopRatedBloc(
        TvSeriesTopRatedUsecase(locator()),
      ));
  locator.registerFactory(() => DetailTvSeriesBloc(
        TvSeriesDetailUsecase(locator()),
      ));
  locator.registerFactory(() => RecommendationTvSeriesBloc(
        GettvSeriesRecommendations(locator()),
      ));
  locator.registerFactory(() => SearchTvSeriesBloc(
        SearchTvSeriesUsecase(locator()),
      ));
  locator.registerFactory(() => StatusWatchListBloc(
        GetStatusWatchlistTvSeries(locator()),
      ));
  locator.registerFactory(() => InsertWatchListBloc(
        SaveWatchlistTvSeries(locator()),
      ));
  locator.registerFactory(() => GetWatchListBloc(
        GetWatchlistTvSeries(locator()),
      ));
  locator.registerFactory(() => RemoveWatchListBloc(
        RemoveWatchlistTvSeries(locator()),
      ));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  //--------
  locator.registerLazySingleton(() => TvSeriesOnTheAirUsecase(locator()));
  locator.registerLazySingleton(() => TvSeriesPopularUsecase(locator()));
  locator.registerLazySingleton(() => TvSeriesTopRatedUsecase(locator()));
  locator.registerLazySingleton(() => TvSeriesDetailUsecase(locator()));
  locator.registerLazySingleton(() => GettvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => GetStatusWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => SearchTvSeriesUsecase(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      tvSeriesLocalDataSource: locator(),
      tvSeriesRemoteDatasource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<TvSeriesDatabaseHelper>(
      () => TvSeriesDatabaseHelper());

  // external
  // locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => HttpCustom.client);
}
