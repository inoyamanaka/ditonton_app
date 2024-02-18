// ignore_for_file: unnecessary_question_mark

import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  bool? adult;
  String? backdropPath;
  List<int>? episodeRunTime;
  DateTime? firstAirDate;
  List<GenreTv>? genre;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  DateTime? lastAirDate;
  String? name;
  dynamic? nextEpisodeToAir;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  TvSeries({
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
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
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
