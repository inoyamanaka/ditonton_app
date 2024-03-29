// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';
import 'package:tv_series/domain/usecases/get_detail_tv_series.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tv_series_.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_status_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendation.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class OnTheAirTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  OnTheAirTvSeriesBloc(this.tvSeriesOnTheAirUsecase)
      : super(TvSeriesInitial()) {
    on<OnTheAirTvSeriesEvent>((event, emit) async {
      emit(OnTheAirTvSeriesLoading());
      final failureOrSuccess = await tvSeriesOnTheAirUsecase.execute();
      failureOrSuccess.fold(
        (error) => emit(OnTheAirTvSeriesFailure(error.message)),
        (data) => emit(OnTheAirTvSeriesSuccess(data)),
      );
    });
  }
  final TvSeriesOnTheAirUsecase tvSeriesOnTheAirUsecase;
}

class PopularTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final TvSeriesPopularUsecase tvSeriesPopularUsecase;

  PopularTvSeriesBloc(
    this.tvSeriesPopularUsecase,
  ) : super(TvSeriesInitial()) {
    on<PopularTvSeriesEvent>((event, emit) async {
      emit(const PopularTvSeriesLoading());
      final failureOrSuccess = await tvSeriesPopularUsecase.execute();
      failureOrSuccess.fold(
        (error) => emit(PopularTvSeriesFailure(error.message)),
        (data) => emit(PopularTvSeriesSuccess(data)),
      );
    });
  }
}

class TvSeriesTopRatedBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final TvSeriesTopRatedUsecase tvSeriesTopRatedUsecase;

  TvSeriesTopRatedBloc(
    this.tvSeriesTopRatedUsecase,
  ) : super(TvSeriesInitial()) {
    on<TvSeriesTopRatedEvent>((event, emit) async {
      emit(TvSeriesTopRatedLoading());
      final failureOrSuccess = await tvSeriesTopRatedUsecase.execute();
      failureOrSuccess.fold(
        (error) => emit(TvSeriesTopRatedFailure(error.message)),
        (data) => emit(TvSeriesTopRatedSuccess(data)),
      );
    });
  }
}

class DetailTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final TvSeriesDetailUsecase tvSeriesDetailUsecase;

  DetailTvSeriesBloc(
    this.tvSeriesDetailUsecase,
  ) : super(TvSeriesInitial()) {
    on<DetailTvSeriesEvent>((event, emit) async {
      emit(DetailTvSeriesLoading());
      final failureOrSuccess = await tvSeriesDetailUsecase.execute(event.id);
      failureOrSuccess.fold(
        (error) => emit(DetailTvSeriesFailure(error.message)),
        (data) => emit(DetailTvSeriesSuccess(data)),
      );
    });
  }
}

class RecommendationTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GettvSeriesRecommendations gettvSeriesRecommendations;

  RecommendationTvSeriesBloc(
    this.gettvSeriesRecommendations,
  ) : super(TvSeriesInitial()) {
    on<RecommendationTvSeriesEvent>((event, emit) async {
      emit(RecommendationTvSeriesLoading());
      final failureOrSuccess =
          await gettvSeriesRecommendations.execute(event.id);
      failureOrSuccess.fold(
        (error) => emit(RecommendationTvSeriesFailure(error.message)),
        (data) => emit(RecommendationTvSeriesSuccess(data)),
      );
    });
  }
}

class SearchTvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final SearchTvSeriesUsecase searchTvSeriesUsecase;

  SearchTvSeriesBloc(
    this.searchTvSeriesUsecase,
  ) : super(TvSeriesInitial()) {
    on<SearchTvSeriesEvent>((event, emit) async {
      emit(SearchTvSeriesLoading());
      final failureOrSuccess = await searchTvSeriesUsecase.execute(event.query);
      failureOrSuccess.fold(
        (error) => emit(SearchTvSeriesFailure(error.message)),
        (data) => emit(SearchTvSeriesSuccess(data)),
      );
    });
  }
}

class StatusWatchListBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetStatusWatchlistTvSeries getStatusWatchlistTvSeries;

  StatusWatchListBloc(
    this.getStatusWatchlistTvSeries,
  ) : super(TvSeriesInitial()) {
    on<StatusWatchListTvSeriesEvent>((event, emit) async {
      emit(StatusWatchListTvSeriesLoading());
      final failureOrSuccess =
          await getStatusWatchlistTvSeries.execute(event.id);
      if (failureOrSuccess == false) {
        emit(const StatusWatchListTvSeriesFailure('Terjadi Error'));
      } else {
        emit(const StatusWatchListTvSeriesSuccess(true));
      }
    });
  }
}

class InsertWatchListBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final SaveWatchlistTvSeries saveWatchlistTvSeries;

  InsertWatchListBloc(
    this.saveWatchlistTvSeries,
  ) : super(TvSeriesInitial()) {
    on<InsertWatchListTvSeriesEvent>((event, emit) async {
      emit(InsertWatchListTvSeriesLoading());
      final failureOrSuccess =
          await saveWatchlistTvSeries.execute(event.series);
      failureOrSuccess.fold(
        (error) => emit(InsertWatchListTvSeriesFailure(error.message)),
        (data) => emit(InsertWatchListTvSeriesSuccess(data)),
      );
    });
  }
}

class GetWatchListBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetWatchlistTvSeries getWatchlistTvSeries;

  GetWatchListBloc(
    this.getWatchlistTvSeries,
  ) : super(TvSeriesInitial()) {
    on<GetWatchListTvSeriesEvent>((event, emit) async {
      emit(GetWatchListTvSeriesLoading());
      final failureOrSuccess = await getWatchlistTvSeries.execute();
      failureOrSuccess.fold(
        (error) => emit(GetWatchListTvSeriesFailure(error.message)),
        (data) => emit(GetWatchListTvSeriesSuccess(data)),
      );
    });
  }
}

class RemoveWatchListBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;

  RemoveWatchListBloc(
    this.removeWatchlistTvSeries,
  ) : super(TvSeriesInitial()) {
    on<RemoveWatchListTvSeriesEvent>((event, emit) async {
      emit(RemoveWatchListTvSeriesLoading());
      final failureOrSuccess =
          await removeWatchlistTvSeries.execute(event.series);
      failureOrSuccess.fold(
        (error) => emit(RemoveWatchListTvSeriesFailure(error.message)),
        (data) => emit(RemoveWatchListTvSeriesSuccess(data)),
      );
    });
  }
}
