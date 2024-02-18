import 'package:ditonton/domain/entities/season.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

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
