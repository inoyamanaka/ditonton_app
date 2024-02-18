import 'package:ditonton/data/models/tv_series/season_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final tTvSeries = TvSeries(
  adult: false,
  backdropPath: '/backdrop_path.jpg',
  episodeRunTime: [30, 60],
  genre: [Genre(id: 1, name: 'Action')],
  homepage: 'https://example.com',
  id: 56789,
  inProduction: true,
  languages: ['English'],
  name: 'Test Series',
  nextEpisodeToAir: null,
  numberOfEpisodes: 10,
  numberOfSeasons: 2,
  originCountry: ['US'],
  originalLanguage: 'en',
  originalName: 'Original Dummy Tv Series',
  overview: 'Test overview',
  popularity: 123.45,
  posterPath: '/test_poster_path.jpg',
  status: 'Running',
  tagline: 'Tagline of Dummy Tv Series',
  type: 'Scripted',
  voteAverage: 8.5,
  voteCount: 100,
);

final tTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: "/backdrop_path.jpg",
  episodeRunTime: [30, 60],
  firstAirDate: DateTime.parse("2022-12-31"),
  genres: [
    GenreModel(
      id: 1,
      name: "Action",
    ),
  ],
  homepage: "http://example.com",
  id: 56789,
  inProduction: true,
  languages: ["English"],
  lastAirDate: DateTime.parse("2022-12-31"),

  name: "TestSeries",
  nextEpisodeToAir: null, // Isi sesuai kebutuhan
  numberOfEpisodes: 10,
  numberOfSeasons: 2,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "Original Dummy Tv Series",
  overview: "This is an example TV series.",
  popularity: 123.45,
  posterPath: "/test_poster_path.jpg",
  status: "Running",
  tagline: "Tagline of Dummy Tv Series",
  type: "Scripted",
  voteAverage: 8.5,
  voteCount: 100,
  seasons: [
    Season(
      airDate: DateTime.parse("2022-01-01"),
      episodeCount: 10,
      id: 1234,
      name: "Season 1",
      overview: "Overview for Season 1",
      posterPath: "/example_season_poster.jpg",
      seasonNumber: 1,
      voteAverage: 8.0,
    ),
    Season(
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
);

final tTvSeriesDetailModel = TvSeriesDetailModel(
  adult: false,
  backdropPath: "/example_backdrop_path.jpg",
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
  id: 56789,
  inProduction: true,
  languages: ["English", "Spanish"],
  lastAirDate: DateTime.parse("2023-12-31"),

  name: "Example TV Series",
  nextEpisodeToAir: null, // Isi sesuai kebutuhan

  numberOfEpisodes: 20,
  numberOfSeasons: 2,
  originCountry: ["US"],
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
);

final tvSeriesTable = TvSeriesTable(
  id: 12345,
  title: "Example TV Series",
  posterPath: "/example_poster_path.jpg",
  overview: "This is an example TV series.",
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 12345,
  name: 'Example TV Series',
  posterPath: '/example_poster_path.jpg',
  overview: 'This is an example TV series.',
);

final testWatchlistTvSeriesList = [testWatchlistTvSeries];
final testTvSeriesMap = {
  'id': 12345,
  'title': "Example TV Series",
  'overview': "This is an example TV series.",
  'posterPath': "/example_poster_path.jpg",
};
