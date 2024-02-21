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
  const OnTheAirTvSeriesFailure(this.message);
}

final class OnTheAirTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  const OnTheAirTvSeriesSuccess(this.data);
}

// =========================================================
class PopularTvSeriesLoading extends TvSeriesState {
  const PopularTvSeriesLoading();
}

class PopularTvSeriesFailure extends TvSeriesState {
  final String message;
  const PopularTvSeriesFailure(this.message);
}

class PopularTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  const PopularTvSeriesSuccess(this.data);
}

// =========================================================
final class TvSeriesTopRatedLoading extends TvSeriesState {}

final class TvSeriesTopRatedFailure extends TvSeriesState {
  final String message;
  const TvSeriesTopRatedFailure(this.message);
}

final class TvSeriesTopRatedSuccess extends TvSeriesState {
  final List<TvSeries> data;
  const TvSeriesTopRatedSuccess(this.data);
}

// =========================================================
final class DetailTvSeriesLoading extends TvSeriesState {}

final class DetailTvSeriesFailure extends TvSeriesState {
  final String message;
  const DetailTvSeriesFailure(this.message);
}

final class DetailTvSeriesSuccess extends TvSeriesState {
  final TvSeriesDetail data;
  const DetailTvSeriesSuccess(this.data);
}

// =========================================================

final class RecommendationTvSeriesLoading extends TvSeriesState {}

final class RecommendationTvSeriesFailure extends TvSeriesState {
  final String message;
  const RecommendationTvSeriesFailure(this.message);
}

final class RecommendationTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  const RecommendationTvSeriesSuccess(this.data);
}

// =========================================================
final class SearchTvSeriesLoading extends TvSeriesState {}

final class SearchTvSeriesFailure extends TvSeriesState {
  final String message;
  const SearchTvSeriesFailure(this.message);
}

final class SearchTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;
  const SearchTvSeriesSuccess(this.data);
}

// =========================================================

final class InsertWatchListTvSeriesLoading extends TvSeriesState {}

final class InsertWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  const InsertWatchListTvSeriesFailure(this.message);
}

final class InsertWatchListTvSeriesSuccess extends TvSeriesState {
  final String data;

  const InsertWatchListTvSeriesSuccess(this.data);
}

final class RemoveWatchListTvSeriesLoading extends TvSeriesState {}

final class RemoveWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  const RemoveWatchListTvSeriesFailure(this.message);
}

final class RemoveWatchListTvSeriesSuccess extends TvSeriesState {
  final String data;

  const RemoveWatchListTvSeriesSuccess(this.data);
}

final class GetWatchListTvSeriesLoading extends TvSeriesState {}

final class GetWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  const GetWatchListTvSeriesFailure(this.message);
}

final class GetWatchListTvSeriesSuccess extends TvSeriesState {
  final List<TvSeries> data;

  const GetWatchListTvSeriesSuccess(this.data);
}

final class StatusWatchListTvSeriesLoading extends TvSeriesState {}

final class StatusWatchListTvSeriesFailure extends TvSeriesState {
  final String message;

  const StatusWatchListTvSeriesFailure(this.message);
}

final class StatusWatchListTvSeriesSuccess extends TvSeriesState {
  final bool status;

  const StatusWatchListTvSeriesSuccess(this.status);
}
