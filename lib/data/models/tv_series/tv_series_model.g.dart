// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesModel _$TvSeriesModelFromJson(Map<String, dynamic> json) =>
    TvSeriesModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdropPath'] as String?,
      episodeRunTime: (json['episodeRunTime'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      firstAirDate: json['firstAirDate'] == null
          ? null
          : DateTime.parse(json['firstAirDate'] as String),
      genre: (json['genre'] as List<dynamic>?)
              ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      inProduction: json['inProduction'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['lastAirDate'] == null
          ? null
          : DateTime.parse(json['lastAirDate'] as String),
      name: json['name'] as String?,
      nextEpisodeToAir: json['nextEpisodeToAir'],
      numberOfEpisodes: json['numberOfEpisodes'] as int?,
      numberOfSeasons: json['numberOfSeasons'] as int?,
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['originalLanguage'] as String?,
      originalName: json['originalName'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      season: (json['season'] as List<dynamic>?)
              ?.map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      type: json['type'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
    );

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
      airDate: json['airDate'] == null
          ? null
          : DateTime.parse(json['airDate'] as String),
      episodeCount: json['episodeCount'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      seasonNumber: json['seasonNumber'] as int?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    );

GenresModel _$GenresModelFromJson(Map<String, dynamic> json) => GenresModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
