part of 'tv_series_bloc.dart';

sealed class TvSeriesEvent extends Equatable {
  const TvSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnTheAirTvSeriesEvent extends TvSeriesEvent {
  const OnTheAirTvSeriesEvent();
}

class PopularTvSeriesEvent extends TvSeriesEvent {
  const PopularTvSeriesEvent();
}

class TvSeriesTopRatedEvent extends TvSeriesEvent {
  const TvSeriesTopRatedEvent();
}

class DetailTvSeriesEvent extends TvSeriesEvent {
  const DetailTvSeriesEvent(this.id);
  final int id;
}

class RecommendationTvSeriesEvent extends TvSeriesEvent {
  const RecommendationTvSeriesEvent(this.id);
  final int id;
}

class SearchTvSeriesEvent extends TvSeriesEvent {
  const SearchTvSeriesEvent(this.query);
  final String query;
}

class InsertWatchListTvSeriesEvent extends TvSeriesEvent {
  const InsertWatchListTvSeriesEvent(this.series);
  final TvSeriesDetail series;
}

class RemoveWatchListTvSeriesEvent extends TvSeriesEvent {
  const RemoveWatchListTvSeriesEvent(this.series);
  final TvSeriesDetail series;
}

class GetWatchListTvSeriesEvent extends TvSeriesEvent {
  const GetWatchListTvSeriesEvent();
}

class StatusWatchListTvSeriesEvent extends TvSeriesEvent {
  final int id;
  const StatusWatchListTvSeriesEvent(this.id);
}
