// ignore_for_file: unnecessary_question_mark, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/genre.dart';

class TvSeries extends Equatable {
  bool? adult;
  String? backdropPath;
  List<int>? episodeRunTime;
  List<Genre>? genre;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
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
    required this.genre,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
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
        genre,
        homepage,
        id,
        inProduction,
        languages,
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
