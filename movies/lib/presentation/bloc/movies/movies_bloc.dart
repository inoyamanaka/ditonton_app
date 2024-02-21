// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:movies/domain/usecases/search_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class OnTheAirMovieBloc extends Bloc<MovieEvent, MovieState> {
  OnTheAirMovieBloc(this.getNowPlayingMovies) : super(MovieInitial()) {
    on<OnTheAirMovieEvent>((event, emit) async {
      emit(OnTheAirMovieLoading());
      final failureOrSuccess = await getNowPlayingMovies.execute();
      failureOrSuccess.fold(
        (error) => emit(OnTheAirMovieFailure(error.message)),
        (data) => emit(OnTheAirMovieSuccess(data)),
      );
    });
  }
  final GetNowPlayingMovies getNowPlayingMovies;
}

class PopularMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieBloc(
    this.getPopularMovies,
  ) : super(MovieInitial()) {
    on<PopularMovieEvent>((event, emit) async {
      emit(const PopularMovieLoading());
      final failureOrSuccess = await getPopularMovies.execute();
      failureOrSuccess.fold(
        (error) => emit(PopularMovieFailure(error.message)),
        (data) => emit(PopularMovieSuccess(data)),
      );
    });
  }
}

class MovieTopRatedBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRatedMovies getTopRatedMovies;

  MovieTopRatedBloc(
    this.getTopRatedMovies,
  ) : super(MovieInitial()) {
    on<MovieTopRatedEvent>((event, emit) async {
      emit(MovieTopRatedLoading());
      final failureOrSuccess = await getTopRatedMovies.execute();
      failureOrSuccess.fold(
        (error) => emit(MovieTopRatedFailure(error.message)),
        (data) => emit(MovieTopRatedSuccess(data)),
      );
    });
  }
}

class DetailMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieDetail getMovieDetail;

  DetailMovieBloc(
    this.getMovieDetail,
  ) : super(MovieInitial()) {
    on<DetailMovieEvent>((event, emit) async {
      emit(DetailMovieLoading());
      final failureOrSuccess = await getMovieDetail.execute(event.id);
      failureOrSuccess.fold(
        (error) => emit(DetailMovieFailure(error.message)),
        (data) => emit(DetailMovieSuccess(data)),
      );
    });
  }
}

class RecommendationMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieRecommendations getMovieRecommendations;

  RecommendationMovieBloc(
    this.getMovieRecommendations,
  ) : super(MovieInitial()) {
    on<RecommendationMovieEvent>((event, emit) async {
      emit(RecommendationMovieLoading());
      final failureOrSuccess = await getMovieRecommendations.execute(event.id);
      failureOrSuccess.fold(
        (error) => emit(RecommendationMovieFailure(error.message)),
        (data) => emit(RecommendationMovieSuccess(data)),
      );
    });
  }
}

class SearchMovieBloc extends Bloc<MovieEvent, MovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc(
    this.searchMovies,
  ) : super(MovieInitial()) {
    on<SearchMovieEvent>((event, emit) async {
      emit(SearchMovieLoading());
      final failureOrSuccess = await searchMovies.execute(event.query);
      failureOrSuccess.fold(
        (error) => emit(SearchMovieFailure(error.message)),
        (data) => emit(SearchMovieSuccess(data)),
      );
    });
  }
}

class MovieStatusWatchListBloc extends Bloc<MovieEvent, MovieState> {
  final GetWatchListStatus getWatchListStatus;

  MovieStatusWatchListBloc(
    this.getWatchListStatus,
  ) : super(MovieInitial()) {
    on<StatusWatchListMovieEvent>((event, emit) async {
      emit(StatusWatchListMovieLoading());
      final failureOrSuccess = await getWatchListStatus.execute(event.id);
      if (failureOrSuccess == false) {
        emit(const StatusWatchListMovieFailure('Terjadi Error'));
      } else {
        emit(const StatusWatchListMovieSuccess(true));
      }
    });
  }
}

class InsertWatchListMovieBloc extends Bloc<MovieEvent, MovieState> {
  final SaveWatchlist saveWatchlistTvSeries;

  InsertWatchListMovieBloc(
    this.saveWatchlistTvSeries,
  ) : super(MovieInitial()) {
    on<InsertWatchListMovieEvent>((event, emit) async {
      emit(InsertWatchListMovieLoading());
      final failureOrSuccess =
          await saveWatchlistTvSeries.execute(event.series);
      failureOrSuccess.fold(
        (error) => emit(InsertWatchListMovieFailure(error.message)),
        (data) => emit(InsertWatchListMovieSuccess(data)),
      );
    });
  }
}

class GetWatchListMovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetWatchlistMovies getWatchlistMovies;

  GetWatchListMovieBloc(
    this.getWatchlistMovies,
  ) : super(MovieInitial()) {
    on<GetWatchListMovieEvent>((event, emit) async {
      emit(GetWatchListMovieLoading());
      final failureOrSuccess = await getWatchlistMovies.execute();
      failureOrSuccess.fold(
        (error) => emit(GetWatchListMovieFailure(error.message)),
        (data) => emit(GetWatchListMovieSuccess(data)),
      );
    });
  }
}

class RemoveWatchListMovieBloc extends Bloc<MovieEvent, MovieState> {
  final RemoveWatchlist removeWatchlist;

  RemoveWatchListMovieBloc(
    this.removeWatchlist,
  ) : super(MovieInitial()) {
    on<RemoveWatchListMovieEvent>((event, emit) async {
      emit(RemoveWatchListMovieLoading());
      final failureOrSuccess = await removeWatchlist.execute(event.series);
      failureOrSuccess.fold(
        (error) => emit(RemoveWatchListMovieFailure(error.message)),
        (data) => emit(RemoveWatchListMovieSuccess(data)),
      );
    });
  }
}
