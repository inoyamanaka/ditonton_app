import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    episodeRunTime: [30, 40],
    firstAirDate: DateTime.parse('2022-01-01'),
    genre: [GenreTv(id: 1, name: 'Action')],
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
      Season(
        airDate: DateTime.parse('2022-01-01'),
        episodeCount: 5,
        id: 1,
        name: 'Season 1',
        overview: 'Season 1 Overview',
        posterPath: 'season1PosterPath',
        seasonNumber: 1,
        voteAverage: 9.0,
      ),
      Season(
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

  test('should be a subclass of TvSeries entity', () async {
    expect(tTvSeriesModel, isA<TvSeries>());
    expect(tTvSeries, isA<TvSeries>());
  });
}
