import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../../helpers/mock_status_watch_list.dart';
import '../../../helpers/mock_tv_series_detail.dart';
import '../../../helpers/mock_tv_series_recommendation.dart';
import '../../../helpers/mock_watchlist_insert.dart';
import '../../../helpers/mock_watchlist_remove.dart';

void main() {
  di.init();

  late MockTvSeriesRecommendationBloc mockTvSeriesRecommendationBloc;
  registerFallbackValue(MockTvSeriesRecommendationEvent);
  registerFallbackValue(MockTvSeriesRecommendationState);

  late MockWatchListStatusBloc mockWatchListStatusBloc;
  registerFallbackValue(MockStatusWatchListEvent);
  registerFallbackValue(MockStatusWatchListState);

  late MockWatchlistInsertBloc mockWatchlistInsertBloc;
  registerFallbackValue(MockWatchlistInsertEvent);
  registerFallbackValue(MockWatchlistInsertState);

  late MockWatchlistRemoveBloc mockWatchlistRemoveBloc;
  registerFallbackValue(MockWatchlistRemoveEvent);
  registerFallbackValue(MockWatchlisRemoveState);

  late MockTvSeriesDetailBloc mockTvSeriesDetailBloc;
  registerFallbackValue(MockTvSeriesDetailEvent);
  registerFallbackValue(MockTvSeriesDetailState);

  setUpAll(() {
    mockTvSeriesRecommendationBloc = MockTvSeriesRecommendationBloc();
    mockWatchListStatusBloc = MockWatchListStatusBloc();
    mockWatchlistInsertBloc = MockWatchlistInsertBloc();
    mockWatchlistRemoveBloc = MockWatchlistRemoveBloc();
    mockTvSeriesDetailBloc = MockTvSeriesDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendationTvSeriesBloc>(
          create: (context) => mockTvSeriesRecommendationBloc,
        ),
        BlocProvider<StatusWatchListBloc>(
          create: (context) => mockWatchListStatusBloc,
        ),
        BlocProvider<InsertWatchListBloc>(
          create: (context) => mockWatchlistInsertBloc,
        ),
        BlocProvider<RemoveWatchListBloc>(
          create: (context) => mockWatchlistRemoveBloc,
        ),
        BlocProvider<DetailTvSeriesBloc>(
          create: (context) => mockTvSeriesDetailBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Watchlist button should display add icon',
      (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(DetailTvSeriesLoading());
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(DetailTvSeriesSuccess(tTvSeriesDetail));
    when(() => mockTvSeriesRecommendationBloc.state)
        .thenReturn(RecommendationTvSeriesLoading());
    when(() => mockWatchListStatusBloc.state)
        .thenReturn(StatusWatchListTvSeriesSuccess(true));

    final watchlistButtonIcon = find.byKey(const Key("icon"));

    // await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(
    //   id: 56789,
    // )));

    await tester.pumpWidget(_makeTestableWidget(DetailContent(tTvSeriesDetail,
        false, mockWatchlistInsertBloc, mockWatchlistRemoveBloc)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  // testWidgets('Watchlist button should display remove icon',
  //     (WidgetTester tester) async {
  //   when(() => mockTvSeriesDetailBloc.state)
  //       .thenReturn(DetailTvSeriesLoading());
  //   when(() => mockTvSeriesDetailBloc.state)
  //       .thenReturn(DetailTvSeriesSuccess(tTvSeriesDetail));
  //   when(() => mockTvSeriesRecommendationBloc.state)
  //       .thenReturn(RecommendationTvSeriesLoading());
  //   when(() => mockWatchListStatusBloc.state)
  //       .thenReturn(StatusWatchListTvSeriesSuccess(false));

  //   final watchlistButtonIcon = find.byKey(const Key("icon"));

  //   await mockNetworkImagesFor(
  //     () async {
  //       return await tester
  //           .pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 56789)));
  //     },
  //   );

  //   await tester.pumpWidget(_makeTestableWidget(DetailContent(tTvSeriesDetail,
  //       false, mockWatchlistInsertBloc, mockWatchlistRemoveBloc)));

  //   expect(watchlistButtonIcon, findsOneWidget);
  // });

  testWidgets('Watchlist detail widget', (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(DetailTvSeriesLoading());
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(DetailTvSeriesSuccess(tTvSeriesDetail));
    when(() => mockTvSeriesRecommendationBloc.state)
        .thenReturn(RecommendationTvSeriesLoading());
    when(() => mockWatchListStatusBloc.state)
        .thenReturn(StatusWatchListTvSeriesSuccess(true));

    final image = find.byType(DetailContent);
    final title = find.byKey(const Key("title"));
    final genre = find.byKey(const Key("genre"));
    final overView = find.byKey(const Key("overView"));
    final RatingBar = find.byType(RatingBarIndicator);

    await tester.pumpWidget(_makeTestableWidget(DetailContent(tTvSeriesDetail,
        true, mockWatchlistInsertBloc, mockWatchlistRemoveBloc)));

    expect(image, findsWidgets);
    expect(title, findsOneWidget);
    expect(genre, findsOneWidget);
    expect(overView, findsOneWidget);
    expect(RatingBar, findsOneWidget);
  });
}
