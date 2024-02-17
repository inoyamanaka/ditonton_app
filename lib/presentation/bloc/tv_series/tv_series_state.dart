part of 'tv_series_bloc.dart';

class TvSeriesState extends Equatable {
  const TvSeriesState();

  @override
  List<Object> get props => [];
}

final class TvSeriesInitial extends TvSeriesState {}

final class OnTheAirTvSeriesLoading extends TvSeriesState {}

final class OnTheAirTvSeriesFailure extends TvSeriesState {
  final String message;
  OnTheAirTvSeriesFailure(this.message);
}

final class OnTheAirTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  OnTheAirTvSeriesSuccess(this.data);
}

// =========================================================
class PopularTvSeriesLoading extends TvSeriesState {
  const PopularTvSeriesLoading();
}

class PopularTvSeriesFailure extends TvSeriesState {
  final String message;
  PopularTvSeriesFailure(this.message);
}

class PopularTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  PopularTvSeriesSuccess(this.data);
}

// =========================================================
final class TopRatedTvSeriesLoading extends TvSeriesState {}

final class TopRatedTvSeriesFailure extends TvSeriesState {
  final String message;
  TopRatedTvSeriesFailure(this.message);
}

final class TopRatedTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  TopRatedTvSeriesSuccess(this.data);
}

// =========================================================
final class DetailTvSeriesLoading extends TvSeriesState {}

final class DetailTvSeriesFailure extends TvSeriesState {
  final String message;
  DetailTvSeriesFailure(this.message);
}

final class DetailTvSeriesSuccess extends TvSeriesState {
  final TvSeriesDetail data;
  DetailTvSeriesSuccess(this.data);
}

// =========================================================

final class RecommendationTvSeriesLoading extends TvSeriesState {}

final class RecommendationTvSeriesFailure extends TvSeriesState {
  final String message;
  RecommendationTvSeriesFailure(this.message);
}

final class RecommendationTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  RecommendationTvSeriesSuccess(this.data);
}

// =========================================================
final class SearchTvSeriesLoading extends TvSeriesState {}

final class SearchTvSeriesFailure extends TvSeriesState {
  final String message;
  SearchTvSeriesFailure(this.message);
}

final class SearchTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  SearchTvSeriesSuccess(this.data);
}

// =========================================================

final class InsertWatchListTvSeriesLoading extends TvSeriesState {}

final class InsertWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  InsertWatchListTvSeriesFailure(this.message);
}

final class InsertWatchListTvSeriesSuccess extends TvSeriesState {
  final String data;

  InsertWatchListTvSeriesSuccess(this.data);
}

final class RemoveWatchListTvSeriesLoading extends TvSeriesState {}

final class RemoveWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  RemoveWatchListTvSeriesFailure(this.message);
}

final class RemoveWatchListTvSeriesSuccess extends TvSeriesState {
  final String data;

  RemoveWatchListTvSeriesSuccess(this.data);
}

final class GetWatchListTvSeriesLoading extends TvSeriesState {}

final class GetWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  GetWatchListTvSeriesFailure(this.message);
}

final class GetWatchListTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;

  GetWatchListTvSeriesSuccess(this.data);
}

final class StatusWatchListTvSeriesLoading extends TvSeriesState {}

final class StatusWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  StatusWatchListTvSeriesFailure(this.message);
}

final class StatusWatchListTvSeriesSuccess extends TvSeriesState {
  final bool status;

  StatusWatchListTvSeriesSuccess(this.status);
}
