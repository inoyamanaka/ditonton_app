// ignore_for_file: unnecessary_question_mark

import 'package:ditonton/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreTv>? genre;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final DateTime? lastAirDate;
  final String? name;
  final dynamic? nextEpisodeToAir;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<Season?>? season;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  const TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genre,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.nextEpisodeToAir,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.season,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genre,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        name,
        nextEpisodeToAir,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        season,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}

class GenreTv extends Equatable {
  GenreTv({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
