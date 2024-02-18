import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGettvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockTvSeriesOnTheAirUsecase mockTvSeriesOnTheAirUsecase;
  late MockTvSeriesPopularUsecase mockTvSeriesPopularUsecase;
  late MockTvSeriesTopRatedUsecase mockTvSeriesTopRatedUsecase;
  late MockTvSeriesDetailUsecase mockTvSeriesDetailUsecase;
  late MockSearchTvSeriesUsecase mockSearchTvSeriesUsecase;
  late MockGetStatusWatchlistTvSeries mockGetStatusWatchlistTvSeries;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  late RecommendationTvSeriesBloc tvSeriesRecommendationBloc;
  late OnTheAirTvSeriesBloc onTheAirTvSeriesBloc;
  late PopularTvSeriesBloc popularTvSeriesBlocl;
  late TvSeriesTopRatedBloc tvSeriesTopRatedBloc;
  late DetailTvSeriesBloc detailTvSeriesBloc;
  late SearchTvSeriesBloc searchTvSeriesBloc;
  late StatusWatchListBloc statusWatchListBloc;
  late InsertWatchListBloc insertWatchListBloc;
  late GetWatchListBloc getWatchListBloc;
  late RemoveWatchListBloc removeWatchListBloc;

  setUp(() {
    mockGetTvSeriesRecommendations = MockGettvSeriesRecommendations();
    mockTvSeriesOnTheAirUsecase = MockTvSeriesOnTheAirUsecase();
    mockTvSeriesPopularUsecase = MockTvSeriesPopularUsecase();
    mockTvSeriesTopRatedUsecase = MockTvSeriesTopRatedUsecase();
    mockTvSeriesDetailUsecase = MockTvSeriesDetailUsecase();
    mockSearchTvSeriesUsecase = MockSearchTvSeriesUsecase();
    mockGetStatusWatchlistTvSeries = MockGetStatusWatchlistTvSeries();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();

    tvSeriesRecommendationBloc =
        RecommendationTvSeriesBloc(mockGetTvSeriesRecommendations);
    onTheAirTvSeriesBloc = OnTheAirTvSeriesBloc(mockTvSeriesOnTheAirUsecase);
    popularTvSeriesBlocl = PopularTvSeriesBloc(mockTvSeriesPopularUsecase);
    tvSeriesTopRatedBloc = TvSeriesTopRatedBloc(mockTvSeriesTopRatedUsecase);
    detailTvSeriesBloc = DetailTvSeriesBloc(mockTvSeriesDetailUsecase);
    searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeriesUsecase);
    statusWatchListBloc = StatusWatchListBloc(mockGetStatusWatchlistTvSeries);
    insertWatchListBloc = InsertWatchListBloc(mockSaveWatchlistTvSeries);
    getWatchListBloc = GetWatchListBloc(mockGetWatchlistTvSeries);
    removeWatchListBloc = RemoveWatchListBloc(mockRemoveWatchlistTvSeries);
  });

  group("Get On The Air Tv Series", () {
    final testTvSeries = <TvSeries>[];

    test('InitialState should be Empty', () {
      expect(onTheAirTvSeriesBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockTvSeriesOnTheAirUsecase.execute())
          .thenAnswer((_) async => Right([]));

      return onTheAirTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(const OnTheAirTvSeriesEvent());
    }, expect: () {
      return [OnTheAirTvSeriesLoading(), OnTheAirTvSeriesSuccess(testTvSeries)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockTvSeriesOnTheAirUsecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return onTheAirTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(const OnTheAirTvSeriesEvent());
    }, expect: () {
      return [
        OnTheAirTvSeriesLoading(),
        OnTheAirTvSeriesFailure("Server Failure")
      ];
    });
  });

  group("Get Popular Tv Series", () {
    final testTvSeries = <TvSeries>[];

    test('InitialState should be Empty', () {
      expect(popularTvSeriesBlocl.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockTvSeriesPopularUsecase.execute())
          .thenAnswer((_) async => Right([]));

      return popularTvSeriesBlocl;
    }, act: (bloc) {
      return bloc.add(const PopularTvSeriesEvent());
    }, expect: () {
      return [PopularTvSeriesLoading(), PopularTvSeriesSuccess(testTvSeries)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockTvSeriesPopularUsecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return popularTvSeriesBlocl;
    }, act: (bloc) {
      return bloc.add(const PopularTvSeriesEvent());
    }, expect: () {
      return [
        PopularTvSeriesLoading(),
        PopularTvSeriesFailure("Server Failure")
      ];
    });
  });

  group("Get Top Rated Tv Series", () {
    final testTvSeries = <TvSeries>[];

    test('InitialState should be Empty', () {
      expect(tvSeriesTopRatedBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockTvSeriesTopRatedUsecase.execute())
          .thenAnswer((_) async => Right([]));

      return tvSeriesTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(const TvSeriesTopRatedEvent());
    }, expect: () {
      return [TvSeriesTopRatedLoading(), TvSeriesTopRatedSuccess(testTvSeries)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockTvSeriesTopRatedUsecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(const TvSeriesTopRatedEvent());
    }, expect: () {
      return [
        TvSeriesTopRatedLoading(),
        TvSeriesTopRatedFailure("Server Failure")
      ];
    });
  });

  group("Get Tv Series Detail", () {
    final testTvSeries = tTvSeriesDetail;

    test('InitialState should be Empty', () {
      expect(detailTvSeriesBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockTvSeriesDetailUsecase.execute(any))
          .thenAnswer((_) async => Right(testTvSeries));

      return detailTvSeriesBloc;
    }, act: (bloc) {
      return bloc
          .add(DetailTvSeriesEvent(5678)); // assuming 1 is the TV series ID
    }, expect: () {
      return [DetailTvSeriesLoading(), DetailTvSeriesSuccess(testTvSeries)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockTvSeriesDetailUsecase.execute(any))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return detailTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(DetailTvSeriesEvent(1));
    }, expect: () {
      return [DetailTvSeriesLoading(), DetailTvSeriesFailure("Server Failure")];
    });
  });

  group("Get Recommendation Movie", () {
    const tId = 1;

    final testTvSeries = <TvSeries>[];

    test('InitialState should be Empty', () {
      expect(tvSeriesRecommendationBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right([]));

      return tvSeriesRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const RecommendationTvSeriesEvent(tId));
    }, expect: () {
      return [
        RecommendationTvSeriesLoading(),
        RecommendationTvSeriesSuccess(testTvSeries)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const RecommendationTvSeriesEvent(tId));
    }, expect: () {
      return [
        RecommendationTvSeriesLoading(),
        RecommendationTvSeriesFailure("Server Failure")
      ];
    });
  });

  group("Search Tv Series", () {
    final testTvSeriesList = <TvSeries>[];

    test('InitialState should be Empty', () {
      expect(searchTvSeriesBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockSearchTvSeriesUsecase.execute(any))
          .thenAnswer((_) async => Right(testTvSeriesList));

      return searchTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(
          SearchTvSeriesEvent("query")); // assuming "query" is the search query
    }, expect: () {
      return [SearchTvSeriesLoading(), SearchTvSeriesSuccess(testTvSeriesList)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockSearchTvSeriesUsecase.execute(any))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return searchTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(SearchTvSeriesEvent("query"));
    }, expect: () {
      return [SearchTvSeriesLoading(), SearchTvSeriesFailure("Server Failure")];
    });
  });

  group("Status Watchlist Tv Series", () {
    const tId = 1;

    test('InitialState should be Empty', () {
      expect(statusWatchListBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetStatusWatchlistTvSeries.execute(tId))
          .thenAnswer((_) async => true);

      return statusWatchListBloc;
    }, act: (bloc) {
      return bloc.add(
          StatusWatchListTvSeriesEvent(1)); // assuming 1 is the TV series ID
    }, expect: () {
      return [
        StatusWatchListTvSeriesLoading(),
        StatusWatchListTvSeriesSuccess(true)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetStatusWatchlistTvSeries.execute(tId))
          .thenAnswer((_) async => false);

      return statusWatchListBloc;
    }, act: (bloc) {
      return bloc.add(StatusWatchListTvSeriesEvent(1));
    }, expect: () {
      return [
        StatusWatchListTvSeriesLoading(),
        StatusWatchListTvSeriesFailure("Databse Failure")
      ];
    });
  });

  group("Insert Watchlist Tv Series", () {
    test('InitialState should be Empty', () {
      expect(insertWatchListBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockSaveWatchlistTvSeries.execute(any))
          .thenAnswer((_) async => Right('SUCCESS'));

      return insertWatchListBloc;
    }, act: (bloc) {
      return bloc.add(InsertWatchListTvSeriesEvent(
          tTvSeriesDetail)); // assuming 1 is the TV series ID
    }, expect: () {
      return [
        InsertWatchListTvSeriesLoading(),
        InsertWatchListTvSeriesSuccess('SUCCESS')
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockSaveWatchlistTvSeries.execute(any))
          .thenAnswer((_) async => Left(ServerFailure('ERROR')));

      return insertWatchListBloc;
    }, act: (bloc) {
      return bloc.add(InsertWatchListTvSeriesEvent(
          tTvSeriesDetail)); // assuming 1 is the TV series ID
    }, expect: () {
      return [
        InsertWatchListTvSeriesLoading(),
        InsertWatchListTvSeriesFailure('ERROR')
      ];
    });
  });

  group("Remove Watchlist Tv Series", () {
    test('InitialState should be Empty', () {
      expect(removeWatchListBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockRemoveWatchlistTvSeries.execute(any))
          .thenAnswer((_) async => Right('SUCCESS'));

      return removeWatchListBloc;
    }, act: (bloc) {
      return bloc.add(RemoveWatchListTvSeriesEvent(
          tTvSeriesDetail)); // assuming 1 is the TV series ID
    }, expect: () {
      return [
        RemoveWatchListTvSeriesLoading(),
        RemoveWatchListTvSeriesSuccess('SUCCESS')
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockRemoveWatchlistTvSeries.execute(any))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return removeWatchListBloc;
    }, act: (bloc) {
      return bloc.add(RemoveWatchListTvSeriesEvent(tTvSeriesDetail));
    }, expect: () {
      return [
        RemoveWatchListTvSeriesLoading(),
        RemoveWatchListTvSeriesFailure("Server Failure")
      ];
    });
  });

  group("Get Watchlist Tv Series", () {
    final testWatchlist =
        <TvSeries>[]; // Replace with the actual list of watchlist items

    test('InitialState should be Empty', () {
      expect(getWatchListBloc.state, TvSeriesInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Right(testWatchlist));

      return getWatchListBloc;
    }, act: (bloc) {
      return bloc.add(GetWatchListTvSeriesEvent());
    }, expect: () {
      return [
        GetWatchListTvSeriesLoading(),
        GetWatchListTvSeriesSuccess(testWatchlist)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return getWatchListBloc;
    }, act: (bloc) {
      return bloc.add(GetWatchListTvSeriesEvent());
    }, expect: () {
      return [
        GetWatchListTvSeriesLoading(),
        GetWatchListTvSeriesFailure("Server Failure")
      ];
    });
  });
}
