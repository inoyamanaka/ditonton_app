import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_table.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final tTvSeries = TvSeries(
  adult: false,
  backdropPath: '/backdrop_path.jpg',
  episodeRunTime: [30, 60],
  firstAirDate: DateTime.parse('2022-01-01'),
  genre: [GenreTv(id: 1, name: 'Action')],
  homepage: 'https://example.com',
  id: 1,
  inProduction: true,
  languages: ['English'],
  lastAirDate: DateTime.parse('2022-12-31'),
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
  season: [],
  status: 'Running',
  tagline: 'Tagline of Dummy Tv Series',
  type: 'Scripted',
  voteAverage: 8.5,
  voteCount: 100,
);

final tTvSeriesDetail = TvSeriesDetail(
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
  id: 56789,
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

final tTvSeriesDetailModel = TvSeriesDetailModel(
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
  id: 56789,
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
