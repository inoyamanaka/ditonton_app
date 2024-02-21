part of 'movies_bloc.dart';

class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class OnTheAirMovieLoading extends MovieState {}

final class OnTheAirMovieFailure extends MovieState {
  final String message;
  const OnTheAirMovieFailure(this.message);
}

final class OnTheAirMovieSuccess extends MovieState {
  final List<Movie> data;
  const OnTheAirMovieSuccess(this.data);
}

// =========================================================
class PopularMovieLoading extends MovieState {
  const PopularMovieLoading();
}

class PopularMovieFailure extends MovieState {
  final String message;
  const PopularMovieFailure(this.message);
}

class PopularMovieSuccess extends MovieState {
  final List<Movie> data;
  const PopularMovieSuccess(this.data);
}

// =========================================================
final class MovieTopRatedLoading extends MovieState {}

final class MovieTopRatedFailure extends MovieState {
  final String message;
  const MovieTopRatedFailure(this.message);
}

final class MovieTopRatedSuccess extends MovieState {
  final List<Movie> data;
  const MovieTopRatedSuccess(this.data);
}

// =========================================================
final class DetailMovieLoading extends MovieState {}

final class DetailMovieFailure extends MovieState {
  final String message;
  const DetailMovieFailure(this.message);
}

final class DetailMovieSuccess extends MovieState {
  final MovieDetail data;
  const DetailMovieSuccess(this.data);
}

// =========================================================

final class RecommendationMovieLoading extends MovieState {}

final class RecommendationMovieFailure extends MovieState {
  final String message;
  const RecommendationMovieFailure(this.message);
}

final class RecommendationMovieSuccess extends MovieState {
  final List<Movie> data;
  const RecommendationMovieSuccess(this.data);
}

// =========================================================
final class SearchMovieLoading extends MovieState {}

final class SearchMovieFailure extends MovieState {
  final String message;
  const SearchMovieFailure(this.message);
}

final class SearchMovieSuccess extends MovieState {
  final List<Movie> data;
  const SearchMovieSuccess(this.data);
}

// =========================================================

final class InsertWatchListMovieLoading extends MovieState {}

final class InsertWatchListMovieFailure extends MovieState {
  final String message;

  const InsertWatchListMovieFailure(this.message);
}

final class InsertWatchListMovieSuccess extends MovieState {
  final String data;

  const InsertWatchListMovieSuccess(this.data);
}

final class RemoveWatchListMovieLoading extends MovieState {}

final class RemoveWatchListMovieFailure extends MovieState {
  final String message;

  const RemoveWatchListMovieFailure(this.message);
}

final class RemoveWatchListMovieSuccess extends MovieState {
  final String data;

  const RemoveWatchListMovieSuccess(this.data);
}

final class GetWatchListMovieLoading extends MovieState {}

final class GetWatchListMovieFailure extends MovieState {
  final String message;

  const GetWatchListMovieFailure(this.message);
}

final class GetWatchListMovieSuccess extends MovieState {
  final List<Movie> data;

  const GetWatchListMovieSuccess(this.data);
}

final class StatusWatchListMovieLoading extends MovieState {}

final class StatusWatchListMovieFailure extends MovieState {
  final String message;

  const StatusWatchListMovieFailure(this.message);
}

final class StatusWatchListMovieSuccess extends MovieState {
  final bool status;

  const StatusWatchListMovieSuccess(this.status);
}
