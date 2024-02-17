import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;


  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,

  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail series) => TvSeriesTable(
        id: series.id!,
        title: series.name,
        posterPath: series.posterPath,
        overview: series.overview,

      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      overview: map['overview'],

      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      
      };

  TvSeries toEntity() => TvSeries.watchlist(
      id: id,
      overview: overview,
      posterPath: posterPath,
      name: title,
      )
      ;

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
