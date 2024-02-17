// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesModel _$TvSeriesModelFromJson(Map<String, dynamic> json) =>
    TvSeriesModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      genre: (json['genre'] as List<dynamic>?)
              ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      inProduction: json['in_production'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['last_air_date'] == null
          ? null
          : DateTime.parse(json['last_air_date'] as String),
      name: json['name'] as String?,
      nextEpisodeToAir: json['next_episode_to_air'],
      numberOfEpisodes: json['number_of_episodes'] as int?,
      numberOfSeasons: json['number_of_seasons'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      season: (json['season'] as List<dynamic>?)
              ?.map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      type: json['type'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodeCount: json['episode_count'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

GenresModel _$GenresModelFromJson(Map<String, dynamic> json) => GenresModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );