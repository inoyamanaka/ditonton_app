
import 'package:json_annotation/json_annotation.dart';
import 'package:tv_series/data/models/season_model.dart';
import 'package:tv_series/domain/entities/genre.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';

part 'tv_series_detail_model.g.dart';

@JsonSerializable(
    createToJson: false, fieldRename: FieldRename.snake, includeIfNull: false)
class TvSeriesDetailModel extends TvSeriesDetail {
  const TvSeriesDetailModel(
      {required super.adult,
      required super.backdropPath,
      required super.episodeRunTime,
      required super.firstAirDate,
      required List<GenreModel> super.genres,
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
      required List<SeasonTvModel> super.seasons,
      required super.status,
      required super.tagline,
      required super.type,
      required super.voteAverage,
      required super.voteCount});

  factory TvSeriesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesDetailModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GenreModel extends Genre {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}
