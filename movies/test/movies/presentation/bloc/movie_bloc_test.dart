import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockSearchMovies mockSearchMovies;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockRemoveWatchlist mockRemoveWatchlist;

  late RecommendationMovieBloc recommendationMovieBloc;
  late OnTheAirMovieBloc onTheAirMovieBloc;
  late PopularMovieBloc popularMovieBloc;
  late MovieTopRatedBloc movieTopRatedBloc;
  late DetailMovieBloc detailMovieBloc;
  late SearchMovieBloc searchMovieBloc;
  late MovieStatusWatchListBloc movieStatusWatchListBloc;
  late InsertWatchListMovieBloc insertWatchListMovieBloc;
  late GetWatchListMovieBloc getWatchListMovieBloc;
  late RemoveWatchListMovieBloc removeWatchListMovieBloc;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetMovieDetail = MockGetMovieDetail();
    mockSearchMovies = MockSearchMovies();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockRemoveWatchlist = MockRemoveWatchlist();

    recommendationMovieBloc =
        RecommendationMovieBloc(mockGetMovieRecommendations);
    onTheAirMovieBloc = OnTheAirMovieBloc(mockGetNowPlayingMovies);
    popularMovieBloc = PopularMovieBloc(mockGetPopularMovies);
    movieTopRatedBloc = MovieTopRatedBloc(mockGetTopRatedMovies);
    detailMovieBloc = DetailMovieBloc(mockGetMovieDetail);
    searchMovieBloc = SearchMovieBloc(mockSearchMovies);
    movieStatusWatchListBloc = MovieStatusWatchListBloc(mockGetWatchListStatus);
    insertWatchListMovieBloc = InsertWatchListMovieBloc(mockSaveWatchlist);
    getWatchListMovieBloc = GetWatchListMovieBloc(mockGetWatchlistMovies);
    removeWatchListMovieBloc = RemoveWatchListMovieBloc(mockRemoveWatchlist);
  });

  group("Get On The Air Movie", () {
    final testMovie = <Movie>[];

    test('InitialState should be Empty', () {
      expect(onTheAirMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Right([]));

      return onTheAirMovieBloc;
    }, act: (bloc) {
      return bloc.add(const OnTheAirMovieEvent());
    }, expect: () {
      return [OnTheAirMovieLoading(), OnTheAirMovieSuccess(testMovie)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return onTheAirMovieBloc;
    }, act: (bloc) {
      return bloc.add(const OnTheAirMovieEvent());
    }, expect: () {
      return [
        OnTheAirMovieLoading(),
        const OnTheAirMovieFailure("Server Failure")
      ];
    });
  });

  group("Get Popular Movies", () {
    final testPopularMovies =
        <Movie>[]; // Ganti ini dengan daftar Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(popularMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Right([]));

      return popularMovieBloc;
    }, act: (bloc) {
      return bloc.add(const PopularMovieEvent());
    }, expect: () {
      return [
        const PopularMovieLoading(),
        PopularMovieSuccess(testPopularMovies)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return popularMovieBloc;
    }, act: (bloc) {
      return bloc.add(const PopularMovieEvent());
    }, expect: () {
      return [
        const PopularMovieLoading(),
        const PopularMovieFailure("Server Failure")
      ];
    });
  });

  group("Get Top Rated Movies", () {
    final testTopRatedMovies =
        <Movie>[]; // Ganti dengan daftar Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(movieTopRatedBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Right([]));

      return movieTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(const MovieTopRatedEvent());
    }, expect: () {
      return [MovieTopRatedLoading(), MovieTopRatedSuccess(testTopRatedMovies)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return movieTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(const MovieTopRatedEvent());
    }, expect: () {
      return [
        MovieTopRatedLoading(),
        const MovieTopRatedFailure("Server Failure")
      ];
    });
  });
  // Bloc test untuk DetailMovieBloc
  group("Get Movie Detail", () {
    const movieDetail = testMovieDetail; // Ganti dengan objek Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(detailMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetMovieDetail.execute(any))
          .thenAnswer((_) async => const Right(movieDetail));

      return detailMovieBloc;
    }, act: (bloc) {
      return bloc.add(const DetailMovieEvent(1));
    }, expect: () {
      return [DetailMovieLoading(), const DetailMovieSuccess(movieDetail)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetMovieDetail.execute(any))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return detailMovieBloc;
    }, act: (bloc) {
      return bloc.add(const DetailMovieEvent(1));
    }, expect: () {
      return [DetailMovieLoading(), const DetailMovieFailure("Server Failure")];
    });
  });

  group("Get Movie Recommendations", () {
    final testRecommendations =
        <Movie>[]; // Ganti dengan daftar Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(recommendationMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetMovieRecommendations.execute(1))
          .thenAnswer((_) async => const Right([]));

      return recommendationMovieBloc;
    }, act: (bloc) {
      return bloc.add(const RecommendationMovieEvent(1));
    }, expect: () {
      return [
        RecommendationMovieLoading(),
        RecommendationMovieSuccess(testRecommendations)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetMovieRecommendations.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return recommendationMovieBloc;
    }, act: (bloc) {
      return bloc.add(const RecommendationMovieEvent(1));
    }, expect: () {
      return [
        RecommendationMovieLoading(),
        const RecommendationMovieFailure("Server Failure")
      ];
    });
  });

  // Bloc test untuk SearchMovieBloc
  group("Search Movies", () {
    final testSearchResults =
        <Movie>[]; // Ganti dengan daftar Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(searchMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockSearchMovies.execute(any))
          .thenAnswer((_) async => Right(testSearchResults));

      return searchMovieBloc;
    }, act: (bloc) {
      return bloc.add(const SearchMovieEvent("query"));
    }, expect: () {
      return [SearchMovieLoading(), SearchMovieSuccess(testSearchResults)];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockSearchMovies.execute(any))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return searchMovieBloc;
    }, act: (bloc) {
      return bloc.add(const SearchMovieEvent("query"));
    }, expect: () {
      return [SearchMovieLoading(), const SearchMovieFailure("Server Failure")];
    });
  });

  // Bloc test untuk MovieStatusWatchListBloc
  group("Get Movie Watchlist Status", () {
    const testWatchListStatus =
        false; // Ganti dengan nilai status watchlist yang sesuai

    test('InitialState should be Empty', () {
      expect(movieStatusWatchListBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetWatchListStatus.execute(1)).thenAnswer((_) async => true);

      return movieStatusWatchListBloc;
    }, act: (bloc) {
      return bloc.add(const StatusWatchListMovieEvent(1));
    }, expect: () {
      return [
        StatusWatchListMovieLoading(),
        const StatusWatchListMovieSuccess(testWatchListStatus)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetWatchListStatus.execute(1)).thenAnswer((_) async => false);

      return movieStatusWatchListBloc;
    }, act: (bloc) {
      return bloc.add(const StatusWatchListMovieEvent(1));
    }, expect: () {
      return [
        StatusWatchListMovieLoading(),
        const StatusWatchListMovieFailure("Server Failure")
      ];
    });
  });

  // Bloc test untuk InsertWatchListMovieBloc
  group("Insert Movie to Watchlist", () {
    test('InitialState should be Empty', () {
      expect(insertWatchListMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockSaveWatchlist.execute(any))
          .thenAnswer((_) async => const Right('SUCCESS'));

      return insertWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const InsertWatchListMovieEvent(testMovieDetail));
    }, expect: () {
      return [
        InsertWatchListMovieLoading(),
        const InsertWatchListMovieSuccess('SUCCESS')
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockSaveWatchlist.execute(any))
          .thenAnswer((_) async => const Left(ServerFailure('ERROR')));

      return insertWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const InsertWatchListMovieEvent(testMovieDetail));
    }, expect: () {
      return [
        InsertWatchListMovieLoading(),
        const InsertWatchListMovieFailure("ERROR")
      ];
    });
  });

  group("Remove Watchlist Tv Series", () {
    test('InitialState should be Empty', () {
      expect(removeWatchListMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockRemoveWatchlist.execute(any))
          .thenAnswer((_) async => const Right('SUCCESS'));

      return removeWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const RemoveWatchListMovieEvent(testMovieDetail));
    }, expect: () {
      return [
        RemoveWatchListMovieLoading(),
        const RemoveWatchListMovieSuccess('SUCCESS')
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockRemoveWatchlist.execute(any))
          .thenAnswer((_) async => const Left(ServerFailure('ERROR')));

      return removeWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const RemoveWatchListMovieEvent(testMovieDetail));
    }, expect: () {
      return [
        RemoveWatchListMovieLoading(),
        const RemoveWatchListMovieFailure("ERROR")
      ];
    });
  });

  // Bloc test untuk GetWatchListMovieBloc
  group("Get Watchlist Movies", () {
    final testWatchListMovies =
        <Movie>[]; // Ganti dengan daftar Movie yang sesuai

    test('InitialState should be Empty', () {
      expect(getWatchListMovieBloc.state, MovieInitial());
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(testWatchListMovies));

      return getWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const GetWatchListMovieEvent());
    }, expect: () {
      return [
        GetWatchListMovieLoading(),
        GetWatchListMovieSuccess(testWatchListMovies)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));

      return getWatchListMovieBloc;
    }, act: (bloc) {
      return bloc.add(const GetWatchListMovieEvent());
    }, expect: () {
      return [
        GetWatchListMovieLoading(),
        const GetWatchListMovieFailure("Server Failure")
      ];
    });
  });
}
