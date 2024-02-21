part of 'movies_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class OnTheAirMovieEvent extends MovieEvent {
  const OnTheAirMovieEvent();
}

class PopularMovieEvent extends MovieEvent {
  const PopularMovieEvent();
}

class MovieTopRatedEvent extends MovieEvent {
  const MovieTopRatedEvent();
}

class DetailMovieEvent extends MovieEvent {
  const DetailMovieEvent(this.id);
  final int id;
}

class RecommendationMovieEvent extends MovieEvent {
  const RecommendationMovieEvent(this.id);
  final int id;
}

class SearchMovieEvent extends MovieEvent {
  const SearchMovieEvent(this.query);
  final String query;
}

class InsertWatchListMovieEvent extends MovieEvent {
  const InsertWatchListMovieEvent(this.series);
  final MovieDetail series;
}

class RemoveWatchListMovieEvent extends MovieEvent {
  const RemoveWatchListMovieEvent(this.series);
  final MovieDetail series;
}

class GetWatchListMovieEvent extends MovieEvent {
  const GetWatchListMovieEvent();
}

class StatusWatchListMovieEvent extends MovieEvent {
  final int id;
  const StatusWatchListMovieEvent(this.id);
}
