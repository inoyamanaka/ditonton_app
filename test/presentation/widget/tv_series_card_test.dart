import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/widgets/tv_series/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTvSeries extends Mock implements TvSeries {}

void main() {
  group('TvSeriesCard Widget Test', () {
    late TvSeries tvSeries;

    setUp(() {
      tvSeries = MockTvSeries();
      when(tvSeries.id).thenReturn(1);
      when(tvSeries.name).thenReturn('Test Series');
      when(tvSeries.overview).thenReturn('Test overview');
      when(tvSeries.posterPath).thenReturn('/test_poster_path.jpg');
    });

    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TvSeriesCard(tvSeries),
        ),
      ));

      expect(find.text('Test Series'), findsOneWidget);
      expect(find.text('Test overview'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Widget onTap navigation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TvSeriesCard(tvSeries),
        ),
        routes: {
          TvSeriesDetailPage.ROUTE_NAME: (_) =>
              Material(child: Text('Detail Page')),
        },
      ));

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Detail Page'), findsOneWidget);
    });
  });
}
