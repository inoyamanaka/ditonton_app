import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
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
    genre: [Genre(id: 1, name: 'Action')],
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
