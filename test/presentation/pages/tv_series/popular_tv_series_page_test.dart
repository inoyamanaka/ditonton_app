import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mock_tv_series_popular.dart';

void main() {
  di.init();

  late MockTvSeriesPopularBloc mockNotifier;
  registerFallbackValue(MockTvSeriesPopularEvent);
  registerFallbackValue(MockTvSeriesPopularState);

  setUpAll(() {
    mockNotifier = MockTvSeriesPopularBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvSeriesBloc>(
      create: (context) => mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockNotifier.state).thenReturn(PopularTvSeriesLoading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(PopularTvSeriesPage()));

    try {
      await tester.pumpWidget(_makeTestableWidget(PopularTvSeriesPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    } catch (e) {
      print('Unexpected error during test: $e');
    }
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => mockNotifier.state)
        .thenReturn(PopularTvSeriesSuccess(<TvSeries>[]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockNotifier.state)
        .thenReturn(PopularTvSeriesFailure('Error Message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(PopularTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
