import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_series_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TvSeriesModel extends TvSeries {
  TvSeriesModel(
      {required super.adult,
      required super.backdropPath,
      required super.episodeRunTime,
      required super.firstAirDate,
      required List<GenresModel> super.genre,
      required super.homepage,
      required super.id,
      required super.inProduction,
      required super.languages,
      required super.lastAirDate,
      required super.name,
      required super.nextEpisodeToAir,
      required super.numberOfEpisodes,
      required super.numberOfSeasons,
      required super.originCountry,
      required super.originalLanguage,
      required super.originalName,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required List<SeasonModel> super.season,
      required super.status,
      required super.tagline,
      required super.type,
      required super.voteAverage,
      required super.voteCount});

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SeasonModel extends Season {
  SeasonModel(
      {required super.airDate,
      required super.episodeCount,
      required super.id,
      required super.name,
      required super.overview,
      required super.posterPath,
      required super.seasonNumber,
      required super.voteAverage});

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GenresModel extends GenreTv {
  GenresModel({required super.id, required super.name});
  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      _$GenresModelFromJson(json);
}
