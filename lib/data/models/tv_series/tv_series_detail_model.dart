import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_series_detail_model.g.dart';

@JsonSerializable(
    createToJson: false, fieldRename: FieldRename.snake, includeIfNull: false)
class TvSeriesDetailModel extends TvSeriesDetail {
  TvSeriesDetailModel(
      {required super.adult,
      required super.backdropPath,
      required List<CreatedByModel> super.createdBy,
      required super.episodeRunTime,
      required super.firstAirDate,
      required List<GenreModel> super.genres,
      required super.homepage,
      required super.id,
      required super.inProduction,
      required super.languages,
      required super.lastAirDate,
      required LastEpisodeToAirModel super.lastEpisodeToAir,
      required super.name,
      required super.nextEpisodeToAir,
      required List<NetworkModel> super.networks,
      required super.numberOfEpisodes,
      required super.numberOfSeasons,
      required super.originCountry,
      required super.originalLanguage,
      required super.originalName,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required List<NetworkModel> super.productionCompanies,
      required List<ProductionCountryModel> super.productionCountries,
      required List<SeasonTvModel> super.seasons,
      required List<SpokenLanguageModel> super.spokenLanguages,
      required super.status,
      required super.tagline,
      required super.type,
      required super.voteAverage,
      required super.voteCount});

  factory TvSeriesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesDetailModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CreatedByModel extends CreatedBy {
  CreatedByModel(
      {required super.id,
      required super.creditId,
      required super.name,
      required super.gender,
      required super.profilePath});

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class NetworkModel extends NetworkTv {
  NetworkModel(
      {required super.id,
      required super.logoPath,
      required super.name,
      required super.originCountry});

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GenreModel extends GenreTv {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LastEpisodeToAirModel extends LastEpisodeToAir {
  LastEpisodeToAirModel(
      {required super.id,
      required super.name,
      required super.overview,
      required super.voteAverage,
      required super.voteCount,
      required super.airDate,
      required super.episodeNumber,
      required super.productionCode,
      required super.runtime,
      required super.seasonNumber,
      required super.showId,
      required super.stillPath});

  factory LastEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({required super.iso31661, required super.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SeasonTvModel extends Season {
  SeasonTvModel(
      {required super.airDate,
      required super.episodeCount,
      required super.id,
      required super.name,
      required super.overview,
      required super.posterPath,
      required super.seasonNumber,
      required super.voteAverage});

  factory SeasonTvModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonTvModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel(
      {required super.englishName,
      required super.iso6391,
      required super.name});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);
}
