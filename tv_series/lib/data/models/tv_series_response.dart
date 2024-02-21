import 'package:equatable/equatable.dart';
import 'package:tv_series/data/models/tv_series_model.dart';

class TvSeriesResponse extends Equatable {
  const TvSeriesResponse({required this.tvSeriesList});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) {
    List<TvSeriesModel> tvSeriesList = (json['results'] as List)
        .map((e) => TvSeriesModel.fromJson(e as Map<String, dynamic>))
        .where((element) => element.overview != '')
        .toList();

    return TvSeriesResponse(
        tvSeriesList: tvSeriesList.isEmpty ? null : tvSeriesList);
  }

  final List<TvSeriesModel>? tvSeriesList;

  @override
  List<Object?> get props => [tvSeriesList];
}
