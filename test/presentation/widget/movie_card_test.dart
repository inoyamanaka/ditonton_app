import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
import 'package:ditonton/presentation/widgets/movie/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMovie extends Mock implements Movie {}

void main() {
  group('MovieCard Widget Test', () {
    late Movie movie;

    setUp(() {
      movie = MockMovie();
      when(movie.id).thenReturn(1);
      when(movie.title).thenReturn('Test Movie');
      when(movie.overview).thenReturn('Test overview');
      when(movie.posterPath).thenReturn('/test_poster_path.jpg');
    });

    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovieCard(movie),
        ),
      ));

      expect(find.text('Test Movie'), findsOneWidget);
      expect(find.text('Test overview'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Widget onTap navigation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovieCard(movie),
        ),
        routes: {
          MovieDetailPage.ROUTE_NAME: (_) => Material(child: Text('Detail Page')),
        },
      ));

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Detail Page'), findsOneWidget);
    });
  });
}
