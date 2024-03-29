import 'dart:io';

import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/data/models/season_model.dart';
import 'package:tv_series/data/models/tv_series_detail_model.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/data/repositories/tv_series_repository_impl.dart';

import '../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockRemoteDataSource;
  late MockTvSeriesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockLocalDataSource = MockTvSeriesLocalDataSource();
    repository = TvSeriesRepositoryImpl(
        tvSeriesRemoteDatasource: mockRemoteDataSource,
        tvSeriesLocalDataSource: mockLocalDataSource);
  });

  final tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    episodeRunTime: const [30, 40],
    genre: const [GenresModel(id: 1, name: 'Action')],
    homepage: 'homepage',
    id: 1,
    inProduction: true,
    languages: const ['English'],
    name: 'TV Series Name',
    nextEpisodeToAir: null,
    numberOfEpisodes: 10,
    numberOfSeasons: 2,
    originCountry: const ['US'],
    originalLanguage: 'en',
    originalName: 'Original Name',
    overview: 'Overview',
    popularity: 100.0,
    posterPath: 'posterPath',
    status: 'Running',
    tagline: 'Tagline',
    type: 'TV',
    voteAverage: 8.0,
    voteCount: 1000,
  );

  TvSeriesDetailModel tTvSeriesDetailModel = TvSeriesDetailModel(
    adult: false,
    backdropPath: "/example_backdrop_path.jpg",
    episodeRunTime: const [30, 45],
    firstAirDate: DateTime.parse("2022-01-01"),
    genres: const [
      GenreModel(
        id: 12,
        name: "Action",
      ),
      GenreModel(
        id: 34,
        name: "Drama",
      ),
    ],
    homepage: "http://example.com",
    id: 12345,
    inProduction: true,
    languages: const ["English", "Spanish"],
    lastAirDate: DateTime.parse("2023-12-31"),
    numberOfEpisodes: 20,
    numberOfSeasons: 2,
    originCountry: const ["US"],
    originalLanguage: "en",
    originalName: "Example Original Name",
    overview: "This is an example TV series.",
    popularity: 123.45,
    posterPath: "/example_poster_path.jpg",
    seasons: [
      SeasonTvModel(
        airDate: DateTime.parse("2022-01-01"),
        episodeCount: 10,
        id: 1234,
        name: "Season 1",
        overview: "Overview for Season 1",
        posterPath: "/example_season_poster.jpg",
        seasonNumber: 1,
        voteAverage: 8.0,
      ),
      SeasonTvModel(
        airDate: DateTime.parse("2023-01-01"),
        episodeCount: 10,
        id: 5678,
        name: "Season 2",
        overview: "Overview for Season 2",
        posterPath: "/example_season_poster.jpg",
        seasonNumber: 2,
        voteAverage: 8.5,
      ),
    ],
    status: "Returning Series",
    tagline: "An example tagline",
    type: "Scripted",
    voteAverage: 8.3,
    voteCount: 500,
    name: 'Example TV Series',
    nextEpisodeToAir: null,
  );

  final tTvSeriesList = <TvSeriesModel>[tTvSeriesModel];

  group('On The Air TV Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getOnTheAirTvSeries())
          .thenAnswer((_) async => tTvSeriesList);
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockRemoteDataSource.getOnTheAirTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getOnTheAirTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockRemoteDataSource.getOnTheAirTvSeries());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getOnTheAirTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockRemoteDataSource.getOnTheAirTvSeries());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular TV Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenAnswer((_) async => tTvSeriesList);
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Top Rated TV Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesTopRated())
          .thenAnswer((_) async => tTvSeriesList);
      // act
      final result = await repository.getTvSeriesTopRated();
      // assert
      verify(mockRemoteDataSource.getTvSeriesTopRated());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesTopRated())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSeriesTopRated();
      // assert
      verify(mockRemoteDataSource.getTvSeriesTopRated());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesTopRated())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSeriesTopRated();
      // assert
      verify(mockRemoteDataSource.getTvSeriesTopRated());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Detail TV Series', () {
    const int tTvSeriesId = 1;

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId))
          .thenAnswer((_) async => tTvSeriesDetailModel);
      // act
      final result = await repository.getTvSeriesDetail(tTvSeriesId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      expect(result, equals(Right(tTvSeriesDetailModel)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSeriesDetail(tTvSeriesId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSeriesDetail(tTvSeriesId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId));
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach Tv Series', () {
    const tQuery = 'Naruto';

    test('should return series list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchSeries(tQuery))
          .thenAnswer((_) async => tTvSeriesList);
      // act
      final result = await repository.searchSeries(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchSeries(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchSeries(tQuery);
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchSeries(tQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchSeries(tQuery);
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  // ========== Local ==========

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(tvSeriesTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(tvSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(tvSeriesTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(tvSeriesTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 1;
      when(mockLocalDataSource.getSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlist(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist series', () {
    test('should return list of Series', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSeries())
          .thenAnswer((_) async => [tvSeriesTable]);
      // act
      final result = await repository.getWatchlistTvSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSeries]);
    });
  });
}
