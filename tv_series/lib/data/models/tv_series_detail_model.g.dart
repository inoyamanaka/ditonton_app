// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesDetailModel _$TvSeriesDetailModelFromJson(Map<String, dynamic> json) =>
    TvSeriesDetailModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
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
      seasons: (json['seasons'] as List<dynamic>?)
              ?.map((e) => SeasonTvModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      type: json['type'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) => GenreModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
