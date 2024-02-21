import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_detail_page.dart';

import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../../helpers/mock_status_watch_list.dart';
import '../../../helpers/mock_tv_series_detail.dart';
import '../../../helpers/mock_tv_series_recommendation.dart';
import '../../../helpers/mock_watchlist_insert.dart';
import '../../../helpers/mock_watchlist_remove.dart';

void main() {
  late MockTvSeriesRecommendationBloc mockTvSeriesRecommendationBloc;
  registerFallbackValue(MockTvSeriesRecommendationEvent);
  registerFallbackValue(MockTvSeriesRecommendationState);

  late MockWatchListStatusBloc mockWatchListStatusBloc;
  registerFallbackValue(MockStatusWatchListEvent);
  registerFallbackValue(MockStatusWatchListState);

  late MockTvSeriesDetailBloc mockTvSeriesDetailBloc;
  registerFallbackValue(MockTvSeriesDetailEvent);
  registerFallbackValue(MockTvSeriesDetailState);

  late MockWatchlistInsertBloc mockWatchlistInsertBloc;
  registerFallbackValue(MockWatchlistInsertEvent);
  registerFallbackValue(MockWatchlistInsertState);

  late MockWatchlistRemoveBloc mockWatchlistRemoveBloc;
  registerFallbackValue(MockWatchlistRemoveEvent);
  registerFallbackValue(MockWatchlistRemoveBloc);

  setUpAll(() {
    mockTvSeriesRecommendationBloc = MockTvSeriesRecommendationBloc();
    mockWatchListStatusBloc = MockWatchListStatusBloc();
    mockTvSeriesDetailBloc = MockTvSeriesDetailBloc();
    mockWatchlistInsertBloc = MockWatchlistInsertBloc();
    mockWatchlistRemoveBloc = MockWatchlistRemoveBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendationTvSeriesBloc>(
          create: (context) => mockTvSeriesRecommendationBloc,
        ),
        BlocProvider<StatusWatchListBloc>(
          create: (context) => mockWatchListStatusBloc,
        ),
        BlocProvider<DetailTvSeriesBloc>(
          create: (context) => mockTvSeriesDetailBloc,
        ),
        BlocProvider<InsertWatchListBloc>(
          create: (context) => mockWatchlistInsertBloc,
        ),
        BlocProvider<RemoveWatchListBloc>(
          create: (context) => mockWatchlistRemoveBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Should Success get all data and button',
      (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(DetailTvSeriesSuccess(tTvSeriesDetail));
    when(() => mockTvSeriesRecommendationBloc.state)
        .thenReturn(const RecommendationTvSeriesSuccess(<TvSeries>[]));
    when(() => mockWatchListStatusBloc.state)
        .thenReturn(const StatusWatchListTvSeriesSuccess(true));
    when(() => mockWatchlistInsertBloc.state)
        .thenReturn(const InsertWatchListTvSeriesSuccess('SUCCESS ADD'));
    when(() => mockWatchlistRemoveBloc.state)
        .thenReturn(const RemoveWatchListTvSeriesSuccess('SUCCESS REMOVE'));

    await tester.pumpWidget(makeTestableWidget(const TvSeriesDetailPage(
      id: 56789,
    )));

    final watchlistButtonIcon = find.byKey(const Key("icon"));

    expect(watchlistButtonIcon, findsOneWidget);
  });
}
