import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/domain/entities/genre.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

void main() {
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

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    episodeRunTime: const [30, 40],
    genre: const [Genre(id: 1, name: 'Action')],
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

  test('should be a subclass of TvSeries entity', () async {
    expect(tTvSeriesModel, isA<TvSeries>());
    expect(tTvSeries, isA<TvSeries>());
  });
}
