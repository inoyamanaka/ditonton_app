import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
import 'package:ditonton/presentation/widgets/movie/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';

class MockMovie extends Mock implements Movie {}

void main() {
  group('MovieCard Widget Test', () {
    late Movie movie;

    setUp(() {
      movie = testMovie;
    });

    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovieCard(movie),
        ),
      ));
      expect(find.text('Spider-Man'), findsOneWidget);
      expect(
          find.text(
              'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.'),
          findsOneWidget);
      // expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Widget onTap navigation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovieCard(movie),
        ),
        routes: {
          MovieDetailPage.ROUTE_NAME: (_) =>
              Material(child: Text('Detail Page')),
        },
      ));

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Detail Page'), findsOneWidget);
    });
  });
}
