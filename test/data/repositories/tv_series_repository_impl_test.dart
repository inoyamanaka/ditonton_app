import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
    episodeRunTime: [30, 40],
    firstAirDate: DateTime.parse('2022-01-01'),
    genre: [GenresModel(id: 1, name: 'Action')],
    homepage: 'homepage',
    id: 1,
    inProduction: true,
    languages: ['English'],
    lastAirDate: DateTime.parse('2022-02-01'),
    name: 'TV Series Name',
    nextEpisodeToAir: null,
    numberOfEpisodes: 10,
    numberOfSeasons: 2,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'Original Name',
    overview: 'Overview',
    popularity: 100.0,
    posterPath: 'posterPath',
    season: [
      SeasonModel(
        airDate: DateTime.parse('2022-01-01'),
        episodeCount: 5,
        id: 1,
        name: 'Season 1',
        overview: 'Season 1 Overview',
        posterPath: 'season1PosterPath',
        seasonNumber: 1,
        voteAverage: 9.0,
      ),
      SeasonModel(
        airDate: DateTime.parse('2022-01-01'),
        episodeCount: 5,
        id: 2,
        name: 'Season 2',
        overview: 'Season 2 Overview',
        posterPath: 'season2PosterPath',
        seasonNumber: 2,
        voteAverage: 9.5,
      ),
    ],
    status: 'Running',
    tagline: 'Tagline',
    type: 'TV',
    voteAverage: 8.0,
    voteCount: 1000,
  );

  TvSeriesDetailModel tTvSeriesDetailModel = TvSeriesDetailModel(
    adult: false,
    backdropPath: "/example_backdrop_path.jpg",
    createdBy: [
      CreatedByModel(
        id: 123,
        creditId: "example_credit_id",
        name: "Example Creator",
        gender: 1,
        profilePath: "/example_profile_path.jpg",
      ),
    ],
    episodeRunTime: [30, 45],
    firstAirDate: DateTime.parse("2022-01-01"),
    genres: [
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
    languages: ["English", "Spanish"],
    lastAirDate: DateTime.parse("2023-12-31"),
    lastEpisodeToAir: LastEpisodeToAirModel(
      id: 9876,
      name: "Example Episode",
      overview: "This is an example episode.",
      voteAverage: 8.5,
      voteCount: 100,
      airDate: DateTime.parse("2023-12-30"),
      episodeNumber: 10,
      productionCode: "EP123",
      runtime: 40,
      seasonNumber: 2,
      showId: 56789,
      stillPath: "/example_still_path.jpg",
    ),
    name: "Example TV Series",
    nextEpisodeToAir: null, // Isi sesuai kebutuhan
    networks: [
      NetworkModel(
        id: 1,
        logoPath: "/example_network_logo.jpg",
        name: "Example Network",
        originCountry: "US",
      ),
    ],
    numberOfEpisodes: 20,
    numberOfSeasons: 2,
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Example Original Name",
    overview: "This is an example TV series.",
    popularity: 123.45,
    posterPath: "/example_poster_path.jpg",
    productionCompanies: [
      NetworkModel(
        id: 2,
        logoPath: "/example_company_logo.jpg",
        name: "Example Production Company",
        originCountry: "US",
      ),
    ],
    productionCountries: [
      ProductionCountryModel(
        iso31661: "US",
        name: "United States",
      ),
    ],
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
    spokenLanguages: [
      SpokenLanguageModel(
        englishName: "English",
        iso6391: "en",
        name: "English",
      ),
    ],
    status: "Returning Series",
    tagline: "An example tagline",
    type: "Scripted",
    voteAverage: 8.3,
    voteCount: 500,
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
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getOnTheAirTvSeries())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockRemoteDataSource.getOnTheAirTvSeries());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
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
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSeries())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      verify(mockRemoteDataSource.getPopularTvSeries());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
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
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesTopRated())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSeriesTopRated();
      // assert
      verify(mockRemoteDataSource.getTvSeriesTopRated());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Detail TV Series', () {
    final int tTvSeriesId = 1;

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
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSeriesDetail(tTvSeriesId);
      // assert
      verify(mockRemoteDataSource.getTvSeriesDetail(tTvSeriesId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach Tv Series', () {
    final tQuery = 'Naruto';

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
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchSeries(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchSeries(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
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
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(tvSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
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
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(tvSeriesTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(tTvSeriesDetailModel);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
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
