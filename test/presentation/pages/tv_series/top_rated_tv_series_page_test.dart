import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_top_rated_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mock_tv_series_top_rated.dart';

void main() {
  di.init();

  late MockTvSeriesTopRatedBloc mockNotifier;
  registerFallbackValue(MockTvSeriesTopRatedEvent);
  registerFallbackValue(MockTvSeriesTopRatedState);

  setUpAll(() {
    mockNotifier = MockTvSeriesTopRatedBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesTopRatedBloc>(
      create: (context) => mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockNotifier.state).thenReturn(TvSeriesTopRatedLoading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => mockNotifier.state)
        .thenReturn(TvSeriesTopRatedSuccess(<TvSeries>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockNotifier.state)
        .thenReturn(TvSeriesTopRatedFailure('Error Message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(textFinder, findsOneWidget);
  });
}
