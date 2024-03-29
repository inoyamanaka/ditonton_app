// import 'package:ditonton/injection.dart' as di;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/pages/movie/movie_detail_page.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_movie_detail.dart';
import '../../../helpers/mock_movie_recommendation.dart';
import '../../../helpers/mock_status_movie_watch_list.dart';
import '../../../helpers/mock_watchlist_movie_insert.dart';
import '../../../helpers/mock_watchlist_movie_remove.dart';

void main() {
  late MockMovieRecommendationBloc mockMovieRecommendationBloc;
  registerFallbackValue(MockMovieRecommendationEvent);
  registerFallbackValue(MockMovieRecommendationState);

  late MockStatusMovieWatchListBloc mockWatchListStatusBloc;
  registerFallbackValue(MockStatusMovieWatchListEvent);
  registerFallbackValue(MockStatusMovieWatchListState);

  late MockMovieDetailBloc mockTvSeriesDetailBloc;
  registerFallbackValue(MockMovieDetailEvent);
  registerFallbackValue(MockMovieDetailState);

  late MockWatchlistInsertMovieBloc mockWatchlistInsertMovieBloc;
  registerFallbackValue(MockWatchlistMovieInsertEvent);
  registerFallbackValue(MockWatchlistInsertMovieState);

  late MockWatchlistRemoveMovieBloc mockWatchlistRemoveMovieBloc;
  registerFallbackValue(MockWatchlistMovieRemoveEvent);
  registerFallbackValue(MockWatchlistMovieRemoveState);

  setUp(() {
    mockMovieRecommendationBloc = MockMovieRecommendationBloc();
    mockWatchListStatusBloc = MockStatusMovieWatchListBloc();
    mockTvSeriesDetailBloc = MockMovieDetailBloc();
    mockWatchlistInsertMovieBloc = MockWatchlistInsertMovieBloc();
    mockWatchlistRemoveMovieBloc = MockWatchlistRemoveMovieBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailMovieBloc>(
          create: (context) => mockTvSeriesDetailBloc,
        ),
        BlocProvider<RecommendationMovieBloc>(
          create: (context) => mockMovieRecommendationBloc,
        ),
        BlocProvider<MovieStatusWatchListBloc>(
          create: (context) => mockWatchListStatusBloc,
        ),
        BlocProvider<InsertWatchListMovieBloc>(
          create: (context) => mockWatchlistInsertMovieBloc,
        ),
        BlocProvider<RemoveWatchListMovieBloc>(
          create: (context) => mockWatchlistRemoveMovieBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Watchlist detail widget', (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const DetailMovieSuccess(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const RecommendationMovieSuccess(<Movie>[]));
    when(() => mockWatchListStatusBloc.state)
        .thenReturn(const StatusWatchListMovieSuccess(true));
    when(() => mockWatchlistInsertMovieBloc.state)
        .thenReturn(const InsertWatchListMovieSuccess('SUCCESS ADD'));
    when(() => mockWatchlistRemoveMovieBloc.state)
        .thenReturn(const RemoveWatchListMovieSuccess('SUCCESS REMOVE'));

    final image = find.byType(CachedNetworkImage);
    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    final title = find.byKey(const Key("Title"));
    final genre = find.byKey(const Key("Genre"));
    final overView = find.byKey(const Key("OverView"));
    final movieRec = find.byKey(const Key("Recommend Movie"));

    expect(image, findsWidgets);
    expect(title, findsOneWidget);
    expect(genre, findsOneWidget);
    expect(overView, findsOneWidget);
    expect(movieRec, findsOneWidget);
  });
}
